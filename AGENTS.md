# AGENTS.md

## Project identity

This repository is the public home of **Forge AI Assistant**, an educational Hugo website and open-source reference project for South African entrepreneurs who want to build simple, secure AI assistants using Hermes.

Use the three project names consistently:

* **Forge** is the working AI WhatsApp assistant privately tested by Motion Foundry Dance Academy.
* **Hermes** is the underlying agent software that coordinates approved knowledge and limited tools.
* **Build with Hermes ZA** is the educational learning path within the wider Forge AI Assistant project.

The public repository contains the learning site and sanitised reusable material. It does not contain the complete private MFDA deployment. Describe the intended core as self-hosted or operator-managed only when also making clear that external messaging and infrastructure providers remain involved.

The project produces two connected outputs:

1. A beginner-friendly tutorial website generated with Hugo.
2. A reference repository containing reusable scripts, configuration templates, prompts, examples, tests, and security checks.

The website and reference material must remain consistent with each other.

## Mission

Teach South African entrepreneurs how to design, build, secure, test, and operate practical AI assistants for small businesses.

The project should help readers understand:

* what an AI assistant is
* what Hermes does
* how an AI model connects to Hermes
* how WhatsApp Cloud API communicates with the system
* how webhooks work
* how tunnelling exposes a webhook safely
* how business knowledge becomes assistant behaviour
* how prompts, tools, and business rules work together
* how to apply least privilege
* how to protect credentials and customer information
* how to test realistic conversations
* how to maintain and improve the system over time

## Intended audience

Assume the reader:

* owns or operates a small South African business
* uses WhatsApp as a major customer communication channel
* has basic computer knowledge
* can copy terminal commands carefully
* may never have administered a Linux server
* may never have used Git
* may never have deployed an AI system
* is learning while building
* wants to understand the process rather than blindly copy commands
* may have a limited technology budget
* may not have a dedicated IT team

Do not assume professional programming, DevOps, networking, Linux, or security experience.

## Primary deliverables

Maintain all of the following:

1. A Hugo-powered educational website.
2. A complete Markdown tutorial curriculum.
3. A safe and reproducible Hermes installation process.
4. Generic Hermes configuration templates.
5. Reusable assistant-design prompts.
6. Realistic business examples.
7. Security explanations written in plain English.
8. Verification, troubleshooting, backup, and rollback instructions.
9. Automated checks for the website and reference files.
10. GitHub Actions for testing and website deployment.

## Project non-goals

Do not build a new general-purpose AI framework.

Do not turn this repository into a Python application.

Do not reproduce the original production server exactly.

Do not include live production settings.

Do not include:

* API keys
* passwords
* private keys
* access tokens
* Cloudflare Tunnel tokens
* WhatsApp access tokens
* model credentials
* private domains
* production phone numbers
* customer conversations
* customer personal information
* production logs
* databases
* private VPS audit files

Do not automate secret entry.

Do not present the material as legal advice.

## Repository model

The repository is the source of truth.

The Hugo website is generated from Markdown and supporting assets in the repository.

Tutorial content lives in:

```text
content/
```

Reusable implementation material lives in:

```text
reference/
```

Tutorial pages should link to the relevant reference files.

Do not duplicate complete scripts or large configuration files inside tutorials. Use short excerpts and link to the canonical reference file.

## Expected repository structure

Organise the project approximately as follows:

```text
.
├── AGENTS.md
├── README.md
├── LICENSE
├── hugo.toml
├── Makefile
│
├── archetypes/
│   └── tutorial.md
│
├── assets/
│   ├── css/
│   ├── js/
│   └── images/
│
├── content/
│   ├── _index.md
│   ├── start-here/
│   ├── tutorials/
│   ├── concepts/
│   ├── prompt-library/
│   ├── business-examples/
│   ├── security/
│   ├── reference/
│   └── about/
│
├── data/
│   ├── requirements.yaml
│   ├── estimated-costs.yaml
│   └── glossary.yaml
│
├── layouts/
│   ├── _default/
│   ├── partials/
│   └── shortcodes/
│
├── static/
│   ├── downloads/
│   └── diagrams/
│
├── reference/
│   ├── scripts/
│   ├── hermes/
│   ├── plugins/
│   ├── examples/
│   └── README.md
│
├── scripts/
│   ├── check-secrets.sh
│   ├── check-links.sh
│   ├── validate-examples.sh
│   └── build-reference-archive.sh
│
├── tests/
│   ├── smoke/
│   └── fixtures/
│
└── .github/
    ├── workflows/
    ├── ISSUE_TEMPLATE/
    └── pull_request_template.md
```

