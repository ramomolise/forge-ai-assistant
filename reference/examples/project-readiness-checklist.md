# Project readiness checklist

This is the canonical, reusable checklist for assessing readiness to begin the
learning project. It does not confirm readiness for a production deployment.

Copy this file to a private location outside the repository before completing
it. Keep this canonical copy generic. Never commit a completed copy containing
private business information, customer information, administrator details,
domains, phone numbers, credentials, or security arrangements.

Use these status words where a written response is needed:

- `READY`
- `NEEDS_REVIEW`
- `DEFERRED`
- `NOT_APPLICABLE`

## Learning expectations

- [ ] I understand that this repository is educational, not a hosted service.
- [ ] I understand that future instructions must be reviewed before use.
- [ ] I can set aside time to read explanations and verify results.
- [ ] I will record questions and unknowns instead of guessing.
- [ ] I understand that completing this checklist does not verify an
      integration or production deployment.

Notes: `<LEARNING_NOTES>`

## Computer and terminal access

- [ ] I have suitable computer access for future administrative work.
- [ ] I can use a text editor or have identified who will help me.
- [ ] I can access a terminal or have identified who will help me.
- [ ] I have a safe plan for interrupted connectivity or power.
- [ ] I can keep private working files outside the public repository.

Access constraints: `<ACCESS_CONSTRAINTS>`

Fallback plan status: `<ACCESS_FALLBACK_STATUS>`

## Git and GitHub access

- [ ] I can access the learning repository.
- [ ] I understand that Git history may retain committed information.
- [ ] I know that private notes and credentials must not be committed.
- [ ] I have identified whether I need help using Git or GitHub.

Support needed: `<GIT_SUPPORT_NEEDED>`

## VPS planning

- [ ] I understand that a VPS is a future architecture component, not a current
      requirement for reading the foundational lessons.
- [ ] I have identified the role that would administer a future VPS.
- [ ] I have recorded questions about access, maintenance, backup, recovery,
      and recurring cost.
- [ ] I will wait for verified requirements before selecting or purchasing a
      service.

VPS planning status: `<VPS_PLANNING_STATUS>`

Unresolved VPS questions: `<VPS_QUESTIONS>`

## Future account categories

Mark each category `READY`, `NEEDS_REVIEW`, `DEFERRED`, or `NOT_APPLICABLE`.
Do not record account identifiers or credentials here.

- [ ] VPS provider category: `<VPS_ACCOUNT_STATUS>`
- [ ] AI model provider category: `<MODEL_ACCOUNT_STATUS>`
- [ ] Messaging provider category: `<MESSAGING_ACCOUNT_STATUS>`
- [ ] Tunnel provider category: `<TUNNEL_ACCOUNT_STATUS>`
- [ ] Hostname or domain category: `<HOSTNAME_STATUS>`
- [ ] Source collaboration category: `<SOURCE_ACCOUNT_STATUS>`

## Administrator access

- [ ] The future administrator role is identified.
- [ ] The role authorised to approve sensitive changes is identified.
- [ ] The boundary between customer and administrator access is understood.
- [ ] A fallback is recorded for administrator unavailability.

Administrator role: `<ADMIN_ROLE>`

Change approver role: `<CHANGE_APPROVER_ROLE>`

Administrator fallback status: `<ADMIN_FALLBACK_STATUS>`

## Business-information preparation

- [ ] A role is responsible for verifying business information.
- [ ] Supported customer goals can be documented.
- [ ] Unsupported requests can be documented.
- [ ] Operating rules and escalation conditions can be reviewed.
- [ ] Production business details will remain outside the public repository.

Business placeholder: `<BUSINESS_NAME>`

Information owner role: `<BUSINESS_INFORMATION_OWNER>`

Missing information: `<MISSING_BUSINESS_INFORMATION>`

## Customer-data boundaries

- [ ] Necessary customer-data categories have been identified.
- [ ] Unnecessary or prohibited data categories have been identified.
- [ ] A response is planned for unexpectedly sensitive messages.
- [ ] Real customer conversations will not be used as public examples.
- [ ] Retention and deletion questions are recorded for later review.

