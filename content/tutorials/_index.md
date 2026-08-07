---
title: "Set up your assistant"
description: "Follow one guided path to prepare, connect, limit and test a small-business assistant."
weight: 20
show_children: false
---

This page shows the whole journey. Complete one step, check the result, then
continue. Some provider details still need independent testing before this
guide can offer a complete live setup.

{{< warning >}}
Before you begin, use made-up business and customer information while learning.
Keep passwords, access keys and real customer details out of this public
repository.
{{< /warning >}}

## 1. Understand what you need

### What this step does

Make sure you have the time, accounts and equipment needed to learn safely.

### Do this

Write down who will own the assistant, which repeated customer question it
should answer first and who will take over when it cannot help.

### Check it

You can describe the assistant's first job in one sentence and name the person
responsible for it.

### If it does not work

Use the [project-readiness checklist](/start-here/project-readiness/) to find the missing
decision.

{{< details summary="Why this matters" >}}
A small first job is easier to review and test. The assistant should not begin
with every possible customer request or business action.
{{< /details >}}

## 2. Prepare a Linux server

### What this step does

A server is a computer that stays on and runs the assistant core. You will
prepare it without using its all-powerful root account for everyday work.

### Do this

Choose a supported Ubuntu server and a normal user account. Review available
software updates before installing them:

{{< command >}}
sudo apt update
sudo apt upgrade
{{< /command >}}

The first command refreshes the list of available software. The second asks you
to review and install updates.

### Check it

Read the final output. It should finish without an error, and you should still
be able to sign in with the normal user.

### If it does not work

Stop before installing Hermes. Use [Prepare a Linux VPS safely](prepare-linux-vps/)
to check network access, backups and update errors.

{{< details summary="Show the technical explanation" >}}
A VPS, or virtual private server, is a rented computer reached over the
internet. The detailed lesson explains account separation, file ownership,
firewalls, connectivity and rollback planning.
{{< /details >}}

## 3. Install Hermes

### What this step does

Hermes is the software that coordinates the assistant's instructions, model and
allowed actions.

### Do this

Download the official installer to a temporary file and read it before running
it:

{{< command >}}
curl -fsSLo /tmp/hermes-install.sh https://hermes-agent.nousresearch.com/install.sh
less /tmp/hermes-install.sh
{{< /command >}}

The public guide has verified the download and inspection step. It does not yet
publish one fully tested unattended installation command for every server.
Follow the current official installer only after reviewing it and the
[installation lesson](install-hermes-agent/).

### Check it

After an authorised installation, run:

{{< command >}}
hermes doctor
hermes config check
{{< /command >}}

Both checks should complete without reporting an invalid installation or
configuration.

### If it does not work

Keep the error message, remove any secrets from it and compare it with the
[detailed Hermes checks](install-hermes-agent/).

{{< details summary="Why this matters" >}}
Reading an installer before running it helps you see which files and software it
will change. Hermes has broad capabilities by default, so later steps must
limit what the business assistant can do.
{{< /details >}}

## 4. Connect an AI model

### What this step does

An AI model reads the customer's words and drafts a response. Hermes connects
to it using a provider account and a private access key.

### Do this

Choose a model provider supported by the current Hermes documentation. Add its
access key through the provider's private setup process; never put the key in a
page, prompt or Git commit.

### Check it

Run `hermes doctor` again, then send a made-up test question. Confirm that you
receive a response without exposing the access key.

### If it does not work

Check the provider name, model name and private key location. The
[model and business-information lesson](model-and-business-knowledge/) explains
the review boundaries.

{{< details summary="Advanced reference" >}}
The exact provider screens, prices and model availability can change. Verify
them against current provider and Hermes documentation before paying for or
connecting a service.
{{< /details >}}

## 5. Add your business information

### What this step does

Give the assistant only reviewed facts it is allowed to use, such as services,
prices, opening times and contact rules.

