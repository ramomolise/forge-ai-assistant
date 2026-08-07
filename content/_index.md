---
title: "Build a practical AI assistant for your small business"
description: "A South African, WhatsApp-first learning project based on lessons from the private MFDA Forge closed beta."
---

Follow a South African, WhatsApp-first learning project based on lessons from a
real closed beta. Learn how to design a focused assistant, protect customer
information, restrict its actions, test realistic conversations and hand
control back to a person.

{{< home-actions >}}

{{< project-status >}}

## Three names, one project

- **Forge** is the working AI WhatsApp assistant in a private closed beta with
  Motion Foundry Dance Academy (MFDA). Its live configuration and data are not
  public.
- **Hermes** is the underlying agent software. In plain language, it coordinates
  the assistant's approved instructions, business knowledge and limited tools.
- **Build with Hermes ZA** is this project's educational learning path. It turns
  sanitised lessons from Forge into understandable guidance for South African
  entrepreneurs.

## Choose your path

{{< path-grid >}}

## How the intended system works

A customer sends a message through WhatsApp. A protected web address called a
webhook receives it. Hermes then uses reviewed business information or a
narrowly restricted tool to prepare a response. When the request is uncertain,
sensitive or outside its role, the assistant hands control back to a person.

{{< system-flow >}}

{{< security >}}
The assistant core may run on infrastructure managed by its operator, but the
whole system is not fully self-hosted. WhatsApp Cloud API and other external
providers remain involved. Never copy production credentials, customer data or
private configuration into this public repository.
{{< /security >}}

## Learn from the closed beta

The [MFDA Forge case study](/business-examples/mfda-forge-beta/) explains what
Forge may do, what stays under human control and what testing has taught us. It
shares patterns and lessons—not customer conversations, production prompts,
credentials, endpoints or live business configuration.
