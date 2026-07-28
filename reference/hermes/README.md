# Hermes reference templates

This project refers to **Hermes Agent by Nous Research**, whose authoritative
source repository is `NousResearch/hermes-agent`. This identity was checked on
28 July 2026 by matching its documented `SOUL.md`, `AGENTS.md`, model
selection, tool configuration, messaging gateway, WhatsApp Business Cloud API
support, and normal-user installation to the intended architecture.

No Hermes file format, configuration key, default, command, or runtime
behaviour is defined here yet. Hermes changes quickly, so each template key and
security effect must be verified against a pinned release before use.

Future templates must use documented placeholders, contain no production
values, explain their security implications, and link to verification and
rollback guidance. They must expose only reviewed capabilities and must not
present untested settings as working.

Hermes Agent is general-purpose software. Its official documentation states
that the default local terminal backend has no isolation and that the agent has
the filesystem access of its operating-system user. This project requires
narrower permissions than a default personal-agent installation.
