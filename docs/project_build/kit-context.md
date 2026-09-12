---
title: "repo-kit — maintainer build context"
description: Session map of this upstream kit’s layout, 2.14.0 ship state, L4 document versions, and a 2026-09-12 review snapshot. Open before kit edits or first adopt from this tree; not a substitute for RULES.
version: "1.2.0"
status: current
audience:
  - maintainers
  - ai-agents
doc_type: other
related:
  - ../../README.md
  - ../../kit/RULES.md
  - ../../kit/SETUP.md
  - ../../kit/UPGRADE.md
  - ../WORKBOARD.md
  - ../../kit/rules/hygiene.md
  - ../../kit/rules/ai-docs-workspace.md
last_updated: "2026-09-12"
---

# repo-kit — maintainer build context

Session map of this upstream kit’s layout, current ship state, and how adopters copy `kit/` into product repos.

**Related:** [README](../../README.md) · [RULES](../../kit/RULES.md) · [SETUP](../../kit/SETUP.md) · [UPGRADE](../../kit/UPGRADE.md) · [WORKBOARD](../WORKBOARD.md) · [hygiene](../../kit/rules/hygiene.md) · [ai-docs-workspace](../../kit/rules/ai-docs-workspace.md)

---

## Summary

This repository **is** the kit (docs-only, Agent Instruct off). Copy `kit/` into a target repo; fill the authority map with real product paths; keep product code outside `kit/`. Canonical law is `kit/RULES.md` plus `kit/rules/*`. This file is session memory only—promote durable policy to L4.

---

## Contents

