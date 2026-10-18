---
title: "Example: C / C++ library"
description: Illustrative filled authority map and verification for a C or C++ library. Open when the interest is a C or C++ package.
status: current
audience:
  - developers
  - maintainers
doc_type: other
version: "1.0.3"
related:
  - ../../../../ADOPTER.md
  - ../../../../kit/RULES.md
  - ../../../../kit/MARKDOWN-STANDARD.md
  - ../../../../kit/rules/files.md
  - ../../../../kit/UPGRADE.md
last_updated: "2026-10-17"
---

# Example: C / C++ library

Illustrative filled authority map and verification for a C or C++ library. Copy the pattern, replace the names and commands, and use [docs-only.md](../../kit-adopter/skills/kit-adopter/template/docs-only.md) on a docs-only adopt.

**Sample interest:** “Library that exposes a small public C API (or C++ header) for callers.”

**Primary platform (example):** multi

**Packaging:** standards under `kit/`; programming source under `src/` (outside `kit/`). See [files.md](../../../../kit/rules/files.md).

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
| File placement / creation / naming | `kit/rules/files.md` |
| Project history (**required**) | Root `CHANGELOG.md` |
| Standards kit baseline | `kit/RULES.md` — Kit baseline |
| Package overview | `src/README.md` |
| Public API contract | `src/README.md` (or `API.md` / public header beside `src/`) |
| Security / trust boundary | `src/SECURITY.md` *(omit if modularity allows)* |
| Default config | `src/defaults.yaml` (or documented compile flags) |
| Golden tests / fixtures | `tests/fixtures/` |
| C / C++ style gate | `.clang-format` + `.clang-tidy` (from [program-language/c/](../program-language/c/); **set `BasedOnStyle`**) |
| Language surface inventory | Inventory in project RULES / security module (filled below) |
| Security & code-validation certification | `certification/README.md` *(optional)* |
| Agent Instruct (optional) | `kit/skills/README.md`; PLAN **Agent models** if using agents ([plan](../../kit-adopter/skills/kit-author-plan/SKILL.md)); BUILD → `docs/library/kit-adopter/generated/` — see [plan.md](../../kit-adopter/skills/kit-author-plan/template/plan.md) |
| AI docs workspace (when used) | Root `docs/README.md` + modules; policy `kit/rules/files.md` |
| Multi-phase execution (when used) | `WORKBOARD.md` · policy `kit/rules/contracts.md` |
| Host always-on / L0 | Root `AGENTS.md` **if** a coding agent is used ([habitat](../../kit-adopter/skills/kit-discover-host/SKILL.md)); skip otherwise |

### Language surface inventory (snippet)

Declare **only** this row when the repo ships C / C++ product sources. Docs-only inventories stay empty and do **not** copy these verify commands.

| Surface | Domain B (validation) | Domain A (security) | Notes |
|---------|----------------------|---------------------|--------|
| **C / C++** | clang-format dry-run + clang-tidy ([style gate](../style-gates.md#c-c-style-gate-clang-format-clang-tidy)) | cppcheck ([SAST catalog](../../../security.md#baseline)) | Required when this row is present. Product build emits `compile_commands.json` |

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
| Docs only | Author checklist (including [author checklist](../../../../kit/MARKDOWN-STANDARD.md#author-checklist)); relative links resolve; last citations remain; consume example in README still runs |
| New navigable directory | Directory-index `README.md` (file → function) for **new** dirs ([files.md](../../../../kit/rules/files.md)); **forward-only** — not a gate for historical folders |

**Adopt clang-format + clang-tidy:** copy [`clang-format`](../program-language/c/clang-format) → `.clang-format` and [`clang-tidy`](../program-language/c/clang-tidy) → `.clang-tidy`; set `BasedOnStyle` if the tree already has a house style; generate `compile_commands.json` from the **product** build (the kit does not ship CMake/Meson/Bazel). Keep clang-format, clang-tidy, and cppcheck **developer-only**. Do not add these rows on a docs-only adopt. Missing compile DB when C / C++ is declared is a failed gate unless a header-only `--` fallback is documented. Declared gates must pass before task completion ([Completion rule](../../../../kit/RULES.md#completion)). Style chapter: [C / C++ style gate](../style-gates.md#c-c-style-gate-clang-format-clang-tidy). Upgrades: [UPGRADE.md](../../../../kit/UPGRADE.md).

---

## Sample commit subjects

```text
feat(my_clib): add transform() public API for record batches
docs(my_clib): document transform() and example consume path
chore(my_clib): bump package version to 1.1.0
```
