#!/usr/bin/env bash

set -Eeuo pipefail

if ! command -v grep >/dev/null 2>&1; then
  printf 'Error: grep is required to validate reference files.\n' >&2
  exit 2
fi

if ! command -v find >/dev/null 2>&1; then
  printf 'Error: find is required to validate reference files.\n' >&2
  exit 2
fi

repository_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repository_root"

required_directories=(
  "reference"
  "reference/scripts"
  "reference/hermes"
  "reference/plugins"
  "reference/examples"
)

required_readmes=(
  "reference/README.md"
  "reference/scripts/README.md"
  "reference/hermes/README.md"
  "reference/plugins/README.md"
  "reference/examples/README.md"
)

required_placeholders=(
  "<BUSINESS_NAME>"
  "<PROFILE_NAME>"
  "<MODEL_ENDPOINT>"
  "<MODEL_NAME>"
  "<ADMIN_WHATSAPP_NUMBER>"
  "<PUBLIC_HOSTNAME>"
  "<WHATSAPP_PHONE_NUMBER_ID>"
)

risk_found=0

report_risk() {
  local category="$1"
  local path="$2"

  printf 'Risk: %s: %s\n' "$category" "$path" >&2
  risk_found=1
}

printf 'Checking canonical reference structure...\n'
for directory in "${required_directories[@]}"; do
  if [[ ! -d "$directory" ]]; then
    report_risk "missing required directory" "$directory"
  fi
done

for readme in "${required_readmes[@]}"; do
  if [[ ! -f "$readme" ]]; then
    report_risk "missing required README" "$readme"
  fi
done

if [[ -f "reference/README.md" ]]; then
  printf 'Checking the required placeholder catalogue...\n'
  for placeholder in "${required_placeholders[@]}"; do
    if ! grep -Fq -- "$placeholder" "reference/README.md"; then
      report_risk "missing required placeholder documentation" "reference/README.md"
    fi
  done
fi

reference_files=()
if [[ -d "reference" ]]; then
  while IFS= read -r -d '' path; do
    reference_files+=("$path")
  done < <(find reference -type f -print0)
fi

printf 'Checking placeholder syntax in reference files...\n'
for path in "${reference_files[@]}"; do
  while IFS= read -r token; do
    if [[ ! "$token" =~ ^\<[A-Z][A-Z0-9_]*\>$ ]]; then
      report_risk "inconsistent placeholder syntax" "$path"
      break
    fi
  done < <(grep -IohE -- '<[A-Za-z][A-Za-z0-9_-]*>' "$path" || true)
done

production_labels=(
  "private key material"
  "AWS access key"
  "GitHub token"
  "Slack token"
  "JWT-like token"
  "long credential assignment"
  "production-like URL"
  "production-like domain"
  "phone-number-shaped value"
)

production_patterns=(
  '-----BEGIN ([A-Z0-9 ]+ )?PRIVATE KEY-----'
  '(^|[^A-Z0-9])AKIA[0-9A-Z]{16}([^A-Z0-9]|$)'
  '(^|[^[:alnum:]_])(gh[pousr]_[[:alnum:]]{20,}|github_pat_[[:alnum:]_]{20,})([^[:alnum:]_]|$)'
  '(^|[^[:alnum:]])xox[baprs]-[[:alnum:]-]{20,}([^[:alnum:]-]|$)'
  '(^|[^[:alnum:]_-])eyJ[[:alnum:]_-]{10,}\.eyJ[[:alnum:]_-]{10,}\.[[:alnum:]_-]{10,}([^[:alnum:]_-]|$)'
  '(api[_-]?key|access[_-]?token|auth[_-]?token|client[_-]?secret|password|secret[_-]?key)[[:space:]]*[:=][[:space:]]*["'\'']?[[:alnum:]/+=._-]{20,}'
  'https?://[[:alnum:]]'
  '(^|[^[:alnum:]_-])[[:alnum:]][[:alnum:]-]*\.(co\.za|com|net|org)([^[:alnum:]_-]|$)'
  '(^|[^[:digit:]])(\+?[[:digit:]][[:digit:] ()-]{7,}[[:digit:]])([^[:digit:]]|$)'
)

printf 'Checking reference files for prohibited production-like values...\n'
for index in "${!production_patterns[@]}"; do
  for path in "${reference_files[@]}"; do
    if grep -IqE -- "${production_patterns[$index]}" "$path"; then
      report_risk "possible ${production_labels[$index]}" "$path"
    fi
  done
done

if (( risk_found != 0 )); then
  printf 'Reference validation failed. Review the named files without sharing suspected values.\n' >&2
  exit 1
fi

printf 'Reference validation passed.\n'