1. [What this tree is](#what-this-tree-is)
2. [Layout](#layout)
3. [Current ship state](#current-ship-state)
4. [Review snapshot](#review-snapshot)
5. [L4 versions](#l4-versions)
6. [Implementing into a product repo](#implementing-into-a-product-repo)
7. [Working on this kit](#working-on-this-kit)

---

## What this tree is

Canonical source: https://github.com/shainemeister/repo-kit. Domain-agnostic standards for libraries, CLIs, services, data tools, monorepos, or docs-only work. No traditional install; dependency is **`git`**.

Portable payload lives under [`kit/`](../../kit/). Adopters copy (or link) that tree into the **target** repo’s `kit/`. Product code, project `CHANGELOG.md`, programming source under `src/` (when any exists), and live `docs/` stay **outside** `kit/` ([hygiene](../../kit/rules/hygiene.md) · [files.md](../../kit/rules/files.md)).

This tree **dogfoods** the kit: landing [README](../../README.md), thin L0 [`AGENTS.md`](../../AGENTS.md), root [`docs/`](../README.md). [`kit/SETUP.md`](../../kit/SETUP.md) **stays** here so adopters can copy it; they delete or archive it after first adopt.

This tree itself has **no** `src/` (docs-only; empty inventory). Do not create an empty `src/` for ceremony.

---

## Layout

```text
repo-kit/
  README.md          Landing (Overview + Operator prompts; no YAML)
  AGENTS.md          L0 pointer — not a second RULES tree
  LICENSE  .gitignore
  docs/              Maintainer working memory (outside kit/)
  kit/               Portable payload
    RULES.md         Hub: authority map, Must index, kit baseline
    rules/           Domain modules (flat — not nested)
    MARKDOWN-STANDARD.md
    SETUP.md         First adopt (ephemeral in product repos)
    UPGRADE.md       Durable upgrades + 1.x→2.x
    CHANGELOG.md     Kit version under ## repo-kit
    templates/  examples/  configs/  agents/
```

| Layer | Path | Role |
|-------|------|------|
| L0 | Root `AGENTS.md` | Thin discovery ([HABITAT](../../kit/agents/HABITAT.md)) |
| L1 | Root `PLAN.md` | **Absent** here — required only if Agent Instruct is on |
| L2 | `kit/agents/` | Instruct how-to; **skip** in this tree |
| L3 | `kit/agents/generated/` | Empty (no packs) |
| L4 | `kit/RULES.md` + `kit/rules/*` | Canonical law — **wins** on conflict |
| Working memory | `docs/` | Board, plans, this file ([ai-docs-workspace](../../kit/rules/ai-docs-workspace.md)) |

**Instruct is off:** no Agent models, no generated packs. Skip OPS / O3. Use the hub only ([AGENTS.md](../../AGENTS.md)).

---

## Current ship state

| Field | Value |
|-------|--------|
| Kit version | **2.14.0** (2026-09-10) — latest dated `### [X.Y.Z]` under `## repo-kit` in [kit/CHANGELOG.md](../../kit/CHANGELOG.md) |
| HEAD | `0285cde` `docs(project_build): refresh kit-context ship-state for 2.14.0` — **ahead of `origin/main` by 2** (unpushed at last refresh) |
| Unpushed | `7e27feb` 2.14.0 `src/` home · `0285cde` this file’s prior refresh |
| Inventory | Empty (docs-only). No pylint, rustfmt, clang-format, Bandit, cargo-audit, or cppcheck. No `src/` |
| Workboard | [docs/WORKBOARD.md](../WORKBOARD.md) — primary program **`none`**. 2.14.0 shipped as a **single change set** (no annex); board “recently completed” still lists **2.13.0** |
| Declared gates | Author checklist, relative links, last citations ([completion](../../kit/rules/verification-and-ops.md#completion-rule)) |
| `SECURITY.md` | Omit ([modularity](../../kit/rules/security.md#security-documentation-modularity)) |
| Root `CHANGELOG.md` | **None** — this kit’s history is `kit/CHANGELOG.md`. Adopting repos **must** keep a root project CHANGELOG |

**2.14.0 in one line:** programming-source home is repo-root `src/` (segment noun, module noun, verb as function). Law: [files.md](../../kit/rules/files.md) **1.1.0**; architecture cites that row; hygiene helpers under `src/build/`; `scripts/` is not a competing home. Historical `crates/` / `build-aux/` / `scripts/` are **not** a complete-fail ([UPGRADE](../../kit/UPGRADE.md) **1.9.0**). Docs-only still needs no `src/`.

Recent shipped programs (read L4, not annexes): src/ home **2.14.0**, commit-note staged-change **2.13.0**, description current-content **2.12.0**, workboard packet **2.11.1**, description identity **2.11.0**. Archaeology: [docs/plan/archive/](../plan/archive/).

---

## Review snapshot

Reviewed 2026-09-12 against [RULES](../../kit/RULES.md), domain modules, landing README, workboard, and git (`main` vs `origin/main`). Working tree was clean.

| Finding | Verdict |
|---------|---------|
| Hygiene layout (`kit/` payload, root landing + `AGENTS.md` + `docs/`, no product under `kit/`) | Matches [hygiene](../../kit/rules/hygiene.md) |
| Landing README: Overview then Operator prompts, no YAML | Matches [landing](../../kit/MARKDOWN-STANDARD.md#landing--root-readme-no-frontmatter) |
| Instruct off; no `PLAN.md`; `kit/agents/generated/` empty | Matches [AGENTS.md](../../AGENTS.md) — skip O3 |
| Empty language inventory; no Domain A/B; no `src/` | Correct for this tree; do not invent gates |
| `SETUP.md` still present | Correct — kit source keeps it for adopters |
| No root `CHANGELOG.md` | Correct here; **not** the adopter pattern ([versioning](../../kit/rules/versioning-and-git.md#mandatory-project-changelog)) |
| RULES authority map still has `{{PACKAGE}}` / `{{KIT_VERSION}}` rows | **Template** for adopters. Do not fill this kit’s map with fake product packages. This tree’s filled facts: Kit baseline “this repository” table, [AGENTS.md](../../AGENTS.md), [docs-only example](../../kit/examples/docs-only.md) |
| 2.14.0 L4 co-update | files **1.1.0**, architecture **1.2.0**, hygiene **1.7.0**, UPGRADE **1.9.0**, examples, CHANGELOG — same-change-set looks complete |
| Workboard silent on 2.14.0 | Expected: not multi-phase. Register the board **before** the next multi-phase program |
| `origin/main` at `a4242eb` (2.13.0 complete-line) | Local **2.14.0 is unpushed**. Push is an operator choice, not a gate |

No declared gate failed. No policy defect to promote to L4 from this review.

---

## L4 versions

Document versions (frontmatter), not kit semver. Open the owner, not this table, when editing.

| Owner | Version |
|-------|---------|
| [RULES.md](../../kit/RULES.md) hub | 2.7.5 |
| [MARKDOWN-STANDARD](../../kit/MARKDOWN-STANDARD.md) | 1.6.0 |
| [files](../../kit/rules/files.md) | 1.1.0 |
| [hygiene](../../kit/rules/hygiene.md) | 1.7.0 |
| [architecture](../../kit/rules/architecture.md) | 1.2.0 |
| [contracts](../../kit/rules/contracts.md) | 1.4.2 |
| [authoring-and-style](../../kit/rules/authoring-and-style.md) | 1.2.5 |
| [security](../../kit/rules/security.md) | 1.1.2 |
| [versioning-and-git](../../kit/rules/versioning-and-git.md) | 1.1.0 |
| [verification-and-ops](../../kit/rules/verification-and-ops.md) | 1.7.3 |
| [ai-docs-workspace](../../kit/rules/ai-docs-workspace.md) | 1.1.5 |
| [workboard](../../kit/rules/workboard.md) | 1.2.0 |
| [continuity](../../kit/rules/continuity.md) | 1.0.1 |
| [UPGRADE](../../kit/UPGRADE.md) | 1.9.0 |
| [HABITAT](../../kit/agents/HABITAT.md) | 1.0.3 |
| [OPS](../../kit/agents/OPS.md) | 1.3.3 (unused while Instruct is off) |

---

## Implementing into a product repo

Copy needed pieces from this `kit/` into the target `kit/`. Do not flatten standards onto the product root. Do not put product under `kit/`.

| Situation | Guide |
|-----------|--------|
| New repo or first adopt (no baseline) | [SETUP](../../kit/SETUP.md) — then **delete** SETUP in the **target** |
| Already has a Kit baseline | [UPGRADE](../../kit/UPGRADE.md) — never SETUP after initiation |
| Pasteable prompts | Root [README — Operator prompts](../../README.md#operator-prompts) |

**Minimal viable adopt:** filled `kit/RULES.md` (authority map + baseline) + `kit/MARKDOWN-STANDARD.md` + `kit/rules/` + root landing README (`Overview` then `Operator prompts`) + root project `CHANGELOG.md` + language inventory + verify rows for languages you ship.

Fill, do not fork:

1. **Authority map** — real product paths ([RULES](../../kit/RULES.md#authority-map)). Existing repos: map current trees; do not rewrite them. Patterns: [kit/examples/](../../kit/examples/) (`docs-only`, `cli-tool`, `python-library`, `rust-library`, `c-cpp-library`).
2. **Language surface inventory** — only declared rows get Domain B (style) and Domain A (SAST). Empty ⇒ no language gates ([security](../../kit/rules/security.md#language-surface-inventory)). Unused files under `kit/configs/` stay dormant.
3. **Kit baseline** — adopted version + date; Kit source always https://github.com/shainemeister/repo-kit
4. **Source layout (when product code exists)** — new programming source under repo-root `src/<segment>/<module>` ([files.md](../../kit/rules/files.md)). Do not put `.rs` / `.py` at repo root or helpers under `scripts/` / `crates/` / `build-aux/` as the home. Historical trees are mapped, not a failed complete.
5. **Optional overlays** — L0 `AGENTS.md` if a coding agent is used (do not clobber a filled file); rest of `kit/agents/` + PLAN Agent models + BUILD only if Instruct; `docs/WORKBOARD.md` if multi-phase; continuity overlay at a recorded project path if high-blast-radius code exists.

Product landing Operator prompts is **that** repo’s load path. Do not paste this kit’s adopt/upgrade fences into a product README.

Style starters in [`kit/configs/`](../../kit/configs/): copy onto the product root **only** for inventory languages (`pylintrc`, `rustfmt.toml` + `clippy.toml`, `clang-format` + `clang-tidy`).

---

## Working on this kit

Session load path: [Operator prompts](../../README.md#operator-prompts) — hub first, empty inventory, HABITAT + `AGENTS.md`, skip Instruct, workboard if multi-phase.

| Task | Do |
|------|-----|
| Policy / contract change | Edit the **canonical** owner in the same change set ([contracts](../../kit/rules/contracts.md)); bump that doc’s `version` / `last_updated`; kit CHANGELOG under `## repo-kit` |
| New or edited durable markdown | YAML except the omit list; `description` passes the [identity test](../../kit/MARKDOWN-STANDARD.md#description-identity); cite, don’t reprint ([density](../../kit/MARKDOWN-STANDARD.md#density-force-and-incorporation)) |
| New navigable directory | Directory-index `README.md` (file → function), forward-only ([files](../../kit/rules/files.md)) |
| Multi-phase kit work | Register [WORKBOARD](../WORKBOARD.md) **before** phase edits; annex only if the board cannot hold the OOO ([workboard](../../kit/rules/workboard.md)) |
| Finding becomes kit law | Promote from `docs/` to L4; do not leave the only copy here |

**Must not** in this tree: invent product languages, host folder trees, or Domain A/B gates; paste `kit/rules/*` into `AGENTS.md`; add empty `src/` here; claim complete if the author checklist, links, or last citations fail.

Git: conventional commits that match staged files and name the **staged change** (not the completed objective); when AI assisted, footer `Assisted-by` / `Compliance` / `Instructed-by` ([versioning-and-git](../../kit/rules/versioning-and-git.md#commit-note-identity)).
