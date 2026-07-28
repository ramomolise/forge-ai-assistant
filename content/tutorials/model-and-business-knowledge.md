---
title: "Design model and business-knowledge boundaries"
description: "Plan provider-neutral model access, private authentication, reviewed identity, approved facts, uncertainty, escalation, and testing."
weight: 50
draft: false
difficulty: "beginner"
estimated_time: "Not yet measured"
requirements:
  - "An approved assistant purpose"
  - "A private model and knowledge review location"
learning_outcomes:
  - "Separate a model from verified business knowledge"
  - "Keep provider authentication private and manual"
  - "Define uncertainty, response, escalation, and test boundaries"
security_notes:
  - "Do not place model credentials or production endpoints in Git"
  - "Generated suggestions are not confirmed business facts"
---

An AI model interprets input and generates text. It does not automatically know
the business, confirm a fact, or authorise an action. This lesson designs the
boundary without choosing a required provider or connecting a model.

## Use the canonical review

{{< reference-file source="reference/examples/model-business-knowledge-review.md" download="downloads/model-business-knowledge-review.md" label="Model and business-knowledge review" >}}

Complete a private copy. Keep credentials, endpoints, customer data, and
production business information outside this repository.

## Keep the model connection generic

Use `<MODEL_ENDPOINT>` and `<MODEL_NAME>` in public design material. The
endpoint identifies where approved model requests would go; the model name
selects an approved model at that endpoint. Neither placeholder implies that a
particular provider, paid service, or model is required.

Authentication is a separate private step. Use the provider's documented
private credential mechanism and configure it manually. Do not put a key in a
prompt, command argument, Markdown file, screenshot, or log.

## Separate identity from permission

System identity describes the assistant's purpose, tone, limits, and behaviour.
Hermes Agent documents `SOUL.md` as durable identity. A system prompt or
identity file can say that an action is prohibited, but it cannot technically
remove filesystem, network, or tool permission.

Pair reviewed identity with external access controls and narrow tools.

## Build an approved knowledge set

Business knowledge should contain only owner-confirmed facts needed for
supported customer goals. Record the source, reviewer, review date, intended
audience, and expiry or recheck condition for each category.

Generated wording and suggestions remain drafts until a human checks them.
Conflicting, missing, expired, or ambiguous information must not be silently
turned into a confident answer.

## Define uncertainty and response limits

The assistant should say when it lacks an approved answer, ask only a necessary
clarifying question, and offer an approved human route. Set limits for topics,
detail, repeated attempts, sensitive data, and claims of completed action.

It must not invent a price, policy, availability, booking, refund, professional
advice, or tool result. A plausible answer is not a verified answer.

## Test with synthetic information

Test normal approved facts, unknown questions, conflicting facts, requests for
private information, instructions to ignore boundaries, and repeated attempts.
Every test needs expected safe behaviour.

{{< expected-output >}}
A private review identifies the model placeholders, authentication owner,
approved knowledge categories, identity, response limits, uncertainty rules,
escalation path, and synthetic tests. It does not claim a connection works.
{{< /expected-output >}}

## Verification

- [ ] No provider is presented as required.
- [ ] Endpoint, model name, and credentials remain placeholders or private.
- [ ] Every business fact has an authorised source and reviewer.
- [ ] Generated suggestions remain distinct from confirmed facts.
- [ ] Identity is not treated as a permission boundary.
- [ ] Uncertainty and response limits lead to safe escalation.
- [ ] Tests use synthetic data and expected safe behaviour.
- [ ] No active model connection is claimed.

{{< troubleshooting >}}
Stop if the provider's current documentation is unclear, credentials appear in
public material, facts have no owner, or the assistant is expected to guess.
Record the unresolved question and block the dependent connection.
{{< /troubleshooting >}}

{{< rollback >}}
Before changing a private model or knowledge configuration, back it up through
an approved process. If verification fails, disable the affected connection,
restore the last reviewed private state, and retest with synthetic data. Do not
delete credentials or knowledge records without owner-approved retention and
recovery decisions.
{{< /rollback >}}

## Source boundary

Hermes Agent's official model and configuration documentation was checked on
28 July 2026. It supports interactive provider/model selection and custom
endpoints. This lesson deliberately publishes no configuration keys or
provider-specific authentication instructions because those choices are not
yet approved.

## Next lesson

Design messaging and webhook handling only after the model and knowledge review
has no unresolved high-risk blocker.
