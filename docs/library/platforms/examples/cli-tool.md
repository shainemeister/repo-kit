---
title: "Example: CLI / automation tool"
description: Illustrative filled authority map and verification for a CLI or automation tool. Open when the interest is a command-line product.
status: current
audience:
  - developers
  - maintainers
doc_type: other
version: "1.0.2"
related:
  - ../../../../ADOPTER.md
  - ../../../../kit/RULES.md
  - ../../../../kit/MARKDOWN-STANDARD.md
  - ../../../../kit/rules/files.md
  - ../../../../kit/UPGRADE.md
last_updated: "2026-10-17"
---

# Example: CLI / automation tool

**Illustrative only** — copy the *pattern* of a filled authority map and verification table. Replace names and commands with your project’s.

**Sample interest:** “CLI that validates config files and reports contract failures with stable exit codes.”

**Primary platform (example):** multi (Windows + Linux/macOS)

**Packaging:** standards under `kit/`; programming source under `src/` (outside `kit/`). See [files.md](../../../../kit/rules/files.md).

---

## Suggested first templates

| Template | Becomes |
|----------|---------|
| [landing.md](../../../../kit/skills/kit-author-docs/template/landing.md) | Root `README.md` (Overview + Operator prompts) |
| [readme.md](../../../../kit/skills/kit-author-docs/template/readme.md) | `src/README.md` (package overview / directory index; frontmatter) |
| [cli.md](../../../../kit/skills/kit-author-docs/template/cli.md) | `src/CLI-GUIDE.md` (contract beside source) |
| [security.md](../../../../kit/skills/kit-apply-security/template/security.md) | `src/SECURITY.md` |

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
| CLI or automation contract | `src/CLI-GUIDE.md` |
| Security / trust boundary | `src/SECURITY.md` *(CLI is an execution surface)* |
| Language surface inventory | Inventory in project RULES / security module (filled below) |
| Security & code-validation certification | `certification/README.md` *(optional)* |
| Default config | `src/config.example.yaml` |
| Golden tests / fixtures | `tests/fixtures/` |
| Agent Instruct (optional) | `kit/skills/README.md`; PLAN **Agent models** if using agents ([plan](../../../../kit/skills/kit-author-plan/SKILL.md)); BUILD → `kit/skills/generated/` — see [plan.md](../../../../kit/skills/kit-author-plan/template/plan.md) |
| AI docs workspace (when used) | Root `docs/README.md` + modules; policy `kit/rules/ai-docs-workspace.md` |
| Multi-phase execution (when used) | `docs/WORKBOARD.md` · policy `kit/rules/workboard.md` |
| Host always-on / L0 | Root `AGENTS.md` **if** a coding agent is used ([habitat](../../../../kit/skills/kit-discover-host/SKILL.md)); skip otherwise |

Rows that do not apply (schema, methodology, etc.) are omitted.

### Language surface inventory (snippet)

| Surface | Domain B (validation) | Domain A (security) | Notes |
|---------|----------------------|---------------------|--------|
| **Python** product code | `python -m pylint src` (if the CLI is Python) | `python -m bandit -r src` | Swap the whole row for the real stack |
| **Secrets** (optional) | — | `gitleaks detect` | When configs or tokens might appear in history |

Declare **only** surfaces this CLI ships. Never paste the full kit language table.

### Sample kit baseline

| Field | Value |
|-------|--------|
| Adopted kit version | *(use latest `### [X.Y.Z]` under `## repo-kit` in kit/CHANGELOG.md)* |
| Adopted on | `2026-07-28` |
| Kit source | https://github.com/shainemeister/repo-kit |

### Sample project CHANGELOG entry (first adoption)

```markdown
## my-cli

### [0.1.0] - 2026-07-28

#### Added

- Adopted repo-kit 2.0.1 from https://github.com/shainemeister/repo-kit (standards under kit/)
```

---

## Verification before ship (snippet)

| Change type | Minimum verification |
|-------------|----------------------|
| Public CLI behavior | `python -m my_cli validate path/to/sample.yaml` (exit 0 on good; non-zero on bad) |
| Environment / packaging | `python -m my_cli --help` |
| Product style (Domain B) | Gate for the CLI’s language—**required** when in inventory |
| Security / SAST (Domain A) | Language-specific SAST for declared surfaces—**required** when declared |
| Formal certification | If `certification/` maintained: regenerate `last_certification.*`; do not stage outputs |
| Docs only | Author checklist (including [density](../MARKDOWN-STANDARD.md#density-force-and-incorporation)); relative links from `src/` resolve; last citations remain |
| New/removed source files | Inventory/catalog updated (if maintained) |
| New navigable directory | Directory-index `README.md` (file → function) for **new** dirs ([files.md](../rules/files.md)); **forward-only** — not a gate for historical folders |

**SECURITY.md** is required here because the package is an execution surface. Declared gates must pass before task completion ([Completion rule](../rules/verification-and-ops.md#completion-rule)). Upgrades: [UPGRADE.md](../../../../kit/UPGRADE.md).

---

## Sample commit subjects

```text
feat(my-cli): add validate command and exit-code contract
docs(my-cli): document validate verbs and exit codes
```
