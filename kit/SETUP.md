---
title: Setup — One-time adoption guide
description: Owns first kit adopt, including copy/fill of durable markdown YAML except the omit list. Open when starting or aligning a repository with no Kit baseline; delete or archive after initiation.
status: current
audience:
  - developers
  - maintainers
doc_type: other
related:
  - RULES.md
  - UPGRADE.md
  - MARKDOWN-STANDARD.md
  - CHANGELOG.md
  - ../README.md
  - rules/files.md
  - rules/hygiene.md
last_updated: "2026-09-01"
---

# Setup — One-time adoption guide

> **One-time adoption guide — follow, then delete or archive.**

Use this file when starting or aligning a repository so **formal markdown guides development**, not only documents finished work. After you have filled the authority map, verification table, kit baseline, and first contracts, **delete or archive this file** so it does not accumulate as stale root noise.

This kit ships `SETUP.md` under [`kit/`](./). **Copy standards into the target repository’s `kit/`** (same packaging as this repo). Keep **product code** and **project** `CHANGELOG.md` **outside** `kit/`. Adopting projects remove SETUP after initiation.

**Permanent after initiation:** root `README.md`, root **project** `CHANGELOG.md`, **`kit/RULES.md`** (hub + kit baseline), `kit/MARKDOWN-STANDARD.md` (or link), and `kit/rules/` as needed. **When a coding agent is used:** keep [HABITAT.md](./agents/HABITAT.md) and a filled root `AGENTS.md` (plus recorded aliases). **When using Agent Instruct:** keep `kit/agents/` (include [OPS.md](./agents/OPS.md)), root `PLAN.md` Agent models, and track thin `generated/` packs. **AI workspace:** root **`docs/`** when research/plan/build context is used ([ai-docs-workspace](./rules/ai-docs-workspace.md); templates [templates/docs/](./templates/docs/)). **Multi-phase execution:** optional `docs/WORKBOARD.md` ([workboard](./rules/workboard.md)). **Later kit upgrades:** durable [UPGRADE.md](./UPGRADE.md).

**Already have a Kit baseline?** Stop and use [UPGRADE.md](./UPGRADE.md).

---

## Summary

