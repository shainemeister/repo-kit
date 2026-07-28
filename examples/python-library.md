# Example: Python library package

**Illustrative only** — copy the *pattern* of a filled authority map and verification table. Replace names and commands with your project’s.

**Sample interest:** “Library that transforms tabular records and exposes a small public API for callers.”

**Primary platform (example):** multi

---

## Suggested first templates

| Template | Becomes |
|----------|---------|
| [TEMPLATE-README.md](../templates/TEMPLATE-README.md) | `my_library/README.md` |
| [TEMPLATE-SECURITY.md](../templates/TEMPLATE-SECURITY.md) | `my_library/SECURITY.md` **only if** trust boundary matters (execution, network, privilege, or secrets)—otherwise **omit** |

Optional: methodology template if formulas or scoring are part of the contract.

---

## Filled authority map (snippet)

| Concern | Canonical source |
|---------|------------------|
| Repo purpose and quick start | `README.md` (project root) |
| Markdown structure | `MARKDOWN-STANDARD.md` |
| Maintenance policy | `RULES.md` |
| Project history (**required**) | `CHANGELOG.md` |
| Standards kit baseline | RULES — Kit baseline |
| Package overview | `my_library/README.md` |
| Public API contract | `my_library/README.md` (or `API.md`) |
| Security / trust boundary | `my_library/SECURITY.md` *(include only if the modularity rule requires it; pure library with no side effects may omit this row)* |
| Default config | `my_library/defaults.yaml` |
| Golden tests / fixtures | `tests/fixtures/` |
| Python style / PEP-8 gate | `.pylintrc` (from kit `configs/pylintrc`; **set `py-version`**) |
| Language surface inventory | RULES — Language surface inventory (filled below) |
| Security & code-validation certification | `certification/README.md` *(optional until formal certs are wanted)* |

### Language surface inventory (snippet)

| Surface | Domain B (validation) | Domain A (security) | Notes |
|---------|----------------------|---------------------|--------|
| **Python** product code | `python -m pylint my_library` (exit 0, 10.00/10) | `python -m bandit -r my_library` | Required when this row is present |
| **Python** dependencies | — | `pip-audit` | Include only if the library has third-party deps to audit; omit for stdlib-only |

Do **not** add PowerShell, JS/TS, Go, Rust, Shell, or Semgrep rows unless those surfaces exist. **Secrets** (Gitleaks) may be added as a separate inventory row if the team scans the repo.

### Sample kit baseline

| Field | Value |
|-------|--------|
| Adopted kit version | `1.1.1` *(example — use latest kit CHANGELOG release under `## repo-kit`)* |
| Adopted on | `2026-07-25` |
| Kit source | https://github.com/shainemeister/repo-kit |

### Sample project CHANGELOG entry (first adoption)

```markdown
## my-library

### [0.1.0] - 2026-07-25

#### Added

- Adopted repo-kit 1.1.1 from https://github.com/shainemeister/repo-kit
```

---

## Verification before ship (snippet)

| Change type | Minimum verification |
|-------------|----------------------|
| Public behavior / exports | `python -m pytest tests/` (or project test command) |
| Python product code style | `python -m pylint my_library` (exit 0, score 10.00/10) — **required** when Python is in inventory |
| Security / SAST (Python only) | `python -m bandit -r my_library` — **required** when Python is in inventory; `pip-audit` when Python deps row is declared |
| Formal certification | If `certification/` maintained: regenerate `last_certification.*`; do not stage outputs |
| Schema or sample data | Headers/fields match schema; consumers still load samples |
| Docs only | Author checklist; consume example in README still runs |

**Adopt pylint:** copy kit `configs/pylintrc` to repo or package root as `.pylintrc`; set `py-version`; keep pylint **developer-only** (not a product runtime dependency).

**Security / SAST:** declare **Python** tools only (Bandit / pip-audit as chosen). Do not add npm audit, govulncheck, cargo-audit, etc. unless those languages exist. Keep all security tools developer-only. Once declared, gates must pass before task completion ([RULES — Completion rule](../RULES.md#completion-rule)).

---

## Sample commit subjects

```text
feat(my_library): add transform() public API for record batches
docs(my_library): document transform() and example consume path
chore(my_library): bump package version to 1.1.0
```
