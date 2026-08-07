#!/usr/bin/env bash

set -Eeuo pipefail

repository_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repository_root"

count_visible_words() {
  local source_file="$1"

  awk '
    BEGIN { front_matter = 0; fence = 0; detail = 0 }
    NR == 1 && $0 == "---" { front_matter = 1; next }
    front_matter && $0 == "---" { front_matter = 0; next }
    front_matter { next }
    /^```/ { fence = !fence; next }
    fence { next }
    /{{< details / { detail = 1; next }
    /{{< \/details >}}/ { detail = 0; next }
    detail { next }
    /{{<[^>]+>}}/ { next }
    {
      line = $0
      gsub(/\]\([^)]*\)/, "]", line)
      gsub(/<[^>]+>/, " ", line)
      gsub(/[^[:alnum:]<>-]+/, " ", line)
      word_count = split(line, words, /[[:space:]]+/)
      for (word_index = 1; word_index <= word_count; word_index++) {
        if (words[word_index] != "") total++
      }
    }
    END { print total }
  ' "$source_file"
}

assert_maximum() {
  local label="$1"
  local count="$2"
  local maximum="$3"

  printf '%s: %s visible words (maximum %s)\n' "$label" "$count" "$maximum"
  if (( count > maximum )); then
    printf '%s exceeds its beginner content budget.\n' "$label" >&2
    return 1
  fi
}

temporary_dir="$(mktemp -d /tmp/forge-content-budget.XXXXXX)"
cleanup() {
  rm -r -- "$temporary_dir"
}
trap cleanup EXIT

sed -n '/^## Motion Foundry Dance Academy$/,/^## A fictional salon$/p' \
  content/business-examples/_index.md | sed '$d' > "$temporary_dir/mfda.md"
sed -n '/^## A fictional salon$/,/^## A fictional repair service$/p' \
  content/business-examples/_index.md | sed '$d' > "$temporary_dir/salon.md"
sed -n '/^## A fictional repair service$/,$p' \
  content/business-examples/_index.md > "$temporary_dir/repair.md"

risk_found=0
assert_maximum "Homepage" "$(count_visible_words content/_index.md)" 300 || risk_found=1
assert_maximum "Set Up page" "$(count_visible_words content/tutorials/_index.md)" 1800 || risk_found=1
assert_maximum "Prompts explanation" "$(count_visible_words content/prompt-library/_index.md)" 800 || risk_found=1
assert_maximum "Examples page" "$(count_visible_words content/business-examples/_index.md)" 1200 || risk_found=1
assert_maximum "MFDA example" "$(count_visible_words "$temporary_dir/mfda.md")" 350 || risk_found=1
assert_maximum "Salon example" "$(count_visible_words "$temporary_dir/salon.md")" 350 || risk_found=1
assert_maximum "Repair-service example" "$(count_visible_words "$temporary_dir/repair.md")" 350 || risk_found=1

main_navigation_count="$(grep -c '^  \[\[menu.main\]\]' hugo.toml)"
printf 'Primary navigation: %s items (required 4)\n' "$main_navigation_count"
if (( main_navigation_count != 4 )); then
  printf 'Primary navigation must contain exactly four items.\n' >&2
  risk_found=1
fi

if (( risk_found != 0 )); then
  exit 1
fi

printf 'Beginner content-budget check passed.\n'
