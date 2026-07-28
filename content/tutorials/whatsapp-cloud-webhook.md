---
title: "Connect Hermes to WhatsApp Business Cloud API"
description: "Plan and review a secure WhatsApp Business Cloud API webhook for Hermes without exposing credentials or claiming deployment success."
weight: 80
draft: false
difficulty: "beginner"
estimated_time: "Not yet measured"
requirements:
  - "A reviewed Hermes Agent installation"
  - "An approved Cloudflare Tunnel design"
  - "An authorised non-production Meta test environment"
  - "Owners for credentials, testing, escalation, and rollback"
learning_outcomes:
  - "Explain how WhatsApp messages reach Hermes through a webhook"
  - "Distinguish Meta controls from the Hermes incoming-user allowlist"
  - "Review configuration, verification, failure, and rollback safely"
security_notes:
  - "Never commit WhatsApp credentials or verification secrets"
  - "Use an explicit Hermes user allowlist by default"
  - "Test with authorised synthetic users before any deployment review"
---

The WhatsApp Business Cloud API connection lets Meta deliver a customer's
WhatsApp message to Hermes and lets Hermes send a reply through Meta's API. It
is a messaging connection, not a new assistant, business database, or security
boundary.

This lesson explains the current Hermes workflow. Meta controls its accounts,
dashboards, policies, limits, app review, and platform requirements. Those
details can change and must be rechecked in current official Meta material
before a real deployment.

This repository has not connected to Meta or tested this integration. Complete
all practical checks in an authorised non-production environment with
synthetic data.

## Use the canonical setup review

{{< reference-file source="reference/examples/whatsapp-cloud-setup-review.md" download="downloads/whatsapp-cloud-setup-review.md" label="WhatsApp Cloud setup review" >}}

Complete a private copy. Record owners and evidence, but never copy credential
values, real phone numbers, customer details, or private infrastructure into
this repository.

## Understand the connection

Hermes uses Meta's official business interface with a dedicated business phone
number. The dedicated number separates the assistant's business identity and
credentials from a person's private WhatsApp account. It also avoids teaching
learners to attach automation to a personal number.

Meta delivers inbound events to a webhook: a small HTTPS endpoint that receives
machine-to-machine requests. Meta's systems cannot call a service that is
available only on the VPS's local network, so the webhook needs a public HTTPS
URL.

Do not bind the whole Hermes gateway directly to a public IP. Use the
[Cloudflare Tunnel security lesson](/tutorials/cloudflare-tunnel-security/) to
plan a narrow route from one public hostname to the local webhook service. That
lesson owns the complete tunnel, DNS, disabling, and rollback guidance.

## Prepare the manual Meta-side work

An authorised person must prepare and review the Meta Business account, Meta
app, WhatsApp Business Account, dedicated business number, test recipients,
and webhook settings. The exact dashboard labels and approval requirements
belong to Meta and may change.

Keep these identifiers distinct:

- the visible business phone number is the address people use in WhatsApp
- the **Phone Number ID** is Meta's internal identifier for that number
- the optional **WABA ID** identifies the WhatsApp Business Account
- the optional **App ID** identifies the Meta app

`<WHATSAPP_PHONE_NUMBER_ID>` must contain the Phone Number ID, not the actual
phone number. Confusing the two is a common setup failure.

## Start the Hermes setup wizard

Run the current Hermes wizard as the normal Hermes service user:

{{< command >}}
hermes whatsapp-cloud
{{< /command >}}

The wizard requests these categories of information:

1. Phone Number ID: `<WHATSAPP_PHONE_NUMBER_ID>`
2. access token: `<WHATSAPP_ACCESS_TOKEN>`
3. App Secret: `<WHATSAPP_APP_SECRET>`
4. webhook Verify Token: `<WHATSAPP_VERIFY_TOKEN>`
5. allowed WhatsApp users, such as `<ADMIN_WHATSAPP_NUMBER>`
6. optional App ID: `<META_APP_ID>`
7. optional WABA ID: `<WABA_ID>`

The wizard helps configure Hermes, but work in Meta's dashboard and the public
tunnel remains manual. Review every prompt against the current upstream guide
before entering a value.

