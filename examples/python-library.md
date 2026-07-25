# Example: Python library package

**Illustrative only** — copy the *pattern* of a filled authority map and verification table. Replace names and commands with your project’s.

**Sample interest:** “Library that transforms tabular records and exposes a small public API for callers.”

**Primary platform (example):** multi

---

## Suggested first templates

| Template | Becomes |
|----------|---------|
| [TEMPLATE-README.md](../templates/TEMPLATE-README.md) | `my_library/README.md` |
| [TEMPLATE-SECURITY.md](../templates/TEMPLATE-SECURITY.md) | `my_library/SECURITY.md` (if trust boundary matters) |

Optional: methodology template if formulas or scoring are part of the contract.

---

## Filled authority map (snippet)

| Concern | Canonical source |
|---------|------------------|
| Repo purpose and quick start | `README.md` (project root) |
| Markdown structure | `MARKDOWN-STANDARD.md` |
| Maintenance policy | `RULES.md` |
| Package overview | `my_library/README.md` |
| Public API contract | `my_library/README.md` (or `API.md`) |
| Security / trust boundary | `my_library/SECURITY.md` |
| Default config | `my_library/defaults.yaml` |
| Golden tests / fixtures | `tests/fixtures/` |
| Python style / PEP-8 gate | `.pylintrc` (from kit `configs/pylintrc`) |

---

## Verification before ship (snippet)

| Change type | Minimum verification |
|-------------|----------------------|
| Public behavior / exports | `python -m pytest tests/` (or project test command) |
| Python product code style | `python -m pylint my_library` (exit 0, score 10.00/10) |
| Schema or sample data | Headers/fields match schema; consumers still load samples |
| Docs only | Author checklist; consume example in README still runs |

**Adopt pylint:** copy kit `configs/pylintrc` to repo or package root as `.pylintrc`; set `py-version`; keep pylint **developer-only** (not a product runtime dependency).

---

## Sample commit subjects

```text
feat(my_library): add transform() public API for record batches
docs(my_library): document transform() and example consume path
chore(my_library): bump package version to 1.1.0
```
