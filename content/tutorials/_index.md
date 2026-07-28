---
title: "Tutorials"
description: "Build a simple Hermes AI assistant step by step."
weight: 20
---

Follow the learning path from server preparation to testing and maintenance.
Each technical lesson distinguishes verified instructions from decisions that
still require owner review.

## Infrastructure

Start with [Prepare a Linux VPS safely](prepare-linux-vps/). It explains the
decisions and checks needed before assistant software is installed.

After the VPS review passes, read [Install Hermes Agent with review
boundaries](install-hermes-agent/). Do not install it until the owner approves
the software's broad default capabilities and the proposed hardening work.

Then [Design model and business-knowledge boundaries](model-and-business-knowledge/)
before adding provider credentials or business facts.

The independent [Cloudflare Tunnel security design](cloudflare-tunnel-security/)
explains how a future public webhook could reach one local service without
publishing the Hermes gateway directly.

Use [Design one narrowly scoped tool](design-scoped-tool/) to turn one approved
business outcome into a permission-limited, testable tool proposal.
