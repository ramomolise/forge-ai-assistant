# WhatsApp Cloud setup review

Complete a private copy of this checklist for an authorised non-production
environment. Record evidence locations and owner roles, not credentials,
customer data, real identifiers, phone numbers, or infrastructure values.

Status choices are `<NOT_REVIEWED>`, `<READY_FOR_TEST>`, `<BLOCKED>`, and
`<NOT_APPLICABLE>`. A completed checklist supports human review; it does not
approve production deployment.

## Scope and ownership

- Review owner: `<WHATSAPP_REVIEW_OWNER_ROLE>`
- Authorised environment: `<AUTHORISED_TEST_ENVIRONMENT>`
- Meta Business account readiness: `<META_BUSINESS_ACCOUNT_STATUS>`
- Meta app readiness: `<META_APP_STATUS>`
- WhatsApp Business Account readiness: `<WABA_STATUS>`
- Dedicated business-number plan: `<DEDICATED_NUMBER_PLAN>`
- Credential owner: `<CREDENTIAL_OWNER_ROLE>`
- Approved private secret-storage location: `<SECRET_STORAGE_LOCATION>`
- Token-rotation owner: `<TOKEN_ROTATION_OWNER_ROLE>`
- Escalation owner: `<ESCALATION_OWNER_ROLE>`
- Rollback owner: `<ROLLBACK_OWNER_ROLE>`

## Identifiers and secrets

- Phone Number ID placeholder: `<WHATSAPP_PHONE_NUMBER_ID>`
- Access token placeholder: `<WHATSAPP_ACCESS_TOKEN>`
- App Secret placeholder: `<WHATSAPP_APP_SECRET>`
- Verify Token placeholder: `<WHATSAPP_VERIFY_TOKEN>`
- Administrator test-user placeholder: `<ADMIN_WHATSAPP_NUMBER>`
- Optional WABA ID placeholder: `<WABA_ID>`
- Optional Meta App ID placeholder: `<META_APP_ID>`
- Phone Number ID confirmed as an ID, not the actual phone number:
  `<PHONE_NUMBER_ID_REVIEW>`
- Access token treated as the bot identity: `<ACCESS_TOKEN_CONTROL>`
- App Secret treated as a signature-verification credential:
  `<APP_SECRET_CONTROL>`
- Verify Token excluded from Git and public records: `<VERIFY_TOKEN_CONTROL>`
- Rotation and suspected-exposure process: `<CREDENTIAL_RESPONSE_PROCESS>`

## Public webhook boundary

- Public HTTPS URL readiness: `<PUBLIC_HTTPS_READINESS>`
- Public hostname placeholder: `<PUBLIC_HOSTNAME>`
- Callback path placeholder: `<WHATSAPP_WEBHOOK_PATH>`
- Callback path reviewed as `/whatsapp/webhook`: `<CALLBACK_PATH_REVIEW>`
- Local webhook host and tunnel target agreement: `<WEBHOOK_HOST_REVIEW>`
- Local webhook port and tunnel target agreement: `<WEBHOOK_PORT_REVIEW>`
- Gateway not exposed directly to a public IP: `<PUBLIC_EXPOSURE_REVIEW>`
- Verify Token handling and exact-match owner: `<VERIFY_TOKEN_OWNER_ROLE>`
- App Secret signature validation enabled: `<SIGNATURE_VALIDATION_STATUS>`
- Invalid-signature rejection expected result: `<INVALID_SIGNATURE_EXPECTATION>`

## Meta and Hermes access controls

- Meta development recipient whitelist owner: `<META_RECIPIENT_OWNER_ROLE>`
- Meta development recipient whitelist status: `<META_RECIPIENT_STATUS>`
- Hermes incoming-user allowlist owner: `<HERMES_ALLOWLIST_OWNER_ROLE>`
- Hermes explicit allowlist status: `<HERMES_ALLOWLIST_STATUS>`
- Allowlisted synthetic users only: `<SYNTHETIC_USER_SCOPE>`
- No-allowlist deny-by-default behaviour expected: `<DEFAULT_DENY_EXPECTATION>`
- Broad allow-all bypass remains disabled: `<ALLOW_ALL_STATUS>`
- `messages` webhook field subscription status: `<MESSAGES_SUBSCRIPTION_STATUS>`

## Messaging boundaries

- 24-hour customer-service window handling: `<CUSTOMER_SERVICE_WINDOW_PLAN>`
- Outside-window failure and escalation behaviour: `<OUTSIDE_WINDOW_PLAN>`
- Unsupported Hermes template-message behaviour recorded:
  `<TEMPLATE_MESSAGE_LIMIT_REVIEW>`
- Hermes direct-message-only limitation recorded:
  `<DIRECT_MESSAGE_LIMIT_REVIEW>`
- No group-chat behaviour promised: `<GROUP_CHAT_SCOPE_REVIEW>`
- Current Meta-controlled requirements recheck owner:
  `<META_REQUIREMENTS_RECHECK_OWNER_ROLE>`

## Authorised non-production tests

For every test, record `<EXPECTED_RESULT>`, `<OBSERVED_RESULT>`,
`<EVIDENCE_LOCATION>`, and `<REVIEW_STATUS>` privately. Do not record secret
values.

- Normal inbound message from an allowlisted synthetic user:
  `<NORMAL_INBOUND_TEST>`
- Inbound message from an unauthorised synthetic user:
  `<UNAUTHORISED_USER_TEST>`
- Webhook request with an invalid signature: `<INVALID_SIGNATURE_TEST>`
- Invalid or expired access token: `<EXPIRED_TOKEN_TEST>`
- Stopped or unavailable tunnel: `<TUNNEL_OUTAGE_TEST>`
- Verify Token mismatch: `<VERIFY_TOKEN_MISMATCH_TEST>`
- Stopped gateway: `<GATEWAY_OUTAGE_TEST>`
- Incorrect Phone Number ID: `<PHONE_NUMBER_ID_FAILURE_TEST>`
- Outside-window free-form send: `<OUTSIDE_WINDOW_TEST>`
- Disabling the route without deleting Hermes data: `<DISABLING_TEST>`
- Rollback to the reviewed starting state: `<ROLLBACK_TEST>`

## Review decision

- Manual Meta dashboard work remaining: `<META_MANUAL_WORK>`
- Credential work remaining: `<CREDENTIAL_MANUAL_WORK>`
- Tunnel work remaining: `<TUNNEL_MANUAL_WORK>`
- Test evidence remaining: `<TEST_EVIDENCE_GAPS>`
- Escalation readiness: `<ESCALATION_READINESS>`
- Rollback readiness: `<ROLLBACK_READINESS>`
- Unresolved deployment blockers: `<UNRESOLVED_DEPLOYMENT_BLOCKERS>`
- Documentation review complete: `<DOCUMENTATION_REVIEW_STATUS>`
- Non-production integration test complete: `<INTEGRATION_TEST_STATUS>`
- Production deployment approved separately: `<DEPLOYMENT_APPROVAL_STATUS>`

If any credential boundary, request validation, user authorisation, unsupported
messaging behaviour, failure test, escalation owner, or rollback owner remains
unresolved, keep the dependent deployment blocked.
