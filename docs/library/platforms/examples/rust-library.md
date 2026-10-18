---
title: "Example: Rust library crate"
description: Illustrative filled authority map and verification for a Rust crate. Open when the interest is a Rust library.
status: current
audience:
  - developers
  - maintainers
doc_type: other
version: "1.0.4"
related:
  - ../../../../ADOPTER.md
  - ../../../../kit/RULES.md
  - ../../../../kit/MARKDOWN-STANDARD.md
  - ../../../../kit/rules/path-pattern.md
  - ../../../../kit/rules/directory-index.md
  - ../../../../kit/UPGRADE.md
last_updated: "2026-10-17"
---

# Example: Rust library crate

Illustrative filled authority map and verification for a Rust crate. Copy the pattern, replace the names and commands, and use [docs-only.md](../../kit-adopter/skills/kit-adopter/template/docs-only.md) on a docs-only adopt.

**Sample interest:** “Library crate that transforms tabular records and exposes a small public API for callers.”

**Primary platform (example):** multi

**Packaging:** standards under `kit/`; programming source under `src/` ([path pattern](../../../../kit/rules/path-pattern.md)).

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
| Path pattern | `kit/rules/path-pattern.md` |
| Directory index | `kit/rules/directory-index.md` |
| Project history (**required**) | Root `CHANGELOG.md` |
| Standards kit baseline | `kit/RULES.md` — Kit baseline |
| Package overview | `src/README.md` |
| Public API contract | `src/README.md` (or `API.md` beside `src/`) |
| Security / trust boundary | `src/SECURITY.md` *(omit if modularity allows)* |
| Default config | `src/defaults.yaml` (or crate `Config` docs) |
| Golden tests / fixtures | `tests/fixtures/` |
| Rust style gate | `rustfmt.toml` + `clippy.toml` (from [program-language/rust/](../program-language/rust/); **set `edition`**) |
| Language surface inventory | Inventory in project RULES / security module (filled below) |
| Security & code-validation certification | `certification/README.md` *(optional)* |
| Agent Instruct (optional) | `kit/skills/README.md`; PLAN **Agent models** if using agents ([plan](../../kit-adopter/skills/kit-author-plan/SKILL.md)); BUILD → `docs/library/kit-adopter/generated/` — see [plan.md](../../kit-adopter/skills/kit-author-plan/template/plan.md) |
| AI docs workspace (when used) | Root `docs/README.md` + modules; policy `kit/rules/contracts.md` |
| Multi-phase execution (when used) | `WORKBOARD.md` · policy `kit/rules/contracts.md` |
| Host always-on / L0 | Root `AGENTS.md` **if** a coding agent is used ([habitat](../../kit-adopter/skills/kit-discover-host/SKILL.md)); skip otherwise |

### Language surface inventory (snippet)

Declare **only** this row when the repo ships Rust. Docs-only inventories stay empty and do **not** copy these verify commands.

| Surface | Domain B (validation) | Domain A (security) | Notes |
|---------|----------------------|---------------------|--------|
| **Rust** | `cargo fmt --check` + kit clippy command ([style gate](../style-gates.md#rust-style-gate-rustfmt-clippy)) | `cargo audit` | Required when this row is present |

### Sample kit baseline

| Field | Value |
|-------|--------|
| Adopted kit version | *(use latest `### [X.Y.Z]` under `## repo-kit` in kit/CHANGELOG.md)* |
| Adopted on | `2026-08-14` |
| Kit source | https://github.com/shainemeister/repo-kit |

### Sample project CHANGELOG entry (first adoption)

```markdown
## my-crate

### [0.1.0] - 2026-08-14

#### Added

- Adopted repo-kit 2.5.0 from https://github.com/shainemeister/repo-kit (standards under kit/)
```

---

## Verification before ship (snippet)

| Change type | Minimum verification |
|-------------|----------------------|
| Public behavior / exports | `cargo test` (or project test command) |
| Rust product code style | `cargo fmt --check` + kit clippy command — **required** when Rust is in inventory |
| Security / SAST (Rust only) | `cargo audit` — **required** when declared |
| Formal certification | If `certification/` maintained: regenerate `last_certification.*`; do not stage outputs |
| Schema or sample data | Headers/fields match schema; consumers still load samples |
| Docs only | Author checklist (including [author checklist](../../../../kit/MARKDOWN-STANDARD.md#author-checklist)); relative links resolve; last citations remain; consume example in README still runs |
| New navigable directory | Directory-index `README.md` (file → function) for **new** dirs ([directory index](../../../../kit/rules/directory-index.md)); **forward-only** — not a gate for historical folders |

**Adopt rustfmt + clippy:** copy [`rustfmt.toml`](../program-language/rust/rustfmt.toml) and [`clippy.toml`](../program-language/rust/clippy.toml) to the crate or repo root; set rustfmt `edition`; keep rustfmt, clippy, and cargo-audit **developer-only**. Do not add these rows on a docs-only adopt. Declared gates must pass before task completion ([Completion rule](../../../../kit/RULES.md#completion)). Style chapter: [Rust style gate](../style-gates.md#rust-style-gate-rustfmt-clippy). Upgrades: [UPGRADE.md](../../../../kit/UPGRADE.md).

---

## Sample commit subjects

```text
feat(my_crate): add transform() public API for record batches
docs(my_crate): document transform() and example consume path
chore(my_crate): bump crate version to 1.1.0
```
