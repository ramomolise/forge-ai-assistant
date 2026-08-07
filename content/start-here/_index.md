---
title: "Start Here"
description: "Understand what you will build, what you need, and how to follow the guide."
weight: 10
---

Begin here if you run a small South African business and want to understand AI
assistants before attempting to operate one.

## Who this guide is for

The guide is written for business owners and operators who rely on WhatsApp for
customer communication, have limited access to technical staff, or need to keep
technology spending predictable.

You do not need professional programming, Linux, networking, or server
administration experience. Later lessons may ask you to copy commands, edit
configuration files, and use Git. Each completed technical lesson should
explain what an action does, how to verify it, and how to undo it.

{{< sa-context >}}
The material is designed for mobile-first reading and variable connectivity.
Where infrastructure choices are eventually discussed, affordability,
reliability, and recovery after connectivity or power interruptions should be
treated as design constraints.
{{< /sa-context >}}

## What you are working towards

The learning outcome is a limited business assistant that receives customer
messages through WhatsApp, uses reviewed business knowledge, performs only
narrowly approved actions, and escalates to a person when necessary.

Forge demonstrates this pattern in a private MFDA closed beta. The public guide
teaches the pattern but does not publish that live configuration or claim that
a generic deployment has been independently verified.

Start with [Check whether you are ready for this learning
project](project-readiness/), then read
[Understand the intended system architecture](architecture/). These lessons
help you plan before any setup work begins.

## Expected learning path

The curriculum is expected to progress through these stages:

1. Understand the architecture and requirements.
2. Learn the server, networking, API, webhook, model, and security concepts.
3. Prepare suitable infrastructure.
4. Install and configure Hermes as a normal user.
5. Connect an AI model through reviewed configuration.
6. Define assistant identity, business knowledge, and boundaries.
7. Apply least privilege and narrowly scoped tools.
8. Connect customer messaging and a protected public webhook.
9. Test normal, confusing, and hostile conversations.
10. Learn operation, monitoring, backup, rollback, and recovery.

The current tutorials cover these stages at different levels of maturity. Read
each lesson's verification notes and do not treat design guidance as proof that
your own integration works.

## Accounts and infrastructure

Depending on the final reviewed design, a learner may eventually need:

- an account with a VPS provider
- a normal Linux user on that VPS
- an AI model provider account
- the appropriate Meta and WhatsApp Cloud API accounts
- a Cloudflare account if Cloudflare Tunnel remains the documented tunnel
- a domain or hostname suitable for a public webhook
- a GitHub account if contributing changes or using GitHub-hosted material
- a computer or mobile device with reliable enough connectivity to administer
  the system safely

Do not create or pay for these services solely because they appear in this
list. Provider requirements and the project instructions have not yet been
verified.

## Cost categories

Possible costs may include server hosting, domain registration, AI model usage,
messaging-provider usage, data or connectivity, backups, and optional support.

No price estimates are currently published. Costs can change by provider,
region, usage, exchange rate, and service terms. Future estimates must be dated,
labelled as estimates, and checked against current provider information.

## Privacy and secret boundaries

{{< security >}}
API keys, access tokens, passwords, private keys, webhook verification secrets,
real phone numbers, customer conversations, customer information, production
logs, databases, private domains, and private VPS evidence do not belong in
this repository.
{{< /security >}}

Credentials will remain manual configuration steps. Examples must use obvious
placeholders, and generated logic must be reviewed before use. If a credential
is ever committed, removing the current file is not enough: stop, rotate the
credential, and inspect the Git history.

## Website and reference implementation

The Hugo website is the teaching layer. Its Markdown pages explain concepts,
decisions, verification, troubleshooting, and rollback.

The `reference/` directory is intended to become the canonical implementation
layer for reusable scripts, templates, and examples. Tutorials should link to
those files instead of duplicating complete scripts or large configurations.

The reference directory currently contains reviewed checklists and examples.
Generic executable implementation material remains planned and will be
published only after sanitisation and independent testing.

## Current limitations

{{< troubleshooting >}}
This repository provides reviewed educational guidance but not the private MFDA
configuration or a complete, independently verified generic deployment. Treat
commands and architecture as learning material until you verify them in an
authorised non-production environment.
{{< /troubleshooting >}}

Provider details and costs can change, reusable implementation components remain
planned, and private operational evidence is deliberately excluded. The public
case study confirms a closed beta exists; it is not proof that another system
will work safely.

## Next lesson

Read [Check whether you are ready for this learning
project](project-readiness/) and complete a private copy of its canonical
checklist. The lesson then links to the intended system architecture.
