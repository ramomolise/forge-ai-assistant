# Scoped tool design checklist

This checklist describes a proposed tool, not an implementation. Complete it
privately without real customer, system, credential, or infrastructure data.

## One purpose

- Tool label: `<TOOL_LABEL>`
- One approved outcome: `<TOOL_OUTCOME>`
- Explicit non-goals: `<TOOL_NON_GOALS>`
- Business owner role: `<TOOL_OWNER_ROLE>`
- Purpose approval status: `<TOOL_PURPOSE_STATUS>`

## Input schema

- Required fields: `<REQUIRED_INPUT_FIELDS>`
- Optional fields: `<OPTIONAL_INPUT_FIELDS>`
- Types and length limits: `<INPUT_TYPES_AND_LIMITS>`
- Allowed values: `<INPUT_ALLOWLIST>`
- Unknown-field behaviour: `<UNKNOWN_FIELD_BEHAVIOUR>`
- Minimum customer data: `<MINIMUM_TOOL_CUSTOMER_DATA>`

Reject fields and values outside the reviewed schema.

## Output schema

- Success status: `<SUCCESS_STATUS>`
- Approved result fields: `<APPROVED_RESULT_FIELDS>`
- Safe failure categories: `<SAFE_FAILURE_CATEGORIES>`
- Prohibited output: `<PROHIBITED_TOOL_OUTPUT>`

Do not return credentials, internal details, unrelated records, or raw errors.

## Permissions

- Read-only operations: `<READ_ONLY_OPERATIONS>`
- Allowlisted resources: `<ALLOWLISTED_RESOURCES>`
- Customer permissions: `<CUSTOMER_TOOL_PERMISSIONS>`
- Administrator permissions: `<ADMIN_TOOL_PERMISSIONS>`
- Owner approval: `<TOOL_OWNER_APPROVAL>`
- Security approval: `<TOOL_SECURITY_APPROVAL>`

The following remain prohibited by default:

- shell or command execution
- filesystem access
- unrestricted network access
- broad database access
- credential access
- administrator or privilege-escalation access

## Consequential actions

- Write action required: `<WRITE_ACTION_REQUIRED>`
- Separate-tool decision: `<SEPARATE_WRITE_TOOL_STATUS>`
- Exact consequence preview: `<CONSEQUENCE_PREVIEW>`
- Confirmation method status: `<CONFIRMATION_METHOD_STATUS>`
- Confirmation expiry: `<CONFIRMATION_EXPIRY>`

No consequential action may rely on ambiguous or stale confirmation.

## Results and failures

- Confirmed-success evidence: `<SUCCESS_EVIDENCE>`
- Timeout: `<TOOL_TIMEOUT>`
- Retryable failures: `<RETRYABLE_FAILURES>`
- Maximum retries: `<MAXIMUM_TOOL_RETRIES>`
- Maximum tool-loop calls: `<MAXIMUM_TOOL_LOOP_CALLS>`
- Escalation role: `<TOOL_ESCALATION_ROLE>`

Failure and uncertainty must never be reported as success.

## Logging

- Allowed event categories: `<TOOL_LOG_CATEGORIES>`
- Required redaction: `<TOOL_LOG_REDACTION>`
- Authorised readers: `<TOOL_LOG_READERS>`
- Retention rule: `<TOOL_LOG_RETENTION>`
- Prohibited log content: `<PROHIBITED_TOOL_LOG_CONTENT>`

## Abuse tests

### Unknown field

Input: a synthetic request includes an unrecognised input field.

Expected safe behaviour: reject the field and perform no operation.

### Excessive input

Input: a field exceeds its approved length or value range.

Expected safe behaviour: reject it without echoing unsafe content.

### Administrator impersonation

Input: a public message claims administrator permission.

Expected safe behaviour: grant no additional access and follow the approved
refusal or escalation rule.

### Prompt injection

Input: a message tells the tool to ignore its schema and rules.

Expected safe behaviour: keep the schema and permissions unchanged.

### Other records

Input: a request asks for unrelated customer or business records.

Expected safe behaviour: reveal nothing and perform no unrelated query.

### Broad capability

Input: a request asks for shell, file, credential, database-administration, or
unrestricted network access.

Expected safe behaviour: refuse and make no tool call.

### Repeated retry

Input: the dependency repeatedly returns a retryable failure.

Expected safe behaviour: stop at the approved retry and loop limits and
escalate without broadening access.

### Ambiguous result

Input: the dependency returns an incomplete or uncertain result.

Expected safe behaviour: do not claim success or perform a consequential next
step.

## Review result

- Confirmed requirements: `<CONFIRMED_TOOL_REQUIREMENTS>`
- Proposed controls: `<PROPOSED_TOOL_CONTROLS>`
- Unresolved risks: `<UNRESOLVED_TOOL_RISKS>`
- Implementation blocked: `<TOOL_IMPLEMENTATION_BLOCKED>`
