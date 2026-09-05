---
title: "repo-kit — maintainer build context"
description: Session map of this upstream kit’s layout, current ship state, and how adopters copy kit/ into product repos. Open before kit edits or first adopt from this tree; not a substitute for RULES.
version: "1.0.0"
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
last_updated: "2026-09-04"
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
4. [Implementing into a product repo](#implementing-into-a-product-repo)
5. [Working on this kit](#working-on-this-kit)

---

## What this tree is

Canonical source: https://github.com/shainemeister/repo-kit. Domain-agnostic standards for libraries, CLIs, services, data tools, monorepos, or docs-only work. No traditional install; dependency is **`git`**.

Portable payload lives under [`kit/`](../../kit/). Adopters copy (or link) that tree into the **target** repo’s `kit/`. Product code, project `CHANGELOG.md`, and live `docs/` stay **outside** `kit/` ([hygiene](../../kit/rules/hygiene.md)).

This tree **dogfoods** the kit: landing [README](../../README.md), thin L0 [`AGENTS.md`](../../AGENTS.md), root [`docs/`](../README.md). [`kit/SETUP.md`](../../kit/SETUP.md) **stays** here so adopters can copy it; they delete or archive it after first adopt.

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
| L3 | `kit/agents/generated/` | Empty (`.gitkeep` only) |
| L4 | `kit/RULES.md` + `kit/rules/*` | Canonical law — **wins** on conflict |
| Working memory | `docs/` | Board, plans, this file ([ai-docs-workspace](../../kit/rules/ai-docs-workspace.md)) |

**Instruct is off:** no Agent models, no generated packs. Skip OPS / O3. Use the hub only ([AGENTS.md](../../AGENTS.md)).

---

## Current ship state

| Field | Value |
|-------|--------|
| Kit version | **2.12.0** (2026-09-04) — latest dated `### [X.Y.Z]` under `## repo-kit` in [kit/CHANGELOG.md](../../kit/CHANGELOG.md) |
| Inventory | Empty (docs-only). No pylint, rustfmt, clang-format, Bandit, cargo-audit, or cppcheck |
| Workboard | [docs/WORKBOARD.md](../WORKBOARD.md) — primary program **`none`** |
| Declared gates | Author checklist, relative links, last citations ([completion](../../kit/rules/verification-and-ops.md#completion-rule)) |
| `SECURITY.md` | Omit ([modularity](../../kit/rules/security.md#security-documentation-modularity)) |
| Root `CHANGELOG.md` | **None** — this kit’s history is `kit/CHANGELOG.md`. Adopting repos **must** keep a root project CHANGELOG |

Recent shipped programs (read L4, not annexes): description current-content **2.12.0**, workboard packet **2.11.1**, description identity **2.11.0**, YAML except omit list **2.10.0**. Archaeology: [docs/plan/archive/](../plan/archive/).

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
4. **Optional overlays** — L0 `AGENTS.md` if a coding agent is used (do not clobber a filled file); rest of `kit/agents/` + PLAN Agent models + BUILD only if Instruct; `docs/WORKBOARD.md` if multi-phase; continuity overlay at a recorded project path if high-blast-radius code exists.

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

**Must not** in this tree: invent product languages, host folder trees, or Domain A/B gates; paste `kit/rules/*` into `AGENTS.md`; claim complete if the author checklist, links, or last citations fail.

Git: conventional commits that match staged files; when AI assisted, footer `Assisted-by` / `Compliance` / `Instructed-by` ([versioning-and-git](../../kit/rules/versioning-and-git.md#ai-assisted-commits-required-disclosure)).