Allowed data categories: `<ALLOWED_DATA_CATEGORIES>`

Prohibited data categories: `<PROHIBITED_DATA_CATEGORIES>`

Unresolved data questions: `<CUSTOMER_DATA_QUESTIONS>`

## Secret-handling rules

- [ ] Secrets will not be stored in Git.
- [ ] Secrets will not be pasted into a completed public checklist.
- [ ] An approved private storage method must be chosen before setup.
- [ ] Secret access will be limited to authorised roles.
- [ ] A response owner is identified for accidental exposure.

Secret-storage decision status: `<SECRET_STORAGE_STATUS>`

Exposure-response owner role: `<SECRET_RESPONSE_ROLE>`

## Backup and rollback planning

- [ ] A role will own backup decisions.
- [ ] A role will own rollback decisions.
- [ ] Backup scope and storage remain recorded decisions until verified.
- [ ] Recovery will not be claimed as working before it is tested.
- [ ] Changes will require a documented return path.

Backup planning status: `<BACKUP_PLANNING_STATUS>`

Rollback planning status: `<ROLLBACK_PLANNING_STATUS>`

Recovery-test status: `<RECOVERY_TEST_STATUS>`

## Human escalation planning

- [ ] An authorised escalation role is identified.
- [ ] Unsupported, uncertain, and sensitive cases require escalation.
- [ ] Availability boundaries can be documented.
- [ ] A fallback is planned when the primary role is unavailable.
- [ ] Real contact details will remain in the private copy only.

Escalation role: `<ESCALATION_ROLE>`

Escalation method: `<ESCALATION_METHOD>`

Escalation fallback: `<ESCALATION_FALLBACK>`

## Testing availability

- [ ] A role can define expected outcomes.
- [ ] Time can be allocated for normal and failure tests.
- [ ] Time can be allocated for confusing and hostile tests.
- [ ] Testing can use synthetic information instead of customer data.
- [ ] A role can decide whether a result is acceptable.

Testing owner role: `<TESTING_OWNER_ROLE>`

Testing availability status: `<TESTING_AVAILABILITY_STATUS>`

Testing constraints: `<TESTING_CONSTRAINTS>`

## Recurring-cost categories

Record `NEEDS_REVIEW`, `DEFERRED`, or `NOT_APPLICABLE`. Do not add price
figures to the canonical checklist.

- [ ] VPS hosting: `<VPS_COST_STATUS>`
- [ ] Hostname or domain renewal: `<HOSTNAME_COST_STATUS>`
- [ ] AI model usage: `<MODEL_COST_STATUS>`
- [ ] Messaging usage: `<MESSAGING_COST_STATUS>`
- [ ] Connectivity: `<CONNECTIVITY_COST_STATUS>`
- [ ] Backup or storage: `<BACKUP_COST_STATUS>`
- [ ] Monitoring: `<MONITORING_COST_STATUS>`
- [ ] Optional support: `<SUPPORT_COST_STATUS>`

Future spending approver role: `<SPENDING_APPROVER_ROLE>`

## Unresolved decisions

Repeat this block in the private copy for every unresolved decision:

- Decision: `<OPEN_DECISION>`
- Responsible role: `<DECISION_OWNER_ROLE>`
- Evidence needed: `<EVIDENCE_NEEDED>`
- Review period: `<TARGET_REVIEW_PERIOD>`
- Current status: `<DECISION_STATUS>`

## Readiness result

- [ ] Every section has been reviewed.
- [ ] Private details remain outside the repository.
- [ ] Unknowns are recorded rather than guessed.
- [ ] Purchases and setup are deferred until requirements are verified.
- [ ] Security, recovery, escalation, and testing responsibilities have owners.

Learning-readiness status: `<LEARNING_READINESS_STATUS>`

Sections that block later technical work: `<BLOCKED_SECTIONS>`

Next reviewed learning step: `<NEXT_LEARNING_STEP>`
