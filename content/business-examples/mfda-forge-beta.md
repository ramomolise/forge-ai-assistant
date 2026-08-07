---
title: "Inside the MFDA Forge closed beta"
description: "A real, sanitised case study of a restricted WhatsApp assistant being privately tested by Motion Foundry Dance Academy."
weight: 5
draft: false
---

Forge is a working AI WhatsApp assistant undergoing private closed-beta testing
with Motion Foundry Dance Academy (MFDA). This is a **real but sanitised case
study**: it explains verified design patterns and lessons without providing a
downloadable copy of the production system.

The beta does not prove that every future deployment will behave in the same
way. Its live configuration, operational data and customer information remain
private.

## The business problem

MFDA receives recurring WhatsApp questions about available dance styles,
suitable classes for different ages, prices, schedules, complimentary trials,
locations and speaking directly to Ramo.

Answering repeated questions consistently takes time. Yet a helpful first reply
is not the same as a business decision: trial approval, uncertain schedule
questions and sensitive situations must remain with a person.

## Forge's limited role

Forge may:

- provide approved class information;
- ask only for details that are still needed;
- match an enquiry to a suitable class using reviewed age and dance-style data;
- submit an **unconfirmed** complimentary trial request; and
- request human follow-up.

Forge may not:

- invent a class, price, schedule, venue or policy;
- claim it checked availability when no availability tool exists;
- approve or confirm a trial;
- expose customer or administrative information;
- perform unrestricted server, shell, file or database operations; or
- claim that Ramo was notified unless the handover tool succeeds.

Customer and administrator capabilities are kept separate. Under-18 enquiries
require suitable parent or guardian details. Breaking schedule enquiries go to
a person while the recurring schedule remains unconfirmed.

## A sanitised trial-request journey

This fictional journey illustrates the real workflow without reproducing a
customer conversation:

1. **Naledi** asks which classes might suit a 13-year-old interested in a
   particular dance style.
2. Forge asks only for any age or style detail that is still missing.
3. Forge responds with matching information from reviewed class data.
4. Naledi asks for a complimentary trial on `<PREFERRED_DATE>`.
5. Forge gathers only the contact and guardian details required for the
   request.
6. A restricted tool submits the trial request.
7. Forge says the request is awaiting human confirmation; it does not call it a
   booking.
8. Ramo confirms or follows up outside the automated decision.

A tool success proves only that the request was submitted. It does not prove
that a place is available or that the customer may attend.

## Venue-state logic

The beta uses controlled venue states so uncertain information cannot quietly
become a confirmed customer-facing location:

| State | Meaning | Customer-facing rule |
| --- | --- | --- |
| `example` | Fictional information used for testing. | Never present it as a real venue. |
| `proposed` | A possible location that has not been confirmed. | Do not present it as confirmed. |
| `confirmed_temporary` | A reviewed location approved for a limited period. | Use only within its approved conditions. |
| `confirmed_permanent` | A reviewed location approved as ongoing information. | It may be shared within the assistant's rules. |

No private or example beta venue is named here. Hiding a location in one reply
is not enough; its state must control whether it can be presented as confirmed.

## Lessons discovered during testing

- **“Requested” and “confirmed” are not interchangeable.** Customer wording
  must preserve the true state of a trial.
- **Availability requires a real capability.** A model must not claim it checked
  availability when no availability tool exists.
- **Lead submission is not attendance confirmation.** A successful tool call
  records a request; a person still makes the decision.
- **Handover needs useful context.** A notification must contain enough safe
  context to identify and assist the customer.
- **Test channels differ.** Terminal tests and real WhatsApp messages provide
  different metadata, so both paths matter.
- **Real messages are messy.** Customers use incomplete, misspelled and
  ambiguous wording that polished test prompts can miss.
- **Automation is only one layer of evidence.** Synthetic tests complement but
  do not replace real closed-beta testing.
- **Operation needs visibility.** Audit visibility, restricted tools,
  short-lived conversation sessions and maintenance controls are used during
  the private beta; observability is required before broader use.
- **Safe stopping is a feature.** A kill switch and a clear maintenance response
  are essential when the assistant should not continue.

## Privacy and openness

This case study publishes patterns and lessons, not customer conversations,
personal information, production prompts, credentials, private endpoints,
databases, live business configuration, phone numbers, lead identifiers,
private locations or server logs.

The assistant core runs on infrastructure managed by the operator, but the
complete system is not fully self-hosted. WhatsApp Cloud API and other external
services remain involved, so information handling must be reviewed across the
whole message path.

{{< security >}}
The beta's safeguards reduce risk; they do not guarantee a secure deployment.
This guide raises practical privacy considerations but does not replace
professional legal advice.
{{< /security >}}

## Continue learning

- Follow the [Build with Hermes ZA tutorials](/tutorials/) to understand the
  system one boundary at a time.
- Review [security boundaries](/security/security-boundaries/) before designing
  tools or collecting customer details.
- Use the [business-discovery prompt](/prompt-library/business-discovery/) to
  define a narrow, reviewable assistant role.
- Explore the [public reference section](/reference/) for sanitised checklists
  and future generic implementation material.
