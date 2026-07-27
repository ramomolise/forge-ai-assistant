# forge-ai-assistant

Open-source reference implementation for building and operating AI assistants for small businesses.

## Canonical reference material

The [`reference/`](reference/) directory is the canonical home for future
reviewed scripts, templates, and generic examples. Website tutorials may
explain or excerpt those files, but must link back to the canonical copy.

## Repository safety checks

Run the local safety baseline with:

```bash
make check-secrets
```

The checker examines files tracked by Git. It rejects sensitive filenames, such
as environment files, private keys, operational reports, Hermes state, logs,
memories, and local databases. It also reports tracked text files that match a
small set of common credential formats. Reports identify filenames only and do
not print the suspected secret values.

This is a precaution, not a guarantee that the repository contains no secrets.
Pattern matching can miss unknown, encoded, split, or unusual credentials, and
the checker does not inspect untracked files or the full Git history. Review
changes before committing, keep private VPS evidence outside the repository,
and use a dedicated history-aware scanner before publishing.

Run all currently available local checks with:

```bash
make test
```

## Tutorial shortcodes

Shortcodes keep recurring tutorial guidance consistent. Use paired opening and
closing tags for content blocks:

| Shortcode | Purpose | Example |
| --- | --- | --- |
| `warning` | Highlights a risk or action requiring care. | `{{</* warning */>}}Check the placeholder.{{</* /warning */>}}` |
| `security` | Identifies a security consideration. | `{{</* security */>}}Protect the placeholder.{{</* /security */>}}` |
| `sa-context` | Adds relevant South African context without making unsupported claims. | `{{</* sa-context */>}}Add reviewed context.{{</* /sa-context */>}}` |
| `command` | Displays a command without executing it. | `{{</* command */>}}placeholder-command{{</* /command */>}}` |
| `expected-output` | Shows the expected result of a command or check. | `{{</* expected-output */>}}<PLACEHOLDER_OUTPUT>{{</* /expected-output */>}}` |
| `troubleshooting` | Explains how to investigate a possible problem. | `{{</* troubleshooting */>}}Check <PLACEHOLDER>.{{</* /troubleshooting */>}}` |
| `rollback` | Describes how to undo or recover from a change. | `{{</* rollback */>}}Restore <PLACEHOLDER>.{{</* /rollback */>}}` |

The `reference-file` shortcode links to canonical material and uses named
parameters:

```text
{{</* reference-file path="/reference/" label="<REFERENCE_FILE>" */>}}
```

Shortcode content may use Markdown. Command and expected-output content is
rendered as literal text. Keep examples generic, replace placeholders only with
reviewed values, and do not place credentials in Markdown.
