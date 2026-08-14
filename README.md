# Repository Standards Kit

Portable standards for consistent repositories: markdown structure, maintenance contracts, copy-ready templates, and **inventory-gated** style configs (Python, Rust, C / C++). Copy the `kit/` tree into a target repo. Unused language configs stay **dormant** until that surface is declared.

All kit source lives under [`kit/`](./kit/) except this README, [LICENSE](./LICENSE), [`.gitignore`](./.gitignore), and optional root [`AGENTS.md`](./AGENTS.md).

## Overview

This kit is **domain-agnostic**. Use it for libraries, CLIs, services, data tools, monorepos, or docs-only work.

There is **no traditional install**. Prefer a remote link or sibling clone; copy what you need into the target repo’s **`kit/`**. Product code and project history stay **outside** `kit/`. Dependency: **`git`**.

A project `PLAN.md` (you supply it) makes adoption more precise. **Agent Instruct** is optional: [kit/agents/README.md](./kit/agents/README.md). When Instruct is off, skip PLAN Agent models and BUILD.

Licensed under MIT — [LICENSE](./LICENSE).

| Piece | Role |
|-------|------|
| [kit/SETUP.md](./kit/SETUP.md) | One-time adoption; then delete |
| [kit/UPGRADE.md](./kit/UPGRADE.md) | Durable upgrade + 1.x→2.x migration |
| [kit/RULES.md](./kit/RULES.md) | Hub: authority map, kit baseline, Must / Must not |
| [kit/rules/](./kit/rules/) | Domain modules (hygiene, contracts, security, verification, workboard, …) |
| [docs/](./docs/) | Working memory (`WORKBOARD.md`, research, plan, …) — outside `kit/` |
| [kit/agents/](./kit/agents/) | Instruct (optional) + [HABITAT](./kit/agents/HABITAT.md) when a coding agent is used |
| [kit/MARKDOWN-STANDARD.md](./kit/MARKDOWN-STANDARD.md) | Authoring shape; landing README has no frontmatter |
| [kit/CHANGELOG.md](./kit/CHANGELOG.md) | Kit history under `## repo-kit` |
| [kit/configs/](./kit/configs/) | Style starters — copy **only** if that language is in the inventory |
| [kit/templates/](./kit/templates/) · [kit/examples/](./kit/examples/) | Skeletons and filled map patterns |

