# Contributing

Contributions should help South African entrepreneurs understand the system
without exposing private infrastructure or inventing technical facts.

## Before editing

Read `AGENTS.md`, `README.md`, and `ARCHITECTURE.md`. Inspect the relevant
tutorial and canonical `reference/` file. Keep complete scripts, templates, and
checklists canonical under `reference/`; lessons should explain and link to
them.

Use placeholders for every production-specific value. Never commit credentials,
customer information, phone numbers, private domains, logs, databases, private
VPS evidence, or completed security and operations reviews.

## Technical facts

Use current authoritative primary documentation for operating systems, Hermes,
and providers. Record the source title, URL, verification date, and facts
verified in the teaching page. If the evidence is unclear, mark the work
blocked instead of guessing.

## Validate a change

Run:

```bash
make test
git diff --check
```

Review the rendered pages on a narrow viewport as well as a desktop viewport.
Inspect the full staged diff, stage only one coherent change, and run the checks
again before committing.

Do not claim that an integration, command, restore, or deployment works unless
the relevant behaviour was safely and directly verified.

## Pull-request review

Describe the educational outcome, files changed, checks run, sources consulted,
security effects, assumptions, and unresolved questions. A human owner must
review any first deployment, production domain, credential boundary,
authentication change, paid service, legal or POPIA guidance, or weakened
security control.
