---
title: "Internet connections"
description: "Understand APIs, webhooks, DNS, TLS, and tunnels."
weight: 20
draft: false
---

## API

**What it is:** An application programming interface (API) is a defined way for
software systems to exchange requests and responses. **Why it matters:** It
sets the permitted operations and data format. **In this project:** Intended
provider and tool connections use APIs, but their exact behaviour requires
official documentation. **Common misunderstanding:** API access does not make
every operation safe or authorised. **Security:** Limit credentials,
permissions, inputs, outputs, and data retention.

## Webhook

**What it is:** A webhook is an internet endpoint that receives an event sent
by another system. **Why it matters:** It can notify an assistant when a
customer message arrives. **In this project:** A future public webhook is the
intended messaging entry point. **Common misunderstanding:** Receiving a
request does not prove who sent it. **Security:** Validate requests, expose only
the required endpoint, and treat message content as untrusted.

## DNS

**What it is:** The Domain Name System (DNS) maps names to network
destinations. **Why it matters:** A provider needs to find a public webhook.
**In this project:** A future public hostname may map to a tunnel; no real
domain belongs in the repository. **Common misunderstanding:** DNS does not
encrypt traffic or authenticate application messages. **Security:** Restrict
who may change records and verify mappings before relying on them.

## TLS

**What it is:** Transport Layer Security (TLS) encrypts network traffic and
helps a client authenticate the service it reached. **Why it matters:** It
protects data travelling across untrusted networks. **In this project:** A
future public webhook must use an appropriately protected connection.
**Common misunderstanding:** TLS does not make unsafe input safe or authorise a
business action. **Security:** Certificate and endpoint validation complement,
but do not replace, request validation and least privilege.

## Tunnel

**What it is:** A tunnel can create an outbound connection that maps a public
entry point to a local service. **Why it matters:** It avoids directly opening
the local gateway to broad inbound traffic. **In this project:** Cloudflare
Tunnel is the intended example, pending verified guidance. **Common
misunderstanding:** A tunnel is not part of assistant reasoning and does not
make the local service automatically secure. **Security:** Protect tunnel
credentials, limit routes, and keep disabling the tunnel separate from
destroying assistant data.
