# Security reporting

Do not open a public issue containing a credential, customer record, private
hostname, phone number, server address, log, database, private audit file, or
detailed unpatched vulnerability.

Use the repository host's private security-reporting feature when the owner has
enabled it. If no private channel is published, report only that a private
contact channel is needed; do not disclose the sensitive detail publicly.

Include a minimal description of the affected public file or component,
potential impact, and safe reproduction conditions. Redact secrets and personal
information. Do not test against production services or other people's data.

If a credential may have been exposed, stop using it, notify its authorised
owner through a private channel, rotate it, inspect Git history, and review
dependent systems. Removing the current file is not sufficient.

This process is not an authorisation to access systems, accounts, customer
information, or private infrastructure.
