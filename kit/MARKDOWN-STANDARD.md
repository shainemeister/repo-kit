---
title: "Markdown standard"
description: "Landing README, directory-index README, and the minimum frontmatter for a kit document. An adopted repository keeps this shape and writes its own words."
version: "3.0.0"
status: current
audience:
  - developers
  - ai-agents
doc_type: other
related:
  - RULES.md
  - rules/files.md
  - rules/contracts.md
last_updated: "2026-10-13"
---

# Markdown standard

Landing README, directory-index README, and the minimum frontmatter for a kit document.

**Related:** [RULES](RULES.md) · [files](rules/files.md) · [contracts](rules/contracts.md)

Kit text stays generic. A term that needs a precise meaning gets a short definition. An adopted repository keeps this shape and writes what its own files do. A kit example is not that description.

## When this applies

Durable markdown carries the frontmatter below. These files omit it:

| File | Why |
|------|-----|
| Root `README.md` | Landing shape |
| Root `AGENTS.md` | Short session order |
| `CHANGELOG.md` | A list of notable changes |

## Frontmatter

```yaml
---
title: "Human-readable title"
description: "What this file contains now."
version: "1.0.0"
status: current
doc_type: other
last_updated: "2026-10-13"
---
```

| Field | Required |
|-------|----------|
| `title` | Yes |
| `description` | Yes. One sentence is enough when it states the current contents and would be wrong on a sibling file. |
| `version` | Yes |
| `status` | Yes. `draft`, `current`, or `deprecated` |
| `doc_type` | Yes. `readme` for a package README. `other` otherwise. |
| `last_updated` | Yes. `YYYY-MM-DD` |
| `related` | 3–7 peers on a substantial doc. Omit on a thin index. |

The lead under the title matches the first sentence of `description`. Refresh `description` when the file's owned facts change.

## Landing README

The root `README.md` has no frontmatter. Two headings, in order: `## Overview`, then `## Operator prompts`.

Overview says what the repository is, who it is for, and one way to start. Operator prompts are the session load path for that repository. They point at `kit/RULES.md`. They do not paste the rules.

## Directory index

A directory README that lists the files in that directory is a table of file to function. The function cell says the role of that file in that folder, in one line. It is not the landing page, and it does not repeat the file's `description` verbatim.

[files.md](rules/files.md) owns when the index is required.

## Author checklist

Before calling a documentation change done:

- One title. Relative links resolve from the file.
- Frontmatter matches the table above, or the file is on the omit list.
- `description` still matches the file.
- A new directory of intentional files has an index README.
- The landing page, when edited, still has Overview and then Operator prompts.
- No second copy of a rule that already has an owner.
