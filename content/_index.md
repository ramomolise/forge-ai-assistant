---
title: "Build with Hermes ZA"
description: "Learn how the parts of a simple, secure AI assistant fit together before following future build guidance."
---

This project teaches South African entrepreneurs how the parts of a practical
AI assistant fit together. It starts with plain-English explanations, then will
progress towards reviewed tutorials and reusable reference material.

It is intended for small-business owners and operators who use WhatsApp to
communicate with customers and may have little experience with Linux, servers,
APIs, or AI systems.

## What you will eventually build

The planned learning path leads towards a narrowly scoped assistant that can
receive a customer message through WhatsApp, use approved business information,
call only approved business tools, and hand the conversation to a person when
it cannot help safely.

This is the intended outcome of the curriculum. The repository does not yet
contain a complete or verified implementation.

{{< expected-output >}}
After the foundational lessons, you should be able to describe each part of the intended system and explain where customer data, credentials, and business decisions require protection.
{{< /expected-output >}}

## What this project is

This repository contains two connected learning resources:

- a Hugo website containing explanations and tutorials
- a reference area that will contain reviewed templates and examples

The repository is an educational open-source project. It is not a hosted
assistant service, and it does not connect your business to any external
provider.

{{< security >}}
Never add production credentials, customer information, private server reports,
or VPS command histories to this repository. Private evidence must stay outside
Git and must be sanitised, generalised, and independently verified before it
influences public documentation.
{{< /security >}}

## Begin with the system map

Go to [Start Here](/start-here/) for the audience, prerequisites, boundaries,
and planned learning path. Then read
[Understand the intended system architecture](/start-here/architecture/) to see
how the customer-facing and technical parts are expected to relate.
