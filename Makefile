.PHONY: serve build check-secrets check-reference test

serve:
	hugo server --buildDrafts

build:
	hugo --minify

check-secrets:
	./scripts/check-secrets.sh

check-reference:
	./scripts/validate-reference.sh

test: check-secrets check-reference build