{{< security >}}
The access token is the bot identity: someone who obtains it may act through
the bot's Meta API permissions. The App Secret is the sensitive credential
Hermes uses to validate webhook signatures. The Verify Token is a shared
webhook-verification secret. Keep all three out of Git, Markdown, prompts,
screenshots, shell history, command-line arguments, and logs.
{{< /security >}}

Use an approved private secret store and record who owns access, rotation, and
incident response. This repository does not automate secret entry.

## Join the tunnel URL and callback path

The callback URL has two parts:

```text
https://<PUBLIC_HOSTNAME><WHATSAPP_WEBHOOK_PATH>
```

For the current Hermes default, `<WHATSAPP_WEBHOOK_PATH>` is
`/whatsapp/webhook`. The resulting shape is therefore:

```text
https://<PUBLIC_HOSTNAME>/whatsapp/webhook
```

The tunnel must forward to the same local host and port on which the Hermes
Cloud API webhook listens. A public URL that points to a different port or an
old rotating tunnel will not reach the intended service.

## Understand webhook verification

When the callback is saved, Meta sends a verification request containing a
challenge and the Verify Token supplied through the dashboard. Hermes compares
the received token with its privately stored value. If they match, Hermes
returns the challenge, allowing Meta to recognise that the configured endpoint
is controlled by the person setting it up.

This handshake checks callback control. It does not prove that later message
delivery, authentication, authorisation, model behaviour, or replies work.

After verification, the authorised operator must subscribe the webhook to the
`messages` field in Meta's current dashboard. Without that subscription, a
verified callback is not instructed to receive inbound message events.

For inbound event delivery, Hermes also uses the App Secret to check Meta's
request signature. Do not test by removing this check.

## Keep the two user lists separate

Meta's development recipient whitelist and Hermes's incoming-user allowlist
solve different problems:

- Meta's development list controls which test recipients the app may message
  while Meta applies its development restrictions.
- Hermes's allowlist controls which inbound WhatsApp users the agent will
  process.

Passing one list does not grant access through the other. Current Hermes
behaviour denies every inbound user when no allowlist permits that user. This
safe default reduces the chance that an unexpected number can invoke the
assistant if Meta-side restrictions later change.

Set `WHATSAPP_CLOUD_ALLOWED_USERS` to an explicit, privately reviewed list.
`WHATSAPP_CLOUD_ALLOW_ALL_USERS=true` bypasses that restriction, broadens
access, and should not be the beginner default. Do not use it merely to make a
failed test pass.

## Understand the Hermes settings

Hermes stores the following settings outside this repository:

| Setting | Role |
| --- | --- |
| `WHATSAPP_CLOUD_PHONE_NUMBER_ID` | Selects Meta's internal ID for the dedicated business number; it is not the visible number. |
| `WHATSAPP_CLOUD_ACCESS_TOKEN` | Authenticates outbound API requests as the bot identity. |
| `WHATSAPP_CLOUD_APP_SECRET` | Validates signatures on inbound webhook requests. |
| `WHATSAPP_CLOUD_VERIFY_TOKEN` | Must match during the callback verification handshake. |
| `WHATSAPP_CLOUD_ALLOWED_USERS` | Lists the WhatsApp user IDs Hermes may process. |
| `WHATSAPP_CLOUD_ALLOW_ALL_USERS` | Bypasses the Hermes allowlist when true; keep false for the beginner design. |
| `WHATSAPP_CLOUD_WEBHOOK_HOST` | Selects the local interface used by the webhook service. |
| `WHATSAPP_CLOUD_WEBHOOK_PORT` | Selects the local webhook port and must agree with the tunnel target. |
| `WHATSAPP_CLOUD_WEBHOOK_PATH` | Selects the callback path; current Hermes defaults to `/whatsapp/webhook`. |

These names and Hermes behaviours were verified in the upstream guide. The
approved values and storage permissions still require private review.

## Plan around current messaging limits

Meta controls a 24-hour customer-service messaging window after a customer's
latest inbound message. Free-form replies are allowed inside that window;
outside it, Meta requires an approved message template.

Current Hermes documentation says its Cloud API adapter does not yet implement
message-template sending. A delayed or proactive send outside the window must
therefore fail safely and escalate; do not claim it was delivered.

