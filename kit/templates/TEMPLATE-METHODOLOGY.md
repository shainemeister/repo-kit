---
title: "{{DOCUMENT_TITLE}}"
description: "{{DESCRIPTION}}"
version: "{{VERSION}}"
status: draft
audience:
  - developers
  - analysts
doc_type: methodology
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

<!-- Replace {{PLACEHOLDERS}}. {{DESCRIPTION}} must pass MARKDOWN-STANDARD identity test (cite; not a sentence count). Delete commented `keywords` if unused. Contents only if ≥ 5 H2s or ≳ 150 lines. Never list Summary as item 1. -->

---

## Definitions and formulas

### {{METRIC_OR_CONCEPT}}

| Symbol / field | Meaning |
|----------------|---------|
| {{SYMBOL}} | {{MEANING}} |

```text
{{FORMULA}}
```

---

## Outputs / column contracts

Do not drop unique columns to shorten this file.

| Column / artifact | Description |
|-------------------|-------------|
| {{COLUMN}} | {{COLUMN_DESC}} |

---

## Purpose and scope

omit if: the lead already states goal, inputs, and non-goals.

| Item | Detail |
|------|--------|
| **Goal** | {{GOAL}} |
| **Inputs** | {{INPUTS}} |
| **Outputs** | {{OUTPUTS}} |
| **Non-goals** | {{NON_GOALS}} |

---

## Pipeline overview

omit if: the formula plus output columns are the whole method.

```text
{{PIPELINE_DIAGRAM}}
```

---

## Worked example

omit if: the method is a single obvious formula (one row in Definitions is enough).

| Case | Input | Result |
|------|-------|--------|
| {{CASE}} | {{INPUT}} | {{RESULT}} |

---

## Validation

omit if: pass criteria live only in fixtures or the project verification table.

| Check | Pass criteria |
|-------|----------------|
| {{CHECK}} | {{PASS_CRITERIA}} |

---

## Common false alarms

omit if: no recurring misreads of the outputs.

| Observation | Explanation |
|-------------|-------------|
| {{OBSERVATION}} | {{EXPLANATION}} |

---

## Out of scope

omit if: non-goals are already in the lead or Purpose.

- {{OUT_OF_SCOPE_ITEM}}

---

## Document history

| Version | Notes |
|---------|--------|
| {{VERSION}} | Initial draft |
