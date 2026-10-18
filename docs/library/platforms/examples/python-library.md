---
title: "Example: Python library package"
description: Illustrative filled authority map and verification for a Python library. Open when the interest is a Python package.
status: current
audience:
  - developers
  - maintainers
doc_type: other
version: "1.0.3"
related:
  - ../../../../ADOPTER.md
  - ../../../../kit/RULES.md
  - ../../../../kit/MARKDOWN-STANDARD.md
  - ../../../../kit/rules/files.md
  - ../../../../kit/UPGRADE.md
last_updated: "2026-10-17"
---

# Example: Python library package

Illustrative filled authority map and verification for a Python library. Copy the pattern and replace the names and commands.

**Sample interest:** “Library that transforms tabular records and exposes a small public API for callers.”

**Primary platform (example):** multi

**Packaging:** standards under `kit/`; programming source under `src/` (outside `kit/`). See [files.md](../../../../kit/rules/files.md).

---

## Suggested first templates

| Template | Becomes |
|----------|---------|
| [landing.md](../../../../kit/skills/kit-author-docs/template/landing.md) | Root `README.md` (Overview + Operator prompts) |
| [readme.md](../../../../kit/skills/kit-author-docs/template/readme.md) | `src/README.md` (package overview / directory index; frontmatter) |
| [security.md](../../../../kit/skills/kit-apply-security/template/security.md) | `src/SECURITY.md` **only if** trust boundary matters—otherwise **omit** |

Optional: methodology template if formulas or scoring are part of the contract.

---

## Filled authority map (snippet)

| Concern | Canonical source |
|---------|------------------|
| Repo purpose and quick start | Root `README.md` |
| Markdown structure | `kit/MARKDOWN-STANDARD.md` |
| Maintenance policy | `kit/RULES.md` + `kit/rules/` |
| Contract policy | `kit/rules/contracts.md` |
| File placement / creation / naming | `kit/rules/files.md` |
| Project history (**required**) | Root `CHANGELOG.md` |
| Standards kit baseline | `kit/RULES.md` — Kit baseline |
| Package overview | `src/README.md` |
| Public API contract | `src/README.md` (or `API.md` beside `src/`) |
| Security / trust boundary | `src/SECURITY.md` *(omit if modularity allows)* |
| Default config | `src/defaults.yaml` |
| Golden tests / fixtures | `tests/fixtures/` |
| Python style / PEP-8 gate | `.pylintrc` (from [`pylintrc`](../program-language/python/pylintrc); **set `py-version`**) |
| Language surface inventory | Inventory in project RULES / security module (filled below) |
| Security & code-validation certification | `certification/README.md` *(optional)* |
| Agent Instruct (optional) | `kit/skills/README.md`; PLAN **Agent models** if using agents ([plan](../../kit-adopter/skills/kit-author-plan/SKILL.md)); BUILD → `docs/library/kit-adopter/generated/` — see [plan.md](../../kit-adopter/skills/kit-author-plan/template/plan.md) |
| AI docs workspace (when used) | Root `docs/README.md` + modules; policy `kit/rules/files.md` |
| Multi-phase execution (when used) | `WORKBOARD.md` · policy `kit/rules/contracts.md` |
| Host always-on / L0 | Root `AGENTS.md` **if** a coding agent is used ([habitat](../../kit-adopter/skills/kit-discover-host/SKILL.md)); skip otherwise |

### Language surface inventory (snippet)

| Surface | Domain B (validation) | Domain A (security) | Notes |
|---------|----------------------|---------------------|--------|
| **Python** product code | `python -m pylint src` (exit 0, 10.00/10) | `python -m bandit -r src` | Required when this row is present |
| **Python** dependencies | — | `pip-audit` | Only if third-party deps exist |

### Sample kit baseline

| Field | Value |
|-------|--------|
| Adopted kit version | *(use latest `### [X.Y.Z]` under `## repo-kit` in kit/CHANGELOG.md)* |
| Adopted on | `2026-07-28` |
| Kit source | https://github.com/shainemeister/repo-kit |

### Sample project CHANGELOG entry (first adoption)

```markdown
## my-library

### [0.1.0] - 2026-07-28

#### Added

- Adopted repo-kit 2.0.1 from https://github.com/shainemeister/repo-kit (standards under kit/)
```

---

## Verification before ship (snippet)

| Change type | Minimum verification |
|-------------|----------------------|
| Public behavior / exports | `python -m pytest tests/` (or project test command) |
| Python product code style | `python -m pylint src` — **required** when Python is in inventory |
| Security / SAST (Python only) | `python -m bandit -r src` — **required** when declared; `pip-audit` when deps row exists |
| Formal certification | If `certification/` maintained: regenerate `last_certification.*`; do not stage outputs |
| Schema or sample data | Headers/fields match schema; consumers still load samples |
| Docs only | Author checklist (including [author checklist](../../../../kit/MARKDOWN-STANDARD.md#author-checklist)); relative links resolve; last citations remain; consume example in README still runs |
| New navigable directory | Directory-index `README.md` (file → function) for **new** dirs ([files.md](../../../../kit/rules/files.md)); **forward-only** — not a gate for historical folders |

**Adopt pylint:** copy [`pylintrc`](../program-language/python/pylintrc) to package or repo root as `.pylintrc`; set `py-version`; keep pylint **developer-only**. Declared gates must pass before task completion ([Completion rule](../../../../kit/RULES.md#completion)). Upgrades: [UPGRADE.md](../../../../kit/UPGRADE.md).

---

## Sample commit subjects

```text
feat(my_library): add transform() public API for record batches
docs(my_library): document transform() and example consume path
chore(my_library): bump package version to 1.1.0
```
