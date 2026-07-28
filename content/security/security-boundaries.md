---
title: "Define assistant security boundaries"
description: "Review what a future assistant must protect, who may access it, which capabilities remain prohibited, and what must be tested."
weight: 10
draft: false
difficulty: "beginner"
estimated_time: "Not yet measured"
requirements:
  - "A private place to save security working notes"
  - "An authorised business owner or security decision-maker"
learning_outcomes:
  - "Identify protected assets, users, and trust boundaries"
  - "Distinguish design requirements from implemented and tested controls"
  - "Record unresolved high-risk questions that must block deployment"
security_notes:
  - "Never commit a completed review containing real infrastructure or security details"
---

A security boundary separates information or capabilities with different trust
levels. Before an assistant is implemented, the business should decide what
must be protected, who may do what, and how unsafe or uncertain requests should
stop.

This lesson documents design requirements only. It does not configure
authentication, Hermes, a firewall, a server, or any other security control.

Useful preparation includes:

- [project readiness](/start-here/project-readiness/)
- [the intended architecture](/start-here/architecture/)
- [Business Discovery](/prompt-library/business-discovery/)
- [the fictional salon example](/business-examples/salon-assistant/)

## Use the canonical security review

The complete reusable checklist lives in the reference directory:

{{< reference-file source="reference/examples/assistant-security-review.md" download="downloads/assistant-security-review.md" label="Assistant security review" >}}

The reference file is canonical. This lesson explains the review and shows only
short excerpts.

## Complete the review privately

Make a private copy outside this repository. Use placeholders in public
material and add real infrastructure or security details only to an approved
private record.

{{< warning >}}
A completed review may identify administrator roles, public entry points,
private services, credential storage, logging, backups, incident ownership,
known weaknesses, and deployment blockers. Do not commit it, attach it to a
public issue, or paste it into a public prompt.
{{< /warning >}}

## Identify protected assets

An asset is something the business would be harmed by losing, exposing, or
changing without permission.

Assets may include credentials, customer information, approved business
knowledge, private configuration, tool permissions, logs, backups, and the
ability to perform a business action. Record categories rather than secret
values.

Ask:

- What must remain confidential?
- What must not be changed by an unauthorised person?
- What must remain available for the business to operate?
- What would require recovery if it were lost or corrupted?

The canonical review records these as `<PROTECTED_ASSETS>`.

## Identify users and trust levels

Not every user should have the same access. Relevant groups may include public
customers, the business owner, authorised administrators, support roles, and
the assistant itself.

A public customer is not trusted to change configuration or approve a tool.
The assistant is also not an administrator merely because it can produce
convincing text.

Use roles such as `<BUSINESS_OWNER_ROLE>` and `<AUTHORISED_ADMIN_ROLES>` instead
of real names in public material.

## Map system boundaries

Start with the [architecture lesson](/start-here/architecture/). Mark where
information crosses between:

- a public customer and the messaging entry point
- a public entry point and a private service
- assistant instructions and untrusted messages
- the AI model and approved business knowledge
- the assistant and a proposed tool
- automated handling and human escalation

Each crossing is a trust boundary that requires an explicit decision about
validation, permissions, data exposure, failure, and logging.

## Separate public and private components

`<PUBLIC_ENTRY_POINTS>` describes only the minimum interfaces intended to
receive public traffic. Public does not mean trusted.

Private services, configuration, credentials, customer records, administrator
functions, logs, and backups should not become public merely because the
assistant needs one narrow result.

No real component address, hostname, account identifier, or access detail
belongs in the canonical review.

## Apply least privilege

Least privilege means granting only the minimum access needed for one approved
purpose, for only as long as it is needed.

If the assistant only needs an approved service description, it should not
receive access to unrelated files, customer histories, or administrator
functions. Convenience is not a reason for broad access.

## Keep tools narrowly scoped

A narrowly scoped tool has a specific outcome, limited inputs, limited output,
clear failure behaviour, and an identified approval owner.

`<APPROVED_TOOLS>` must list only tools whose purpose and access have been
reviewed. `<PROHIBITED_CAPABILITIES>` should prohibit broad shell, filesystem,
network, database, credential, and administrator access by default.

{{< security >}}
A proposed tool is not an implemented control or capability. Tool access
requires separate owner, security, and technical approval, followed by
implementation evidence and testing.
{{< /security >}}

## Authentication and authorisation are different

Authentication asks, “Who is this user or system?” Authorisation asks, “What is
this authenticated identity allowed to do?”

Knowing or claiming an identity does not automatically grant permission. A
future system must verify both questions where privileged actions exist. This
lesson does not define an authentication method or configuration.

## Treat customer input as untrusted

