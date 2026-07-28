#!/usr/bin/env bash

set -Eeuo pipefail

repository_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repository_root"

build_dir="$(mktemp -d /tmp/forge-link-check.XXXXXX)"
cleanup() {
  rm -r -- "$build_dir"
}
trap cleanup EXIT

hugo --environment production --buildDrafts=false --destination "$build_dir" >/dev/null

risk_found=0
while IFS= read -r href; do
  clean_path="${href%%#*}"
  clean_path="${clean_path%%\?*}"
  target="$build_dir$clean_path"

  if [[ -d "$target" ]]; then
    target="$target/index.html"
  fi

  if [[ ! -e "$target" ]]; then
    printf 'Broken rendered internal link: %s\n' "$href" >&2
    risk_found=1
  fi
done < <(
  grep -rhoE 'href=["'\'']?/[^"'\'\'' >]+' "$build_dir" --include='*.html' |
    sed -E 's/^href=["'\'']?//' |
    sort -u
)

if (( risk_found != 0 )); then
  exit 1
fi

printf 'Rendered internal-link check passed.\n'
