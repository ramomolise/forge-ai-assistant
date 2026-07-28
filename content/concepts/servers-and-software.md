---
title: "Servers and software"
description: "Understand VPS hosting, Linux users, packages, Git, and GitHub."
weight: 10
draft: false
---

## VPS

**What it is:** A virtual private server (VPS) is a rented virtual computer
that runs an operating system. **Why it matters:** It can keep an assistant
available when the owner's device is offline. **In this project:** The intended
VPS hosts private assistant components; no provider or size is yet approved.
**Common misunderstanding:** “Private” does not mean only the owner can reach
it. Network exposure and account permissions still matter. **Security:** Keep
public entry points minimal, update the system, and plan backups and recovery.

## Linux users and root

**What they are:** A Linux user is an account with its own identity and
permissions. `root` is the administrator account with power over the whole
system. **Why they matter:** Separate accounts limit the damage caused by a
mistake or compromised service. **In this project:** Hermes is intended to run
as a normal user, not as root. **Common misunderstanding:** A normal user can
still own and operate a service; root is not required for every task.
**Security:** Grant administrative access only for reviewed administration and
never give an assistant root permissions.

## Packages

**What they are:** A package is software prepared for installation and updates
by a package manager or another documented source. **Why they matter:** Package
sources, versions, and dependencies affect repeatability. **In this project:**
Future tutorials must verify prerequisites against authoritative
documentation. **Common misunderstanding:** A package name or command from one
Linux distribution may not apply to another. **Security:** Use trusted sources,
review changes, and keep installed software to the necessary minimum.

## Git

**What it is:** Git records versions of files and changes between them.
**Why it matters:** It supports review, focused commits, and recovery of public
project material. **In this project:** The repository is the source of truth
for lessons and generic reference files. **Common misunderstanding:** Deleting
a secret from the latest file does not remove it from Git history.
**Security:** Review staged changes and never commit credentials, customer data,
logs, databases, or private server evidence.

## GitHub

**What it is:** GitHub is an online service that can host Git repositories and
run repository automation. It is not Git itself. **Why it matters:** It can
support collaboration and publication after owner review. **In this project:**
No deployment or production connection is implied. **Common misunderstanding:**
A local commit is not automatically uploaded. **Security:** Treat public
repositories as public disclosure and give automated workflows the least
permission possible.
