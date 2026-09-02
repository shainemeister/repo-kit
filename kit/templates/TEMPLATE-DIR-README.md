---
title: "{{FOLDER_NAME}}"
description: "Catalog of intentional files in this folder (file → unique role). Open when adding, moving, or finding a path here; not a landing page or package README."
version: "1.1.0"
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
# keywords:          # omit-if
#   - {{KEYWORD}}
---

# {{FOLDER_NAME}}

Catalog of intentional files in this folder (file → unique role).

**Related:** [files.md](../rules/files.md) · [RULES.md](../RULES.md) · [MARKDOWN-STANDARD.md](../MARKDOWN-STANDARD.md)

**Copy:** this file becomes `README.md` in a **new** navigable directory. Retarget relative links if the destination is not `kit/templates/`. Canonical owner: `kit/rules/files.md`.

---

## Files

| File | Function |
|------|----------|
| {{FILE_NAME}} | {{FILE_FUNCTION}} |

Add or remove rows so the table matches this directory. Function cells pass the [identity test](../MARKDOWN-STANDARD.md#description-identity) at one line (unique role in this folder; not a filename restatement). Omit regenerable outputs, vendor, `.git/`, secrets, host trees this repo did not create, and language leaves already listed in the parent package README ([directory index](../rules/files.md#directory-index)).

<!-- Example only — do not copy these kit paths into a product folder.
| File | Function |
|------|----------|
| SETUP.md | First adopt; delete after initiation (not later upgrades) |
| UPGRADE.md | Later kit bumps and 1.x→2.x migrate |
| RULES.md | Hub: authority map, baseline, Must index |
-->

---

## When to add a sibling

When adding, moving, or splitting a path here, follow [files.md](../rules/files.md).

Replace every `{{PLACEHOLDER}}`. Delete commented `keywords` if unused. This skeleton is a **directory index** (file → function), not [landing](../MARKDOWN-STANDARD.md#landing--root-readme-no-frontmatter). Forward-only: do not backfill historical folders.
