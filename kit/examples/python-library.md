# Example: Python library package

**Illustrative only** — copy the *pattern* of a filled authority map and verification table. Replace names and commands with your project’s.

**Sample interest:** “Library that transforms tabular records and exposes a small public API for callers.”

**Primary platform (example):** multi

**Packaging:** standards under `kit/`; package under `my_library/` (outside `kit/`). See [hygiene](../rules/hygiene.md).

---

## Suggested first templates

| Template | Becomes |
|----------|---------|
| [TEMPLATE-README.md](../templates/TEMPLATE-README.md) | `my_library/README.md` |
| [TEMPLATE-SECURITY.md](../templates/TEMPLATE-SECURITY.md) | `my_library/SECURITY.md` **only if** trust boundary matters—otherwise **omit** |

Optional: methodology template if formulas or scoring are part of the contract.

---

## Filled authority map (snippet)

| Concern | Canonical source |
|---------|------------------|
| Repo purpose and quick start | Root `README.md` |
| Markdown structure | `kit/MARKDOWN-STANDARD.md` |
| Maintenance policy | `kit/RULES.md` + `kit/rules/` |
| Contract policy | `kit/rules/contracts.md` |
| Project history (**required**) | Root `CHANGELOG.md` |
| Standards kit baseline | `kit/RULES.md` — Kit baseline |
| Package overview | `my_library/README.md` |
| Public API contract | `my_library/README.md` (or `API.md`) |
| Security / trust boundary | `my_library/SECURITY.md` *(omit if modularity allows)* |
| Default config | `my_library/defaults.yaml` |
| Golden tests / fixtures | `tests/fixtures/` |
| Python style / PEP-8 gate | `.pylintrc` (from `kit/configs/pylintrc`; **set `py-version`**) |
| Language surface inventory | Inventory in project RULES / security module (filled below) |
| Security & code-validation certification | `certification/README.md` *(optional)* |
| Agent Instruct (optional) | `kit/agents/README.md`; PLAN **Agent models** if using agents ([PLAN-HOOK](../agents/PLAN-HOOK.md)); BUILD → `kit/agents/generated/` — see [PLAN snippet](../agents/examples/PLAN-agent-models-snippet.md) |

### Language surface inventory (snippet)

| Surface | Domain B (validation) | Domain A (security) | Notes |
|---------|----------------------|---------------------|--------|
| **Python** product code | `python -m pylint my_library` (exit 0, 10.00/10) | `python -m bandit -r my_library` | Required when this row is present |
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
| Python product code style | `python -m pylint my_library` — **required** when Python is in inventory |
| Security / SAST (Python only) | `python -m bandit -r my_library` — **required** when declared; `pip-audit` when deps row exists |
| Formal certification | If `certification/` maintained: regenerate `last_certification.*`; do not stage outputs |
| Schema or sample data | Headers/fields match schema; consumers still load samples |
| Docs only | Author checklist; consume example in README still runs |

**Adopt pylint:** copy `kit/configs/pylintrc` to package or repo root as `.pylintrc`; set `py-version`; keep pylint **developer-only**. Declared gates must pass before task completion ([Completion rule](../rules/verification-and-ops.md#completion-rule)). Upgrades: [UPGRADE.md](../UPGRADE.md).

---

## Sample commit subjects

```text
feat(my_library): add transform() public API for record batches
docs(my_library): document transform() and example consume path
chore(my_library): bump package version to 1.1.0
```
