---
title: "Check whether you are ready for this learning project"
description: "Use a private readiness checklist to identify what you have, what you still need to learn, and which decisions must wait."
weight: 20
draft: false
difficulty: "beginner"
estimated_time: "Not yet measured"
requirements:
  - "No technical experience required"
learning_outcomes:
  - "Assess whether you can begin the learning material safely"
  - "Identify access, information, and planning gaps"
  - "Keep completed readiness notes outside the public repository"
security_notes:
  - "Do not put private business details or credentials in a committed checklist"
---

Readiness does not mean having every account or knowing every command. It means
understanding the learning commitment, identifying what is missing, and keeping
private information out of the public project.

This lesson does not configure Hermes, WhatsApp, Cloudflare, a VPS, or an AI
model. None of those components is claimed to be working in this repository.

## Use the canonical checklist

The complete reusable checklist lives in the reference directory:

{{< reference-file source="reference/examples/project-readiness-checklist.md" download="downloads/project-readiness-checklist.md" label="Project readiness checklist" >}}

That reference file is canonical. This lesson explains its sections and shows
only short excerpts. If the checklist changes, this explanation should be
reviewed, but the complete checklist must not be copied into this page.

## Make a private working copy

Open the canonical checklist in your repository browser or text editor. Save a
copy in a private location outside this repository, then complete that copy for
your business.

Rename the private copy if that helps you identify it, but do not include a
business name, domain, phone number, or customer detail in a committed
filename.

{{< security >}}
A completed readiness checklist may reveal administrator roles, business
processes, account plans, security gaps, or recovery arrangements. Do not
commit it, attach it to a public issue, or paste it into a public conversation.
The canonical checklist must remain generic.
{{< /security >}}

## Learning expectations

The project is designed to teach you how the parts fit together, not to provide
a hosted service. You should expect to read explanations, keep notes, review
future commands before using them, and pause when a result differs from the
documented expectation.

A short excerpt from the checklist is:

> - [ ] I understand that this repository is educational.
> - [ ] I will record questions instead of guessing.

These statements help distinguish being ready to learn from being ready to
operate a production assistant.

## Computer and terminal access

Later lessons may require a computer with a terminal, a text editor, and
reliable enough connectivity to complete an administrative task without
rushing. Mobile access is useful for reading, but some future technical work
may be safer on a larger screen with a physical keyboard.

Record any access constraints. Also plan how you will stop safely if
connectivity or power is interrupted.

{{< sa-context >}}
Variable connectivity, mobile-first access, and power interruptions can affect
when administrative work is safe to attempt. The checklist asks you to record
a fallback rather than assuming uninterrupted access.
{{< /sa-context >}}

## Git and GitHub access

Git records changes to files. GitHub may eventually be used to obtain or
contribute repository material. You do not need to be a Git expert before
starting, but you should know that committed information can remain in history
even after the current file is edited.

Record whether you can access the learning repository and whether you need
help understanding the difference between public repository material and
private working notes.

## VPS planning

A VPS is part of the intended future architecture, but you do not need to
purchase one to read the foundational lessons. First record whether a VPS is
likely to be appropriate, who would administer it, and which questions remain
about maintenance, backups, access, and recurring cost.

No provider, server size, operating system requirement, or setup procedure is
verified by this lesson.

## Future account categories

The intended architecture may eventually require categories of accounts for a
VPS, an AI model, messaging, tunnelling, a hostname, and source collaboration.
The checklist records whether each category is already available, must be
investigated, or is deliberately deferred.

Do not create accounts or buy services merely to tick a box. Provider-specific
requirements must be verified in later reviewed guidance.

## Administrator access

Identify the authorised role that would administer the future system and the
role that would approve sensitive changes. For a very small business, one
person may hold both roles, but the responsibilities should still be written
down.

Use placeholders such as `<ADMIN_ROLE>` in the canonical copy. Put real names
and contact details only in your private working copy, if they are genuinely
needed.

## Business-information preparation

An assistant can only be dependable when its business information has an
identified owner and a review process. Decide who can verify service
descriptions, operating rules, supported customer requests, unsupported
requests, and escalation conditions.

Do not place production business information in the public checklist. At this
stage, record whether the information exists, who reviews it, and what is still
missing.

## Customer-data boundaries

Decide which customer information would be necessary for a supported task and
which information the assistant should not request or retain. Include a plan
for messages that contain more sensitive information than expected.

This is a practical design boundary, not legal guidance. Any later legal review
must be handled separately by an appropriately qualified person.

## Secret-handling rules

Secrets include passwords, access tokens, private keys, and verification
credentials. Before technical setup, decide where authorised people will store
them, who may access them, and what happens if one is exposed.

{{< warning >}}
Never put a real secret into the canonical checklist, a tutorial, a Git commit,
a screenshot, or a public support message. A placeholder marks where a private
value may eventually be needed; it is not an invitation to publish that value.
{{< /warning >}}

## Backup and rollback planning

A backup is useful only when its scope, storage, and recovery responsibility
are understood. A rollback plan explains how to return to a known state when a
change fails.

At readiness stage, identify who owns these plans and which decisions remain
open. Do not claim that recovery works until a future process has been tested.

## Human escalation planning

The intended assistant must have a path to an authorised person when a request
is unsupported, uncertain, sensitive, or cannot be completed safely. Record
the responsible role, availability boundaries, and the fallback when that
person is unavailable.

The public checklist uses role and method placeholders. Real contact details
belong only in the private copy.

## Testing availability

Future testing will need time, safe test data, expected outcomes, and someone
who can decide whether the behaviour is acceptable. Plan for normal,
confusing, failure, and hostile cases without using real customer
conversations.

Record who can participate and which testing work must wait. Availability for
testing is part of readiness, not an afterthought.

## Recurring-cost categories

Possible recurring categories include VPS hosting, hostname renewal, model
usage, messaging usage, connectivity, backups, monitoring, and optional
support. The checklist contains no figures because provider terms and usage can
change.

Record which categories need investigation and who will approve future
spending. Do not invent an estimate to make the checklist look complete.

## Unresolved decisions

An honest “not decided” is safer than a guessed answer. For each unresolved
item, record the question, the role responsible for resolving it, what evidence
is needed, and when it should be reviewed.

Unresolved decisions do not always prevent you from continuing with conceptual
lessons. They should prevent dependent technical work from being presented as
ready.

## Verify your readiness result

Review your private checklist and confirm:

1. every section has been considered
2. private details remain outside the repository
3. unknowns are recorded rather than guessed
4. account purchases and technical setup are deferred until verified guidance
5. an authorised person owns security, recovery, escalation, and testing
   decisions

{{< expected-output >}}
Your private checklist shows which learning work can begin now, which decisions
are deferred, and who is responsible for resolving each gap. It contains no
published credentials or customer information.
{{< /expected-output >}}

{{< troubleshooting >}}
If many items are unresolved, continue with conceptual lessons and record the
gaps. Do not respond by purchasing services, inventing technical requirements,
or copying private values into the repository.
{{< /troubleshooting >}}

## Next step

When the private readiness review is complete, read
[Understand the intended system architecture](/start-here/architecture/).
That lesson explains the planned components without asking you to configure
them.

No system change was made in this lesson, so there is no technical rollback.
If a private detail was accidentally added to Git, stop and follow the
repository's secret-response process before continuing.
