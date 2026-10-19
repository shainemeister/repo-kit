---
title: Host Habitat (L0)
description: How AI and humans establish thin discovery files where a coding-agent host already looks, without moving law out of kit/ or inventing host folder trees.
version: "1.8.2"
status: current
audience:
  - developers
  - maintainers
doc_type: other
related:
  - ../../../../../kit/skills/README.md
  - ../kit-use-instruct/SKILL.md
  - ../kit-map-layers/SKILL.md
  - ../../../../../kit/RULES.md
  - template/agents.md
  - ../../../../../kit/rules/path-pattern.md
  - template/memory.md
last_updated: "2026-10-19"
---

# Host Habitat (L0)

How AI and humans establish thin discovery files where a coding-agent host already looks, without moving law out of kit/ or inventing host folder trees. `kit/skills/` is L2 (how to match, build, and run). It is not the file most hosts auto-load.

**Related:** [README.md](../../../../../kit/skills/README.md) · [kit-use-instruct](../kit-use-instruct/SKILL.md) · [FRAMEWORK.md](../kit-map-layers/SKILL.md) · [RULES.md](../../../../../kit/RULES.md) · [TEMPLATE-AGENTS](template/agents.md) · [path pattern](../../../../../kit/rules/path-pattern.md) · [memory blank](template/memory.md)

Related lists maintainer peers. Do not load them for this task.

## Handback

You are the sub-agent for this file. Do this procedure. Do not open another pack. Do not deploy a sub-agent. Return done, or a short fix list. Then stop.

---

## Summary

