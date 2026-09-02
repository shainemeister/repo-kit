---
title: "{{DOCUMENT_TITLE}}"
description: "{{DESCRIPTION}}"
version: "{{VERSION}}"
status: draft
audience:
  - developers
  - analysts
doc_type: concept
related:
  - README.md
  - {{RELATED_DOC}}
last_updated: "{{LAST_UPDATED}}"
# keywords:          # omit-if
#   - {{KEYWORD}}
---

# {{DOCUMENT_TITLE}}

{{ONE_LINE_PURPOSE}}

**Document version:** {{VERSION}}  
**Related:** [README.md](./README.md) · [{{RELATED_DOC}}](./{{RELATED_DOC}})

<!-- Replace {{PLACEHOLDERS}}. {{DESCRIPTION}} must pass MARKDOWN-STANDARD identity test (claim not in title/filename/doc_type; wrong if swapped onto a sibling). One sentence is legal; not a sentence count. Delete commented `keywords` if unused. Contents only if ≥ 5 H2s or ≳ 150 lines. Never list Summary as item 1. -->

---

## Shared principles

| Principle | Description |
|-----------|-------------|
| {{PRINCIPLE}} | {{PRINCIPLE_DESC}} |

---

## Current shape

**Goal:** {{PHASE_1_GOAL}}

| Item | Notes |
|------|--------|
| {{ITEM}} | {{NOTES}} |

Current implementation target: **{{CURRENT_TARGET}}**.

---

## Overview

omit if: it only restates the lead.

{{OVERVIEW}}

---

## Earlier versions

omit if: no version archaeology (one current shape is enough).

### Version / Phase — {{PHASE_2_NAME}}

**Goal:** {{PHASE_2_GOAL}}

| Item | Notes |
|------|--------|
| {{ITEM}} | {{NOTES}} |

---

## Implementation notes

omit if: implementation belongs in code comments or a package README.

- {{IMPLEMENTATION_NOTE}}

---

## Document control

omit if: not a standalone CLI / methodology / SECURITY contract (use frontmatter + CHANGELOG).

- This document is updated as formulas, thresholds, and scope are refined.

| Version | Notes |
|---------|--------|
| {{VERSION}} | Initial concept |
