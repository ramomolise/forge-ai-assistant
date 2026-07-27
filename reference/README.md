# Canonical reference material

This directory is the canonical home for reusable implementation material that
will accompany the educational website.

It currently contains documentation only. No Hermes configuration,
installation procedure, messaging integration, tunnel configuration, model
setting, business example, or executable reference file has been implemented
or verified.

## Directory responsibilities

- [`scripts/`](scripts/) will contain readable installation, verification,
  backup, rollback, and security-validation scripts after they are reviewed and
  tested.
- [`hermes/`](hermes/) will contain generic Hermes-related templates after
  their file formats and behaviour are independently verified.
- [`plugins/`](plugins/) will contain narrowly scoped plugin and tool material
  after its interface and permissions are verified.
- [`examples/`](examples/) will contain generic, non-production examples that
  connect reviewed concepts to canonical reference files.

Each subdirectory README defines its boundaries. Material must not be placed in
a neighbouring directory merely because its correct location is not yet known.

## Relationship to the website

Reference files are canonical. A tutorial may show a short excerpt when it
helps a beginner understand an important line, but it must link to the complete
canonical reference file.

Complete scripts and configurations must not be copied into multiple tutorial
pages. When a reference file changes, its linked tutorial explanations and
verification guidance must be reviewed for consistency.

## Placeholder convention

Future templates must represent values supplied by a learner with uppercase
snake-case names inside angle brackets:

```text
<BUSINESS_NAME>
<PROFILE_NAME>
<MODEL_ENDPOINT>
<MODEL_NAME>
<ADMIN_WHATSAPP_NUMBER>
<PUBLIC_HOSTNAME>
<WHATSAPP_PHONE_NUMBER_ID>
```

The syntax is `<UPPERCASE_NAME>`. Names may contain uppercase letters, digits,
and underscores, must start with a letter, and should describe the value rather
than suggest an example value.

New placeholder names may be introduced when a reviewed template genuinely
needs them, but they must use the same syntax and be documented with that
template.

Placeholders must never be replaced with production values in committed
examples. Real credentials, domains, phone numbers, customer information,
business information, server evidence, logs, and databases must remain outside
the repository.

## Review requirements

Before a future executable script or configuration template is accepted, its
documentation must include:

1. its purpose and intended scope
2. prerequisites and supported conditions
3. security implications and required permissions
4. verification steps and expected behaviour
5. rollback or recovery steps
6. validation of required placeholders
7. confirmation that no credential is embedded
8. clear labels for anything not independently verified

Executable material must also be readable, fail safely, avoid printing
secrets, create backups before replacement, and avoid unsupported claims about
Hermes or external providers.

## Local validation

Run:

```text
make check-reference
```

The validator checks the required directory skeleton, required README files,
the initial placeholder catalogue, placeholder syntax, and selected
production-like value patterns. It reports only filenames and risk categories.

This validation is a precaution, not proof that material is safe or correct. It
does not verify Hermes formats, provider behaviour, script correctness,
historical commits, encoded values, or every possible credential format.