The structure may evolve when there is a clear and documented reason.

## Hugo requirements

Use Hugo as the static site generator.

Use a conventional Hugo structure:

```text
archetypes/
assets/
content/
data/
layouts/
static/
hugo.toml
```

Keep tutorial content in Markdown.

Prefer simple Hugo layouts and minimal dependencies.

Do not add a complicated JavaScript framework unless it is genuinely necessary.

The website must remain usable on:

* desktop browsers
* mobile browsers
* slow internet connections
* lower-powered devices

Keep pages lightweight.

## Visual system

Use the dark Forge theme across the website. Its four-item primary navigation,
near-black background, restrained purple illumination, original Forge mark and
synthetic conversation preview form the public visual identity.

The visual direction is inspired by the Ascend marketplace template, but the
implementation must remain original. Do not copy third-party HTML, CSS, logos,
screenshots, wording, fonts, hosted assets or runtime code. Keep the public
attribution in `CREDITS.md` accurate.

Do not add fake SaaS content such as prices, testimonials, client logos, usage
statistics or product dashboards. Beginner clarity takes priority over visual
spectacle, and the homepage content budget remains enforced.

Effects must be lightweight, static where practical, pointer-transparent and
accessible. Do not add an external font, icon or JavaScript dependency without
strong justification. Every visual component must work with keyboard input and
on mobile widths down to approximately 320 pixels. The Forge mark and
conversation preview must use code-native graphics and obviously synthetic
information only.

Avoid:

* autoplay video
* excessive animation
* oversized images
* unnecessary tracking
* large JavaScript bundles
* visual effects that reduce readability

## Website information architecture

Keep the beginner journey to four primary destinations:

```text
Home
Set Up
Prompts
Examples
```

Concepts, Security, Reference, About and GitHub are secondary destinations.
Link them from the footer, relevant “Learn more” links or optional expandable
explanations. Do not make advanced material compete with the beginner journey.

## Start Here section

Explain:

* what the reader will build
* who the guide is for
* what knowledge is required
* what accounts are required
* what hardware or VPS is required
* approximate costs
* the recommended learning order
* what the guide does not cover
* what must remain private

## Tutorials section

Provide a progressive learning path.

A likely sequence is:

1. Understand the system architecture.
2. Understand the requirements.
3. Prepare a VPS.
4. Install Hermes.
5. Create a Hermes profile.
6. Connect an AI model.
7. Define the assistant identity.
8. Add business knowledge.
9. Apply security restrictions.
10. Connect WhatsApp Cloud API.
11. Configure a secure tunnel.
12. Add a narrowly scoped business tool.
13. Test normal and hostile conversations.
14. Operate and maintain the system.
15. Back up and recover the system.

Do not skip foundational explanations.

## Concepts section

Explain technical ideas independently from commands.

Include plain-English explanations for:

* VPS
* Linux user
* root user
* package manager
* API
* webhook
* DNS
* TLS
* tunnel
* AI model
* system prompt
* tool calling
* environment variable
* systemd service
* least privilege
* allowlist
* prompt injection
* logs
* backups
* rollback
* configuration files
* secrets
* Git
* GitHub

Every concept page should explain:

1. What it is.
2. Why it matters.
3. How it appears in this project.
4. Common misunderstandings.
5. Security implications.

## Prompt Library section

Include realistic prompts that help entrepreneurs design:

* business requirements
* assistant purpose
* customer journeys
* business rules
* conversation style
* knowledge requirements
* tool definitions
* escalation logic
* failure behaviour
* privacy controls
* security boundaries
* adversarial tests
* acceptance tests
* operational checklists

Every prompt must:

* include clear placeholders
* request structured and practical output
* remind users to verify generated facts
* avoid unnecessary personal-data collection
* encourage narrowly scoped capabilities
* include human escalation where appropriate
* warn against deploying unreviewed generated logic

