# Example: C / C++ library

**Illustrative only** — copy the *pattern* of a filled authority map and verification table. Replace names and commands with your project’s. Use this file when the interest is a **C or C++** library. Docs-only adopters use [docs-only.md](./docs-only.md) and skip these configs.

**Sample interest:** “Library that exposes a small public C API (or C++ header) for callers.”

**Primary platform (example):** multi

**Packaging:** standards under `kit/`; sources under `my_clib/` (outside `kit/`). See [hygiene](../rules/hygiene.md).

---

## Suggested first templates

| Template | Becomes |
|----------|---------|
| [TEMPLATE-LANDING-README.md](../templates/TEMPLATE-LANDING-README.md) | Root `README.md` (Overview + Operator prompts) |
| [TEMPLATE-README.md](../templates/TEMPLATE-README.md) | `my_clib/README.md` (package; frontmatter) |
| [TEMPLATE-SECURITY.md](../templates/TEMPLATE-SECURITY.md) | `my_clib/SECURITY.md` **only if** trust boundary matters—otherwise **omit** |

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
| Package overview | `my_clib/README.md` |
| Public API contract | `my_clib/README.md` (or `API.md` / public header) |
| Security / trust boundary | `my_clib/SECURITY.md` *(omit if modularity allows)* |
| Default config | `my_clib/defaults.yaml` (or documented compile flags) |
| Golden tests / fixtures | `tests/fixtures/` |
| C / C++ style gate | `.clang-format` + `.clang-tidy` (from `kit/configs/`; **set `BasedOnStyle`**) |
| Language surface inventory | Inventory in project RULES / security module (filled below) |
| Security & code-validation certification | `certification/README.md` *(optional)* |
| Agent Instruct (optional) | `kit/agents/README.md`; PLAN **Agent models** if using agents ([PLAN-HOOK](../agents/PLAN-HOOK.md)); BUILD → `kit/agents/generated/` — see [PLAN snippet](../agents/examples/PLAN-agent-models-snippet.md) |
| AI docs workspace (when used) | Root `docs/README.md` + modules; policy `kit/rules/ai-docs-workspace.md` |
| Multi-phase execution (when used) | `docs/WORKBOARD.md` · policy `kit/rules/workboard.md` |
| Host always-on / L0 | Root `AGENTS.md` **if** a coding agent is used ([HABITAT](../agents/HABITAT.md)); skip otherwise |

### Language surface inventory (snippet)

Declare **only** this row when the repo ships C / C++ product sources. Docs-only inventories stay empty and do **not** copy these verify commands.

| Surface | Domain B (validation) | Domain A (security) | Notes |
|---------|----------------------|---------------------|--------|
| **C / C++** | clang-format dry-run + clang-tidy ([style gate](../rules/authoring-and-style.md#c--c-style-gate-clang-format--clang-tidy)) | cppcheck ([SAST catalog](../rules/security.md#security--sast-gates-required-when-declared)) | Required when this row is present. Product build emits `compile_commands.json` |

### Sample kit baseline

| Field | Value |
|-------|--------|
| Adopted kit version | *(use latest `### [X.Y.Z]` under `## repo-kit` in kit/CHANGELOG.md)* |
| Adopted on | `2026-08-14` |
| Kit source | https://github.com/shainemeister/repo-kit |

### Sample project CHANGELOG entry (first adoption)

```markdown
## my-clib

### [0.1.0] - 2026-08-14

#### Added

- Adopted repo-kit 2.5.0 from https://github.com/shainemeister/repo-kit (standards under kit/)
```

---

## Verification before ship (snippet)

| Change type | Minimum verification |
|-------------|----------------------|
| Public behavior / exports | Project test/build command (e.g. `ctest` or `meson test`) |
| C / C++ product code style | clang-format dry-run + clang-tidy — **required** when C / C++ is in inventory |
| Security / SAST (C / C++ only) | `cppcheck …` — **required** when declared |
| Formal certification | If `certification/` maintained: regenerate `last_certification.*`; do not stage outputs |
| Schema or sample data | Headers/fields match schema; consumers still load samples |
| Docs only | Author checklist (including [density](../MARKDOWN-STANDARD.md#density-force-and-incorporation)); relative links resolve; last citations remain; consume example in README still runs |
| New navigable directory | Directory-index `README.md` (file → function) for **new** dirs ([files.md](../rules/files.md)); **forward-only** — not a gate for historical folders |

**Adopt clang-format + clang-tidy:** copy `kit/configs/clang-format` → `.clang-format` and `kit/configs/clang-tidy` → `.clang-tidy`; set `BasedOnStyle` if the tree already has a house style; generate `compile_commands.json` from the **product** build (the kit does not ship CMake/Meson/Bazel). Keep clang-format, clang-tidy, and cppcheck **developer-only**. Do not add these rows on a docs-only adopt. Missing compile DB when C / C++ is declared is a failed gate unless a header-only `--` fallback is documented. Declared gates must pass before task completion ([Completion rule](../rules/verification-and-ops.md#completion-rule)). Style chapter: [C / C++ style gate](../rules/authoring-and-style.md#c--c-style-gate-clang-format--clang-tidy). Upgrades: [UPGRADE.md](../UPGRADE.md).

---

## Sample commit subjects

```text
feat(my_clib): add transform() public API for record batches
docs(my_clib): document transform() and example consume path
chore(my_clib): bump package version to 1.1.0
```
