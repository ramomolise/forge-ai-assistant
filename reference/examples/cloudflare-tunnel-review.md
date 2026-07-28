# Cloudflare Tunnel review

Complete this checklist privately. Do not record a real hostname, address,
port, tunnel identifier, token, DNS record, account identifier, or service
location.

## Purpose and route

- Public purpose: `<PUBLIC_WEBHOOK_PURPOSE>`
- Public hostname placeholder: `<PUBLIC_HOSTNAME>`
- Local service category: `<LOCAL_WEBHOOK_SERVICE>`
- Explicitly excluded services: `<EXCLUDED_PRIVATE_SERVICES>`
- Route approval status: `<TUNNEL_ROUTE_APPROVAL_STATUS>`

Only the approved webhook service may be routed.

## Local boundary

- Local listen boundary: `<LOCAL_LISTEN_BOUNDARY>`
- Request-validation status: `<REQUEST_VALIDATION_STATUS>`
- Invalid-request behaviour: `<INVALID_REQUEST_BEHAVIOUR>`
- Unrelated-path test: `<UNRELATED_PATH_TEST>`
- Local owner role: `<LOCAL_SERVICE_OWNER_ROLE>`

An unresolved request-validation boundary blocks publication.

## DNS ownership

- DNS owner role: `<DNS_OWNER_ROLE>`
- Zone approval status: `<DNS_ZONE_APPROVAL_STATUS>`
- Hostname approval status: `<HOSTNAME_APPROVAL_STATUS>`
- Certificate requirement status: `<CERTIFICATE_REQUIREMENT_STATUS>`
- Previous DNS recovery record: `<PRIVATE_DNS_RECOVERY_STATUS>`

Store real DNS details only in the approved private system.

## Tunnel credential

- Token owner role: `<TUNNEL_TOKEN_OWNER_ROLE>`
- Private storage category: `<TUNNEL_TOKEN_STORAGE_CATEGORY>`
- Service-reader role: `<TUNNEL_TOKEN_READER_ROLE>`
- Rotation owner role: `<TUNNEL_TOKEN_ROTATION_ROLE>`
- Exposure response: `<TUNNEL_TOKEN_EXPOSURE_RESPONSE>`

Never record the token value.

## Verification

- [ ] The local service uses only the approved local boundary.
- [ ] The tunnel route contains only the approved service.
- [ ] DNS maps only the approved public hostname.
- [ ] An authorised synthetic request reaches the webhook.
- [ ] An invalid synthetic request is rejected.
- [ ] Unrelated paths and private services remain unavailable.
- [ ] Connector status is checked without treating it as end-to-end proof.
- [ ] Disabling the connector removes public reachability.
- [ ] Hermes data remains intact when the tunnel is disabled.

## Failure behaviour

- Connector unavailable: `<CONNECTOR_FAILURE_BEHAVIOUR>`
- Local service unavailable: `<LOCAL_SERVICE_FAILURE_BEHAVIOUR>`
- DNS failure: `<DNS_FAILURE_BEHAVIOUR>`
- Credential failure: `<TOKEN_FAILURE_BEHAVIOUR>`
- Validation failure: `<VALIDATION_FAILURE_BEHAVIOUR>`

No dependent component may claim success during uncertainty.

## Disable and rollback

- Disable decision role: `<TUNNEL_DISABLE_ROLE>`
- Approved disable method status: `<DISABLE_METHOD_STATUS>`
- DNS rollback owner: `<DNS_ROLLBACK_OWNER_ROLE>`
- Public-unavailability check: `<PUBLIC_DISABLE_CHECK>`
- Hermes-data integrity check: `<HERMES_DATA_INTEGRITY_CHECK>`

Disabling or removing the tunnel must remain separate from deleting Hermes
data, business knowledge, logs, or backups.

## Review result

- Confirmed requirements: `<CONFIRMED_TUNNEL_REQUIREMENTS>`
- Proposed controls: `<PROPOSED_TUNNEL_CONTROLS>`
- Unresolved risks: `<UNRESOLVED_TUNNEL_RISKS>`
- Publication blocked: `<TUNNEL_PUBLICATION_BLOCKED>`