The current Hermes Cloud API adapter also handles direct messages only. Do not
design or promise group-chat behaviour for this adapter.

Recheck all Meta-controlled messaging rules, policies, limits, and dashboard
requirements before testing or deployment. This lesson is not a complete Meta
API reference.

## Test without exposing secrets

Use authorised synthetic users and record only non-secret evidence:

1. Confirm the gateway process is running under the approved normal user.
2. Confirm the local webhook host, port, and path match the reviewed tunnel
   target without displaying credential values.
3. Confirm the public callback hostname and `/whatsapp/webhook` route are the
   currently approved route.
4. Confirm configuration reports only that the Phone Number ID, access token,
   App Secret, and Verify Token are present, never their values.
5. Complete Meta's callback verification through the authorised dashboard.
6. Confirm the `messages` field is subscribed.
7. Send a normal inbound message from an allowlisted synthetic user and record
   the observed result without claiming success in advance.
8. Confirm a synthetic user absent from the Hermes allowlist is denied.
9. Confirm a request with an invalid signature is rejected.
10. Test invalid or expired-token, tunnel-outage, and outside-window behaviour
    and confirm the system fails without a false delivery claim.

{{< expected-output >}}
The private test record distinguishes each observed pass or failure. It contains
no secret values or customer data and does not convert one successful handshake
into a claim that the complete integration is production-ready.
{{< /expected-output >}}

## Troubleshoot one boundary at a time

{{< troubleshooting >}}
If callback verification fails, check whether the tunnel URL is stale or
incorrect, the Verify Token values differ, the gateway is stopped, or the App
Secret is missing. If sending or media access fails, check whether the access
token is expired, invalid, revoked, or incorrectly authorised. If Meta reports
that the phone object cannot be found, recheck that the Phone Number ID was
entered instead of the actual phone number. Never print the suspected secret
while investigating.
{{< /troubleshooting >}}

A working tunnel does not prove Hermes is running. A verified callback does not
prove `messages` is subscribed. A valid token does not prove an inbound user is
authorised. Record which boundary failed before changing anything.

## Disable and roll back safely

{{< rollback >}}
Stop accepting new test messages by disabling the approved webhook subscription
or tunnel route through its authorised owner process, then stop the Hermes
gateway if required. Revoke or rotate credentials only through the credential
owner when exposure is suspected or the integration is being retired. Restore
the previously reviewed private configuration from backup if authorised.
Confirm the public callback no longer reaches Hermes and that Hermes data,
business knowledge, and backups remain intact. Deleting accounts, numbers,
credentials, or Hermes data is a separate owner-approved action.
{{< /rollback >}}

## Record what remains manual

Before any deployment review, an authorised person must still:

- recheck current Meta dashboards, policies, limits, app review, and account
  requirements
- create or approve the Meta-side resources and dedicated business number
- store and rotate credentials privately
- configure and subscribe the callback in Meta
- create the approved tunnel route
- run the complete canonical review in a non-production environment
- review evidence for normal, unauthorised, invalid-signature, expired-token,
  tunnel-outage, and rollback tests
- approve escalation, incident, and rollback ownership

None of those actions was performed or verified by this documentation change.

## References

- **Source title:** [WhatsApp Business Cloud API Setup](https://hermes-agent.nousresearch.com/docs/user-guide/messaging/whatsapp-cloud)
- **Publisher:** Hermes Agent / Nous Research
- **Source URL:** `https://hermes-agent.nousresearch.com/docs/user-guide/messaging/whatsapp-cloud`
- **Verification date:** 28 July 2026
- **Hermes-specific facts verified:** wizard command and requested value
  categories; Phone Number ID validation; environment-variable roles; callback
  path and verification response; signature validation with the App Secret;
  `messages` subscription; incoming-user deny-by-default allowlisting; the
  24-hour-window warning; missing template-message sending; direct-message-only
  adapter limitation; and the listed troubleshooting categories.

The source is authoritative for the Hermes Agent adapter. Meta remains
authoritative for the underlying platform and may change its dashboards,
policies, limits, and requirements.

## Next lesson

Return to [Plan testing, operations, and recovery](/tutorials/testing-operations-recovery/)
and include the reviewed WhatsApp failure, escalation, backup, and rollback
evidence before release review.
