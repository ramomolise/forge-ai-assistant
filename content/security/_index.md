---
title: "Security"
description: "Protect your server, credentials, business systems, and customer information."
weight: 60
---

Security must be designed before deployment because an assistant may receive
public messages, handle business information, and request actions from other
systems. Adding restrictions after broad access has been granted is not a safe
starting point.

An assistant should receive only the information and capabilities needed for
its approved purpose. Public messages must be treated as untrusted input:
customers, mistakes, and hostile instructions must not be able to change
permissions or reveal private information.

Credentials, private customer information, production infrastructure details,
and private server evidence must remain outside prompts and source control.

Security controls require human review and realistic testing. A written rule is
not proof that a control is implemented, and an implemented control is not
proof that it works.

{{< security >}}
This guide is educational. It is not a security certification or legal
opinion. A business remains responsible for obtaining appropriate technical,
security, and other professional review before deployment.
{{< /security >}}

## First security lesson

Read [Define assistant security boundaries](security-boundaries/) to identify
protected assets, trust boundaries, access limits, tests, and unresolved risks
before technical implementation.
