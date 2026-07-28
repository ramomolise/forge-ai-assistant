# Generic reference examples

This directory contains generic examples that demonstrate how reviewed
reference material supports the website.

## Available material

- [`cloudflare-tunnel-review.md`](cloudflare-tunnel-review.md) is the
  canonical planning checklist for a single public hostname, local service
  boundary, sensitive tunnel credential, verification, disabling, and rollback.
- [`model-business-knowledge-review.md`](model-business-knowledge-review.md)
  is the canonical provider-neutral review for model access, identity,
  approved facts, uncertainty, escalation, and synthetic testing.
- [`vps-preparation-checklist.md`](vps-preparation-checklist.md) is the
  canonical planning and verification checklist for preparing a Linux VPS
  without recording real infrastructure or access details.
- [`assistant-security-review.md`](assistant-security-review.md) is the
  canonical checklist for documenting security boundaries, ownership, control
  status, tests, approvals, and unresolved deployment blockers.
- [`business-discovery-prompt.md`](business-discovery-prompt.md) is the
  canonical prompt for producing a structured draft business-assistant brief.
  Complete it and store its generated output only in a private location.
- [`project-readiness-checklist.md`](project-readiness-checklist.md) is the
  canonical checklist for recording whether a learner can begin safely and
  which decisions remain open. Complete it only in a private copy outside the
  repository.
- [`salon-assistant-brief.md`](salon-assistant-brief.md) is a canonical,
  fictional assistant brief showing boundaries, unimplemented tool proposals,
  escalation rules, risks, and tests for a generic salon.

No real business or provider example is included. Future examples must use
fictional, non-identifying information and the documented placeholder
convention. They must link to canonical scripts or templates instead of copying
complete files.

An example must state what is simulated, what remains unverified, how a learner
can check the expected result, and how to return to the starting state. It must
not include production values, customer information, credentials, or private
VPS evidence.
