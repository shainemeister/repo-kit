# Example: Rust library crate

**Illustrative only** — copy the *pattern* of a filled authority map and verification table. Replace names and commands with your project’s. Use this file when the interest is a **Rust** crate. Docs-only adopters use [docs-only.md](./docs-only.md) and skip these configs.

**Sample interest:** “Library crate that transforms tabular records and exposes a small public API for callers.”

**Primary platform (example):** multi

**Packaging:** standards under `kit/`; crate under `my_crate/` (outside `kit/`). See [hygiene](../rules/hygiene.md).

---

## Suggested first templates

| Template | Becomes |
|----------|---------|
| [TEMPLATE-LANDING-README.md](../templates/TEMPLATE-LANDING-README.md) | Root `README.md` (Overview + Operator prompts) |
| [TEMPLATE-README.md](../templates/TEMPLATE-README.md) | `my_crate/README.md` (package; frontmatter) |
| [TEMPLATE-SECURITY.md](../templates/TEMPLATE-SECURITY.md) | `my_crate/SECURITY.md` **only if** trust boundary matters—otherwise **omit** |

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
| Package overview | `my_crate/README.md` |
| Public API contract | `my_crate/README.md` (or `API.md`) |
| Security / trust boundary | `my_crate/SECURITY.md` *(omit if modularity allows)* |
| Default config | `my_crate/defaults.yaml` (or crate `Config` docs) |
| Golden tests / fixtures | `tests/fixtures/` |
| Rust style gate | `rustfmt.toml` + `clippy.toml` (from `kit/configs/`; **set `edition`**) |
| Language surface inventory | Inventory in project RULES / security module (filled below) |
| Security & code-validation certification | `certification/README.md` *(optional)* |
| Agent Instruct (optional) | `kit/agents/README.md`; PLAN **Agent models** if using agents ([PLAN-HOOK](../agents/PLAN-HOOK.md)); BUILD → `kit/agents/generated/` — see [PLAN snippet](../agents/examples/PLAN-agent-models-snippet.md) |
| AI docs workspace (when used) | Root `docs/README.md` + modules; policy `kit/rules/ai-docs-workspace.md` |
| Multi-phase execution (when used) | `docs/WORKBOARD.md` · policy `kit/rules/workboard.md` |
| Host always-on / L0 | Root `AGENTS.md` **if** a coding agent is used ([HABITAT](../agents/HABITAT.md)); skip otherwise |

### Language surface inventory (snippet)

Declare **only** this row when the repo ships Rust. Docs-only inventories stay empty and do **not** copy these verify commands.

| Surface | Domain B (validation) | Domain A (security) | Notes |
|---------|----------------------|---------------------|--------|
| **Rust** | `cargo fmt --check` + kit clippy command ([style gate](../rules/authoring-and-style.md#rust-style-gate-rustfmt--clippy)) | `cargo audit` | Required when this row is present |

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
| Docs only | Author checklist; consume example in README still runs |

**Adopt rustfmt + clippy:** copy `kit/configs/rustfmt.toml` and `kit/configs/clippy.toml` to the crate or repo root; set rustfmt `edition`; keep rustfmt, clippy, and cargo-audit **developer-only**. Do not add these rows on a docs-only adopt. Declared gates must pass before task completion ([Completion rule](../rules/verification-and-ops.md#completion-rule)). Style chapter: [Rust style gate](../rules/authoring-and-style.md#rust-style-gate-rustfmt--clippy). Upgrades: [UPGRADE.md](../UPGRADE.md).

---

## Sample commit subjects

```text
feat(my_crate): add transform() public API for record batches
docs(my_crate): document transform() and example consume path
chore(my_crate): bump crate version to 1.1.0
```