1. Choose an [adoption mode](#adoption-modes) (greenfield, existing repo, or reference).  
2. [State the interest](#1-state-the-interest) and [platform context](#2-set-platform-context).  
3. [Copy](#3-copy-kit-pieces) pieces **from upstream `kit/` into the target repo’s `kit/`** (include [HABITAT.md](./agents/HABITAT.md) when a coding agent is used; include the rest of `kit/agents/` when using Agent Instruct).  
4. Ensure **project root** has README, `CHANGELOG.md`, LICENSE, `.gitignore`.  
   - **With Agent Instruct:** root **`PLAN.md` is required** — include an **Agent models** section ([agents/PLAN-HOOK.md](./agents/PLAN-HOOK.md)).  
   - **Bare adopt (no agents):** `PLAN.md` remains optional; skip BUILD.  
5. [Fill the authority map](#4-fill-the-authority-map) (product paths **outside** `kit/`), [language inventory](./rules/security.md#language-surface-inventory), and verification table.  
6. [Record kit baseline](#4b-record-kit-baseline) in `kit/RULES.md`.  
7. [Optional workboard](#4c-optional-workboard) if the interest is already multi-phase.  
8. [Pick templates](#5-pick-templates-by-interest), scaffold package docs **outside** `kit/`, and [verify](#8-first-verification-commands).  
9. **If using Agent Instruct:** ensure Agent models section, then run **[BUILD](./agents/BUILD.md)** → `kit/agents/generated/` ([Agent Instruct path](#agent-instruct-path)). Ongoing tasks use **[OPS](./agents/OPS.md)** O3.  
10. [Delete or archive this file](#after-setup); point maintainers at [UPGRADE.md](./UPGRADE.md). **Keep** `kit/agents/` and PLAN Agent models. **Keep** `docs/WORKBOARD.md` if you scaffolded it.

Layout doctrine: [rules/hygiene.md](./rules/hygiene.md). Agent Instruct: [agents/README.md](./agents/README.md) · [agents/OPS.md](./agents/OPS.md).

---

## Adoption modes

| Mode | Audience | What to do |
|------|----------|------------|
| **Full copy** | Greenfield (new repo) | Create target `kit/`; copy MARKDOWN-STANDARD, RULES hub, `rules/*`, templates/configs as needed. Root: product README + project CHANGELOG. Use this checklist end-to-end. |
| **Selective copy / align** | **Existing repo, first kit adopt** | Add `kit/` with needed standards; **do not rewrite** product layout; fill authority map with **real existing paths**; follow [Existing repository (first adopt)](#existing-repository-first-adopt). |
| **Reference / submodule** | Either | Link or submodule upstream kit; keep filled **`kit/RULES.md`** (or documented hub path) in the consumer; product stays outside. |

---

## Existing repository (first adopt)

For a **live codebase** that has never recorded a Kit baseline:

1. **Inventory current state** — languages, packages, existing README/docs, CI, secrets posture.  
2. **Do not force a directory rewrite** of product code; map **real** paths into the authority map. Directory index applies **from the adopt date forward** ([files.md](./rules/files.md)) — do not backfill historical folders. Do **not** rewrite product trees to inject YAML. New durable markdown gets a fence except the [omit list](./MARKDOWN-STANDARD.md#when-to-use-this-standard); existing files when already editing. Fill `description` per the [identity test](./MARKDOWN-STANDARD.md#description-identity) on new files and when already editing; historical tautological blurbs are not a failed complete.  
3. **Add `kit/`** — do **not** place RULES / MARKDOWN-STANDARD / rules modules on the product root as the default.  
4. **Minimal viable adopt:** `kit/RULES.md` hub + kit baseline + root project `CHANGELOG.md` + `kit/MARKDOWN-STANDARD.md` (or link) + language inventory + verification rows for languages you already ship. **Reshape** the existing root `README.md` to **Overview** + **Operator prompts** (load path for *this* repo — do not paste upstream kit adopt fences).  
5. **Add contracts only where surfaces exist** (package CLI guide if a CLI exists; skip empty SECURITY per [modularity](./rules/security.md#security-documentation-modularity)).  
6. **Adopt contract policy** — keep [rules/contracts.md](./rules/contracts.md) under `kit/rules/`.  
7. **Optional L0 habitat** — if a coding agent maintains the repo: copy [HABITAT.md](./agents/HABITAT.md); create root `AGENTS.md` if missing; do not clobber a filled file ([HABITAT](./agents/HABITAT.md)).  
8. **Optional Agent Instruct** — if using Instruct: PLAN Agent models + first [BUILD](./agents/BUILD.md); see [Agent Instruct path](#agent-instruct-path). Do not copy the rest of `kit/agents/` for L0 alone.  
9. **Optional workboard** — if the repo already has (or is about to start) multi-phase work: [4c](#4c-optional-workboard). Map any existing planning folder; do not invent a second board.  
10. **Record Kit baseline** from upstream [CHANGELOG.md](./CHANGELOG.md) under `## repo-kit`.  
11. **Project root CHANGELOG** adoption entry under the current version.  
12. **Delete or archive this SETUP** from the project’s `kit/`; keep HABITAT + filled `AGENTS.md` if a coding agent is used; keep `kit/agents/` and PLAN Agent models if Instruct is used; keep `docs/WORKBOARD.md` if scaffolded; future kit bumps use **[UPGRADE.md](./UPGRADE.md)**.

---

## 1. State the interest

One sentence: product type (library / CLI / service / data tool / docs-only / monorepo) and primary user outcome.

**Example:** “CLI that validates config files and exits non-zero on contract failures.”

---

## 2. Set platform context

Primary OS for examples and verify commands: **Windows**, **Linux**, **macOS**, or **multi**.

Follow [Platform-aware examples](./MARKDOWN-STANDARD.md#platform-aware-examples): declare primary platform when examples are OS-specific; use dual shell fences when the team is multi-OS.

---

## 3. Copy kit pieces

**Sources:** this upstream `kit/` directory.  
**Standards target:** **`your-repo/kit/`** (same tree shape).  
**Root target:** product landing + **project** history only.

| Piece | Target | Always? | Notes |
|-------|--------|---------|--------|
| [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) | `kit/` | Yes (or link) | Authoring rules; copy/fill durable markdown YAML except the [omit list](./MARKDOWN-STANDARD.md#when-to-use-this-standard) |
| [RULES.md](./RULES.md) | `kit/` | Yes | Fill authority map and kit baseline |
| [rules/](./rules/) | `kit/rules/` | Recommended | Domain modules; or fold into single `kit/RULES.md` (document in authority map) |
| [rules/files.md](./rules/files.md) | `kit/rules/` | Recommended (with rules/) | Create/place/name; directory index forward-only |
| Project `CHANGELOG.md` | **repo root** | **Yes** | Project history (H2 → H3 → H4); **not** a copy of kit release history |
| Root `README.md` | **repo root** | Yes | Product landing — **no frontmatter**; **Overview** + **Operator prompts** ([landing](./MARKDOWN-STANDARD.md#landing--root-readme-no-frontmatter); [TEMPLATE-LANDING-README](./templates/TEMPLATE-LANDING-README.md)) |
| [templates/](./templates/) | `kit/templates/` or package paths | As needed | Scaffold into **packages** outside `kit/` |
| [templates/docs/](./templates/docs/) | Project root **`docs/`** | When AI workspace needed | Copy skeletons to root `docs/` (not under kit as live notes) |
| [rules/ai-docs-workspace.md](./rules/ai-docs-workspace.md) | `kit/rules/` | Recommended | AI docs workspace policy |
| [rules/workboard.md](./rules/workboard.md) | `kit/rules/` | Recommended | Multi-phase board / annex / archive |
| [rules/continuity.md](./rules/continuity.md) | `kit/rules/` | Optional | Portable surgical-edit policy (empty surface table) |
| [TEMPLATE-CONTINUITY.md](./templates/TEMPLATE-CONTINUITY.md) | Project overlay (e.g. `docs/project_build/continuity.md`) | If high-blast-radius code | Filled overlay — **not** this kit module; preserve on upgrade |
| [templates/docs/WORKBOARD.md](./templates/docs/WORKBOARD.md) | Project root **`docs/WORKBOARD.md`** | If multi-phase | Live board — project data; do not leave placeholders |
| [agents/HABITAT.md](./agents/HABITAT.md) | `kit/agents/HABITAT.md` | **If any coding agent is used** | L0 procedure only — not the rest of Instruct. Keep after SETUP delete |
| [agents/](./agents/) | `kit/agents/` | If Agent Instruct | Remaining Instruct docs, templates; then BUILD → `generated/` |
| [configs/pylintrc](./configs/pylintrc) | `kit/configs/` or `.pylintrc` at package/repo | **If Python** | Developer tooling only; dormant until Python is in the inventory |
| [configs/rustfmt.toml](./configs/rustfmt.toml) · [configs/clippy.toml](./configs/clippy.toml) | `kit/configs/` or crate/repo root | **If Rust** | Developer tooling only; dormant until Rust is in the inventory |
| [configs/clang-format](./configs/clang-format) · [configs/clang-tidy](./configs/clang-tidy) | `kit/configs/` or `.clang-format` / `.clang-tidy` at package/repo | **If C/C++** | Developer tooling only; dormant until C/C++ is in the inventory |
| [TEMPLATE-AGENTS.md](./templates/TEMPLATE-AGENTS.md) | Project root **`AGENTS.md`** | **If any coding agent is used** (or user asked) | Thin L0 pointer — [HABITAT](./agents/HABITAT.md). Never Always. Do not clobber a filled file |
| [TEMPLATE-HOST-ALIAS.md](./templates/TEMPLATE-HOST-ALIAS.md) | Host-native path | **If** a detected host cannot see `AGENTS.md` | 1–3 lines; confirm include syntax in **current** host docs |
| [UPGRADE.md](./UPGRADE.md) | `kit/` | Recommended | Durable upgrade guide—or always open from Kit source |
| This `SETUP.md` | `kit/` | Temporary | Follow, then delete or archive |

**Do not** copy product code into `kit/`. **Do not** flatten standards onto the product root.

---

## 4. Fill the authority map

In [RULES.md — Authority map](./RULES.md#authority-map), replace placeholders with **real or planned** paths—even before code exists—so every concern has a canonical home.

- Standards owners: under `kit/` (e.g. `./rules/contracts.md`; create/place sibling [files.md](./rules/files.md)).  
- Product owners: **outside** `kit/` (e.g. `../packages/my-service/CLI-GUIDE.md` from files inside `kit/`).  
- Project history: root `../CHANGELOG.md`.

**Security documentation is optional** for packages with no execution surface, network access, elevated privilege, or secrets handling—omit `SECURITY.md` and the authority-map security row rather than creating an empty file. See [Security documentation modularity](./rules/security.md#security-documentation-modularity).

Also fill:

1. **[Language surface inventory](./rules/security.md#language-surface-inventory)** — copy **only** rows for languages this project will ship. Docs-only → empty inventory.  
2. **[Verification before ship](./rules/verification-and-ops.md#verification-before-ship)** — commands for each declared surface. Declared gates are **required** before task completion.  
3. **Contract policy** — [rules/contracts.md](./rules/contracts.md).  
4. **File placement / creation / naming** — [rules/files.md](./rules/files.md) (create/place; sibling of contract policy).  
5. **Optional `certification/`** at **repo root** (not under product packages by default)—see [templates/TEMPLATE-CERTIFICATION-README.md](./templates/TEMPLATE-CERTIFICATION-README.md) and [certification policy](./rules/security.md#security-and-code-validation-certification).

**Filled examples (copy the pattern, not the product names):**

| Interest | Example file |
|----------|--------------|
| CLI / automation | [examples/cli-tool.md](./examples/cli-tool.md) |
| Python library | [examples/python-library.md](./examples/python-library.md) |
| Rust library | [examples/rust-library.md](./examples/rust-library.md) |
| C / C++ library | [examples/c-cpp-library.md](./examples/c-cpp-library.md) |
| Docs-only / standards | [examples/docs-only.md](./examples/docs-only.md) |

---

## 4b. Record kit baseline

Before deleting this file, fill [Kit baseline](./RULES.md#kit-baseline) in the project’s **`kit/RULES.md`**:

| Field | What to set |
|-------|-------------|
| **Adopted kit version** | Latest released `### [X.Y.Z]` under `## repo-kit` in the kit [CHANGELOG.md](./CHANGELOG.md) (or latest released version + commit SHA if copying a non-release tip) |
| **Adopted on** | Today’s date (`YYYY-MM-DD`) |
| **Kit source** | Always **https://github.com/shainemeister/repo-kit** |

Also ensure **project root** `CHANGELOG.md` exists with structure `## <Repository Name>` → `### [X.Y.Z] - YYYY-MM-DD` → `####` categories. Record first adoption under the initial project version section (e.g. under `#### Added`: “Adopted repo-kit X.Y.Z from https://github.com/shainemeister/repo-kit”).

Upgrades later: [README — Upgrade repo-kit](../README.md#upgrade-repo-kit) · [UPGRADE.md](./UPGRADE.md).

---

## 4c. Optional workboard

Scaffold **only** when the interest is already multi-phase or the first work will span multiple sessions. Trivial / single-task adopt may skip.

1. Copy [templates/docs/WORKBOARD.md](./templates/docs/WORKBOARD.md) → project `docs/WORKBOARD.md`.  
2. Replace every `{{PLACEHOLDER}}`. Primary program may be `none`.  
3. Enable the `docs/plan/` module (from [templates/docs/plan/](./templates/docs/plan/)) if an annex will be needed.  
4. Add authority-map rows: active multi-phase work → `docs/WORKBOARD.md`; policy → `kit/rules/workboard.md`.  
5. If the repo already has another planning folder (e.g. `docs/planning/`), **map it** — do not invent a second board ([path aliases](./rules/workboard.md#path-aliases)).

Policy: [workboard.md](./rules/workboard.md). The board is **project data**: keep it when you delete this SETUP file.

**Optional continuity overlay:** if the repo has high-blast-radius surfaces, copy [TEMPLATE-CONTINUITY.md](./templates/TEMPLATE-CONTINUITY.md) to a recorded project path (typical: `docs/project_build/continuity.md`). Do **not** fill product paths into portable `kit/rules/continuity.md`.

---

## Agent Instruct path

Optional but recommended for AI-maintained repos. Full index: [agents/README.md](./agents/README.md).

| Step | Action |
|------|--------|
| 1 | Copy/merge `kit/agents/**` with the rest of `kit/` |
| 2 | Ensure root **PLAN.md** exists from project interest |
| 3 | Ensure **`## Agent models`** section exists — insert from [agents/PLAN-HOOK.md](./agents/PLAN-HOOK.md) or [agents/examples/PLAN-agent-models-snippet.md](./agents/examples/PLAN-agent-models-snippet.md) |
| 4 | Fill authority map + language inventory (existing SETUP steps) |
| 5 | Run **BUILD** per [agents/BUILD.md](./agents/BUILD.md) → emit `kit/agents/generated/<id>.md` (expert packs with expertise map) |
| 6 | Prefer **tracking** thin generated packs in git so clones work offline |
| 7 | Point operators at **[OPS.md](./agents/OPS.md)** for task utilization (match primary pack, co-maintain docs/rules, lifecycle) |
| 8 | When deleting this SETUP file: **keep** `kit/agents/` and PLAN Agent models |

**Bare adopt:** omit Agent models and skip BUILD. You can add Agent Instruct later via PLAN-HOOK + BUILD without re-running full SETUP.

Packs are **views** over L4 law (`kit/RULES.md` + `kit/rules/*` + product contracts). On conflict, law wins. When Instruct is in use, [RULES — When Agent Instruct is in use](./RULES.md#when-agent-instruct-is-in-use) and [OPS](./agents/OPS.md) apply.

---

## 5. Pick templates by interest

| Project interest | Start with templates | First contracts to write |
|------------------|----------------------|---------------------------|
| Root landing (every repo) | [TEMPLATE-LANDING-README](./templates/TEMPLATE-LANDING-README.md) | Overview + Operator prompts (no frontmatter) |
| Library / package API | [TEMPLATE-README](./templates/TEMPLATE-README.md) | Package overview + consume example (**in package**, outside `kit/`) |
| CLI / automation | README + CLI | Invocation, exit codes, verbs |
| Service / long-running | README + SECURITY (+ CLI if any) | Trust boundary, run/verify |
| Methodology / scoring / formulas | README + METHODOLOGY | Pipeline, formulas, outputs |
| Security-sensitive tool | README + SECURITY | Trust boundary before features sprawl |
| Design / multi-phase concept | CONCEPT + [workboard](./templates/docs/WORKBOARD.md) | Principles in PLAN/CONCEPT; live phases on `docs/WORKBOARD.md` |
| Docs-only / standards | [TEMPLATE-LANDING-README](./templates/TEMPLATE-LANDING-README.md) + GENERIC for deep notes | Overview + Operator prompts at root |
| Monorepo multi-package | Per-package README (+ CLI/SECURITY as needed) | Shared `kit/RULES`; thin per-package overlays |

Templates live under [templates/](./templates/). Scaffold finished docs into **product paths**, not into `kit/` as permanent package docs. New docs use the **required core** for the type; extra template sections are **omit-if** ([density](./MARKDOWN-STANDARD.md#density-force-and-incorporation)). Co-update rules: [rules/contracts.md](./rules/contracts.md).

---

## 6. Scaffold docs first

Scaffold formal docs **before** or **in the same change set as** first code:

1. Copy the chosen template(s) into the **package** path (outside `kit/`). Keep the required core; delete omit-if sections that do not apply.  
2. Replace every `{{PLACEHOLDER}}`.  
3. Refresh Contents **if present** (only if ≥ 5 H2s or ≳ 150 lines).  
4. Leave frontmatter `status: draft` until the contract matches behavior. Durable markdown not on the [omit list](./MARKDOWN-STANDARD.md#when-to-use-this-standard) gets YAML in the same change set as create. Fill `description` per the [identity test](./MARKDOWN-STANDARD.md#description-identity).  
5. Root README: **required** [landing pattern](./MARKDOWN-STANDARD.md#landing--root-readme-no-frontmatter) — no frontmatter; `## Overview` then `## Operator prompts`. Start from [TEMPLATE-LANDING-README.md](./templates/TEMPLATE-LANDING-README.md) or rewrite the existing root README. Do not copy this kit’s adopt/upgrade fences onto a product landing. Package READMEs still use [TEMPLATE-README.md](./templates/TEMPLATE-README.md).

---

## 7. Use docs as the development guide

| Trigger | Action |
|---------|--------|
| New behavior | Update the **canonical** authority-map file in the same change set ([contracts](./rules/contracts.md)) |
| New public surface | CLI/API or package README section before the feature is “done” |
| Verification exists | Fill real commands in the verification table; run them before ship |

---

## 8. First verification commands

Fill and run the rows in [Verification before ship](./rules/verification-and-ops.md#verification-before-ship). Until project-specific commands exist, use placeholders like:

**Docs only**

```text
# Relative links and structure — author checklist
# See kit/MARKDOWN-STANDARD.md#author-checklist
```

**Python product code** (if applicable — Python in the inventory)

```text
python -m pylint <package_or_paths>
```

On Windows you may use `py -3.x -m pylint …`. Install pylint in the **developer** environment only—not as a product runtime dependency. Details: [Python style gate](./rules/authoring-and-style.md#python-style-gate-pylint).

**Rust product code** (if applicable — Rust in the inventory)

```text
cargo fmt --check
cargo clippy …   # exact flags: Rust style gate Command row
cargo audit
```

Copy `kit/configs/rustfmt.toml` and `kit/configs/clippy.toml`; set rustfmt `edition`. Canonical Domain B command: [Rust style gate](./rules/authoring-and-style.md#rust-style-gate-rustfmt--clippy).

**C / C++ product code** (if applicable — C / C++ in the inventory)

```text
clang-format --dry-run --Werror <sources>
clang-tidy -p compile_commands.json <sources>
cppcheck …      # exact flags: C / C++ style gate Domain A row
```

Copy `kit/configs/clang-format` → `.clang-format` and `kit/configs/clang-tidy` → `.clang-tidy`; set `BasedOnStyle`. Product build must emit `compile_commands.json`. Canonical Domain B command: [C / C++ style gate](./rules/authoring-and-style.md#c--c-style-gate-clang-format--clang-tidy).

**Other languages:** declare a style gate (tool + pass criteria)—see [Other language style gates](./rules/authoring-and-style.md#other-language-style-gates).

Docs-only / empty inventory: skip every language block above. Unused files under `kit/configs/` after a whole-tree copy are dormant catalog, not live gates.

**When a language is introduced later:** add **only that** inventory row, copy the matching `kit/configs/*` to the product path, fill Domain B + Domain A verify commands, and update the authority-map style-config row if listed — same change set. Then those gates apply ([security.md](./rules/security.md#language-surface-inventory)).

**When a coding-agent host is introduced later:** same change set — copy [HABITAT.md](./agents/HABITAT.md) if missing; create root `AGENTS.md` if missing (do not clobber a filled file); add a thin alias **only if** that host will not see `AGENTS.md`; map L0 + aliases. Detect existing habitat files first; do not invent unused host trees.

**Security / SAST gates (required when declared):** declare only tools for **surfaces in the language inventory**. Once declared, they must pass before task completion. See [Security / SAST gates](./rules/security.md#security--sast-gates-required-when-declared) and [Completion rule](./rules/verification-and-ops.md#completion-rule).

**Formal certification (optional):** if you maintain `certification/`, regenerate `last_certification.json` / `.txt` after critical gates; never commit those outputs. Schema: [Certification](./rules/security.md#security-and-code-validation-certification).

---

## 9. Optional next steps

- Maintain a root `FILE-CATALOG.md` (or similar) and update it on path add/remove/rename.  
- If Python: copy `configs/pylintrc` → `.pylintrc` (package or repo root), set `py-version`, point the verification table at the real package path.  
- If Rust: copy `configs/rustfmt.toml` and `configs/clippy.toml`, set rustfmt `edition`, add `cargo fmt` / clippy / `cargo audit` to the verification table.  
- If C / C++: copy `configs/clang-format` → `.clang-format` and `configs/clang-tidy` → `.clang-tidy`, set `BasedOnStyle`, arrange `compile_commands.json`, add format / tidy / cppcheck to the verification table.  
- If a coding agent is used: copy [TEMPLATE-AGENTS.md](./templates/TEMPLATE-AGENTS.md) → root `AGENTS.md`; replace placeholders; detect existing habitat files; alias only if required ([HABITAT](./agents/HABITAT.md)).  
- Add root `certification/` + operator README when product code warrants formal self-attestation certificates.  
- Enable or tune Agent Instruct: PLAN Agent models + [BUILD](./agents/BUILD.md); use [OPS](./agents/OPS.md) each task ([agents/README.md](./agents/README.md)).  
- Scaffold root **`docs/`** from [templates/docs/](./templates/docs/) when multi-step research/plan/build work starts ([ai-docs-workspace](./rules/ai-docs-workspace.md)).  
- If work is multi-phase: scaffold `docs/WORKBOARD.md` ([4c](#4c-optional-workboard)).  
- If the codebase has high-blast-radius surfaces: copy [TEMPLATE-CONTINUITY.md](./templates/TEMPLATE-CONTINUITY.md) to a recorded project path (e.g. `docs/project_build/continuity.md`). Do not fill product paths into `kit/rules/continuity.md`.  
- Read [How overlays work](../README.md#how-overlays-work) so stack-specific rules stay in the project map, not a forked kit.

**Checklists:** [Author checklist](./MARKDOWN-STANDARD.md#author-checklist) · [Contributor checklist](./rules/verification-and-ops.md#contributor-checklist)

---

## After setup

| Keep (permanent) | Remove or archive |
|------------------|-------------------|
| Root README, root **project** CHANGELOG | **This `kit/SETUP.md`** |
| `kit/RULES.md` (baseline filled) | — |
| `kit/MARKDOWN-STANDARD.md` (or link) | — |
| `kit/rules/` modules (or folded policy) | — |
| `kit/UPGRADE.md` path known (local copy optional) | — |
| `kit/agents/HABITAT.md` (if a coding agent is used) | — |
| Root `AGENTS.md` + recorded host aliases (if a coding agent is used) | — |
| `kit/agents/` Instruct + templates (if Instruct adopted) | — |
| `kit/agents/generated/` thin packs (if using Instruct; track recommended) | — |
| Root `PLAN.md` Agent models (if using Instruct) | — |
| Product packages **outside** `kit/` | Unfilled template copies you do not need |
| Root `docs/` AI workspace (when used) | — |
| Root `docs/WORKBOARD.md` (when multi-phase) | — |
| Filled continuity overlay (when used) | — |
| `.pylintrc` / style configs you adopted | — |

Root hygiene / packaging: [rules/hygiene.md](./rules/hygiene.md). Kit upgrades: [UPGRADE.md](./UPGRADE.md) · [README — Upgrade repo-kit](../README.md#upgrade-repo-kit) via https://github.com/shainemeister/repo-kit. Agent Instruct: [agents/README.md](./agents/README.md).
