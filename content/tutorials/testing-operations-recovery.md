---
title: "Plan testing, operations, and recovery"
description: "Define synthetic conversation tests, health and log review, data redaction, session expiry, incidents, backups, restore tests, and rollback."
weight: 90
draft: false
difficulty: "beginner"
estimated_time: "Not yet measured"
requirements:
  - "Approved assistant, security, model, and tool designs"
  - "Authorised test, incident, backup, and recovery owners"
learning_outcomes:
  - "Test normal, confusing, hostile, injection, and tool-abuse inputs"
  - "Separate health, logs, incidents, backups, restore tests, and rollback"
  - "Record unresolved blockers without claiming production readiness"
security_notes:
  - "Use synthetic data and never copy production conversations into tests"
  - "A backup is unproven until an authorised restore test succeeds"
---

Testing asks whether observed behaviour matches an approved safe expectation.
Operations keep a reviewed system understandable over time. Recovery provides
a planned response when a change or service fails.

This lesson creates a plan only. It does not claim an operational or production
assistant exists.

## Use the canonical checklist

{{< reference-file source="reference/examples/testing-operations-recovery-checklist.md" download="downloads/testing-operations-recovery-checklist.md" label="Testing, operations, and recovery checklist" >}}

Complete it privately with synthetic information.

## Test realistic conversation categories

Normal tests confirm supported goals without unnecessary data or tools.
Confusing tests cover ambiguity, contradiction, missing facts, and uncertain
tool results. Hostile tests cover repeated pressure, impersonation, and
sensitive requests. Prompt-injection tests try to change instructions or reveal
private context. Tool-abuse tests ask for prohibited access or actions.

Every case must record input, expected safe behaviour, observed behaviour,
evidence location, reviewer, result, and follow-up. A generated summary is not
test evidence.

## Define health checks

A health check should answer one narrow question, such as whether a required
local process is running or a synthetic dependency check returns its approved
status. It must not expose credentials, customer data, hidden prompts, or
internal diagnostics to a public user.

“Healthy” at one layer is not end-to-end proof. Record separate checks for the
service, model boundary, webhook validation, tunnel, tool, and escalation path
only when those components exist.

## Review logs safely

Define permitted event categories, redaction, readers, retention, and deletion.
Redact secrets and unnecessary customer data before storage. Do not rely on
redaction to make a credential safe after exposure; rotate it and investigate.

Log review should look for failures, denied access, repeated attempts, unusual
tool loops, redaction failures, and claims of success without evidence.

## Expire sessions

Define when conversation and administrator sessions expire, what state is
discarded, and what requires fresh authentication or confirmation. A public
customer session must not acquire administrator permission over time.

## Assign incident ownership

Name roles for triage, containment, communication, recovery, and review.
Define events that require disabling a tool, model, webhook, tunnel, or service.
Do not place real incident details in this repository.

## Back up and restore

Backups need an owner, approved scope, private storage, access control,
retention, integrity checking, and a schedule. Exclude or separately protect
credentials and unnecessary customer data.

A restore test uses an authorised isolated target, verifies expected files and
permissions, checks that secrets were not exposed, and records the result.
Never overwrite the only working state merely to test recovery.

## Plan rollback and restart boundaries

Rollback returns a defined change to its last reviewed state. Record the
trigger, decision owner, previous state, procedure source, verification, and
data-retention effect.

A service restart is not a repair by itself. Restart only through the
documented method, after preserving safe diagnostics, and verify state,
permissions, dependencies, and queues afterwards. Repeated restart loops stop
and escalate.

## Keep maintenance records

Record dates, change purpose, approver, affected components, backup status,
verification, rollback status, incidents, and unresolved risks. Store private
operational details outside Git.

{{< expected-output >}}
A private plan contains synthetic tests and expected safe behaviour, layered
health checks, safe log and session rules, incident roles, backup and restore
evidence requirements, rollback and restart boundaries, maintenance records,
and visible deployment blockers.
{{< /expected-output >}}

## Production blocker review

- [ ] Every test category has approved expected safe behaviour.
- [ ] Observed behaviour and evidence are recorded separately.
- [ ] Health checks reveal no private information.
- [ ] Logs redact secrets and unnecessary customer data.
- [ ] Session expiry and fresh authorisation are defined.
- [ ] Incident roles and disable conditions are approved.
- [ ] Backup ownership, scope, retention, and access are approved.
- [ ] A restore test has succeeded in an authorised isolated target.
- [ ] Rollback and restart procedures have been verified.
- [ ] Maintenance records and unresolved risks are current.

Any unmet high-risk item blocks dependent production work.

{{< troubleshooting >}}
Stop testing if it requires real customer data, a credential, offensive exploit
steps, a production action, or an unapproved external service. Replace the
input with synthetic data or record the test as blocked.
{{< /troubleshooting >}}

{{< rollback >}}
If a test or maintenance change causes unexpected behaviour, stop the affected
component, preserve safe evidence, use the approved rollback decision and
procedure, and rerun the relevant synthetic verification. Do not claim
recovery until the expected state and permissions are observed.
{{< /rollback >}}

## Next step

Complete repository automation and a human release-readiness review. Do not
deploy from this lesson.
