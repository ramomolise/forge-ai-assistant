---
title: "Prepare a Linux VPS safely"
description: "Plan a supported Linux server, separate user permissions, update packages, and define verification and rollback before installing assistant software."
weight: 30
draft: false
difficulty: "beginner"
estimated_time: "Not yet measured"
requirements:
  - "An owner-approved VPS candidate"
  - "A tested private backup or snapshot method"
  - "A documented administrator access and recovery path"
learning_outcomes:
  - "Separate normal service ownership from administrator access"
  - "Plan updates, firewall boundaries, backups, and recovery"
  - "Identify decisions that must block installation"
security_notes:
  - "Do not run assistant software as root"
  - "Do not change remote access or firewall rules without a tested recovery path"
---

This lesson prepares a VPS candidate for later learning. It does not install
Hermes, open a firewall, change an account, or prove that a particular VPS is
compatible.

## What you are preparing

A VPS is a virtual computer operated in a provider's infrastructure. For this
project, a suitable category is a currently supported, server-oriented Linux
release with security updates and documentation available from its publisher.
Ubuntu Server LTS and Debian stable are candidates for owner evaluation, not a
claim of Hermes compatibility.

Record the operating-system name, release, CPU architecture, storage, memory,
backup capability, and provider recovery method in a private inventory. Do not
commit the server address, account identifier, access key, hostname, or
provider records.

## Use the canonical checklist

{{< reference-file source="reference/examples/vps-preparation-checklist.md" download="downloads/vps-preparation-checklist.md" label="VPS preparation checklist" >}}

Complete a private copy. The canonical file contains placeholders only.

## Separate people, services, and root

Use a named normal account for routine administration and a separate normal
service identity for future assistant processes. Root has system-wide power
and should not own or run the assistant.

Ubuntu disables direct root login by default and uses approved `sudo` access
for temporary administrative work. This does not mean every normal user should
receive administrator permission.

Before changing any account or remote-access setting, confirm that an
authorised person has a second tested recovery path, such as the provider's
documented console. An incorrect access change can lock the owner out.

## Plan filesystem ownership

Decide which normal user will own future configuration, working data, backups,
and service files. Keep public content, private configuration, credentials,
logs, and backups in separate categories with separate access decisions.

Do not invent Hermes paths at this stage. Record `<APPROVED_SERVICE_PATHS>` only
after Milestone 11 identifies authoritative Hermes documentation.

## Back up before changing packages

Use the VPS provider's documented backup or snapshot process and record who can
restore it. A snapshot label is not evidence of recovery: the owner must define
how restoration will be tested without risking the live access path.

{{< warning >}}
Do not start an operating-system release upgrade from this lesson. Release
upgrades have different prerequisites and risks from routine package updates.
Follow the publisher's release-specific guide and test recovery first.
{{< /warning >}}

## Review routine Ubuntu package updates

The following commands are verified for supported Ubuntu Server releases in
the official Ubuntu package-management guide, checked 28 July 2026:

{{< command >}}
sudo apt update
sudo apt upgrade
{{< /command >}}

The first command refreshes the local package index. The second shows proposed
upgrades and asks for confirmation before changing installed packages. Read the
proposal and prompts; do not assume every third-party package is covered.

For Debian, consult the release notes and Debian Administrator's Handbook for
the installed stable release before choosing an update command. This lesson
does not generalise Ubuntu commands to every Linux distribution.

{{< expected-output >}}
The package-index refresh completes without repository errors. Any proposed
upgrade is reviewed, finishes without reported failure, and does not remove the
owner's tested administration path.
{{< /expected-output >}}

## Plan the firewall before changing it

A host firewall controls network traffic reaching the VPS. List the current
administration path, intended future public entry point, and services that must
remain private. Prefer the smallest required inbound surface.

No firewall command appears here. Rules depend on provider networking, current
remote access, address families, and recovery options. Applying a generic rule
could interrupt access. The future tunnel lesson must not require the Hermes
gateway itself to be publicly reachable.

## Plan for connectivity and power interruptions

South African owners may administer an overseas or local VPS over variable
connectivity and during load shedding. Schedule changes when an authorised
person has stable power and internet, enough time to observe the result, and an
alternative connection. Avoid starting a change that cannot be monitored.

## Verify readiness

- [ ] The Linux release is supported by its publisher.
- [ ] The CPU architecture and capacity are recorded privately.
- [ ] Routine administration and future service ownership use normal users.
- [ ] Root access is reserved for reviewed administration.
- [ ] Provider console or recovery access has been tested.
- [ ] A backup exists and a restore test is planned.
- [ ] Package updates completed without reported failure.
- [ ] Public and private network needs are documented before firewall changes.
- [ ] Credentials and real infrastructure details remain outside Git.
- [ ] Unknown Hermes paths and requirements remain unresolved.

{{< troubleshooting >}}
Stop if repositories report errors, packages remain in a broken state, remote
access becomes uncertain, backup restoration has no owner, or the operating
system is outside publisher support. Record the exact non-secret error
privately and obtain authorised system-administration help.
{{< /troubleshooting >}}

## Rollback boundary

{{< rollback >}}
Do not improvise package downgrades or account and firewall reversals. Stop the
change, preserve non-secret diagnostics, and use the pre-approved provider
recovery or restore procedure. Verify administrator access, service ownership,
network boundaries, and package state after recovery.
{{< /rollback >}}

## Sources verified

Provider facts and commands were checked on 28 July 2026 against:

- [Ubuntu Server: User management](https://documentation.ubuntu.com/server/how-to/security/user-management/)
- [Ubuntu Server: Install and manage packages](https://documentation.ubuntu.com/server/how-to/software/package-management/)
- [Ubuntu Server: Firewall](https://documentation.ubuntu.com/server/how-to/security/firewalls/)
- [Ubuntu Server: Upgrade a release](https://documentation.ubuntu.com/server/how-to/software/upgrade-your-release/)
- [Debian Administrator's Handbook: APT tools](https://www.debian.org/doc/manuals/debian-handbook/apt.en.html)

These sources verify operating-system behaviour only. They do not verify
Hermes compatibility or a production deployment.

## Next lesson

Continue only after the intended Hermes project and its supported prerequisites
are identified from authoritative documentation.