| You want to… | Start here |
|--------------|------------|
| Start from an interest | [kit/SETUP.md](./kit/SETUP.md) |
| Align an existing repo | [SETUP — Existing repository](./kit/SETUP.md#existing-repository-first-adopt) |
| Upgrade repo-kit | [Upgrade repo-kit](#upgrade-repo-kit) · [kit/UPGRADE.md](./kit/UPGRADE.md) |
| Agent Instruct | [kit/agents/README.md](./kit/agents/README.md) |
| Coding-agent discovery (L0) | [HABITAT](./kit/agents/HABITAT.md) · [TEMPLATE-AGENTS](./kit/templates/TEMPLATE-AGENTS.md) |
| Multi-phase work | [workboard](./kit/rules/workboard.md) · [SETUP 4c](./kit/SETUP.md#4c-optional-workboard) |
| Style / SAST | [inventory](./kit/rules/security.md#language-surface-inventory) · [authoring-and-style](./kit/rules/authoring-and-style.md) |
| Maintenance policy | [kit/RULES.md](./kit/RULES.md) · [contracts](./kit/rules/contracts.md) |
| Write a root landing README | [Landing](./kit/MARKDOWN-STANDARD.md#landing--root-readme-no-frontmatter) · [TEMPLATE-LANDING-README](./kit/templates/TEMPLATE-LANDING-README.md) |

### Use cases

| Use case | What you get | Start here |
|----------|--------------|------------|
| New greenfield repo | Same doc shape and git hygiene from day one | [SETUP](./kit/SETUP.md) |
| Align an existing repo | Authority map without a product rewrite | [SETUP](./kit/SETUP.md) (selective) |
| Upgrade / migrate from 1.x | Merge kit deltas; standards under `kit/` | [UPGRADE](./kit/UPGRADE.md) |
| Python / Rust / C++ product | Named Domain B + Domain A when **declared** | [authoring-and-style](./kit/rules/authoring-and-style.md) · [examples](./kit/examples/) |
| Docs-only | Empty inventory; author checklist only | [docs-only example](./kit/examples/docs-only.md) |
| Host discovery | Thin `AGENTS.md`; no host trees invented | [HABITAT](./kit/agents/HABITAT.md) |
| Multi-phase execution | One workboard; optional annex | [workboard](./kit/rules/workboard.md) |

### Quick start

Follow **[kit/SETUP.md](./kit/SETUP.md)**: copy needed pieces into the target `kit/`, fill the authority map and inventory, record the kit baseline, delete SETUP. Pasteable checklists are under [Operator prompts](#operator-prompts).

Suggested layout after adopt (product repo):

```text
your-repo/
  README.md  LICENSE  .gitignore  CHANGELOG.md
  PLAN.md                 # required only if using Agent Instruct
  AGENTS.md               # if a coding agent is used — thin L0 pointer
  docs/                   # working memory when needed; optional WORKBOARD.md
  kit/                    # standards (RULES, rules/, UPGRADE, optional agents/)
  packages/               # product — never under kit/
```

Do not put product code under `kit/`; do not flatten standards onto the product root. [hygiene](./kit/rules/hygiene.md).

### Governance

Canonical policy: **[kit/RULES.md](./kit/RULES.md)**. In short: update the **canonical** owner with behavior; keep project `CHANGELOG.md`; run **declared** style/SAST only; keep kit baseline current. Full Must / Must not and operator checklist live in the hub.

### How overlays work

| Layer | Contains |
|-------|----------|
| **Standards** (`kit/`) | Portable law, templates, optional Instruct |
| **Project RULES hub** | Real product paths and verify commands |
| **Agent packs** (optional) | Views over L4 — not a second RULES tree |
| **`docs/`** | Working memory; promote promises to L4 |
| **Package docs** | CLI / API / SECURITY outside `kit/` |

Do not fork the whole standard for every product fact.

### Style gates and SAST

Fill the [language surface inventory](./kit/rules/security.md#language-surface-inventory). Only **declared** surfaces have required Domain B (style) and Domain A (SAST) gates. Commands and starter configs: [authoring-and-style](./kit/rules/authoring-and-style.md) and [kit/configs/](./kit/configs/). Docs-only inventories declare none.

### For maintainers of this kit

Kit version is the latest `### [X.Y.Z]` under `## repo-kit` in [kit/CHANGELOG.md](./kit/CHANGELOG.md). Canonical source: https://github.com/shainemeister/repo-kit. Edit under `kit/`; bump document `version` / `last_updated` when contracts change. Adopters keep **project** history in their own root `CHANGELOG.md`.

---

## Operator prompts

Pasteable adoption and upgrade text, plus which files to open first. **Law stays in [kit/RULES.md](./kit/RULES.md).** Host auto-load stays [AGENTS.md](./AGENTS.md) when that file exists.

**Load order**

1. `kit/RULES.md` — authority map, inventory, operator checklist.  
2. Declared inventory rows only (empty ⇒ no language gates).  
3. If a coding agent is used: `kit/agents/HABITAT.md` and root `AGENTS.md` (do not clobber a filled file).  
4. If Instruct (PLAN Agent models or `kit/agents/generated/` packs): `kit/agents/OPS.md`.  
5. If multi-phase: `docs/WORKBOARD.md`.

Then follow [kit/SETUP.md](./kit/SETUP.md) (first adopt) or [kit/UPGRADE.md](./kit/UPGRADE.md) (existing baseline). `PLAN.md` is a user-supplied dependency; the kit does not ship one.

#### New implementation

```text
Review PLAN.md (project plan) and kit/SETUP.md at https://github.com/shainemeister/repo-kit, then initiate the adoption checklist. Place standards under kit/ in the target repo; keep product code and project CHANGELOG outside kit/. Fill kit/RULES.md authority map with real product paths. If a coding agent is used: copy kit/agents/HABITAT.md and create root AGENTS.md if missing (do not clobber a filled file). Optional Agent Instruct: include the rest of kit/agents/, PLAN Agent models (kit/agents/PLAN-HOOK.md), run kit/agents/BUILD.md.
```

#### Existing repository (first adopt)

```text
This repository has no repo-kit Kit baseline yet. Follow kit/SETUP.md selective adoption / Existing repository (first adopt). Add a kit/ standards tree (do not flatten standards onto root). Map real product paths into the authority map; do not force a product directory rewrite. Record Kit baseline in kit/RULES.md; delete kit/SETUP.md. Later upgrades use kit/UPGRADE.md. If a coding agent is used: copy kit/agents/HABITAT.md and create root AGENTS.md if missing (do not clobber). Optional Agent Instruct: selective rest of kit/agents/ + PLAN Agent models; do not force Instruct on bare adopt.
```

#### Alternative (local clone reference)

```text
git clone https://github.com/shainemeister/repo-kit ../repo-kit-reference
```

```text
Review PLAN.md and kit/SETUP.md from ../repo-kit-reference, then initiate the adoption checklist. Standards live under the target repo's kit/; product data stays outside kit/. If a coding agent is used: kit/agents/HABITAT.md + root AGENTS.md if missing. Optional Agent Instruct: rest of kit/agents/ + PLAN Agent models + BUILD when using Instruct.
```

#### Upgrade repo-kit

```text
Upgrade repo-kit for this repository (Kit baseline already present in kit/RULES.md, or root RULES.md if still on 1.x layout).

1. Read this project's Kit baseline (Adopted kit version, Kit source) in kit/RULES.md (or root RULES.md until migrated).
2. Open the kit at Kit source (canonical: https://github.com/shainemeister/repo-kit) and read kit/UPGRADE.md and kit/CHANGELOG.md under ## repo-kit.
3. If baseline is 1.x or standards still sit at project root, follow UPGRADE — Migrate from kit 1.x to 2.x layout; otherwise follow the routine upgrade procedure.
4. Merge only appropriate kit pieces into this project's kit/; preserve authority-map product paths and verification commands.
5. Reshape root README.md to landing if needed (no frontmatter; ## Overview then ## Operator prompts). Keep this repo's Overview; do not paste upstream kit adopt/upgrade fences. Package READMEs unchanged.
6. If a coding agent is used (or AGENTS.md exists): merge kit/agents/HABITAT.md; do not overwrite a filled root AGENTS.md or host aliases.
7. If Agent Instruct is in use: merge the rest of kit/agents/; preserve PLAN Agent models (active/disabled/overlays/tuning); re-run kit/agents/BUILD.md.
8. Preserve docs/WORKBOARD.md, docs/plan/** (or a recorded alias such as docs/planning/), and any filled continuity overlay. Merge kit/rules/workboard.md; do not overwrite a live board with the empty template.
9. Update Kit baseline (version + date); keep Kit source unchanged unless this repo is a deliberate fork.
10. Add a short note to the project root CHANGELOG.md. Do not copy the full kit CHANGELOG history into the project CHANGELOG.
```