Prompt pages should explain:

* when to use the prompt
* what information to prepare
* what the generated output should contain
* what must be reviewed manually
* common mistakes
* how to convert the result into Hermes logic

## Business Examples section

Include examples for South African small businesses such as:

* salon
* barber
* tutor
* dance school
* guesthouse
* consultant
* estate agent
* repair service
* gym
* online retailer

Each example should contain:

* business summary
* assistant purpose
* supported customer goals
* unsupported requests
* required business information
* required customer information
* conversation rules
* suggested tools
* escalation conditions
* privacy risks
* security risks
* example conversations
* acceptance tests
* hostile or confusing test cases

Examples must remain generic.

Do not include private production content.

## Security section

Security must be taught throughout the project and summarised in a dedicated section.

Explain:

* why Hermes should run as a normal user
* why secrets do not belong in Git
* why general-purpose tools should be disabled
* why allowlists are preferred to broad access
* why customer and administrator permissions are separated
* why public memory should be disabled by default
* why logs must be handled carefully
* why the gateway should not be exposed directly
* why public webhooks require validation
* why actions require confirmed success
* why backups and rollback plans matter
* why session expiry matters
* why prompt injection must be tested
* how POPIA-related concerns influence system design

Do not present POPIA content as legal advice.

Use language such as:

> This guide raises practical privacy considerations but does not replace professional legal advice.

## South African context

Where relevant, discuss:

* WhatsApp-first customer communication
* costs in South African rand
* local versus international VPS providers
* mobile-first readership
* variable internet connectivity
* load shedding resilience
* POPIA considerations
* local business language and tone
* limited access to technical staff
* practical escalation to a business owner
* affordability and predictable operating costs

Do not make unsupported claims about South African law, pricing, or market behaviour.

Mark costs as estimates.

Include the date on cost estimates.

## Reference directory

The `reference/` directory contains canonical implementation material.

Organise it approximately as follows:

```text
reference/
├── scripts/
├── hermes/
├── plugins/
├── examples/
└── README.md
```

## Reference scripts

Provide readable and educational scripts such as:

* install script
* verification script
* uninstall or rollback script
* backup script
* security validation script

Scripts must be understandable to a learner.

Do not compress important logic into clever one-liners.

Use descriptive function names.

Explain important actions with comments.

## Hermes templates

Include generic templates for:

* `SOUL.md`
* `AGENTS.md`
* Hermes profile configuration
* gateway configuration
* business-information skill
* plugin manifest
* narrowly scoped business tools
* environment variable examples

Use placeholders such as:

```text
<BUSINESS_NAME>
<PROFILE_NAME>
<MODEL_ENDPOINT>
<MODEL_NAME>
<ADMIN_WHATSAPP_NUMBER>
<PUBLIC_HOSTNAME>
<WHATSAPP_PHONE_NUMBER_ID>
```

Never use production values.

## Installation experience

The eventual quick-start command may resemble:

```bash
curl -fsSL https://raw.githubusercontent.com/OWNER/REPOSITORY/main/reference/scripts/install.sh | bash
```

However, the documentation should recommend the safer learning workflow:

```bash
curl -fsSLO https://raw.githubusercontent.com/OWNER/REPOSITORY/main/reference/scripts/install.sh
less install.sh
chmod +x install.sh
./install.sh
```

Readers should be encouraged to inspect scripts before running them.

## Installer responsibilities

The installer may:

* check the operating system
* check supported CPU architectures
* check required commands
* install documented prerequisites
* install Hermes
* create a generic profile
* copy generic templates
* back up existing configuration
* apply secure default settings
* validate the configuration
* print remaining manual steps
* stop safely when requirements are missing

The installer must not:

* embed credentials
* accept secrets through visible command-line arguments
* commit secrets
* install a real Cloudflare token
* configure a live WhatsApp token
* include a real phone number
* include a model API key
* include a private domain
* overwrite files without backup
* silently open public ports
* silently weaken firewall settings
* run Hermes as root
* claim success without verification

## Manual configuration boundaries

Treat these as manual or interactive steps:

