---
title: "Design a secure Cloudflare Tunnel boundary"
description: "Plan an outbound tunnel from one public webhook hostname to one local service without exposing the Hermes gateway directly."
weight: 70
draft: false
difficulty: "beginner"
estimated_time: "Not yet measured"
requirements:
  - "An approved public-webhook design"
  - "A private DNS and tunnel administration process"
learning_outcomes:
  - "Explain outbound tunnel architecture and DNS responsibility"
  - "Protect the tunnel token and local service boundary"
  - "Define verification, disabling, failure, and rollback"
security_notes:
  - "A tunnel token is a credential and must not enter Git"
  - "A public hostname makes the routed application reachable from the internet"
---

A messaging provider needs a public webhook to deliver events. The intended
Hermes gateway and other private services should not be directly reachable from
the internet. A tunnel can publish one narrowly defined webhook route while the
local service remains on a private address.

This is a design lesson. It does not create a Cloudflare account, DNS record,
tunnel, token, hostname, or service.

## Use the canonical review

{{< reference-file source="reference/examples/cloudflare-tunnel-review.md" download="downloads/cloudflare-tunnel-review.md" label="Cloudflare Tunnel review" >}}

Complete a private copy; never add real infrastructure or credentials.

## Understand the outbound connection

Official Cloudflare documentation says `cloudflared` initiates outbound-only
connections from the origin to Cloudflare's network. This avoids requiring a
publicly routable origin address or a broad inbound route to the local service.

Traffic can still flow from an internet client through Cloudflare and down the
established tunnel. “Outbound-only” does not mean the published application is
private.

## Map one hostname to one local service

The intended mapping is:

`<PUBLIC_HOSTNAME>` → Cloudflare → named tunnel → `<LOCAL_WEBHOOK_SERVICE>`

The local webhook service should listen only on the approved local address and
port. Do not route the whole VPS, administrator interface, Hermes home,
database, logs, or unrelated gateway endpoints.

Cloudflare documents a published application route as a public hostname mapped
to a service URL. Once published, anyone on the internet may reach that
application unless additional controls apply. The webhook must therefore
validate provider requests itself.

## Keep DNS responsibility separate

DNS associates the public hostname with the tunnel route. An authorised DNS
owner must approve the zone, hostname, and record. A DNS change does not change
Hermes identity, business knowledge, or stored conversations.

Never put a real hostname in this repository. The owner must also confirm that
the chosen hostname and certificate arrangement meet current Cloudflare and
messaging-provider requirements.

## Protect the tunnel token

For remotely managed tunnels, Cloudflare documents a tunnel token that lets a
connector run that tunnel. Treat it as a credential:

- retrieve and enter it only through an approved private process
- do not put it in a command example, prompt, Git file, screenshot, or log
- restrict which administrator or service identity may read it
- rotate it after suspected exposure

This project does not automate token entry.

## Verify each boundary separately

A tunnel “Healthy” status only reports the connector relationship; it does not
prove the webhook validates requests or Hermes behaves safely.

Verify privately:

1. the local webhook responds only on its approved local address
2. the tunnel route names only that service
3. DNS resolves the approved public hostname
4. an authorised synthetic request reaches the webhook
5. an invalid synthetic request is rejected
6. unrelated local and gateway paths remain unavailable
7. disabling the connector makes the public route unavailable
8. Hermes data remains intact after the tunnel is disabled

## Plan failure and disabling

Expected failures include a stopped connector, unreachable local service,
incorrect DNS, expired or rotated credential, restrictive outbound firewall,
and provider request validation failure. The assistant must not claim message
delivery or action success when any dependent check is uncertain.

Disabling a connector or route should stop new public webhook traffic. It
should not delete Hermes data, business knowledge, logs, or backups. Deleting a
tunnel, DNS record, or credential is a separate owner-approved action.

{{< rollback >}}
Before any tunnel or DNS change, record the previous approved route privately.
If verification fails, disable the new route or connector through the approved
Cloudflare process, restore the previous DNS state if authorised, confirm the
public hostname no longer reaches the failed route, and verify local Hermes
data was not changed.
{{< /rollback >}}

## Sources verified

Cloudflare facts were checked on 28 July 2026 against:

- [Cloudflare Tunnel overview](https://developers.cloudflare.com/cloudflare-one/networks/connectors/cloudflare-tunnel/)
- [Create a remotely managed tunnel](https://developers.cloudflare.com/cloudflare-one/networks/connectors/cloudflare-tunnel/get-started/create-remote-tunnel/)
- [Published applications](https://developers.cloudflare.com/cloudflare-one/networks/connectors/cloudflare-tunnel/routing-to-tunnel/)
- [Tunnel run parameters](https://developers.cloudflare.com/cloudflare-one/networks/connectors/cloudflare-tunnel/configure-tunnels/run-parameters/)
- [Tunnel with firewall](https://developers.cloudflare.com/cloudflare-one/networks/connectors/cloudflare-tunnel/configure-tunnels/tunnel-with-firewall/)

These sources verify the outbound model, public hostname mapping, local service
URL, token purpose, connector status, and firewall relationship. No tunnel,
DNS, token, or external account was created or tested.

## Next lesson

Do not publish a webhook until current official Meta requirements and the local
request-validation implementation are independently verified.
