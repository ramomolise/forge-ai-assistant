#!/usr/bin/env bash

set -Eeuo pipefail

repository_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repository_root"

required_tokens=(
  --color-bg
  --color-surface
  --color-text
  --color-text-muted
  --color-border
  --color-purple
  --color-gold
  --shadow-glow
  --radius-pill
  --content-width
  --reading-width
)

for token in "${required_tokens[@]}"; do
  if ! grep -q -- "$token:" assets/css/main.css; then
    printf 'Missing required Forge design token: %s\n' "$token" >&2
    exit 1
  fi
done

required_home_markup=(
  'status-pill'
  'forge-preview'
  'Fictional example conversation'
  'message--customer'
  'message--forge'
)

for pattern in "${required_home_markup[@]}"; do
  if ! grep -q -- "$pattern" public/index.html; then
    printf 'Missing required rendered homepage component: %s\n' "$pattern" >&2
    exit 1
  fi
done

if ! grep -q 'class=mobile-menu' public/index.html; then
  printf 'Rendered homepage is missing the semantic mobile menu.\n' >&2
  exit 1
fi

if [[ ! -s public/favicon.svg ]]; then
  printf 'Generated site is missing the local Forge favicon.\n' >&2
  exit 1
fi

if grep -RIE "<(script|img)[^>]+src=[\"']https?://|<link[^>]+(stylesheet|preload)[^>]+href=[\"']https?://" \
  public --include='*.html' >/dev/null; then
  printf 'Rendered site contains an externally hosted script, image, font, or stylesheet.\n' >&2
  exit 1
fi

if grep -RIE 'projectToCloneAuthToken|admin:webstudio|baserow-backend|marketplace-ascend\.wstd\.io' \
  --exclude=check-theme.sh --exclude-dir=.git --exclude-dir=public . >/dev/null; then
  printf 'Repository contains a prohibited preview credential or hosted Ascend asset reference.\n' >&2
  exit 1
fi

if ! grep -q '@media (max-width: 48rem)' assets/css/main.css ||
   ! grep -q '@media (max-width: 30rem)' assets/css/main.css ||
   ! grep -q '@media (prefers-reduced-motion: reduce)' assets/css/main.css; then
  printf 'Forge theme is missing required responsive or reduced-motion rules.\n' >&2
  exit 1
fi

printf 'Dark Forge theme structure check passed.\n'
