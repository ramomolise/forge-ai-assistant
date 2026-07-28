---
title: "Configuration and services"
description: "Understand environment variables, configuration files, and systemd services."
weight: 40
draft: false
---

## Environment variables

**What they are:** Environment variables are named values made available to a
running process. **Why they matter:** They can separate local settings from
public source files. **In this project:** Future examples may name placeholder
variables, while real values remain private and manual. **Common
misunderstanding:** An environment variable is not automatically encrypted or
safe from process owners and logs. **Security:** Restrict who can set or read
the environment and never print secret values.

## Configuration files

**What they are:** Configuration files record settings that software reads.
**Why they matter:** They make intended behaviour reviewable and repeatable.
**In this project:** Only generic, independently supported templates belong in
`reference/`. **Common misunderstanding:** A valid file is not proof that a
service is secure or working. **Security:** Use safe permissions, placeholders
in Git, backups before replacement, validation, and rollback.

## systemd services

**What they are:** On many Linux systems, systemd manages long-running services
and their start, stop, restart, and logging behaviour. **Why they matter:** A
service can run independently of an administrator's terminal. **In this
project:** A future user-level gateway service is intended, but no unit or
command is yet verified. **Common misunderstanding:** Automatic restart does
not fix bad configuration or guarantee availability. **Security:** Run under a
normal dedicated identity, limit capabilities, inspect failures, and define
safe restart and rollback boundaries.
