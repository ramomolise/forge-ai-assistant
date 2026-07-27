---
title: "Understand the intended system architecture"
description: "Learn how the planned customer, messaging, server, AI, business knowledge, tools, and human escalation components relate."
weight: 10
draft: false
difficulty: "beginner"
estimated_time: "Not yet measured"
requirements:
  - "No technical experience required"
learning_outcomes:
  - "Name each component in the intended architecture"
  - "Describe the planned path of a customer message"
  - "Identify where tightly limited access and human escalation matter"
security_notes:
  - "This is a conceptual design, not a verified deployment"
---

This lesson explains the intended system in plain English. It contains no setup
commands and does not claim that any integration is currently working.

## What you are learning

The planned assistant has several parts. Each part has one job, and information
passes between them along a controlled route.

{{< expected-output >}}
After this lesson, you should be able to explain the intended message path from a customer to the assistant and back, and identify when a business owner should take over.
{{< /expected-output >}}

## The intended message path

The planned flow is:

1. A **customer** sends a message to the business on WhatsApp.
2. **WhatsApp Cloud API** is expected to notify a public webhook about the
   message.
3. The **public webhook** is the internet-reachable entry point intended to
   accept valid messaging events.
4. **Cloudflare Tunnel** is the currently intended tunnel option. It would carry
   approved traffic through an outbound connection instead of requiring the
   Hermes gateway to be exposed directly.
5. The tunnel would forward the request to a local service on the **VPS**.
6. **Hermes** is intended to coordinate the assistant conversation and its
   approved capabilities.
7. An **AI model** would help interpret the message and draft an appropriate
   response within the assistant's instructions.
8. **Business knowledge** would supply reviewed facts such as services,
   operating rules, and escalation information.
9. **Narrowly scoped tools** would allow only specific approved business
   actions, if a later implementation genuinely needs them.
10. A **business owner or other authorised person** would handle requests that
    the assistant cannot answer or act on safely.

A response would need to travel back through the approved messaging path. That
return path is part of the intended design and has not yet been implemented or
verified here.

## What each component means

### Customer

The customer is the person contacting the business. Their message may contain
personal, incomplete, or sensitive information. The system should request only
what is necessary and should not assume every request can be automated.

### WhatsApp Cloud API

An API is a controlled way for software systems to exchange information.
WhatsApp Cloud API is intended to be the messaging connection between WhatsApp
and the future assistant. Account creation, permissions, message behaviour, and
setup steps still require current, authoritative verification.

### Public webhook

A webhook is an address another service can notify when an event occurs. Meta
would need an internet-reachable webhook for messaging events, but that does
not mean the Hermes gateway itself should be directly open to the internet.

A future webhook implementation must validate that requests are legitimate
before accepting or processing their contents.

### Cloudflare Tunnel

A tunnel creates an outbound connection from the VPS and maps a public hostname
to a local service. Cloudflare Tunnel is the intended example for this
curriculum, but no tunnel configuration or account procedure has been verified
in this repository.

Tunnel credentials would be secrets. Tunnelling is infrastructure and should
remain separate from the assistant's business behaviour and stored data.

### VPS

A virtual private server, or VPS, is a rented computer reached over the
internet. The future design expects it to host the local gateway and assistant
components. Provider choice, capacity, operating system requirements, and
recovery procedures remain unverified.

### Hermes

Hermes is intended to coordinate messages, assistant instructions, approved
knowledge, model access, and limited tools. This repository does not yet contain
a verified Hermes installation or configuration, so more specific behaviour
must not be assumed from this architecture page.

### AI model

The AI model is the component intended to interpret language and produce a
draft response. It should not be treated as a source of guaranteed business
facts or permission. Business rules, approved information, tool restrictions,
and human escalation remain necessary.

### Business knowledge

Business knowledge is the reviewed information the assistant is allowed to use,
such as service descriptions or operating rules. It should be generic in this
public repository. Real business information belongs in private operational
configuration.

### Narrowly scoped tools

A tool lets an assistant request a specific action from another system. A
narrowly scoped tool should expose only the minimum operation and information
needed for its task. No business tool is implemented or verified here.

### Business owner or human escalation

Automation needs a clear stopping point. The intended design hands a
conversation to an authorised person when information is missing, a request is
unsupported, an action is sensitive, or safe completion cannot be confirmed.
The person remains responsible for business decisions.

## Trust boundaries

{{< security >}}
Treat customer messages, webhook requests, model output, and tool arguments as
untrusted until the relevant checks succeed. Credentials must remain outside
Git, and a public webhook must not grant broad access to the VPS or business
systems.
{{< /security >}}

The intended architecture separates:

- the public messaging entry point from the local gateway
- assistant-generated text from approved business facts
- customer permissions from owner permissions
- conversation guidance from narrowly scoped actions
- automated handling from human decisions

These are design goals, not evidence of controls already implemented.

{{< sa-context >}}
For a small South African business, the design should remain usable on mobile
devices and under variable connectivity. A future implementation also needs a
clear manual fallback when the service, internet connection, or power supply is
unavailable. No particular continuity setup is claimed here.
{{< /sa-context >}}

## What remains unverified

{{< troubleshooting >}}
No end-to-end message flow has been tested in this repository. Provider
accounts, webhook behaviour, tunnel configuration, VPS requirements, Hermes
behaviour, model access, tool permissions, message delivery, and escalation
procedures all require separate implementation and verification.
{{< /troubleshooting >}}

## Return to the learning path

Return to [Start Here](/start-here/) to review the planned curriculum and
project boundaries.
