# Forge AI Assistant architecture

This document records the canonical conceptual architecture for contributors.
It must stay consistent with the public
[architecture lesson](content/start-here/architecture.md).

This public architecture explains the intended reusable pattern taught through
Build with Hermes ZA. Forge provides a real, private MFDA beta case study, but
its live topology, configuration and operational evidence are not reproduced
here. The generic architecture still requires independent end-to-end testing.

The assistant core is intended to run on infrastructure managed by the
operator. The complete system is not fully self-hosted: WhatsApp Cloud API, an
AI model and other external providers may handle information where required.

## Intended message flow

1. A customer sends the business a WhatsApp message.
2. WhatsApp Cloud API notifies a public webhook.
3. Cloudflare Tunnel carries approved webhook traffic over an outbound
   connection to a local service on the VPS.
4. Hermes coordinates the conversation using approved instructions, business
   knowledge, model access, and narrowly scoped tools.
5. An AI model helps interpret the request and draft a response within those
   boundaries.
6. A narrowly scoped tool may request a specific approved business action.
7. Unsupported, uncertain, or sensitive cases pass to the business owner or
   another authorised person.
8. Any response returns through the approved messaging path.

The private beta has informed this flow, but each public generic implementation
step remains unverified until supported by reviewed reusable material and
independent tests.

## Component responsibilities

### Customer

The source and recipient of business messages. Customer input is untrusted and
may contain personal or sensitive information.

### WhatsApp Cloud API

The intended external messaging interface. Contributor documentation must not
invent its requirements or behaviour; setup guidance will require verification
against current authoritative documentation.

### Public webhook

The intended internet-facing receiver for messaging events. A future
implementation must validate requests and expose only the required endpoint.

### Cloudflare Tunnel

The intended example for mapping a public hostname to the local webhook service
through an outbound connection. Tunnel credentials are secrets. Tunnel
configuration must remain separate from Hermes data and behaviour.

### VPS

The intended host for the local gateway and assistant components. Future
material must establish supported systems, capacity, user permissions,
maintenance, backup, and recovery requirements through testing.

### Hermes

The underlying agent software that coordinates assistant instructions, approved
knowledge, model access and limited tools. The tutorials document reviewed
concepts and upstream behaviour, but the private Forge configuration is not in
this repository and a generic configuration remains planned.

### AI model

The intended language-processing component. Model output is not automatically
a verified business fact or an authorised action.

### Business knowledge

Reviewed information made available to the assistant. Public examples must be
generic; production business information must remain outside this repository.

### Narrowly scoped tools

Specific approved operations with minimal permissions. General-purpose access
is outside the intended design. No tool implementation currently exists here.

### Human escalation

The route to a business owner or another authorised person when automation is
unsupported, uncertain, sensitive, or unable to confirm success.

## Trust boundaries

Future implementations and documentation must preserve these separations:

- public webhook traffic from local gateway access
- untrusted customer input from trusted configuration
- model-generated text from reviewed business knowledge
- customer permissions from administrator permissions
- assistant reasoning from permission to perform an action
- narrowly scoped tools from general-purpose server access
- automated conversation handling from human business decisions

Credentials, customer data, production logs, databases, private domains, phone
numbers, and private VPS evidence must not enter the repository.

## Contributor consistency rules

- Tutorials explain the architecture in beginner-friendly language.
- Canonical scripts and templates belong under `reference/` when they exist.
- Tutorials link to canonical files rather than duplicating them.
- Unverified components are labelled as intended, planned, future, or
  unverified.
- Commands are not published until their behaviour and rollback path have been
  tested.
- Provider requirements are checked against current authoritative sources
  before setup guidance is written.
- Cost estimates, if later added, are dated and clearly identified as
  estimates.
- Privacy discussion raises practical considerations without making legal
  claims.

## Public implementation boundary

The repository contains educational procedures and review checklists for these
components. It does not contain the complete MFDA implementation or a fully
independently verified generic stack. Production prompts, customer data,
credentials, phone numbers, endpoints, databases, logs, private locations and
server evidence remain outside the repository.
