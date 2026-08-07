.PHONY: serve build build-draft-free check-secrets check-reference check-shell check-links check-headings check-content-budgets test

serve:
	hugo server --buildDrafts

build:
	hugo --minify

build-draft-free:
	hugo --environment production --buildDrafts=false --minify

check-secrets:
	./scripts/check-secrets.sh

check-reference:
	./scripts/validate-reference.sh

check-shell:
	./scripts/check-shell.sh

check-links:
	./scripts/check-links.sh

check-headings:
	./scripts/check-headings.sh

check-content-budgets:
	./scripts/check-content-budgets.sh

test: check-secrets check-reference check-shell build build-draft-free check-links check-headings check-content-budgets
