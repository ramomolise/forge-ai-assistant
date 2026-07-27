#!/usr/bin/env bash

set -Eeuo pipefail

if ! command -v git >/dev/null 2>&1; then
  printf 'Error: git is required to check tracked files.\n' >&2
  exit 2
fi

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  printf 'Error: run this script inside a Git working tree.\n' >&2
  exit 2
fi

repository_root="$(git rev-parse --show-toplevel)"
cd "$repository_root"

risk_found=0

is_sensitive_path() {
  local path="$1"
  local filename="${path##*/}"

  case "$filename" in
    .env|.env.*|*.key|*.pem|*.token|credentials.json|REPORT.txt|command-history*.txt|forge-vps-audit-*|*.db|*.sqlite|*.sqlite3)
      return 0
      ;;
  esac

  case "/$path/" in
    */.hermes/*|*/logs/*|*/memories/*)
      return 0
      ;;
  esac

  return 1
}

printf 'Checking tracked filenames for sensitive files...\n'
while IFS= read -r -d '' tracked_path; do
  if is_sensitive_path "$tracked_path"; then
    printf 'Risk: tracked sensitive filename: %s\n' "$tracked_path" >&2
    risk_found=1
  fi
done < <(git ls-files -z)

credential_labels=(
  "private key material"
  "AWS access key"
  "GitHub token"
  "Slack token"
  "JWT-like token"
  "long credential assignment"
)

credential_patterns=(
  '-----BEGIN ([A-Z0-9 ]+ )?PRIVATE KEY-----'
  '(^|[^A-Z0-9])AKIA[0-9A-Z]{16}([^A-Z0-9]|$)'
  '(^|[^[:alnum:]_])(gh[pousr]_[[:alnum:]]{20,}|github_pat_[[:alnum:]_]{20,})([^[:alnum:]_]|$)'
  '(^|[^[:alnum:]])xox[baprs]-[[:alnum:]-]{20,}([^[:alnum:]-]|$)'
  '(^|[^[:alnum:]_-])eyJ[[:alnum:]_-]{10,}\.eyJ[[:alnum:]_-]{10,}\.[[:alnum:]_-]{10,}([^[:alnum:]_-]|$)'
  '(api[_-]?key|access[_-]?token|auth[_-]?token|client[_-]?secret|password|secret[_-]?key)[[:space:]]*[:=][[:space:]]*["'\'']?[[:alnum:]/+=._-]{20,}'
)

printf 'Checking tracked text files for common credential patterns...\n'
for index in "${!credential_patterns[@]}"; do
  matches="$(
    git grep -I -l -E \
      -e "${credential_patterns[$index]}" \
      -- . 2>/dev/null || true
  )"

  if [[ -n "$matches" ]]; then
    printf 'Risk: possible %s found in tracked file(s):\n' \
      "${credential_labels[$index]}" >&2
    while IFS= read -r matched_file; do
      printf '  %s\n' "$matched_file" >&2
    done <<<"$matches"
    risk_found=1
  fi
done

if (( risk_found != 0 )); then
  printf 'Secret check failed. Review the named files without sharing any credential values.\n' >&2
  exit 1
fi

printf 'Secret check passed: no configured filename or credential-pattern risks were found.\n'