| Must |
|------|
| Prefer one portable L0 body: root **`AGENTS.md`**; create habitat files **only with evidence** (host in use, existing file, or user asked) |
| Keep L0 a **pointer** (prefer far under the [size budget](../kit-map-layers/SKILL.md#size-budgets)); do not paste `kit/rules/*` or pack bodies into habitat files |
| Record L0 + aliases in the [authority map](../../../../../kit/RULES.md#authority-map) same change set; confirm alias syntax against **that host’s current docs** |
| On upgrade, [kit-upgrade](../../../kit-upgrade/skills/kit-upgrade/SKILL.md) owns the session file and the notepad |
| Do **not** invent host trees (`.claude/agents`, skill matrices, spawn APIs) or dual-own CHANGELOG, SAST, or completion in `AGENTS.md` |

No coding agent and the user did not ask: **skip this module**. Docs-only repos that *are* agent-maintained still get a thin `AGENTS.md`. Habitat vs skip follows the same evidence dual path as style configs. Instruct vs bare: [PLAN dual path](../kit-author-plan/SKILL.md#plan-dual-path).

Procedure: [ADOPTER.md](../../../../../ADOPTER.md) when installing. Completion: [kit/RULES.md](../../../../../kit/RULES.md#completion).

---

## Contents

1. [Three habitats](#three-habitats)
2. [When this module applies](#when-this-module-applies)
3. [Detection](#detection)
4. [Create and alias](#create-and-alias)
5. [What L0 may say](#what-l0-may-say)
6. [Informative host catalog](#informative-host-catalog)
7. [Host introduced later](#host-introduced-later)
8. [Mirrors vs law](#mirrors-vs-law)
9. [Document history](#document-history)

---

## Three habitats

Layers are [kit-map-layers](../kit-map-layers/SKILL.md#layers-l0l4). L0 is root `AGENTS.md`. Law stays in `kit/`. `docs/` is working memory ([docs workspace](../../../../README.md)). Root [MEMORY.md](../../../../../MEMORY.md) is the notepad. Do not add a fourth home for agent essays. Durable procedure belongs in PLAN or `kit/skills/`.

---

## When this module applies

| Situation | Action |
|-----------|--------|
| No coding agent; user did not ask | **Stop.** Do not create habitat files. |
| Some agent will maintain the repo | Follow [agents.md](template/agents.md) for the session file. A missing notepad is step 1 under Create and alias |
| Host already has a native file (`CLAUDE.md`, `.github/copilot-instructions.md`, …) | Do **not** clobber. Add a thin alias **only if** that host will not see `AGENTS.md` |
| Instruct in use (PLAN Agent models / generated packs) | L0 points at [kit-use-instruct](../kit-use-instruct/SKILL.md). One session loads one skill |
| Bare adopt (no Instruct) | L0 still points at `kit/RULES.md`; skip OPS / packs ([PLAN dual path](../kit-author-plan/SKILL.md#plan-dual-path)) |

---

## Detection

**Evidence** (any one is enough):

- An existing habitat file in the repo
- The user named a host
- Project config that implies a host (for example `.cursor/`, `.aider.conf.yml`)

**No evidence ⇒ do not create that host’s tree.**  
If the only need is “an agent should find the kit,” create root `AGENTS.md`, and root `MEMORY.md` from [memory.md](template/memory.md) when that file is missing.

Do not treat “the kit *could* support N hosts” as evidence for N trees.

---

## Create and alias

Whether to create `AGENTS.md` remains this file. Law stays in `kit/` ([RULES](../../../../../kit/RULES.md)). Do not add root `./rules/`.

1. Follow [agents.md](template/agents.md) for the session file. If root `MEMORY.md` is missing, copy the fenced body in [memory.md](template/memory.md) and remove the fence. If it exists, leave it.  
2. List existing habitat files. Leave them in place.  
3. **Alias:** only when a **detected** host will not load `AGENTS.md` unless pointed. Add the **minimum** native file that points at `AGENTS.md` and `kit/RULES.md`. Copy include or symlink syntax from **that host’s current documentation**. If unsure, skip the alias. See [TEMPLATE-HOST-ALIAS](template/host-alias.md).  
4. Authority-map row for L0 + aliases, same change set.  
5. Do **not** generate empty skills, agents, hooks, or instruction matrices “for completeness.”

Install is [kit-adopter](../kit-adopter/SKILL.md). Do not run that procedure in this task.

---

## What L0 may say

| Include | Exclude |
|---------|---------|
| Open `kit/RULES.md` | Full domain modules |
| One canonical owner; same change set | A second changelog or completion rule |
| Security baseline when the change needs it | A pasted security procedure |
| `WORKBOARD.md` for a multi-phase checklist | A copy of the live phase table |
| `MEMORY.md` as the agent's notepad | A phase log |
| Instruct: follow [OPS](../kit-use-instruct/SKILL.md) **only if** PLAN Agent models or generated packs exist | Pack bodies; spawn-tool names |
| Do not invent tools, folders, or gates | Host skill schemas |

**Size:** [size budgets](../kit-map-layers/SKILL.md#size-budgets). A good habitat file is a few dozen lines.

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

## Host introduced later

Same change set: map row + thin `AGENTS.md` or alias. Do not wait for a later docs pass.

---

## Mirrors vs law

| Artifact | Track | Role |
|----------|-------|------|
| `kit/skills/` packs and their blanks | Yes | L2 procedure |
| `docs/library/kit-adopter/generated/` packs | Yes (thin packs recommended) | L3 views |
| Root `AGENTS.md` + recorded aliases | Yes (project data) | L0 discovery |
| Root `MEMORY.md` | Yes (project data) | Agent notepad |
| Regenerable **mirrors** of packs in a host skill/rules dir | Prefer **gitignore**; emit only if PLAN/runtime opt-in | Adapter, not law |

Kit correctness does not depend on any host skill directory. The default paths are [kit-map-layers](../kit-map-layers/SKILL.md#default-paths).

---

## Document history

| Version | Notes |
|---------|--------|
| 1.8.2 | The session file follows template/agents.md. Upgrade cites kit-upgrade |
| 1.8.1 | The notepad cites MEMORY.md. Law stays in kit/ |
| 1.8.0 | A missing `MEMORY.md` is copied from `template/memory.md`. A filled notepad stays |
| 1.7.0 | This pack lives under `docs/library/kit-adopter/skills/` |
| 1.6.0 | Layers and size cite `kit-map-layers`. Install stays `kit-adopter` |
| 1.5.0 | Home is `kit/skills/kit-<action>/`. A blank is `template/<noun>.md` |
| 1.4.0 | Kit packs are `skills/kit-<action>/`. Ids stay. `kit-adopter` and `generated/` stay |
| 1.3.1 | The next tasks are `author-plan`, `emit-packs`, and `use-instruct`. Ids stay |
| 1.3.0 | One skill per task. No parent/child protocol |
| 1.2.1 | Pack path is `skills/<action>/SKILL.md`. The alias skeleton stays in this directory |
| 1.2.0 | The host alias skeleton lives in this directory |
| 1.1.0 | Home is `skills/` |
| 1.0.4 | Adopt uses the paste block in `kit/templates/TEMPLATE-AGENTS.md`. Do not replace a filled file |
| 1.0.3 | Cite files.md for habitat path category; L0 pointer and evidence rules unchanged |
| 1.0.2 | Drop in-body document-version echo (kit 2.8.1) |
| 1.0.1 | Density restyle (kit 2.8.0); unique L0 pointer, evidence, and host catalog unchanged |
| 1.0.0 | Initial habitat module (kit 2.6.0) |
