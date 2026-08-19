---
title: "{{DOCUMENT_TITLE}}"
description: "{{ONE_LINE_PURPOSE}}"
version: "{{VERSION}}"
status: draft
audience:
  - developers
doc_type: other
related:
  - README.md
  - {{RELATED_DOC}}
last_updated: "{{LAST_UPDATED}}"
---

# {{DOCUMENT_TITLE}}

{{ONE_LINE_PURPOSE}}

**Version:** {{VERSION}}  
**Related:** [README.md](./README.md) · [{{RELATED_DOC}}](./{{RELATED_DOC}})

<!-- Contents only if ≥ 5 H2s or ≳ 150 lines. Never list Summary as item 1. -->

---

## Summary

omit if: body ≲ 60 lines (no decision table required).

{{SUMMARY_PARAGRAPH}}

---

## Details

{{DETAILS}}

| Item | Notes |
|------|--------|
| {{ITEM}} | {{NOTES}} |

---

## Next steps

omit if: no follow-up actions.

- {{NEXT_STEP}}

---

## Document history

omit if: kit-internal module (use frontmatter `version`/`last_updated` + project or kit CHANGELOG). Keep this table on standalone contracts (CLI, methodology, SECURITY).

| Version | Notes |
|---------|--------|
| {{VERSION}} | Initial draft |
