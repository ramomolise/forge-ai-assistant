---
title: "AI assistant building blocks"
description: "Understand AI models, system prompts, and tool calling."
weight: 30
draft: false
---

## AI model

**What it is:** An AI model processes input and generates output based on
patterns learned during training and the context it receives. **Why it
matters:** It can interpret a request and draft a useful response. **In this
project:** A future model supports Hermes within approved boundaries; no
provider is required or connected. **Common misunderstanding:** Confident text
is not proof that a fact is correct. **Security:** Minimise shared data, keep
credentials private, verify business facts, and escalate uncertainty.

## System prompt

**What it is:** A system prompt supplies high-priority instructions about an
assistant's role and behaviour. **Why it matters:** It helps express purpose,
limits, tone, and escalation rules. **In this project:** Future identity
material will use reviewed business rules. **Common misunderstanding:** A
prompt alone is not an access control and cannot prove compliance.
**Security:** Enforce permissions outside the prompt and test attempts to
override or reveal instructions.

## Tool calling

**What it is:** Tool calling lets a model request a defined operation from
software that decides whether and how to execute it. **Why it matters:** It can
support a narrow business outcome beyond generating text. **In this project:**
Only owner-approved, narrowly scoped tools are intended. **Common
misunderstanding:** A model's request is not authorisation or evidence of
success. **Security:** Validate inputs, allowlist operations, confirm
consequential actions, limit retries, and return only necessary data.
