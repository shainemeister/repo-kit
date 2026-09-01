# Example: Docs-only / standards repository

**Illustrative only** — copy the *pattern* of a filled authority map and verification table. Replace names and paths with your project’s.

**Sample interest:** “Design and standards repo that captures methodology and progressive concepts without shipping product code.”

**Primary platform (example):** multi (path examples only; no runtime gate)

**Packaging:** standards under `kit/`; design docs at repo root or under a docs tree **outside** `kit/` if you want clear separation. See [hygiene](../rules/hygiene.md).

---

## Suggested first templates

| Template | Becomes |
|----------|---------|
| [TEMPLATE-LANDING-README.md](../templates/TEMPLATE-LANDING-README.md) | Root `README.md` — Overview + Operator prompts (empty inventory in the load path) |
| [TEMPLATE-GENERIC.md](../templates/TEMPLATE-GENERIC.md) | e.g. `DESIGN-NOTES.md` |
| [TEMPLATE-CONCEPT.md](../templates/TEMPLATE-CONCEPT.md) | e.g. `CONCEPT-v1.md` |
| [TEMPLATE-METHODOLOGY.md](../templates/TEMPLATE-METHODOLOGY.md) | e.g. `METHODOLOGY.md` when formulas exist |

Copy [RULES.md](../RULES.md) and [MARKDOWN-STANDARD.md](../MARKDOWN-STANDARD.md) into project **`kit/`**; remove or skip code-only rows.

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
| Agent Instruct (optional) | `kit/agents/README.md`; PLAN **Agent models** if using agents ([PLAN-HOOK](../agents/PLAN-HOOK.md)); BUILD → `kit/agents/generated/` — see [PLAN snippet](../agents/examples/PLAN-agent-models-snippet.md) |
| AI docs workspace (when used) | Root `docs/` (research/plan/project_build/resources); policy `kit/rules/ai-docs-workspace.md` — complements design docs outside kit |
| Multi-phase execution (when used) | `docs/WORKBOARD.md` · policy `kit/rules/workboard.md` |
| Host always-on / L0 | **Omit** unless a coding agent maintains the repo — then thin `AGENTS.md` ([HABITAT](../agents/HABITAT.md)) |

Omit package CLI, schema, fixtures, Python style, and **Security / trust boundary** rows when they do not apply. This example **omits `SECURITY.md`**—see [Security documentation modularity](../rules/security.md#security-documentation-modularity). Docs-only repos still **must** keep root `CHANGELOG.md` for policy/doc releases.

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
| Docs only | Author checklist (including [density](../MARKDOWN-STANDARD.md#density-force-and-incorporation)); relative links resolve; last citations remain |
| New/removed source files | `FILE-CATALOG.md` updated (if maintained) |
| New navigable directory | Directory-index `README.md` (file → function) for **new** dirs ([files.md](../rules/files.md)); **forward-only** — not a gate for historical folders |
| Methodology interpretation change | Document history row + status honesty |

No product language gates unless code is later added. Upgrades: [UPGRADE.md](../UPGRADE.md).

---

## Sample commit subjects

```text
docs: add concept phases for v1 design
docs(methodology): clarify scoring pipeline steps
chore: catalog new DESIGN-NOTES path
```
