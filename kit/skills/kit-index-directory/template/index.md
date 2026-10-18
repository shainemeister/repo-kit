---
title: "{{FOLDER_NAME}}"
description: "Catalog of intentional files in this folder (file → unique role). Open when adding, moving, or finding a path here; not a landing page or package README."
version: "1.0.0"
status: current
audience:
  - developers
  - maintainers
doc_type: other
related:
  - ../../../rules/directory-index.md
  - ../../../rules/path-pattern.md
  - ../../../MARKDOWN-STANDARD.md
last_updated: "{{LAST_UPDATED}}"
# keywords:          # omit-if
#   - {{KEYWORD}}
---

# {{FOLDER_NAME}}

Catalog of intentional files in this folder (file → unique role).

**Related:** [directory index](../../../rules/directory-index.md) · [path pattern](../../../rules/path-pattern.md) · [markdown](../../../MARKDOWN-STANDARD.md)

**Copy:** this file becomes `README.md` in a **new** navigable directory. Retarget relative links if the destination is not this blank's folder. When the index is required: `kit/rules/directory-index.md`.

---

## Files

| File | Function |
|------|----------|
| {{FILE_NAME}} | {{FILE_FUNCTION}} |

Add or remove rows so the table matches this directory. The cell shape is the [directory index](../../../MARKDOWN-STANDARD.md#directory-index). Omit regenerable outputs, vendor, `.git/`, secrets, host trees this repo did not create, and language leaves already listed in the parent package README ([directory index](../../../rules/directory-index.md#directory-index)).

<!-- Example only — replace with this folder’s files; do not ship these sample names.
| File | Function |
|------|----------|
| CLI-GUIDE.md | Verbs, flags, exits, and stable stdout (not the library API) |
| SECURITY.md | Trust boundary when the package has an execution surface |
| METHODOLOGY.md | Formulas and output columns (not the CLI contract) |
-->

---

## When to add a sibling

When adding, moving, or splitting a path here, follow [path-pattern.md](../../../rules/path-pattern.md).

Replace every `{{PLACEHOLDER}}`. Delete commented `keywords` if unused. This skeleton is a **directory index** (file → function), not [landing](../../../MARKDOWN-STANDARD.md#landing-readme). Forward-only: do not backfill historical folders.