### Do this

Use the [business-information prompt](/prompt-library/#organise-my-approved-business-information)
to organise confirmed facts. Save the reviewed result in the private business
information used by your Hermes profile.

### Check it

Ask three made-up questions whose answers appear in your information. Then ask
one question it does not answer. The assistant should use the reviewed facts
and admit when information is missing.

### If it does not work

Correct the source information first. Do not add a guess to make one test pass.

{{< details summary="Why this matters" >}}
The AI model's general knowledge is not your approved business record. Keeping
business facts separate makes them easier to review and update.
{{< /details >}}

## 6. Limit what the assistant may do

### What this step does

Decide what the assistant may answer and which limited action, if any, it may
request. A tool is a controlled action such as submitting a trial request.

### Do this

List allowed questions, forbidden requests and the cases that need a person.
Start without general file, shell, server or database access. If you add a tool,
give it one purpose and a clear success or failure result.

### Check it

Try an allowed request, a forbidden request and a request that should go to a
person. The assistant must not claim an action worked when its tool failed.

### If it does not work

Disable the action and review [Design one limited tool](design-scoped-tool/)
before trying again.

{{< details summary="Show the technical explanation" >}}
The detailed security material covers least privilege, which means giving the
assistant only the minimum access needed for its job. Read the
[security boundaries](/security/security-boundaries/) before live use.
{{< /details >}}

## 7. Connect WhatsApp

### What this step does

WhatsApp Cloud API is Meta's service for sending business messages to and from
the assistant. A webhook is the web address that receives a message when
something happens.

### Do this

Complete the authorised Meta business setup manually. Then start the current
Hermes WhatsApp setup guide:

{{< command >}}
hermes whatsapp-cloud
{{< /command >}}

Enter credentials only when the private setup asks for them. The public guide
does not provide a complete MFDA configuration or a universal live endpoint.

### Check it

Use a permitted test account to send a made-up message. Confirm that one message
arrives, receives the expected reply and appears only in the records you planned
to keep.

### If it does not work

Check one connection at a time with the [WhatsApp setup lesson](whatsapp-cloud-webhook/).

{{< details summary="Advanced reference" >}}
The complete system is not fully self-hosted. WhatsApp Cloud API, the AI model
and possibly a tunnel provider handle parts of the message path. The
[tunnel lesson](cloudflare-tunnel-security/) explains the optional public
connection without exposing the whole Hermes service.
{{< /details >}}

## 8. Test before launch

### What this step does

Testing shows how the assistant responds before real customers rely on it.

### Do this

Create made-up conversations for normal questions, missing details,
misspellings, forbidden requests, tool failure and asking for a person. Include
at least one question the assistant cannot answer.

### Check it

Record the expected result beside each test. Fix and repeat every failed test;
do not treat a submitted request as a confirmed booking.

### If it does not work

Turn off the failing action and use the [testing and recovery lesson](testing-operations-recovery/)
to decide what must change.

{{< details summary="Why this matters" >}}
Made-up tests find repeatable problems without exposing customer information.
They complement, but do not replace, careful testing through the real message
channel before broader use.
{{< /details >}}

## 9. Maintain and improve it

### What this step does

Keep business facts current, review what happened and make sure a person can
stop the assistant when needed.

### Do this

Choose a regular review date. Back up the approved configuration, check failed
requests, update changed business information and keep a tested way to disable
customer replies.

### Check it

Restore a backup in a safe test location, confirm the maintenance message works
and record who completed the review.

### If it does not work

Keep the assistant unavailable to customers until backup, recovery and owner
handover work as planned. Use the [operations and recovery lesson](testing-operations-recovery/)
for the detailed checklist.

{{< details summary="Advanced reference" >}}
The [Reference section](/reference/) keeps reusable checklists and future
generic files. The [Security section](/security/) explains deeper risks without
interrupting this setup path.
{{< /details >}}
