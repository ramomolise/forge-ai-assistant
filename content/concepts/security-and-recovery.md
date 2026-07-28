---
title: "Security and recovery"
description: "Understand least privilege, allowlists, prompt injection, logs, backups, rollback, and secrets."
weight: 50
draft: false
---

## Least privilege

**What it is:** Least privilege grants only the minimum access needed for an
approved purpose. **Why it matters:** It limits mistakes and misuse. **In this
project:** Users, services, models, and tools should have narrow roles.
**Common misunderstanding:** Convenient broad access is not a safe starting
point. **Security:** Review permissions, duration, inputs, outputs, and owners.

## Allowlists

**What they are:** An allowlist names what is permitted; anything not listed is
denied by default. **Why they matter:** A small permitted set is easier to
review than every possible danger. **In this project:** Future tools and access
routes should use explicit allowlists. **Common misunderstanding:** An
allowlisted action still needs validated input and authorisation. **Security:**
Keep entries specific and require review before expansion.

## Prompt injection

**What it is:** Prompt injection is untrusted content intended to change an
assistant's rules or misuse its data and tools. **Why it matters:** Public
messages may contain hostile instructions. **In this project:** Tests must
confirm that messages cannot broaden permissions or reveal private material.
**Common misunderstanding:** A stronger prompt cannot replace technical access
controls. **Security:** Separate instructions from input, enforce permissions
outside the model, minimise data, and fail safely.

## Logs

**What they are:** Logs are records of events produced by software. **Why they
matter:** They help investigate failures and confirm behaviour. **In this
project:** Future logging must have approved content, readers, redaction, and
retention. **Common misunderstanding:** More logging is not always safer.
**Security:** Avoid credentials and unnecessary customer data, restrict access,
and remove records according to an approved rule.

## Backups

**What they are:** Backups are separate recoverable copies of important data or
configuration. **Why they matter:** They support recovery after loss,
corruption, or a failed change. **In this project:** Scope, ownership, private
storage, and restore tests remain future decisions. **Common misunderstanding:**
A copy is not a usable backup until restoration is tested. **Security:** Protect
backup confidentiality and integrity and limit access.

## Rollback

**What it is:** Rollback returns a change to a known earlier state. **Why it
matters:** It provides a planned exit when verification fails. **In this
project:** Meaningful technical changes require rollback guidance.
**Common misunderstanding:** Rollback and backup are related but different; a
rollback may restore configuration without recovering lost data. **Security:**
Back up first, define decision ownership, and verify the restored state.

## Secrets

**What they are:** Secrets are values such as passwords, private keys, and
access tokens that grant access or prove identity. **Why they matter:** Anyone
who obtains one may gain its permissions. **In this project:** Real secrets
stay outside Git, prompts, examples, and logs. **Common misunderstanding:**
Placeholders are safe examples; realistic-looking invented credentials are
not. **Security:** Use approved private storage, least access, redaction,
rotation after suspected exposure, and history review after a commit.
