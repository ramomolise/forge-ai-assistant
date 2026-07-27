---
title: "Prompt Library"
description: "Realistic prompts for designing the logic behind an AI assistant."
weight: 40
---

The Prompt Library contains reusable questions and instructions that help you
think through an assistant before technical configuration begins.

These prompts can help organise business requirements, customer goals,
boundaries, escalation rules, possible tools, risks, and tests. They do not
configure Hermes or connect any service automatically.

## Treat generated output as a draft

An AI model can organise information and point out gaps, but it does not know
your business unless you provide reviewed facts. It may misunderstand a rule,
make an unsafe suggestion, or present an assumption confidently.

The business owner or another authorised reviewer must check generated output,
correct mistakes, approve decisions, and record unresolved questions. Generated
business logic must not be deployed without human review and later technical
testing.

{{< security >}}
Do not paste customer records, private conversations, credentials, access
tokens, production domains, administrator contact details, or private VPS
evidence into a prompt. Use generic descriptions and placeholders. Save any
completed prompt and generated brief in a private location outside this
repository.
{{< /security >}}

## Start with business discovery

Use [Create a business-assistant brief](business-discovery/) to gather the
facts, boundaries, and open decisions needed before designing assistant
behaviour.
