---
title: Active workboard
description: Open multi-phase work. One program is active at a time.
version: "1.3.0"
status: current
audience:
  - ai-agents
  - maintainers
doc_type: other
related:
  - ../../../../kit/RULES.md
  - ../../../../kit/CHANGELOG.md
  - ../../../README.md
last_updated: "2026-10-18"
---

# Workboard

Open multi-phase work. One program is active at a time.

**Updated:** 2026-10-18  
**Primary program:** skill-shape  
**Rules:** [kit/RULES.md](../../../../kit/RULES.md)

| Status | Meaning |
|--------|---------|
| `open` | Not started |
| `active` | Current phase (prefer exactly one) |
| `blocked` | Waiting on a decision |
| `done` | Finished |
| `cancelled` | Dropped |
| `deferred` | Parked |

Primary program `—` means no program is registered.

An authorized commit updates this file before that commit is created, and files it only for a named program with no phase `open`, `active`, or `blocked` ([contracts](../../../../kit/rules/contracts.md#boundaries)).

## Active program

| Field | Value |
|-------|--------|
| **Goal** | Shorten AgentPack bodies per skill. Keep frontmatter, the expertise map, and the procedure. Drop `## Must` only after its unique bullets are steps. Thin `## Must not` in a later pass. |
| **Base** | `12b173d` |
| **L4 docs to update** | [kit-define-pack](../../../library/kit-adopter/skills/kit-define-pack/SKILL.md), [kit-emit-packs](../../../library/kit-adopter/skills/kit-emit-packs/SKILL.md), the eleven seeds under [kit/skills](../../../../kit/skills/README.md), [kit-adopter](../../../library/kit-adopter/skills/kit-adopter/SKILL.md), [kit-author-plan](../../../library/kit-adopter/skills/kit-author-plan/SKILL.md) |
| **Optional annex** | — |
| **Smoke / gates** | Author checklist on every edited markdown file. A seed that loses `## Must` is invalid until phase 1 lands. Do not rewrite a deferred file into a seed. |

### Decisions

| Rule | Owner |
|------|--------|
| `## Must` drops only after every bullet that is not already a procedure step has moved into the procedure, and only after validation no longer requires the heading. | [kit-define-pack](../../../library/kit-adopter/skills/kit-define-pack/SKILL.md) |
| `## Must not` stays for this pass. A later pass keeps real boundaries and `{{TUNING_MUST_NOT_EXTRA}}`. Emit fills that token. | [kit-emit-packs](../../../library/kit-adopter/skills/kit-emit-packs/SKILL.md) |
| A paragraph under the H1 that only repeats `description` goes. An owner sentence stays. | The seed being edited |
| Lookup tables the principle assigns to a skill stay. Shelf manuals stay Summary and Contents. | [kit-map-layers](../../../library/kit-adopter/skills/kit-map-layers/SKILL.md) |
| Project agents, the skill specimen, and the retired crew are not in the kit-seed pass. | [agent-skills](../../../library/agent-skills/README.md) |
| A uniform delete of both headings is not a phase. It drops the tuning site and the last local copy of several boundaries. | This board |

### Phases

| ID | Work | File | Status | Notes |
|----|------|------|--------|-------|
| 1 | Let a seed omit `## Must` | [kit-define-pack](../../../library/kit-adopter/skills/kit-define-pack/SKILL.md) | `done` | Edit kit-define-pack in place. Validation item 2 requires body Must and Must not. Change that row, the field table, and the injection sentence so a procedure plus an expertise map is valid, and so tuning may sit under Must not or a Tuning heading. Do not collapse Summary, Contents, or the citation schema. |
| 2 | Point emit at the surviving tuning heading | [kit-emit-packs](../../../library/kit-adopter/skills/kit-emit-packs/SKILL.md) | `done` | Edit kit-emit-packs in place. Step 5d, body rule 2, the `must_not_extra` row, and the empty-token omit rule name `## Must not`. A generated pack must not keep a raw token or a Must heading the schema stopped requiring. Do not collapse the algorithm or the seed table. |
| 3 | Thin `workboard-register` | [workboard-register](../../../../kit/skills/kit-workboard-register/SKILL.md) | `done` | Description echo goes. Owner sentence stays. Must is already the procedure. Later Must not keeps the product-work ban, the status-meanings ban, and the tuning token. The live phase table stays on the board. |
| 4 | Thin `workboard-advance` | [workboard-advance](../../../../kit/skills/kit-workboard-advance/SKILL.md) | `done` | Must adds nothing. Procedure step 3 may set another phase "to the status the work has reached," which can mark `done`. Must not is the only line that names `kit-workboard-close`. Keep that handoff, the product-work ban, the status-meanings ban, and the token. |
| 5 | Thin `workboard-close` | [workboard-close](../../../../kit/skills/kit-workboard-close/SKILL.md) | `done` | Move "leave this program as the primary" into the procedure before Must drops. Keep changelog and contracts as cites. Later Must not keeps the product-work ban, the status-meanings ban, and the token. Filing stays owned by contracts. |
| 6 | Thin `workboard-archive` | [workboard-archive](../../../../kit/skills/kit-workboard-archive/SKILL.md) | `done` | Fold "leave the snapshot row" into the procedure before Must drops. Later Must not keeps the ban on writing this pack's name back into the blank, the status-meanings ban, and the token. MEMORY and AGENTS stay a verify gate. Do not restate the filing order. |
| 7 | Thin `name-path` | [name-path](../../../../kit/skills/kit-name-path/SKILL.md) | `done` | Must is already the procedure. Do not move Evidence, One role, or the source-home ban out of path-pattern. Later Must not may shrink to a pointer plus the token. Procedure steps for a public promise and a skipped check stay. |
| 8 | Thin `index-directory` | [index-directory](../../../../kit/skills/kit-index-directory/SKILL.md) | `done` | Fold the cell-shape cite and the same-change-set cite into the procedure. "Do not name or create the sibling files" is the only copy. Keep it in Must not. Do not delete directory-index's ban on a README beside SKILL.md. |
| 9 | Thin `kit-commit` | [kit-commit](../../../../kit/skills/kit-commit/SKILL.md) | `done` | Keep Types, Body, Identity, Trailer placement, and Example. Move the subject cite and the path-pattern check into the procedure before Must drops. Later Must not keeps the kit-history paste ban, the ban on restating version surfaces in the message, and the token. |
| 10 | Thin `implementer` | [implementer](../../../../kit/skills/kit-apply-change/SKILL.md) | `done` | Move the owner cites, the `{{VERIFY_COMMANDS}}` fill rule, and the second-concern stop into the procedure. Do not shrink Must not in that pass. The copy-into-this-pack ban has no other copy. Align the map with `references`. |
| 11 | Thin `docs-author` | [docs-author](../../../../kit/skills/kit-author-docs/SKILL.md) | `done` | Move both handoffs and "cite the owner" into the procedure. Later Must not keeps "docs/ is not the only home of a public contract" and the token. The placeholder ban already sits in verify. |
| 12 | Thin `reviewer` | [reviewer](../../../../kit/skills/kit-review-change/SKILL.md) | `done` | Move "do not open another skill" into procedure step 1. Later Must not keeps do-not-rewrite, do-not-carry kit-commit's tables, do-not-expand, and the token. Dropping the table ban lets this pack paste the commit lookups. |
| 13 | Thin `security` | [security](../../../../kit/skills/kit-apply-security/SKILL.md) | `done` | Move "fill `{{SAST_COMMANDS}}` and do not invent one" into the procedure. The dependencies refusal is not in the negative trigger. Keep it in Must not with the external-citation ban and the token. The baseline table stays in docs/security.md. |
| 14 | Thin `kit-adopter` | [kit-adopter](../../../library/kit-adopter/skills/kit-adopter/SKILL.md) | `done` | Fold the path-pattern bullet and "do not open kit-author-plan or kit-emit-packs in this session" into the procedure. Later Must not keeps "do not delete Agent models" and the token. |
| 15 | Thin the seed head of `kit-author-plan` | [kit-author-plan](../../../library/kit-adopter/skills/kit-author-plan/SKILL.md) | `done` | Mixed file. Nothing in Must is the only copy. Thin the seed headings and leave every section after Open for law. Those sections are the Agent models contract. A strip-to-seed pass deletes absent, unset, empty, and the trust boundary. Emit lists this path as the plan-author seed. |
| 16 | Leave `kit-map-layers` | [kit-map-layers](../../../library/kit-adopter/skills/kit-map-layers/SKILL.md) | `cancelled` | Shelf manual. Layers, enums, activation, and size budgets are the only copy. No rewrite. |
| 17 | Leave `kit-use-instruct` | [kit-use-instruct](../../../library/kit-adopter/skills/kit-use-instruct/SKILL.md) | `cancelled` | Shelf manual. Detect, the eight-step order, co-maintain routing, and the report shape are the only copy. No rewrite. |
| 18 | Leave `kit-discover-host` | [kit-discover-host](../../../library/kit-adopter/skills/kit-discover-host/SKILL.md) | `cancelled` | Shelf manual. Evidence, alias steps, the host catalog, and mirrors-versus-law are the only copy. Adopt still points here. No rewrite. |
| 19 | Leave the skill specimen | [kit-skill-template](../../../library/kit-skill-template/SKILL.md) | `done` | Fence omits Must. Cite the owner is procedure step 1. Must not keeps the restate ban and the tuning token. Emit does not read the fence. |
| 20 | Leave project agents until a product BUILD | [orchestrator](../../../library/agent-skills/agent-orchestrator/SKILL.md), [execute](../../../library/agent-skills/execute/SKILL.md), [check-code](../../../library/agent-skills/check-code/SKILL.md), [check-ui](../../../library/agent-skills/check-ui/SKILL.md) | `cancelled` | Product packs. Must stays valid. A later program may thin them. Do not merge their citation rules. |
| 21 | Leave the retired crew | [dispatch-crew](../../../library/archive/dispatch-crew/SKILL.md) | `cancelled` | Deprecated. Stop and the history stay. Do not add AgentPack frontmatter. |

### Progress log (newest first, max ~15 lines)

- 2026-10-18 — Filed `skill-shape`. No phase was open, active, or blocked.
- 2026-10-18 — Phase 19 done. Phases 16–18, 20, and 21 are cancelled. No phase is open, active, or blocked. This board stays live until the follow-up commit files it.
- 2026-10-18 — Phases 1–15 are done. Seeds omit `## Must` and keep `## Must not`. Phases 16–21 stay deferred. This board stays live until the follow-up commit files it.
- 2026-10-18 — Added a File column. Each phase links the file it edits. Notes no longer repeat that path.
- 2026-10-18 — Registered `skill-shape` on `12b173d`. Phases 1–15 are the edit queue. Phases 16–21 stay deferred. No skill body was rewritten. None are active.

## Deferred

| ID | Note |
|----|------|
| — | — |

## Not on this board

| Concern | Where |
|---------|--------|
| Session order | `AGENTS.md` |
| Agent notepad | `MEMORY.md` |
| Kit law | `kit/RULES.md` |
| Filing order for this board | [contracts](../../../../kit/rules/contracts.md#boundaries). No phase is open, active, or blocked. This copy is the filed snapshot. |

Check a phase off by setting its status. A registered program replaces the `—` rows.
