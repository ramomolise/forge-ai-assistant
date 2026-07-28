# Release-readiness checklist

This checklist requires human review. Passing automation is necessary but does
not approve deployment.

## Content and sources

- [ ] Intended audience and project identity are unchanged.
- [ ] Tutorials and canonical reference files agree.
- [ ] Current technical facts cite authoritative primary documentation.
- [ ] Verification dates and facts verified are recorded.
- [ ] Unsupported facts and commands are absent or visibly blocked.
- [ ] No unverified integration or deployment success is claimed.

## Repository checks

- [ ] Hugo production build passes.
- [ ] Explicit draft-free build passes.
- [ ] Secret checking passes.
- [ ] Reference validation passes.
- [ ] Bash syntax checking passes.
- [ ] Rendered internal-link checking passes.
- [ ] Rendered heading-order checking passes.
- [ ] The complete staged diff passes `git diff --check`.

## Security and privacy

- [ ] No credential or sensitive filename is tracked.
- [ ] No production phone number, domain, endpoint, customer data, or log exists.
- [ ] No private VPS evidence exists.
- [ ] Broad tool and administrator access remain prohibited.
- [ ] Authentication, authorisation, secret, logging, and data boundaries have
      human owners.
- [ ] Privacy discussion does not claim to be legal advice.

## Usability and accessibility

- [ ] Pages use one clear first-level heading.
- [ ] Heading levels do not skip.
- [ ] Navigation and skip link work with a keyboard.
- [ ] Focus remains visible.
- [ ] Content works at a narrow mobile viewport without required horizontal
      page scrolling.
- [ ] Commands and long content can scroll within their own blocks.
- [ ] Pages remain useful without JavaScript.

## Operational evidence

- [ ] Installation was tested in an authorised non-production environment.
- [ ] Model, webhook, tunnel, and tool boundaries were tested with synthetic data.
- [ ] The WhatsApp Cloud review records separate Meta recipient and Hermes
      incoming-user controls, signature validation, adapter limitations, and
      failure tests.
- [ ] Backups and an isolated restore test have reviewed evidence.
- [ ] Rollback and service-restart procedures have reviewed evidence.
- [ ] Incident and maintenance owners are assigned.

## Deployment blockers

- [ ] Current Meta dashboards, policies, limits, and requirements were rechecked
      before the authorised non-production test.
- [ ] The WhatsApp Cloud integration has reviewed non-production evidence and
      no unresolved blocker in its canonical setup review.
- [ ] The owner has supplied and approved the public project URL.
- [ ] The placeholder `baseURL` has been replaced through a reviewed change.
- [ ] The first production deployment has explicit human approval.
- [ ] No workflow deploys pull-request content or exposes secrets.

## Decision

- Reviewer role: `<RELEASE_REVIEWER_ROLE>`
- Review date: `<RELEASE_REVIEW_DATE>`
- Confirmed evidence: `<RELEASE_EVIDENCE>`
- Unresolved blockers: `<RELEASE_BLOCKERS>`
- Release approved: `<RELEASE_APPROVED>`
- Deployment approved separately: `<DEPLOYMENT_APPROVED>`
