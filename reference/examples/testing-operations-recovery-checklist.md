# Testing, operations, and recovery checklist

Complete this plan privately with synthetic data. It is not evidence that an
operational or production assistant exists.

## Test record fields

- Test identifier: `<TEST_IDENTIFIER>`
- Category: `<TEST_CATEGORY>`
- Synthetic input: `<SYNTHETIC_TEST_INPUT>`
- Expected safe behaviour: `<EXPECTED_SAFE_BEHAVIOUR>`
- Observed behaviour: `<OBSERVED_BEHAVIOUR>`
- Private evidence location: `<TEST_EVIDENCE_LOCATION>`
- Reviewer role: `<TEST_REVIEWER_ROLE>`
- Result: `<TEST_RESULT>`
- Follow-up: `<TEST_FOLLOW_UP>`

Use this record for every test below.

## Required conversation tests

- Normal supported request: `<NORMAL_TEST_STATUS>`
- Confusing or ambiguous request: `<CONFUSING_TEST_STATUS>`
- Hostile or repeated-pressure request: `<HOSTILE_TEST_STATUS>`
- Prompt-injection request: `<PROMPT_INJECTION_TEST_STATUS>`
- Tool-abuse request: `<TOOL_ABUSE_TEST_STATUS>`
- Sensitive-data request: `<SENSITIVE_DATA_TEST_STATUS>`
- Uncertain tool result: `<UNCERTAIN_RESULT_TEST_STATUS>`
- Human escalation: `<ESCALATION_TEST_STATUS>`

Every test requires expected safe behaviour and separately observed evidence.

## Health checks

- Local service check: `<LOCAL_SERVICE_HEALTH_CHECK>`
- Model-boundary check: `<MODEL_BOUNDARY_HEALTH_CHECK>`
- Webhook-validation check: `<WEBHOOK_HEALTH_CHECK>`
- Tunnel check: `<TUNNEL_HEALTH_CHECK>`
- Tool check: `<TOOL_HEALTH_CHECK>`
- Escalation-path check: `<ESCALATION_HEALTH_CHECK>`
- Public diagnostic prohibition: `<PUBLIC_DIAGNOSTIC_BOUNDARY>`

Mark checks not applicable when a component does not exist.

## Logs and redaction

- Allowed log events: `<ALLOWED_OPERATIONAL_EVENTS>`
- Secret redaction: `<SECRET_REDACTION_RULE>`
- Customer-data redaction: `<CUSTOMER_DATA_REDACTION_RULE>`
- Authorised readers: `<LOG_READER_ROLES>`
- Retention and deletion: `<LOG_RETENTION_AND_DELETION>`
- Redaction test status: `<REDACTION_TEST_STATUS>`

Suspected credential exposure requires rotation and incident review.

## Session expiry

- Customer session expiry: `<CUSTOMER_SESSION_EXPIRY>`
- Administrator session expiry: `<ADMIN_SESSION_EXPIRY>`
- State discarded at expiry: `<EXPIRED_SESSION_STATE>`
- Fresh authentication conditions: `<FRESH_AUTHENTICATION_CONDITIONS>`
- Fresh confirmation conditions: `<FRESH_CONFIRMATION_CONDITIONS>`
- Expiry test status: `<SESSION_EXPIRY_TEST_STATUS>`

## Incident ownership

- Triage role: `<INCIDENT_TRIAGE_ROLE>`
- Containment role: `<INCIDENT_CONTAINMENT_ROLE>`
- Communication role: `<INCIDENT_COMMUNICATION_ROLE>`
- Recovery role: `<INCIDENT_RECOVERY_ROLE>`
- Review role: `<INCIDENT_REVIEW_ROLE>`
- Disable conditions: `<INCIDENT_DISABLE_CONDITIONS>`

## Backup ownership

- Backup owner role: `<BACKUP_OWNER_ROLE>`
- Approved scope: `<BACKUP_SCOPE>`
- Excluded data: `<BACKUP_EXCLUSIONS>`
- Private storage category: `<BACKUP_STORAGE_CATEGORY>`
- Access roles: `<BACKUP_ACCESS_ROLES>`
- Schedule: `<BACKUP_SCHEDULE>`
- Retention: `<BACKUP_RETENTION>`
- Integrity check: `<BACKUP_INTEGRITY_CHECK>`

## Restore testing

- Isolated restore target: `<ISOLATED_RESTORE_TARGET>`
- Restore owner role: `<RESTORE_OWNER_ROLE>`
- Expected files and state: `<EXPECTED_RESTORED_STATE>`
- Permission verification: `<RESTORED_PERMISSION_CHECK>`
- Secret-exposure check: `<RESTORE_SECRET_CHECK>`
- Restore result: `<RESTORE_TEST_RESULT>`
- Evidence review: `<RESTORE_EVIDENCE_REVIEW>`

Do not overwrite the only working state to test restoration.

## Rollback

- Change requiring rollback: `<ROLLBACK_CHANGE>`
- Trigger: `<ROLLBACK_TRIGGER>`
- Decision role: `<ROLLBACK_DECISION_ROLE>`
- Previous reviewed state: `<PREVIOUS_REVIEWED_STATE>`
- Procedure source: `<ROLLBACK_PROCEDURE_SOURCE>`
- Verification: `<ROLLBACK_VERIFICATION>`
- Data-retention effect: `<ROLLBACK_DATA_EFFECT>`

## Service restart boundary

- Approved restart method status: `<RESTART_METHOD_STATUS>`
- Diagnostic preservation: `<PRE_RESTART_DIAGNOSTICS>`
- Restart decision role: `<RESTART_DECISION_ROLE>`
- Post-restart verification: `<POST_RESTART_VERIFICATION>`
- Maximum restart attempts: `<MAXIMUM_RESTART_ATTEMPTS>`
- Escalation after failure: `<RESTART_FAILURE_ESCALATION>`

Repeated restart loops are prohibited.

## Maintenance record

- Change date: `<MAINTENANCE_DATE>`
- Purpose: `<MAINTENANCE_PURPOSE>`
- Approver role: `<MAINTENANCE_APPROVER_ROLE>`
- Components affected: `<AFFECTED_COMPONENTS>`
- Backup status: `<MAINTENANCE_BACKUP_STATUS>`
- Verification result: `<MAINTENANCE_VERIFICATION>`
- Rollback result: `<MAINTENANCE_ROLLBACK_RESULT>`
- Incident reference: `<PRIVATE_INCIDENT_REFERENCE>`
- Unresolved risks: `<MAINTENANCE_UNRESOLVED_RISKS>`

## Deployment blockers

- Failed or missing tests: `<TEST_BLOCKERS>`
- Missing owners: `<OWNERSHIP_BLOCKERS>`
- Missing redaction or expiry evidence: `<DATA_CONTROL_BLOCKERS>`
- Missing restore evidence: `<RESTORE_BLOCKERS>`
- Unverified rollback or restart: `<RECOVERY_BLOCKERS>`
- Other high-risk uncertainty: `<OTHER_DEPLOYMENT_BLOCKERS>`
- Deployment blocked: `<DEPLOYMENT_BLOCKED>`