* AI provider authentication
* model API keys
* WhatsApp Cloud credentials
* Meta application configuration
* webhook verification secrets
* administrator phone numbers
* Cloudflare authentication
* tunnel creation
* DNS mapping
* production business information

Document these steps clearly, but never place real values in source control.

## Tunnelling documentation

Explain tunnelling in plain English.

Readers should understand:

* Hermes listens on a local address and port
* Meta needs a publicly reachable webhook
* directly exposing the gateway increases risk
* a tunnel creates an outbound connection
* the tunnel maps a public hostname to a local service
* the tunnel token is sensitive
* tunnel credentials must never be committed
* tunnelling is separate from Hermes assistant logic
* disabling the tunnel should not destroy Hermes data

Do not include production tunnel settings.

Use placeholders in every example.

## Hermes hardening scope

Document reusable changes made to Hermes, including:

* profile creation
* identity and behaviour files
* business-information skills
* restricted business plugins
* disabled memory
* disabled general-purpose toolsets
* approved tool allowlists
* administrator restrictions
* regular-user command restrictions
* PII redaction
* secret redaction
* manual approvals
* maximum turn limits
* tool-loop protections
* message queueing
* hidden reasoning
* hidden tool progress
* session expiry
* user-level gateway services
* configuration checks
* health checks
* log inspection
* backup and rollback

Explain each setting in plain English before showing configuration.

## Tutorial content format

Every major tutorial should include:

1. What you are building.
2. Why the step matters.
3. What you need before starting.
4. The commands or configuration.
5. An explanation of each important command.
6. What success looks like.
7. Common problems.
8. Security notes.
9. How to verify the result.
10. How to undo or roll back the change.
11. Links to relevant reference files.
12. The suggested next lesson.

Do not publish command-only tutorials without explanations.

## Hugo front matter

Use consistent front matter for tutorial pages.

Example:

```yaml
---
title: "Create a secure Hermes profile"
description: "Create a Hermes profile and restrict it to approved business capabilities."
weight: 40
draft: false
difficulty: "beginner"
estimated_time: "30 minutes"
requirements:
  - "A working Hermes installation"
  - "A normal Linux user"
learning_outcomes:
  - "Create a Hermes profile"
  - "Understand tool restrictions"
security_notes:
  - "Do not run Hermes as root"
---
```

Do not invent completion times when the process has not been tested.

Mark estimates clearly.

## Hugo components

Prefer reusable shortcodes or partials for:

* warnings
* security notes
* South African context notes
* terminal commands
* expected output
* troubleshooting
* reference-file links
* prerequisites
* verification steps
* rollback steps

Possible shortcode names include:

```text
warning
security
sa-context
command
expected-output
troubleshooting
rollback
reference-file
```

Keep shortcodes simple and documented.

## Writing style

Use clear South African English.

Teach progressively: first say what the reader can build, then give one action,
show how to check it and offer deeper explanation only when requested. The main
pages should feel like a calm teacher rather than a technical manual.

Keep paragraphs to no more than three sentences in most cases. Lead with the
point, use direct verbs and define a necessary technical term immediately.
Keep actions and checks visible; place optional reasoning in semantic,
collapsed `<details>` sections.

Apply these content budgets:

* homepage: no more than 300 visible words
* MFDA example: no more than 350 visible words
* each additional example: no more than 350 visible words
* primary navigation: exactly four items
* one primary action per page section

Navigation, footer text and complete prompt text do not count against the
explanatory word budgets.

Explain technical terms when they first appear.

Avoid unnecessary jargon.

Do not use marketing hype.

Do not assume the reader already understands the command being shown.

Prefer:

> This command installs the package that runs the tunnel as a system service.

Avoid:

> Simply execute the following command.

Explain both what the command does and why it matters.

## Command safety

Use:

```bash
set -Eeuo pipefail
```

in Bash scripts where appropriate.

Quote shell variables.

Use descriptive error messages.

Check prerequisites before making changes.

Create backups before replacing files.

Make scripts idempotent where practical.

Never print secrets.

Never include live credentials in examples.

Do not use destructive commands without a clear warning.

Do not hide important actions.

## Verification and rollback

Every meaningful technical change should include:

* a verification command
* expected output or expected behaviour
* common failure messages
* a rollback or uninstall method

