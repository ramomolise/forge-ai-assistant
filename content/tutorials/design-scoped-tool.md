---
title: "Design one narrowly scoped tool"
description: "Turn one approved business outcome into a small tool proposal with explicit data, permissions, confirmation, failure, and abuse boundaries."
weight: 80
draft: false
difficulty: "beginner"
estimated_time: "Not yet measured"
requirements:
  - "An owner-approved assistant purpose"
  - "A completed security-boundaries review"
learning_outcomes:
  - "Define a one-purpose tool with minimum inputs and outputs"
  - "Separate customer, administrator, and owner approval"
  - "Design success, failure, retry, logging, and abuse tests"
security_notes:
  - "This lesson designs but does not implement a tool"
  - "Broad shell, filesystem, network, database, credential, and administrator access remain prohibited"
---

A tool lets an assistant request a defined operation from software. The model's
request is not permission to run it, and generated text is not proof that an
operation succeeded.

This lesson creates a design only. It grants no access and implements no
production tool.

## Use the canonical checklist

{{< reference-file source="reference/examples/scoped-tool-design-checklist.md" download="downloads/scoped-tool-design-checklist.md" label="Scoped tool design checklist" >}}

Complete it privately with authorised business and security reviewers.

## Start with one purpose

Write one outcome a customer understands. A tool called “manage the business”
is too broad. A possible fictional salon design is “return owner-approved
appointment-slot labels from a synthetic read-only list”.

That example does not read a real calendar, make a booking, reveal customer
records, or change availability. Those would be separate capabilities with
separate reviews.

## Define explicit inputs and outputs

Name every accepted field, type, allowed value, length, and whether it is
required. Reject unknown fields. Collect the minimum data needed for the one
outcome.

Define an equally narrow response: a status, the approved result fields, and a
safe error category. Do not return internal paths, queries, raw provider
responses, credentials, unrelated records, or debugging details.

## Prefer read-only and allowlisted behaviour

Begin read-only. List allowed operations and resources; deny everything else.
The tool must not gain general shell, filesystem, network, database,
credential, or administrator access.

If a later write action is genuinely necessary, design it as a separate tool.
Require owner approval and a confirmation step that shows the exact
consequence before execution.

## Separate permissions

A public customer may request only customer-approved outcomes. An
administrator role is not established by a claim in a message. Owner and
security approval happens outside the customer conversation.

The assistant, model, customer, and administrator are distinct roles. None may
expand its own permissions.

## Make success and failure unambiguous

Success must come from a confirmed tool result, not the model's expectation.
Failures should use limited categories, reveal no private details, and never
be reworded as success.

Set a timeout, a small retry limit for approved retryable failures, and a total
tool-loop limit. Repeated failure stops and escalates; it never broadens access.

## Minimise logs

Log only an approved event category, synthetic or necessary identifiers, safe
status, and timing needed for operations. Redact credentials and unnecessary
customer information. Define readers and retention before enabling logging.

## Test injection and abuse

Test unknown input fields, excessive values, role impersonation, requests for
other customers' information, instructions to ignore the schema, shell or file
requests, unrelated network destinations, repeated retries, ambiguous results,
and false-success pressure.

Every case needs expected safe behaviour. The tool itself must enforce its
boundary even if the model asks convincingly.

{{< expected-output >}}
A reviewed tool proposal has one purpose, an explicit schema, minimum data,
read-only and allowlisted access, clear roles, confirmation boundaries, safe
results, failure limits, logging rules, and abuse tests. No capability has been
implemented or granted.
{{< /expected-output >}}

## Verification

- [ ] The purpose describes one customer-visible outcome.
- [ ] Inputs and outputs are explicit and minimal.
- [ ] Read-only is the default.
- [ ] Allowed operations and resources are listed.
- [ ] Broad access is prohibited.
- [ ] Customer, administrator, owner, and assistant roles are separated.
- [ ] Consequential action would require separate approval and confirmation.
- [ ] Success requires a confirmed result.
- [ ] Timeout, retry, and loop limits fail safely.
- [ ] Logs minimise and redact data.
- [ ] Injection and abuse tests have expected safe behaviour.

{{< troubleshooting >}}
Stop if the proposal needs “all files”, “any command”, an unrestricted
endpoint, broad database access, credentials, administrator permission, or an
undefined retry. Split the outcome or escalate the unresolved design.
{{< /troubleshooting >}}

{{< rollback >}}
Because this lesson grants no capability, rollback means withdrawing the
proposal and retaining its review record. A future implementation must include
its own disable switch, state recovery, verification, and owner-approved data
retention plan.
{{< /rollback >}}

## Next lesson

Build the complete synthetic test and operations plan before implementing or
connecting any tool.
