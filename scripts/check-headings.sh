#!/usr/bin/env bash

set -Eeuo pipefail

repository_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repository_root"

build_dir="$(mktemp -d /tmp/forge-heading-check.XXXXXX)"
cleanup() {
  rm -r -- "$build_dir"
}
trap cleanup EXIT

hugo --environment production --buildDrafts=false --destination "$build_dir" >/dev/null

risk_found=0
while IFS= read -r -d '' page; do
  previous=0
  while IFS= read -r heading; do
    level="${heading#<h}"
    if (( previous != 0 && level > previous + 1 )); then
      printf 'Heading level skipped in %s: h%s follows h%s\n' \
        "${page#"$build_dir"/}" "$level" "$previous" >&2
      risk_found=1
    fi
    previous="$level"
  done < <(grep -oE '<h[1-6]' "$page" || true)
done < <(find "$build_dir" -type f -name '*.html' -print0)

if (( risk_found != 0 )); then
  exit 1
fi

printf 'Rendered heading-order check passed.\n'
