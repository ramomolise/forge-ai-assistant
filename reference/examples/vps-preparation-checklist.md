# VPS preparation checklist

Use this canonical checklist to review a VPS candidate. Complete it in an
approved private location. Do not add real addresses, hostnames, account
identifiers, credentials, provider records, or recovery details to Git.

## Platform

- Operating-system category: `<OPERATING_SYSTEM_CATEGORY>`
- Release support evidence: `<RELEASE_SUPPORT_EVIDENCE>`
- CPU architecture category: `<CPU_ARCHITECTURE_CATEGORY>`
- Capacity decision status: `<CAPACITY_DECISION_STATUS>`
- Hermes compatibility status: `<HERMES_COMPATIBILITY_STATUS>`

An unresolved compatibility status blocks Hermes installation.

## Ownership and access

- Business owner role: `<BUSINESS_OWNER_ROLE>`
- Normal administrator role: `<NORMAL_ADMIN_ROLE>`
- Future service-owner role: `<SERVICE_OWNER_ROLE>`
- Root-use boundary: `<ROOT_USE_BOUNDARY>`
- Private recovery-access status: `<RECOVERY_ACCESS_STATUS>`

The future assistant must not run as root. Do not record usernames, keys,
addresses, or console details in this checklist.

## Filesystem plan

- Private configuration category: `<PRIVATE_CONFIGURATION_CATEGORY>`
- Future service paths: `<APPROVED_SERVICE_PATHS>`
- Log category and reader roles: `<LOG_ACCESS_BOUNDARY>`
- Backup category and owner role: `<BACKUP_OWNER_ROLE>`
- Ownership verification status: `<OWNERSHIP_VERIFICATION_STATUS>`

Do not invent application paths. Leave them unresolved until authoritative
application documentation supports them.

## Updates

- Publisher update guidance reviewed: `<UPDATE_GUIDANCE_STATUS>`
- Backup before updates: `<PRE_UPDATE_BACKUP_STATUS>`
- Proposed package changes reviewed by: `<UPDATE_REVIEW_ROLE>`
- Routine update result: `<ROUTINE_UPDATE_RESULT>`
- Restart or reboot decision owner: `<RESTART_DECISION_ROLE>`

Do not claim success when the package manager reports an error.

## Firewall planning

- Current administration path category: `<ADMINISTRATION_PATH_CATEGORY>`
- Intended public entry-point category: `<PUBLIC_ENTRY_POINT_CATEGORY>`
- Services that must remain private: `<PRIVATE_SERVICE_CATEGORIES>`
- Provider network controls reviewed: `<PROVIDER_NETWORK_REVIEW_STATUS>`
- Host firewall plan status: `<FIREWALL_PLAN_STATUS>`
- Recovery path tested before rule changes: `<FIREWALL_RECOVERY_STATUS>`

This checklist does not prescribe firewall commands. An unresolved
administration or recovery path blocks firewall changes.

## Resilience

- Stable maintenance connection available: `<MAINTENANCE_CONNECTIVITY_STATUS>`
- Alternative connection available: `<ALTERNATIVE_CONNECTIVITY_STATUS>`
- Power continuity plan: `<POWER_CONTINUITY_STATUS>`
- Maintenance observer role: `<MAINTENANCE_OBSERVER_ROLE>`
- Safe maintenance window: `<MAINTENANCE_WINDOW_STATUS>`

## Secrets outside Git

- [ ] No server address or hostname is recorded.
- [ ] No account identifier or username is recorded.
- [ ] No password, private key, token, or recovery value is recorded.
- [ ] No provider console or backup location is recorded.
- [ ] No production log, database, or private audit evidence is recorded.

## Verification

- [ ] Publisher support is confirmed.
- [ ] Normal-user and root boundaries are approved.
- [ ] Provider recovery access is tested privately.
- [ ] Backup ownership and restore testing are defined.
- [ ] Routine updates report no failure.
- [ ] Filesystem ownership categories are separated.
- [ ] Firewall needs are documented without applying unreviewed rules.
- [ ] Connectivity and power interruption plans are approved.
- [ ] All unresolved high-risk items block dependent work.

## Rollback plan

- Recovery decision role: `<RECOVERY_DECISION_ROLE>`
- Provider restore procedure status: `<PROVIDER_RESTORE_STATUS>`
- Access verification after recovery: `<ACCESS_RECOVERY_CHECK>`
- Package-state verification after recovery: `<PACKAGE_RECOVERY_CHECK>`
- Filesystem and network verification: `<BOUNDARY_RECOVERY_CHECK>`

Do not improvise destructive recovery commands. Use the approved provider and
operating-system procedure, then verify the restored boundaries.

## Review result

- Confirmed requirements: `<CONFIRMED_REQUIREMENTS>`
- Proposed controls: `<PROPOSED_CONTROLS>`
- Unresolved risks: `<UNRESOLVED_RISKS>`
- Deployment blocked: `<DEPLOYMENT_BLOCKED>`
