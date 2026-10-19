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
  - kit/RULES.md
  - kit/CHANGELOG.md
  - docs/README.md
last_updated: "2026-10-18"
---

# Workboard

Open multi-phase work. One program is active at a time.

**Updated:** 2026-10-18  
**Primary program:** skill-shape  
**Rules:** [kit/RULES.md](kit/RULES.md)

| Status | Meaning |
|--------|---------|
| `open` | Not started |
| `active` | Current phase (prefer exactly one) |
| `blocked` | Waiting on a decision |
| `done` | Finished |
| `cancelled` | Dropped |
| `deferred` | Parked |

Primary program `—` means no program is registered.

An authorized commit updates this file before that commit is created, and files it only for a named program with no phase `open`, `active`, or `blocked` ([contracts](kit/rules/contracts.md#boundaries)).

## Active program

| Field | Value |
|-------|--------|
| **Goal** | Shorten AgentPack bodies per skill. Keep frontmatter, the expertise map, and the procedure. Drop `## Must` only after its unique bullets are steps. Thin `## Must not` in a later pass. |
| **Base** | `12b173d` |
| **L4 docs to update** | [kit-define-pack](docs/library/kit-adopter/skills/kit-define-pack/SKILL.md), [kit-emit-packs](docs/library/kit-adopter/skills/kit-emit-packs/SKILL.md), the eleven seeds under [kit/skills](kit/skills/README.md), [kit-adopter](docs/library/kit-adopter/skills/kit-adopter/SKILL.md), [kit-author-plan](docs/library/kit-adopter/skills/kit-author-plan/SKILL.md) |
| **Optional annex** | — |
| **Smoke / gates** | Author checklist on every edited markdown file. A seed that loses `## Must` is invalid until phase 1 lands. Do not rewrite a deferred file into a seed. |

### Decisions

| Rule | Owner |
|------|--------|
| `## Must` drops only after every bullet that is not already a procedure step has moved into the procedure, and only after validation no longer requires the heading. | [kit-define-pack](docs/library/kit-adopter/skills/kit-define-pack/SKILL.md) |
| `## Must not` stays for this pass. A later pass keeps real boundaries and `{{TUNING_MUST_NOT_EXTRA}}`. Emit fills that token. | [kit-emit-packs](docs/library/kit-adopter/skills/kit-emit-packs/SKILL.md) |
| A paragraph under the H1 that only repeats `description` goes. An owner sentence stays. | The seed being edited |
| Lookup tables the principle assigns to a skill stay. Shelf manuals stay Summary and Contents. | [kit-map-layers](docs/library/kit-adopter/skills/kit-map-layers/SKILL.md) |
| Project agents, the skill specimen, and the retired crew are not in the kit-seed pass. | [agent-skills](docs/library/agent-skills/README.md) |
| A uniform delete of both headings is not a phase. It drops the tuning site and the last local copy of several boundaries. | This board |

### Phases

| ID | Work | File | Status | Notes |
|----|------|------|--------|-------|
| 1 | Let a seed omit `## Must` | [kit-define-pack](docs/library/kit-adopter/skills/kit-define-pack/SKILL.md) | `open` | Edit kit-define-pack in place. Validation item 2 requires body Must and Must not. Change that row, the field table, and the injection sentence so a procedure plus an expertise map is valid, and so tuning may sit under Must not or a Tuning heading. Do not collapse Summary, Contents, or the citation schema. |
| 2 | Point emit at the surviving tuning heading | [kit-emit-packs](docs/library/kit-adopter/skills/kit-emit-packs/SKILL.md) | `open` | Edit kit-emit-packs in place. Step 5d, body rule 2, the `must_not_extra` row, and the empty-token omit rule name `## Must not`. A generated pack must not keep a raw token or a Must heading the schema stopped requiring. Do not collapse the algorithm or the seed table. |
| 3 | Thin `workboard-register` | [workboard-register](kit/skills/kit-workboard-register/SKILL.md) | `open` | Description echo goes. Owner sentence stays. Must is already the procedure. Later Must not keeps the product-work ban, the status-meanings ban, and the tuning token. The live phase table stays on the board. |
| 4 | Thin `workboard-advance` | [workboard-advance](kit/skills/kit-workboard-advance/SKILL.md) | `open` | Must adds nothing. Procedure step 3 may set another phase "to the status the work has reached," which can mark `done`. Must not is the only line that names `kit-workboard-close`. Keep that handoff, the product-work ban, the status-meanings ban, and the token. |
| 5 | Thin `workboard-close` | [workboard-close](kit/skills/kit-workboard-close/SKILL.md) | `open` | Move "leave this program as the primary" into the procedure before Must drops. Keep changelog and contracts as cites. Later Must not keeps the product-work ban, the status-meanings ban, and the token. Filing stays owned by contracts. |
| 6 | Thin `workboard-archive` | [workboard-archive](kit/skills/kit-workboard-archive/SKILL.md) | `open` | Fold "leave the snapshot row" into the procedure before Must drops. Later Must not keeps the ban on writing this pack's name back into the blank, the status-meanings ban, and the token. MEMORY and AGENTS stay a verify gate. Do not restate the filing order. |
| 7 | Thin `name-path` | [name-path](kit/skills/kit-name-path/SKILL.md) | `open` | Must is already the procedure. Do not move Evidence, One role, or the source-home ban out of path-pattern. Later Must not may shrink to a pointer plus the token. Procedure steps for a public promise and a skipped check stay. |
| 8 | Thin `index-directory` | [index-directory](kit/skills/kit-index-directory/SKILL.md) | `open` | Fold the cell-shape cite and the same-change-set cite into the procedure. "Do not name or create the sibling files" is the only copy. Keep it in Must not. Do not delete directory-index's ban on a README beside SKILL.md. |
| 9 | Thin `kit-commit` | [kit-commit](kit/skills/kit-commit/SKILL.md) | `open` | Keep Types, Body, Identity, Trailer placement, and Example. Move the subject cite and the path-pattern check into the procedure before Must drops. Later Must not keeps the kit-history paste ban, the ban on restating version surfaces in the message, and the token. |
| 10 | Thin `implementer` | [implementer](kit/skills/kit-apply-change/SKILL.md) | `open` | Move the owner cites, the `{{VERIFY_COMMANDS}}` fill rule, and the second-concern stop into the procedure. Do not shrink Must not in that pass. The copy-into-this-pack ban has no other copy. Align the map with `references`. |
| 11 | Thin `docs-author` | [docs-author](kit/skills/kit-author-docs/SKILL.md) | `open` | Move both handoffs and "cite the owner" into the procedure. Later Must not keeps "docs/ is not the only home of a public contract" and the token. The placeholder ban already sits in verify. |
| 12 | Thin `reviewer` | [reviewer](kit/skills/kit-review-change/SKILL.md) | `open` | Move "do not open another skill" into procedure step 1. Later Must not keeps do-not-rewrite, do-not-carry kit-commit's tables, do-not-expand, and the token. Dropping the table ban lets this pack paste the commit lookups. |
| 13 | Thin `security` | [security](kit/skills/kit-apply-security/SKILL.md) | `open` | Move "fill `{{SAST_COMMANDS}}` and do not invent one" into the procedure. The dependencies refusal is not in the negative trigger. Keep it in Must not with the external-citation ban and the token. The baseline table stays in docs/security.md. |
| 14 | Thin `kit-adopter` | [kit-adopter](docs/library/kit-adopter/skills/kit-adopter/SKILL.md) | `open` | Fold the path-pattern bullet and "do not open kit-author-plan or kit-emit-packs in this session" into the procedure. Later Must not keeps "do not delete Agent models" and the token. |
| 15 | Thin the seed head of `kit-author-plan` | [kit-author-plan](docs/library/kit-adopter/skills/kit-author-plan/SKILL.md) | `open` | Mixed file. Nothing in Must is the only copy. Thin the seed headings and leave every section after Open for law. Those sections are the Agent models contract. A strip-to-seed pass deletes absent, unset, empty, and the trust boundary. Emit lists this path as the plan-author seed. |
| 16 | Leave `kit-map-layers` | [kit-map-layers](docs/library/kit-adopter/skills/kit-map-layers/SKILL.md) | `deferred` | Shelf manual. Layers, enums, activation, and size budgets are the only copy. The size budget already says a generated body is a procedure and an expertise map. No rewrite. |
| 17 | Leave `kit-use-instruct` | [kit-use-instruct](docs/library/kit-adopter/skills/kit-use-instruct/SKILL.md) | `deferred` | Shelf manual. Detect, the eight-step order, co-maintain routing, and the report shape are the only copy. Do not fold Summary into a seed procedure. |
| 18 | Leave `kit-discover-host` | [kit-discover-host](docs/library/kit-adopter/skills/kit-discover-host/SKILL.md) | `deferred` | Shelf manual. Evidence, alias steps, the host catalog, and mirrors-versus-law are the only copy. Adopt still points here. |
| 19 | Leave the skill specimen | [kit-skill-template](docs/library/kit-skill-template/SKILL.md) | `deferred` | kit-skill-template is a draft. Emit does not read the fence. Changing the fence does not change live seeds. Update the fence only after the seeds have the new shape, and keep "cite the owner" in that fence's procedure. |
| 20 | Leave project agents until a product BUILD | [orchestrator](docs/library/agent-skills/agent-orchestrator/SKILL.md), [execute](docs/library/agent-skills/execute/SKILL.md), [check-code](docs/library/agent-skills/check-code/SKILL.md), [check-ui](docs/library/agent-skills/check-ui/SKILL.md) | `deferred` | Orchestrator: move "phases are the order of operations" before any Must drop, and keep the seven Must not boundaries. Execute: move the private-worktree rule. check-code and check-ui: Must already matches Procedure. Keep each pack's "do not implement the finding" ban. Do not merge their citation rules. `{{PROJECT_NAME}}` is in the BUILD comment and unused in the body. |
| 21 | Leave the retired crew | [dispatch-crew](docs/library/archive/dispatch-crew/SKILL.md) | `deferred` | dispatch-crew is deprecated. Stop and the history are the only copy. Do not add AgentPack frontmatter, a procedure, or a tuning token. |

### Progress log (newest first, max ~15 lines)

- 2026-10-18 — Added a File column. Each phase links the file it edits. Notes no longer repeat that path.
- 2026-10-18 — Registered `skill-shape` on `12b173d`. Phases 1–15 are the edit queue. Phases 16–21 stay deferred. No skill body was rewritten. None are active.

## Deferred

| ID | Note |
|----|------|
| 16–21 | Shelf manuals, the specimen, project agents, and the retired crew. Mapped so a later pass does not pull them into the seed shape. |

## Not on this board

| Concern | Where |
|---------|--------|
| Session order | `AGENTS.md` |
| Agent notepad | `MEMORY.md` |
| Kit law | `kit/RULES.md` |
| Filing order for this board | [contracts](kit/rules/contracts.md#boundaries). Phases 1–15 are open, so this file stays the live board. |

Check a phase off by setting its status. A registered program replaces the `—` rows.
