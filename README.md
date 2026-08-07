# Forge AI Assistant

Forge AI Assistant is an open-source learning project for South African
entrepreneurs who want to understand how a focused, secure AI assistant can be
designed, tested and operated around WhatsApp-first customer communication.

The project is informed by a real private closed beta at Motion Foundry Dance
Academy (MFDA). The public repository contains the Hugo educational site,
sanitised lessons, synthetic examples and reusable review material—not the live
MFDA implementation.

## The three names

- **Forge** is the working WhatsApp assistant privately tested by MFDA.
- **Hermes** is the underlying agent software that coordinates approved
  knowledge and limited tools.
- **Build with Hermes ZA** is the educational learning path within the wider
  Forge project.

The assistant core may run on infrastructure managed by its operator, while
WhatsApp Cloud API and other external messaging or infrastructure providers
remain part of the complete system.

## Current status

**Closed beta — August 2026.** Forge is undergoing private testing. Generic
reusable components will be added only after beta findings are sanitised,
reviewed and safe to share. No production deployment, customer data, complete
private configuration or independently verified generic implementation is
claimed here.

- [Read the deployed learning site](https://ramomolise.github.io/forge-ai-assistant/)
- [Start the single setup journey](https://ramomolise.github.io/forge-ai-assistant/tutorials/)
- [See the consolidated examples](https://ramomolise.github.io/forge-ai-assistant/business-examples/)

## Beginner journey

The public site keeps four destinations in its primary navigation:

1. **Home** explains the useful outcome.
2. **Set Up** gives one sequential path with an action and check at every step.
3. **Prompts** provides six complete planning prompts on one page.
4. **Examples** compares the real sanitised MFDA pattern with fictional small
   businesses.

Concepts, Security, Reference, About and GitHub remain available as optional
depth from the footer and contextual links. Detailed tutorial URLs remain live
as advanced material.

## Run the site locally

Install a compatible extended Hugo release, clone the repository, then run:

```bash
make serve
```

Hugo prints the local preview address. The development server includes drafts;
stop it with <kbd>Ctrl</kbd>+<kbd>C</kbd>.

Create the production build with:

```bash
make build
```

Generated `public/` output and `.hugo_build.lock` are local artefacts and must
not be committed.

## Test changes

Run the complete local baseline:

```bash
make test
```

This checks tracked filenames and common credential patterns, canonical
reference links, shell syntax, production and draft-free Hugo builds, rendered
internal links, heading order and beginner-page content budgets. It reduces risk
but does not prove a deployment is secure or scan every possible secret format.

## Repository boundaries

The [`content/`](content/) directory is the teaching layer. The
[`reference/`](reference/) directory is the canonical home for reviewed generic
scripts, templates, checklists and examples as they become safe to publish.
Tutorials should link to canonical reference files instead of duplicating them.

Never commit customer conversations or personal information, production prompts
or configuration, credentials, phone numbers, private endpoints, databases,
server logs, private locations or VPS evidence. Use obvious fictional names and
placeholders in public examples.

## Contribute

Read [`CONTRIBUTING.md`](CONTRIBUTING.md), [`AGENTS.md`](AGENTS.md) and the
relevant content and reference files before editing. Keep changes focused, run
`make test`, explain commands for beginner readers and preserve verification,
rollback, least-privilege and human-handover boundaries.

## Tutorial shortcodes

Recurring tutorial guidance uses paired Hugo shortcodes: `warning`, `security`,
`sa-context`, `command`, `expected-output`, `troubleshooting` and `rollback`.
The `reference-file` shortcode links a tutorial to canonical repository material.
The `details` shortcode keeps optional explanations collapsed while actions and
checks stay visible. See existing pages for reviewed examples and keep all
values generic.

## Licence

See [`LICENSE`](LICENSE).
