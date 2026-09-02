---
title: "{{PRODUCT_NAME}}"
description: "{{DESCRIPTION}}"
version: "{{VERSION}}"
status: draft
audience:
  - users
  - developers
doc_type: readme
related:
  - CLI-GUIDE.md
  - SECURITY.md
last_updated: "{{LAST_UPDATED}}"
# keywords:          # omit-if
#   - {{KEYWORD}}
---

# {{PRODUCT_NAME}} (`{{FOLDER_NAME}}`)

{{ONE_LINE_PURPOSE}}

**Package version:** {{VERSION}}  
**Folder:** `{{FOLDER_NAME}}/`  

**Related docs:** [CLI-GUIDE.md](./CLI-GUIDE.md) · [SECURITY.md](./SECURITY.md)

<!-- Replace {{PLACEHOLDERS}}. {{DESCRIPTION}} must pass MARKDOWN-STANDARD identity test (claim not in title/filename/doc_type; wrong if swapped onto a sibling). One sentence is legal; not a sentence count. Delete commented `keywords` if unused. Contents only if ≥ 5 H2s or ≳ 150 lines. Never list Summary as item 1. -->

---

## Who should use this

| Audience | Entry point |
|----------|-------------|
| Interactive / cmd | `{{ENTRY_CMD}}` |
| Automation | See [CLI-GUIDE.md](./CLI-GUIDE.md) |
| Library consumers | `{{LIBRARY_ENTRY}}` |

---

## Recommended workflow

Use the block for your host OS. Keep both when the project is multi-platform; drop the unused OS when primary platform is single and declared.

### Windows

```bat
cd /d C:\path\to\{{FOLDER_NAME}}
{{QUICKSTART_COMMANDS}}
```

### Linux / macOS

```bash
cd /path/to/{{FOLDER_NAME}}
{{QUICKSTART_COMMANDS}}
```

---

## Where to go next

| You want… | Open |
|-----------|------|
| Commands, exits, stable output | [CLI-GUIDE.md](./CLI-GUIDE.md) |
| Trust boundary | [SECURITY.md](./SECURITY.md) |

---

## What it produces

omit if: no distinct outputs to enumerate (link the CLI or methodology contract instead).

| Output | Description |
|--------|-------------|
| {{OUTPUT_NAME}} | {{OUTPUT_DESCRIPTION}} |

---

## Prerequisites

omit if: no extra tooling beyond what the workflow already shows.

| Need | Notes |
|------|--------|
| {{PREREQ}} | {{PREREQ_NOTES}} |

---

## Data and configuration

omit if: no data or config contract (or it lives only in the CLI/methodology owner).

| Input | Role |
|-------|------|
| {{INPUT}} | {{INPUT_ROLE}} |

---

## Layout and architecture

omit if: layout is obvious from the package folder or owned by architecture.md.

```text
{{FOLDER_NAME}}/
  README.md
  {{MAIN_ENTRY}}
```

```text
{{ARCHITECTURE_FLOW}}
```

---

## Using from other code

omit if: not a library, or the consume example is the workflow above.

```{{CODE_LANG}}
{{CODE_EXAMPLE}}
```

---

## CLI quick reference

omit if: a CLI-GUIDE exists (full verbs, flags, and exits belong there — do not fork a matrix here).

| Command | Purpose |
|---------|---------|
| {{CMD}} | {{CMD_PURPOSE}} |

---

## Validation

omit if: no package-specific checks beyond the project verification table.

{{VALIDATION_NOTES}}

---

## Security notes

omit if: no local consequence beyond linking SECURITY.md (do not reprint the trust-boundary table).

Full write-up: [SECURITY.md](./SECURITY.md).

---

## Troubleshooting

omit if: no recurring operator failures unique to this package.

| Symptom | What to try |
|---------|-------------|
| {{SYMPTOM}} | {{RESOLUTION}} |

---

## Out of scope

omit if: non-goals are already clear from the lead or Who should use this.

- {{OUT_OF_SCOPE_ITEM}}
