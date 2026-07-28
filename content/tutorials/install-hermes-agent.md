---
title: "Install Hermes Agent with review boundaries"
description: "Identify the intended Hermes project, inspect its official installer, verify a normal-user installation, and preserve backup and rollback boundaries."
weight: 40
draft: false
difficulty: "beginner"
estimated_time: "Not yet measured"
requirements:
  - "A completed private VPS preparation review"
  - "A normal Linux service user without administrator access"
  - "Git, curl, and xz-utils as documented prerequisites"
  - "Owner approval of the installer and security limitations"
learning_outcomes:
  - "Identify the authoritative Hermes Agent project"
  - "Inspect rather than pipe a remote installer directly into a shell"
  - "Verify installation without claiming model or gateway success"
security_notes:
  - "Hermes Agent is general-purpose software with powerful tools"
  - "Installation does not approve production use or broad tool access"
---

This lesson concerns **Hermes Agent by Nous Research**, published in the
`NousResearch/hermes-agent` repository. The identity was verified on 28 July
2026 by matching the official source and documentation to this project's
`SOUL.md`, project `AGENTS.md`, model, tools, messaging gateway, and WhatsApp
Business Cloud API concepts.

## Understand the boundary first

Hermes Agent is a general-purpose agent. Its official documentation states that
the default local terminal backend has no isolation and can access files
available to its operating-system user. Installing it does not make it suitable
for public customer messages.

{{< warning >}}
Do not configure messaging, model credentials, memory, scheduled tasks, or
broad tools in this lesson. Later milestones must define and test those
boundaries. Never run Hermes as root.
{{< /warning >}}

## Confirm prerequisites

The official Linux installer documentation lists Git, `curl`, and `xz-utils`
as prerequisites. It says the installer supplies its Python, Node.js, ripgrep,
and ffmpeg requirements. Linux on x86_64 and aarch64 is Tier 1, with upstream
testing focused on the latest Ubuntu.

Confirm the VPS review, backup, normal service user, and owner approval before
downloading anything. Browser automation has additional requirements and is
not enabled here.

## Inspect the official installer

The upstream quickstart pipes a download to `bash`. For learning, download the
same official script, inspect it, and execute only the reviewed local copy:

{{< command >}}
curl -fsSLo /tmp/hermes-install.sh https://hermes-agent.nousresearch.com/install.sh
less /tmp/hermes-install.sh
bash /tmp/hermes-install.sh --skip-browser
{{< /command >}}

The commands download the official installer to a temporary file, open it for
review, and run the reviewed copy as the current normal user while omitting
optional browser setup.

Stop if the script differs from what was approved, requests unexpected
privilege, or proposes unexplained changes. This repository has not run the
installer and does not claim success on a particular VPS.

## Know the documented locations

For an official per-user Git installation, upstream documents:

- code under `~/.hermes/hermes-agent/`
- the launcher at `~/.local/bin/hermes`
- instance data under `~/.hermes/`, unless `HERMES_HOME` selects another home
- configuration at `~/.hermes/config.yaml`
- primary identity at `HERMES_HOME/SOUL.md`

`SOUL.md` defines durable identity and style. Project-specific architecture,
workflow, and tool guidance belongs in `AGENTS.md`. Neither file is an access
control; permissions must be restricted separately.

## Verify only installation

{{< command >}}
source ~/.bashrc
hermes doctor
hermes config check
{{< /command >}}

The first command reloads the normal user's shell configuration. `hermes
doctor` is the upstream diagnostic command, while `hermes config check`
validates configuration according to official troubleshooting guidance. Review
non-secret output privately.

{{< expected-output >}}
The launcher is found and the checks report no unresolved installation error.
This proves neither model access nor gateway, tool, memory, or production
readiness.
{{< /expected-output >}}

Do not enter credentials or connect a provider in this lesson.

## Back up before configuration

Record the installer source, verification date, method, and non-secret
diagnostic result privately. Back up the Hermes home using an owner-approved
private process before changing identity, model, gateway, tools, or memory.

## Rollback and uninstall boundary

{{< rollback >}}
Stop Hermes processes before recovery. Use the current official “Updating &
Uninstalling” guidance for the detected installation method. Back up the Hermes
home first, distinguish program files from user data, and do not delete either
until the owner approves retention. Verify the launcher and process are absent
after uninstall while retained data remains private.
{{< /rollback >}}

No uninstall command is reproduced because it must be rechecked for the
installed method and release. Deleting `~/.hermes/` may destroy credentials,
identity, sessions, or other state without a recovery path.

## Security review

- [ ] Hermes runs as a normal dedicated user.
- [ ] No credential was passed on a command line or committed.
- [ ] The default local terminal backend is treated as unisolated.
- [ ] No broad tools, browser, memory, cron, or gateway is approved.
- [ ] `SOUL.md` and `AGENTS.md` are instructions, not isolation.
- [ ] Backup, retention, rollback, and uninstall owners are recorded.
- [ ] Diagnostics do not become a claim that an integration works.

## Sources verified

Checked 28 July 2026:

- [Hermes Agent source](https://github.com/NousResearch/hermes-agent)
- [Installation](https://hermes-agent.nousresearch.com/docs/getting-started/installation)
- [Platform support](https://hermes-agent.nousresearch.com/docs/getting-started/platform-support)
- [Configuration](https://hermes-agent.nousresearch.com/docs/user-guide/configuration)
- [Security](https://hermes-agent.nousresearch.com/docs/user-guide/security)
- [SOUL.md](https://hermes-agent.nousresearch.com/docs/user-guide/features/personality)
- [WhatsApp Business Cloud API](https://hermes-agent.nousresearch.com/docs/user-guide/messaging/whatsapp-cloud)

These sources verify identity, installation categories, prerequisites,
locations, diagnostics, identity behaviour, and the unisolated local-tool
warning. No installation or external connection was performed.

## Next lesson

Choose and test a model only after credential, data, tool, and uncertainty
boundaries are approved.
