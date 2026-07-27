# forge-ai-assistant

Open-source reference implementation for building and operating AI assistants for small businesses.

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