Customer messages may be mistaken, ambiguous, manipulated, or hostile. They
must not be treated as instructions that can change system rules, grant tool
access, or reveal private information.

The assistant should clarify ordinary ambiguity, refuse prohibited requests,
and escalate sensitive or unresolved situations.

## Understand prompt injection

Prompt injection is an attempt to make an assistant ignore its approved
instructions or misuse information and tools. It can appear as a direct
instruction, quoted content, or information presented as if it came from an
administrator.

Testing should verify that such messages do not reveal hidden instructions,
expand permissions, expose customer data, or trigger prohibited actions. This
guide describes safe test goals, not offensive exploitation procedures.

## Protect secrets

Credentials include passwords, access tokens, private keys, and verification
secrets. They must stay out of prompts, Markdown, Git, screenshots, logs, and
public support conversations.

The private review may record an approved storage method and authorised roles,
but should not contain the credential values themselves.

## Minimise customer data

Collect only information necessary for a specific supported goal. Do not ask
for information merely because it might be useful later.

The owner must approve both the allowed data categories and the prohibited
categories. Sensitive or unexpectedly detailed messages should trigger safe
handling and, where appropriate, human escalation.

## Control logging risks

Logs can help investigate failures, but they may also retain customer messages,
identifiers, tool arguments, or security details.

`<LOG_RETENTION_RULE>` should define what may be logged, what must be redacted,
who may read logs, and when records are removed. A logging rule is not verified
until the implementation and its output have been inspected.

## Define human escalation

`<ESCALATION_CONTACT_ROLE>` is the authorised role for situations the assistant
cannot handle safely. Escalation conditions should include unsupported,
sensitive, disputed, uncertain, and unconfirmed actions.

Real names and contact details belong only in a private operational process.

## Fail safely

When a control, tool, or information source is unavailable or unclear, the
assistant should stop the affected action, avoid claiming success, preserve
the approved data boundary, and offer the approved escalation path.

Repeated attempts must not create an uncontrolled loop or gradually broaden
access.

## Plan backups and rollback

Backups protect recoverable information; rollback returns a change to a known
state. The review identifies `<BACKUP_OWNER_ROLE>` and a rollback owner, but
does not claim that either process works.

A future implementation requires documented scope, secure storage, restoration
testing, change verification, and clear responsibility.

## Test normal, confusing, and hostile requests

Security testing should include:

- normal requests that must stay inside approved boundaries
- confusing or uncertain requests that require clarification or escalation
- prompt-injection attempts that must not change rules
- tool-abuse requests that must not broaden permissions

Every test requires expected safe behaviour. A test without an expected result
cannot show whether the boundary held.

## Separate design, implementation, and evidence

The canonical review uses three design statuses:

> **Confirmed design requirement:** approved by the owner as a requirement,
> but not proof of implementation.
>
> **Proposed control:** suggested and awaiting approval or evidence.
>
> **Unresolved risk:** unanswered and potentially able to block deployment.

After implementation, a separate review would need evidence that a control
exists and test results showing how it behaved. This repository currently
provides neither.

## Block deployment on unresolved high risk

An unresolved high-risk question should block dependent deployment work. The
business should not treat an unknown credential boundary, administrator role,
public entry point, tool permission, customer-data rule, logging rule, backup,
rollback, or incident owner as a minor documentation gap.

{{< warning >}}
If a high-risk decision has no approved answer or a control has no evidence,
record the blocker and stop the dependent deployment. Do not label a proposed
control as implemented to make the review appear complete.
{{< /warning >}}

## Verify the private review

- [ ] The purpose and protected assets are defined.
- [ ] Authorised and unauthorised roles are separated.
- [ ] Public entry points and private services are identified.
- [ ] Customer input is classified as untrusted.
- [ ] Credential and customer-data boundaries are approved.
- [ ] Tools are narrow and broad access is prohibited by default.
- [ ] Logging, escalation, backup, rollback, and incident owners are recorded.
- [ ] Every test has expected safe behaviour.
- [ ] Confirmed requirements, proposals, and unresolved risks are separate.
- [ ] High-risk unresolved questions block deployment.
- [ ] The completed review is stored privately.

{{< expected-output >}}
You have a private design review that identifies protected assets, trust
boundaries, minimum access, prohibited capabilities, responsible roles, tests,
and unresolved deployment blockers. It does not claim that controls are
implemented or tested.
{{< /expected-output >}}

{{< troubleshooting >}}
If the review depends on unknown access, missing owners, real secrets in the
document, or untested broad permissions, stop the dependent work. Remove secret
values from the review, record the unresolved risk, and seek authorised human
review.
{{< /troubleshooting >}}
