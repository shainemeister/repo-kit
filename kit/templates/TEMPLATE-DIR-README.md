---
title: "{{FOLDER_NAME}}"
description: "Index of files in this directory."
version: "1.0.0"
status: current
audience:
  - developers
  - maintainers
doc_type: other
related:
  - ../rules/files.md
  - ../RULES.md
  - ../MARKDOWN-STANDARD.md
last_updated: "{{LAST_UPDATED}}"
---

# {{FOLDER_NAME}}

Index of files in this directory. **Not** a landing page: do **not** use Overview or Operator prompts.

**Related:** [files.md](../rules/files.md) · [RULES.md](../RULES.md) · [MARKDOWN-STANDARD.md](../MARKDOWN-STANDARD.md)

**Copy:** this file becomes `README.md` in a **new** navigable directory. Retarget relative links if the destination is not `kit/templates/`. Canonical owner: `kit/rules/files.md`.

---

## Files

| File | Function |
|------|----------|
| {{FILE_NAME}} | {{FILE_FUNCTION}} |

Add or remove rows so the table matches this directory. Omit regenerable outputs, vendor, `.git/`, secrets, host trees this repo did not create, and language leaves already listed in the parent package README ([directory index](../rules/files.md#directory-index)).

---

## When to add a sibling

When adding, moving, or splitting a path here, follow [files.md](../rules/files.md).

Replace every `{{PLACEHOLDER}}`. This skeleton is a **directory index** (file → function), not [landing](../MARKDOWN-STANDARD.md#landing--root-readme-no-frontmatter). Forward-only: do not backfill historical folders.
