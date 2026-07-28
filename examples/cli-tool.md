# Example: CLI / automation tool

**Illustrative only** — copy the *pattern* of a filled authority map and verification table. Replace names and commands with your project’s.

**Sample interest:** “CLI that validates config files and reports contract failures with stable exit codes.”

**Primary platform (example):** multi (Windows + Linux/macOS)

---

## Suggested first templates

| Template | Becomes |
|----------|---------|
| [TEMPLATE-README.md](../templates/TEMPLATE-README.md) | `my-cli/README.md` |
| [TEMPLATE-CLI.md](../templates/TEMPLATE-CLI.md) | `my-cli/CLI-GUIDE.md` |
| [TEMPLATE-SECURITY.md](../templates/TEMPLATE-SECURITY.md) | `my-cli/SECURITY.md` |

---

## Filled authority map (snippet)

| Concern | Canonical source |
|---------|------------------|
| Repo purpose and quick start | [README.md](../README.md) (project root) |
| Markdown structure | `MARKDOWN-STANDARD.md` |
| Maintenance policy | `RULES.md` |
| Project history (**required**) | `CHANGELOG.md` |
| Standards kit baseline | RULES — Kit baseline |
| Package overview | `my-cli/README.md` |
| CLI or automation contract | `my-cli/CLI-GUIDE.md` |
| Security / trust boundary | `my-cli/SECURITY.md` *(present because a CLI is an execution surface)* |
| Language surface inventory | RULES — Language surface inventory (filled below) |
| Security & code-validation certification | `certification/README.md` *(optional until formal certs are wanted)* |
| Default config | `my-cli/config.example.yaml` |
| Golden tests / fixtures | `my-cli/tests/fixtures/` |

Rows that do not apply (schema, methodology, etc.) are omitted.

### Language surface inventory (snippet)

| Surface | Domain B (validation) | Domain A (security) | Notes |
|---------|----------------------|---------------------|--------|
| **Python** product code | `python -m pylint my_cli` (if the CLI is Python) | `python -m bandit -r my_cli` | Swap the whole row for the real stack (e.g. JS/TS → eslint + npm audit; Go → golangci-lint + govulncheck) |
| **Secrets** (optional) | — | `gitleaks detect` | Encourage when configs or tokens might appear in history |

Declare **only** surfaces this CLI ships. Never paste the full kit language table.

### Sample kit baseline

| Field | Value |
|-------|--------|
| Adopted kit version | `1.1.1` *(example — use latest kit CHANGELOG release under `## repo-kit`)* |
| Adopted on | `2026-07-25` |
| Kit source | https://github.com/shainemeister/repo-kit |

### Sample project CHANGELOG entry (first adoption)

```markdown
## my-cli

### [0.1.0] - 2026-07-25

#### Added

- Adopted repo-kit 1.1.1 from https://github.com/shainemeister/repo-kit
```

---

## Verification before ship (snippet)

| Change type | Minimum verification |
|-------------|----------------------|
| Public CLI behavior | `python -m my_cli validate path/to/sample.yaml` (exit 0 on good; non-zero on bad) |
| Environment / packaging | `python -m my_cli --help` |
| Product style (Domain B) | Gate for the CLI’s language (e.g. pylint for Python)—**required** when in inventory |
| Security / SAST (Domain A) | `python -m bandit -r my_cli` *(example assumes Python CLI—swap for the real stack: npm audit, govulncheck, cargo-audit, PSScriptAnalyzer, etc.; never paste the full multi-language table)* — **required** when declared |
| Formal certification | If `certification/` maintained: regenerate `last_certification.*`; do not stage outputs |
| Docs only | Author checklist; relative links from `my-cli/` resolve |
| New/removed source files | Inventory/catalog updated (if maintained) |

**Windows note:** same module form works; or `py -3 -m my_cli …` if that is the team convention.

**SECURITY.md** is required here because the package is an execution surface. SAST gates match **only** the language of this CLI, not every language in the kit table. Declared gates must pass before task completion ([RULES — Completion rule](../RULES.md#completion-rule)).

---

## Sample commit subjects

```text
feat(my-cli): add validate command and exit-code contract
docs(my-cli): document validate verbs and exit codes
```
