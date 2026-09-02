---
title: "{{PRODUCT_NAME}} CLI Reference"
description: "{{DESCRIPTION}}"
version: "{{VERSION}}"
status: draft
audience:
  - developers
  - automation
doc_type: cli
related:
  - README.md
  - SECURITY.md
last_updated: "{{LAST_UPDATED}}"
# keywords:          # omit-if
#   - {{KEYWORD}}
---

# {{PRODUCT_NAME}} — CLI Reference

{{ONE_LINE_PURPOSE}}

**Package version:** {{VERSION}}  

**Related docs:** [README.md](./README.md) · [SECURITY.md](./SECURITY.md)

| Item | Value |
|------|--------|
| **Package folder** | `{{FOLDER_NAME}}/` |
| **CLI entry** | `{{CLI_ENTRY}}` |
| **Library** | `{{LIBRARY_ENTRY}}` |

<!-- Replace {{PLACEHOLDERS}}. {{DESCRIPTION}} must pass MARKDOWN-STANDARD identity test (claim not in title/filename/doc_type; wrong if swapped onto a sibling). One sentence is legal; not a sentence count. Delete commented `keywords` if unused. Contents only if ≥ 5 H2s or ≳ 150 lines. Never list Summary as item 1. -->

---

## Invocation

Keep both OS blocks when multi-platform; drop the unused OS when primary platform is single and declared.

### Windows

```bat
cd /d C:\path\to\{{FOLDER_NAME}}
{{CLI_ENTRY}} {{EXAMPLE_COMMAND}}
```

### Linux / macOS

```bash
cd /path/to/{{FOLDER_NAME}}
{{CLI_ENTRY}} {{EXAMPLE_COMMAND}}
```

### General form

```text
{{CLI_ENTRY}} <command> [options]
```

---

## Commands

| Verb | Purpose |
|------|---------|
| `{{COMMAND}}` | {{COMMAND_DESCRIPTION}} |

### `{{COMMAND}}`

```text
{{CLI_ENTRY}} {{COMMAND}} [options]
```

| Option | Required | Default | Description |
|--------|----------|---------|-------------|
| `{{OPTION}}` | No | {{DEFAULT}} | {{OPTION_DESC}} |

---

## Exit codes

| Code | Meaning |
|------|---------|
| **0** | Success |
| **1** | Validation / usage / preflight |
| **2** | Runtime failure (if used) |

---

## Global options

omit if: no flags apply to every verb.

| Option | Description |
|--------|-------------|
| `{{GLOBAL_OPTION}}` | {{GLOBAL_OPTION_DESC}} |

---

## Data contract

Stable stdout / file output. Do not drop unique columns to shorten this file.

| Input / output | Role |
|----------------|------|
| {{IO_NAME}} | {{IO_ROLE}} |

```json
{
  "Success": true,
  "Command": "{{COMMAND}}",
  "Version": "{{VERSION}}"
}
```

---

## Architecture

omit if: no multi-stage pipeline unique to this CLI (do not reprint architecture.md).

```text
{{ARCHITECTURE_FLOW}}
```

---

## When to use the CLI vs the library

omit if: CLI-only, or the choice is already in the README workflow.

| Caller | Recommended API |
|--------|-----------------|
| Same-process scripts | {{LIBRARY_ENTRY}} |
| Task Scheduler / cmd / other languages | CLI |

---

## Example use cases

omit if: Invocation plus Commands already show the realistic path (no novel scenario).

### {{USE_CASE_TITLE}}

**Windows**

```bat
{{USE_CASE_COMMANDS}}
```

**Linux / macOS**

```bash
{{USE_CASE_COMMANDS}}
```

---

## Constraints

omit if: no extra limits beyond [SECURITY.md](./SECURITY.md) and the data contract.

| Topic | Behavior |
|-------|----------|
| {{CONSTRAINT}} | {{CONSTRAINT_BEHAVIOR}} |

---

## Troubleshooting

omit if: no recurring invocation failures unique to this CLI.

| Symptom | What to check |
|---------|----------------|
| {{SYMPTOM}} | {{CHECK}} |

---

## Version policy

omit if: versioning is only “bump this file with the verbs” (then record the bump in Document history).

CLI and product version are aligned at **{{VERSION}}**. Bump when changing verbs, exit codes, or machine-readable field names.

---

## Document history

| Version | Notes |
|---------|--------|
| {{VERSION}} | Initial CLI contract |
