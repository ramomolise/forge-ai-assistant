#!/usr/bin/env bash

set -Eeuo pipefail

repository_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repository_root"

printf 'Checking Bash syntax...\n'
while IFS= read -r -d '' script; do
  bash -n "$script"
done < <(find scripts reference/scripts -type f -name '*.sh' -print0)

printf 'Bash syntax check passed.\n'
