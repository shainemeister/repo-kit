---
title: Host Habitat (L0)
description: Detect and create thin always-on discovery files in each coding-agent host’s natural path; portable law stays under kit/.
version: "1.0.1"
status: current
audience:
  - developers
  - maintainers
doc_type: other
related:
  - README.md
  - OPS.md
  - FRAMEWORK.md
  - ../RULES.md
  - ../SETUP.md
  - ../templates/TEMPLATE-AGENTS.md
  - ../rules/hygiene.md
last_updated: "2026-08-21"
---

# Host Habitat (L0)

How AI and humans **establish thin discovery files where a coding-agent host already looks**, without moving law out of `kit/` or inventing host folder trees. `kit/agents/` is **L2** (how to match, build, and run). It is not the file most hosts auto-load.

**Document version:** 1.0.1  

**Related:** [README.md](./README.md) · [OPS.md](./OPS.md) · [FRAMEWORK.md](./FRAMEWORK.md) · [RULES.md](../RULES.md) · [SETUP.md](../SETUP.md) · [TEMPLATE-AGENTS](../templates/TEMPLATE-AGENTS.md) · [hygiene](../rules/hygiene.md)

---

## Summary

| Must |
|------|
| Prefer one portable L0 body: root **`AGENTS.md`**; create habitat files **only with evidence** (host in use, existing file, or user asked) |
| Keep L0 a **pointer** (prefer ≪ 100 lines); do not paste `kit/rules/*`, inventory tables, or pack bodies into habitat files |
| Record L0 + aliases in the [authority map](../RULES.md#authority-map) same change set; confirm alias syntax against **that host’s current docs** |
| Treat filled `AGENTS.md` as **project data** on upgrade ([UPGRADE](../UPGRADE.md)); do not overwrite with the empty template |
| Do **not** invent host trees (`.claude/agents`, skill matrices, spawn APIs) or dual-own CHANGELOG, SAST, or completion in `AGENTS.md` |

No coding agent and the user did not ask: **skip this module**. Docs-only repos that *are* agent-maintained still get a thin `AGENTS.md`. Habitat vs skip follows the same evidence dual path as style configs. Instruct vs bare: [PLAN dual path](./PLAN-HOOK.md#plan-dual-path).

**Enforcement:** Policy + operator / SETUP procedure. **Not** a Domain A/B gate.

---

## Contents

1. [Three habitats](#three-habitats)
2. [When this module applies](#when-this-module-applies)
3. [Detection](#detection)
4. [Create and alias](#create-and-alias)
5. [What L0 may say](#what-l0-may-say)
6. [Informative host catalog](#informative-host-catalog)
7. [Adopter order of operations](#adopter-order-of-operations)
8. [Host introduced later](#host-introduced-later)
9. [Mirrors vs law](#mirrors-vs-law)
10. [Document history](#document-history)

---

## Three habitats

```text
L0   Habitat (native)     AGENTS.md  [+ thin host alias if required]
         │ pointer only
L2–L4  Law (kit/)         RULES, rules/*, agents/OPS CATALOG FRAMEWORK
         │
docs/  Working memory     WORKBOARD, research, plan, project_build
```

Do **not** add a fourth home for agent essays. Durable procedure belongs in PLAN or `kit/agents/`. `docs/` is working memory ([ai-docs-workspace](../rules/ai-docs-workspace.md)).

---

## When this module applies

| Situation | Action |
|-----------|--------|
| No coding agent; user did not ask | **Stop.** Do not create habitat files. |
| Some agent will maintain the repo | If root `AGENTS.md` is **missing**, copy [TEMPLATE-AGENTS](../templates/TEMPLATE-AGENTS.md) and fill placeholders. If it already exists, do **not** replace the body; add a one-line pointer to `kit/RULES.md` only if that pointer is absent |
| Host already has a native file (`CLAUDE.md`, `.github/copilot-instructions.md`, …) | Do **not** clobber. Add a thin alias **only if** that host will not see `AGENTS.md` |
| Instruct in use (PLAN Agent models / generated packs) | L0 points at [OPS](./OPS.md); parent/child protocol when work is isolated |
| Bare adopt (no Instruct) | L0 still points at `kit/RULES.md`; skip OPS / packs ([PLAN dual path](./PLAN-HOOK.md#plan-dual-path)) |

---

## Detection

**Evidence** (any one is enough):

- An existing habitat file in the repo
- The user named a host
- Project config that implies a host (for example `.cursor/`, `.aider.conf.yml`)

**No evidence ⇒ do not create that host’s tree.**  
If the only need is “an agent should find the kit,” create **only** root `AGENTS.md`.

Do not treat “the kit *could* support N hosts” as evidence for N trees.

---

## Create and alias

1. If root `AGENTS.md` is missing, copy [TEMPLATE-AGENTS.md](../templates/TEMPLATE-AGENTS.md) and replace placeholders.  
2. List existing habitat files. Leave them in place.  
3. **Alias:** only when a **detected** host will not load `AGENTS.md` unless pointed. Add the **minimum** native file that points at `AGENTS.md` and `kit/RULES.md`. Copy include or symlink syntax from **that host’s current documentation**. If unsure, skip the alias. See [TEMPLATE-HOST-ALIAS](../templates/TEMPLATE-HOST-ALIAS.md).  
4. Authority-map row for L0 + aliases, same change set.  
5. Do **not** generate empty skills, agents, hooks, or instruction matrices “for completeness.”

---

## What L0 may say

| Include | Exclude |
|---------|---------|
| Open `kit/RULES.md` (map, inventory, operator checklist) | Full domain modules |
| Inventory is the gate switch; empty ⇒ no language gates | Pasted SAST / verify tables |
| One canonical owner; same change set | A second CHANGELOG or completion rule |
| `docs/WORKBOARD.md` **if** that file exists | Live phase tables |
| Instruct: follow [OPS](./OPS.md) **only if** PLAN Agent models or generated packs exist | Pack bodies; spawn-tool names |
| Do not invent tools, folders, or gates | Host skill schemas |

**Size:** prefer far under FRAMEWORK’s L0 budget (~100–150 lines). A good habitat file is a few dozen lines.

---

## Informative host catalog

**Not kit law.** Paths and product names change. Confirm against **that host’s current docs** before writing an alias. Snapshot: 2026-08-14.

| Host / family | Domain | Typical auto-read | Do not invent |
|---------------|--------|-------------------|---------------|
| **AGENTS.md** ([agents.md](https://agents.md/)) | Cross-tool L0 | Root `AGENTS.md`; nested OK, nearest wins | — |
| OpenAI Codex | CLI | `AGENTS.md` | Host config outside the repo |
| Cursor | IDE | `AGENTS.md`; `.cursor/rules/*.mdc`; legacy `.cursorrules` | A full `.cursor/` product tree |
| Claude Code | CLI / IDE | `CLAUDE.md` or `.claude/CLAUDE.md` (ancestors). May include `AGENTS.md` | `.claude/agents`, skills, hooks unless already used |
| GitHub Copilot | IDE + coding agent | `.github/copilot-instructions.md`; path-scoped `.github/instructions/` | Extra Copilot matrices |
| Gemini CLI | CLI | `GEMINI.md`; may point context at `AGENTS.md` | A full `.gemini/` tree |
| Grok Build | CLI / TUI | `AGENTS.md`; may also read `CLAUDE.md` / `.claude/` | Project `.grok/skills` unless requested |
| Windsurf / Cascade / Devin desktop | IDE | `AGENTS.md`; `.windsurfrules` or `.windsurf/rules/` | `.windsurf/` / `.devin/` extras |
| Cline | IDE extension | `.clinerules` | — |
| Aider | CLI | `AGENTS.md` or `CONVENTIONS.md` if configured | — |
| Zed, Warp, Amp, Jules, Factory, Goose, … | Mixed | Primarily `AGENTS.md` | Host extras |

Preferred portable file: **`AGENTS.md`**. Host-native files are **aliases**, not a second essay.

---

## Adopter order of operations

1. Evidence of a coding agent? If no and the user did not ask → **stop**.  
2. Open `kit/RULES.md` and the language inventory (always).  
3. Follow [Create and alias](#create-and-alias) (template if missing; do not replace a filled body; alias only if required; map L0).  
4. If Instruct: PLAN Agent models + [BUILD](./BUILD.md); [OPS](./OPS.md) O3; [parent/child](./OPS.md#parent--child-when-work-is-isolated) when isolating work.  
5. Do not paste `kit/rules/*` into L0. Do not invent unused host trees.

---

## Host introduced later

Same change set: map row + thin `AGENTS.md` or alias. Do not wait for “docs later.” Analogous to adding a language to the inventory.

---

## Mirrors vs law

| Artifact | Track | Role |
|----------|-------|------|
| `kit/agents/*` Instruct docs + templates | Yes | L2 law / how-to |
| `kit/agents/generated/` packs | Yes (thin packs recommended) | L3 views |
| Root `AGENTS.md` + recorded aliases | Yes (project data) | L0 discovery |
| Regenerable **mirrors** of packs in a host skill/rules dir | Prefer **gitignore**; emit only if PLAN/runtime opt-in | Adapter, not law |

Kit correctness does **not** depend on any host skill directory ([RUNTIME](./RUNTIME.md)).

---

## Document history

| Version | Notes |
|---------|--------|
| 1.0.1 | Density restyle (kit 2.8.0); unique L0 pointer, evidence, and host catalog unchanged |
| 1.0.0 | Initial habitat module (kit 2.6.0) |
