---
title: "Example: Docs-only / standards repository"
description: Illustrative filled authority map and verification for a docs-only or standards repo. Open when adopting the kit with no product code.
status: current
audience:
  - developers
  - maintainers
doc_type: other
version: "1.1.0"
related:
  - ../../../../../../ADOPTER.md
  - ../../../../../../kit/RULES.md
  - ../../../../../../kit/MARKDOWN-STANDARD.md
  - ../../../../../../kit/rules/files.md
  - ../../../../../../kit/rules/contracts.md
last_updated: "2026-10-17"
---

# Example: Docs-only / standards repository

**Illustrative only** — copy the *pattern* of a filled authority map and verification table. Replace names and paths with your project’s.

**Sample interest:** “Design and standards repo that captures methodology and progressive concepts without shipping product code.”

**Primary platform (example):** multi (path examples only; no runtime gate)

**Packaging:** standards under `kit/`. Design notes stay outside `kit/`. A docs-only repository needs no `src/`. See [files.md](../../../../../../kit/rules/files.md).

---

## Suggested first templates

| Template | Becomes |
|----------|---------|
| [landing.md](../../../../../../kit/skills/kit-author-docs/template/landing.md) | Root `README.md` — Overview + Operator prompts (empty inventory in the load path) |
| [generic.md](../../../../../../kit/skills/kit-author-docs/template/generic.md) | e.g. `DESIGN-NOTES.md` |
| [concept.md](../../../../../../kit/skills/kit-author-docs/template/concept.md) | e.g. `CONCEPT-v1.md` |
| [methodology.md](../../../../../../kit/skills/kit-author-docs/template/methodology.md) | e.g. `METHODOLOGY.md` when formulas exist |

Copy [RULES.md](../../../../../../kit/RULES.md) and [MARKDOWN-STANDARD.md](../../../../../../kit/MARKDOWN-STANDARD.md) into project **`kit/`**; remove or skip code-only rows.

---

## Filled authority map (snippet)

| Concern | Canonical source |
|---------|------------------|
| Repo purpose and quick start | Root `README.md` |
| Path-level file inventory (optional) | Root `FILE-CATALOG.md` |
| Markdown structure | `kit/MARKDOWN-STANDARD.md` |
| Maintenance policy | `kit/RULES.md` + `kit/rules/` |
| Contract policy | `kit/rules/contracts.md` |
| File placement / creation / naming | `kit/rules/files.md` |
| Project history (**required**) | Root `CHANGELOG.md` |
| Standards kit baseline | `kit/RULES.md` — Kit baseline |
| Design / concept notes | `CONCEPT-v1.md` (outside `kit/`) |
| Formulas / “how it works” | `METHODOLOGY.md` |
| Kit evolution / planning | Root `PLAN.md` (if used) |
| Working notes | Root `docs/` when the work needs them |
| Multi-phase work | `WORKBOARD.md` |
| Coding agent | Root `AGENTS.md` when an agent maintains the repo |

Omit package CLI, schema, and fixtures when they do not apply. This example omits `SECURITY.md` because a docs-only repository does not execute, use the network, elevate, or handle secrets. A notable change still gets a changelog line. The commit holds the detail.

### Language surface inventory (snippet)

| Surface | Domain B | Domain A |
|---------|----------|----------|
| *(none — docs-only)* | — | — |

Empty inventory: no language gates. No `certification/` folder required.

### Sample kit baseline

| Field | Value |
|-------|--------|
| Adopted kit version | *(use latest `### [X.Y.Z]` under `## repo-kit` in kit/CHANGELOG.md)* |
| Adopted on | `2026-07-28` |
| Kit source | https://github.com/shainemeister/repo-kit |

### Sample project CHANGELOG entry (first adoption)

```markdown
## design-notes

### [0.1.0] - 2026-07-28

#### Added

- Adopted repo-kit 2.0.1 from https://github.com/shainemeister/repo-kit (standards under kit/)
```

---

## Verification before ship (snippet)

| Change type | Minimum verification |
|-------------|----------------------|
| Docs only | Author checklist (including [density](../../../../../../kit/MARKDOWN-STANDARD.md#author-checklist)); relative links resolve; last citations remain |
| New/removed source files | `FILE-CATALOG.md` updated (if maintained) |
| New navigable directory | Directory-index `README.md` (file → function) for **new** dirs ([files.md](../../../../../../kit/rules/files.md)); **forward-only** — not a gate for historical folders |
| Methodology interpretation change | Document history row + status honesty |

No product language gates unless code is later added. Upgrades: [UPGRADE.md](../../../../../../kit/UPGRADE.md).

---

## Sample commit subjects

```text
docs: add concept phases for v1 design
docs(methodology): clarify scoring pipeline steps
chore: catalog new DESIGN-NOTES path
```
