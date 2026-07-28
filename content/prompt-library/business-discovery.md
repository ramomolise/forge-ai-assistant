---
title: "Create a business-assistant brief"
description: "Prepare reviewed business information and use a canonical prompt to draft a structured assistant brief."
weight: 10
draft: false
difficulty: "beginner"
estimated_time: "Not yet measured"
requirements:
  - "A private place to save working notes"
  - "An authorised person who can review business decisions"
learning_outcomes:
  - "Prepare safe, relevant information for business discovery"
  - "Use the canonical prompt without sharing private customer data or secrets"
  - "Review a generated brief and identify decisions requiring owner approval"
security_notes:
  - "Generated output is a draft and must remain private until reviewed"
---

Business discovery is the process of writing down what an assistant should and
should not help with before anyone designs its behaviour.

This lesson helps you prepare information and use a reusable prompt to produce
a draft business-assistant brief. It does not configure Hermes, call an API, or
connect a production service.

If you have not done the foundational planning, first complete
[Check whether you are ready for this learning
project](/start-here/project-readiness/) and review
[the intended architecture](/start-here/architecture/).

## Use the canonical prompt

The complete reusable prompt lives in the reference directory:

{{< reference-file source="reference/examples/business-discovery-prompt.md" download="downloads/business-discovery-prompt.md" label="Business discovery prompt" >}}

The reference file is canonical. This lesson explains how to prepare, use, and
review it. Only short excerpts appear here.

## Prepare confirmed business information

Begin with facts an authorised person can verify:

- a short description of the business and the customers it intends to serve
- common reasons customers contact the business
- requests the future assistant may support
- requests it must refuse or pass to a person
- business hours and rules for availability
- information customers may receive
- information that must remain restricted

Use generic categories instead of customer records. If a fact is not confirmed,
mark it as unknown rather than filling the gap with a guess.

## Define customer-information boundaries

List the minimum information needed for each supported request. Separately list
information the assistant should not ask for or retain.

Do not copy real customer names, contact details, conversations, account
records, or other identifying data into the canonical prompt. Synthetic
descriptions such as “a customer asks whether a service is available” are
enough for discovery.

{{< security >}}
Never paste passwords, tokens, private keys, production addresses,
administrator contact details, or private server evidence into an AI prompt.
The model does not need credentials to help structure a business brief.
{{< /security >}}

## Prepare escalation and failure rules

Write down when a person must take over. Examples of categories include an
unsupported request, uncertain business information, a sensitive situation, or
an action whose success cannot be confirmed.

Also decide what the assistant should do when information is missing or a
future tool is unavailable. Safe failure behaviour should avoid inventing an
answer, claiming success, or hiding uncertainty.

## Describe tone and language preferences

Describe how the business wants to communicate: for example, concise or
detailed, formal or conversational, and which language preferences require
further review.

{{< sa-context >}}
South African businesses may serve customers with different language and tone
preferences. Record what the business has actually confirmed. Do not assume a
customer's preferred language, background, or level of technical knowledge.
{{< /sa-context >}}

Tone guidance must not override accuracy, privacy boundaries, refusal rules, or
human escalation.

## Consider possible tools carefully

A tool would allow a future assistant to request a specific business action.
At discovery stage, describe the desired outcome, not a broad technical
solution.

Prefer a narrow idea such as “check whether a defined appointment slot is
available” over general access to calendars, files, email, or the server. A
suggested tool is not approved merely because a model included it.

## Record risks and unresolved questions

Prepare a list of decisions the business has not made. Include who must approve
each decision and what evidence is needed.

Known risks might concern incorrect information, unnecessary data collection,
inappropriate automation, unavailable escalation, or actions that cannot be
confirmed. These are prompts for review, not proof that every risk has been
identified.

## Use the prompt privately

Make a private copy of the canonical prompt outside this repository. Replace
its placeholders only with reviewed, non-secret information. Leave a
placeholder or write `UNKNOWN` when the answer is not yet confirmed.

A short excerpt from the prompt is:

> Separate confirmed facts, assumptions, suggestions, and owner-approval
> decisions. Do not turn an unknown into a business fact.

Submit the private copy to the AI model available to you only after checking
that it contains no customer records, credentials, or production details.
Provider choice and provider-specific handling are outside this lesson.

{{< warning >}}
Save the completed prompt and generated brief in an approved private location.
Do not commit them to this repository or paste them into a public issue. They
may reveal business rules, gaps, risks, and escalation arrangements.
{{< /warning >}}

## Review the generated brief

Review the result section by section with the business owner or another
authorised decision-maker:

1. Compare every claimed fact with the prepared source information.
2. Check that assumptions and suggestions are clearly labelled.
3. Remove invented services, rules, capabilities, or customer details.
4. Confirm that supported and unsupported requests are distinct.
5. Check that requested customer information is the minimum needed.
6. Confirm that sensitive and uncertain cases escalate to a person.
7. Reject broad tool access and keep only narrowly defined proposals.
8. Review each proposed test and its expected result.
9. Record every decision that still needs owner approval.

Generated output is a design draft. It is not Hermes configuration and must not
be treated as deployed business logic.

## Verification checklist

- [ ] The input contained no credentials or production access details.
- [ ] The input contained no real customer record or private conversation.
- [ ] Confirmed facts are distinguishable from assumptions and suggestions.
- [ ] Supported and unsupported requests are both documented.
- [ ] Customer-data collection is limited to stated needs.
- [ ] Escalation and failure behaviour are clear.
- [ ] Tool ideas are narrow and remain unapproved proposals.
- [ ] Acceptance tests use synthetic scenarios and expected outcomes.
- [ ] Unresolved decisions name an approval role.
- [ ] The completed prompt and output are stored privately.

{{< expected-output >}}
You have a privately stored draft brief with confirmed facts separated from
assumptions and suggestions, clear assistant boundaries, escalation rules,
narrow tool proposals, acceptance-test ideas, and an owner-approval list.
{{< /expected-output >}}

## What the prompt cannot determine

The prompt cannot determine:

- whether an unverified statement about the business is true
- which decision the owner should approve
- whether a proposed process meets legal or contractual obligations
- whether a tool is secure or technically feasible
- how Hermes should be configured
- whether an external provider is suitable
- whether an integration or backup works
- actual operating costs
- whether the final assistant is safe or ready for production

{{< troubleshooting >}}
If the result contains invented facts, broad access, excessive data collection,
or confident answers to unresolved questions, do not try to polish those
sections into acceptance. Mark them for correction, supply only verified
information, and repeat the review.
{{< /troubleshooting >}}

## Next step

Keep the reviewed brief private. Later lessons may use its approved,
non-sensitive decisions to define assistant purpose, boundaries, and tests.
Those lessons and any Hermes implementation material remain future work.