Do not claim that something works unless it has been tested or clearly marked as untested.

## Quality standards

All work should eventually pass:

* Hugo production build
* draft-free build
* internal-link checks
* secret scanning
* shell syntax checks
* configuration parsing checks
* reference-file validation
* basic mobile review
* basic accessibility review

Support these commands through a Makefile:

```bash
make serve
make build
make test
make check-secrets
make check-links
```

## GitHub Actions

Maintain workflows that:

1. Build the Hugo website.
2. Run repository checks.
3. Scan for accidental secrets.
4. Validate shell scripts.
5. Deploy the generated website to GitHub Pages after approved changes reach the main branch.

Do not deploy from untrusted pull requests.

Do not expose repository secrets to pull-request workflows.

The first production deployment requires human review.

## Git workflow

Before large changes:

1. Inspect the repository.
2. Read this file.
3. Review the relevant content and reference files.
4. State assumptions.
5. Create the smallest coherent change.
6. Run relevant checks.
7. Review the diff.
8. Summarise changes.
9. List unresolved questions.
10. Commit only after review.

Use focused commits.

Do not combine:

* a major website redesign
* installer changes
* tutorial rewrites
* deployment changes

in one commit.

## Codex operating rules

Codex may independently:

* create and edit Hugo pages
* create layouts and shortcodes
* improve navigation
* create generic business examples
* create prompt templates
* improve accessibility
* improve mobile styling
* update the Makefile
* write validation scripts
* run local tests
* fix Hugo build failures
* update reference links
* prepare focused Git commits
* update documentation when reference files change
* identify inconsistent documentation
* create issues or task lists for missing content

Codex must stop and request human review before:

* publishing or deploying for the first time
* changing production domains
* adding or handling credentials
* changing legal or POPIA guidance
* changing the intended audience
* introducing paid services
* making destructive changes
* deleting substantial content
* changing the public project identity
* using private VPS evidence directly
* asserting that an untested command works
* weakening a security control
* changing authentication methods
* connecting to production services

## Codex independence

Codex should independently handle routine repository work within the rules in this file.

It should:

* inspect the repository before editing
* choose the smallest practical change
* run checks after editing
* fix issues caused by its own changes
* review the final diff
* explain what changed
* identify assumptions
* identify anything requiring human confirmation

Codex must not treat independence as permission to invent facts.

## Independence does not mean invention

When information is missing:

* do not invent production history
* do not invent Hermes behaviour
* do not invent costs
* do not invent security claims
* do not invent legal claims
* do not invent test results
* do not invent successful deployments

Use placeholders or document an open question.

The owner remains the source of truth for the original deployment, business intent, and lived process.

## Private evidence

The original VPS report and command history are private research materials.

They must remain outside the repository.

They may be used to reconstruct:

* the chronological setup process
* commands that were actually run
* problems encountered
* Hermes changes
* security decisions
* validation steps
* rollback procedures

Before converting private evidence into public documentation:

1. Remove credentials and tokens.
2. Replace domains and phone numbers with placeholders.
3. Remove customer information.
4. Remove private business information.
5. Generalise environment-specific details.
6. Verify the resulting instructions independently.
7. Do not commit the original evidence.

## Secret protection

The repository must ignore and reject files such as:

```text
.env
.env.*
*.key
*.pem
*.token
credentials.json
REPORT.txt
command-history*.txt
forge-vps-audit-*
.hermes/
logs/
memories/
*.db
*.sqlite
*.sqlite3
```

Before committing, run secret checks.

If a credential may have been committed:

1. Stop.
2. Remove it from the working tree.
3. Rotate the credential.
4. inspect Git history.
5. clean the history if required.
6. document the incident without exposing the credential.

Redaction alone does not make a credential safe if it was already exposed.

## Definition of done

A task is complete only when:

* the Hugo site builds successfully
* relevant tests and checks pass
* tutorial content and reference files agree
* no secrets are introduced
* new pages are linked into navigation
* commands are explained
* verification steps are included
* rollback guidance is included where appropriate
* the final summary lists the important changes
* unresolved assumptions are clearly identified

The primary goal is education.

The repository should help a South African entrepreneur understand not only which command to run, but what they are building, why it works, what could go wrong, and how to operate it safely.
