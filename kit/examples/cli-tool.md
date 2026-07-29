# Example: CLI / automation tool

**Illustrative only** — copy the *pattern* of a filled authority map and verification table. Replace names and commands with your project’s.

**Sample interest:** “CLI that validates config files and reports contract failures with stable exit codes.”

**Primary platform (example):** multi (Windows + Linux/macOS)

**Packaging:** standards under `kit/`; product under `my-cli/` (outside `kit/`). See [hygiene](../rules/hygiene.md).

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
| Repo purpose and quick start | Root `README.md` |
| Markdown structure | `kit/MARKDOWN-STANDARD.md` |
| Maintenance policy | `kit/RULES.md` + `kit/rules/` |
| Contract policy | `kit/rules/contracts.md` |
| Project history (**required**) | Root `CHANGELOG.md` |
| Standards kit baseline | `kit/RULES.md` — Kit baseline |
| Package overview | `my-cli/README.md` |
| CLI or automation contract | `my-cli/CLI-GUIDE.md` |
| Security / trust boundary | `my-cli/SECURITY.md` *(CLI is an execution surface)* |
| Language surface inventory | Inventory in project RULES / security module (filled below) |
| Security & code-validation certification | `certification/README.md` *(optional)* |
| Default config | `my-cli/config.example.yaml` |
| Golden tests / fixtures | `my-cli/tests/fixtures/` |

Rows that do not apply (schema, methodology, etc.) are omitted.

### Language surface inventory (snippet)

| Surface | Domain B (validation) | Domain A (security) | Notes |
|---------|----------------------|---------------------|--------|
| **Python** product code | `python -m pylint my_cli` (if the CLI is Python) | `python -m bandit -r my_cli` | Swap the whole row for the real stack |
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
| Docs only | Author checklist; relative links from `my-cli/` resolve |
| New/removed source files | Inventory/catalog updated (if maintained) |

**SECURITY.md** is required here because the package is an execution surface. Declared gates must pass before task completion ([Completion rule](../rules/verification-and-ops.md#completion-rule)). Upgrades: [UPGRADE.md](../UPGRADE.md).

---

## Sample commit subjects

```text
feat(my-cli): add validate command and exit-code contract
docs(my-cli): document validate verbs and exit codes
```
