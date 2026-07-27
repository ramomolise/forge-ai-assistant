.PHONY: serve build check-secrets test

serve:
	hugo server --buildDrafts

build:
	hugo --minify

check-secrets:
	./scripts/check-secrets.sh

test: check-secrets build
