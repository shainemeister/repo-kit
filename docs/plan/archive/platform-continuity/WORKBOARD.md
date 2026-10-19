---
title: Active workboard
description: Open multi-phase work. One program is active at a time.
version: "1.4.0"
status: current
audience:
  - ai-agents
  - maintainers
doc_type: other
related:
  - ../../../../kit/RULES.md
  - ../../../../kit/CHANGELOG.md
  - ../../../../docs/README.md
last_updated: "2026-10-19"
---

# Workboard

Open multi-phase work. One program is active at a time.

**Updated:** 2026-10-19
**Primary program:** platform-continuity
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
| **Goal** | Make the platform packs follow the author checklist, replace the source checker with pin tables, and retarget the research notes that still name removed files. |
| **Base** | `ca083c8` |
| **L4 docs to update** | [platforms index](../../../../docs/library/platforms/README.md), the family indexes and current policy packs, [platforms changelog](../../../../docs/library/platforms/CHANGELOG.md), [style-gates.md](../../../../docs/library/platforms/style-gates.md), [skill-pack-sequence.md](../../../../docs/research/skill-pack-sequence.md), [kit-skills.md](../../../../docs/research/kit-skills.md), [repo-kit-rework.md](../../../../docs/research/repo-kit-rework.md), [repo-kit-rules-enhancement.md](../../../../docs/research/repo-kit-rules-enhancement.md), [path-pattern.md](../../../../kit/rules/path-pattern.md), [kit/skills/README.md](../../../../kit/skills/README.md), [kit-author-docs](../../../../kit/skills/kit-author-docs/SKILL.md), [kit-apply-change](../../../../kit/skills/kit-apply-change/SKILL.md), [ADOPTER.md](../../../../ADOPTER.md), [kit-emit-packs](../../../../docs/library/kit-adopter/skills/kit-emit-packs/SKILL.md), [authoring blanks](../../../../kit/skills/kit-author-docs/template/generic.md) |
| **Optional annex** | [platform-continuity](README.md) |
| **Smoke / gates** | Author checklist on every edited markdown file. Relative links from each edited file resolve. |

### Decisions

| Rule | Owner |
|------|--------|
| Pin tables live under `docs/library/platforms`, one table per family. `kit/RULES.md` does not cite the library. | Family indexes |
| The checker, each `sources.yaml`, and `pyproject.toml` retire in the same change as those tables. The table records the pin. It does not fetch. | Phase 3 |
| OS packs and language packs are both in the lead pass. Archive copies stay snapshots. | Phase 1 |
| Platform history uses the kit's one-sentence shape. | [kit/CHANGELOG.md](../../../../kit/CHANGELOG.md) |
| Published changelog sections through `[3.0.0]` stay as published. `docs/plan/archive/` stays historical. | [kit/CHANGELOG.md](../../../../kit/CHANGELOG.md) |
| `.git-mgr/` stays with the application work. | Deferred |

### Phases

| ID | Work | File | Status | Notes |
|----|------|------|--------|-------|
| 1 | Align pack leads with descriptions | [platforms](../../../../docs/library/platforms/README.md) | `done` | Every current OS and language pack, and each family index. Archive copies stay. |
| 2 | Name the intentional platform files | [platforms](../../../../docs/library/platforms/README.md) | `done` | Root index names the changelog, license, examples, and certification blank. Python, C, and Rust indexes name their tool configs. |
| 3 | Replace source pins with tables | [platforms](../../../../docs/library/platforms/README.md) | `done` | One table on each family index. The checker, `pyproject.toml`, and each `sources.yaml` are removed. |
| 4 | Give platform history the kit sentence | [CHANGELOG.md](../../../../docs/library/platforms/CHANGELOG.md) | `done` | One sentence per notable version. Keep a Changelog categories are gone. |
| 5 | Close the repair queue that the tree already passed | [skill-pack-sequence.md](../../../../docs/research/skill-pack-sequence.md) | `done` | Sections 11–16 are done. Upgrade packs are named under `kit-upgrade`. |
| 6 | Point the shipped record at the path owners | [repo-kit-rework.md](../../../../docs/research/repo-kit-rework.md) | `done` | The enhancement note points at the same owners. The edge sentence in `path-pattern.md` already resolves. |
| 7 | Make copied skills followable without the shelf | [skills index](../../../../kit/skills/README.md) | `done` | Shelf paths are kit-source reads. `ADOPTER.md` keeps the shelf links. |
| 8 | Point the empty-map failure at adopt | [kit-emit-packs](../../../../docs/library/kit-adopter/skills/kit-emit-packs/SKILL.md) | `done` | The failure row names `ADOPTER.md`. |
| 9 | Quote the related placeholder | [generic.md](../../../../kit/skills/kit-author-docs/template/generic.md) | `done` | Same quote in `concept.md` and `methodology.md`. |

Each registered phase has a draft at `docs/plan/<program>/<id>-<verb>.md` with that phase's working text. The File cell stays the product file.

### Progress log (newest first, max ~15 lines)

- 2026-10-19 — Filed `platform-continuity`. The closed repair queue and the shipped rework record are deprecated.
- 2026-10-19 — Phase 9 done. The related placeholder is quoted in the three authoring blanks. No phase is open, active, or blocked.
- 2026-10-19 — Phase 9 is active. Quote the related placeholder in the three authoring blanks.
- 2026-10-19 — Phase 8 done. An empty authority map follows ADOPTER.md. SETUP.md was not recreated.
- 2026-10-19 — Phase 8 is active. The empty authority-map failure names ADOPTER.md.
- 2026-10-19 — Phase 7 done. Copied skills name the shelf as a kit-source read. ADOPTER.md keeps the shelf links.
- 2026-10-19 — Phase 7 is active. Copied skills name the shelf as a kit-source read and do not require it.
- 2026-10-19 — Phase 6 done. The shipped record cites path-pattern.md and directory-index.md. The edge sentence already resolved.
- 2026-10-19 — Phase 6 is active. Point the shipped record at path-pattern.md and directory-index.md.
- 2026-10-19 — Phase 5 done. The repair queue is closed. Upgrade packs are named on the upgrade shelf.
- 2026-10-19 — Phase 5 is active. Close the repair sections the tree already matches, and point upgrade packs at the upgrade shelf.
- 2026-10-19 — Phase 4 done. The platform changelog is one sentence per version and points at the kit sentence.
- 2026-10-19 — Phase 4 is active. Rewrite the platform changelog as one sentence per notable version.
- 2026-10-19 — Phase 2 done. The platform indexes name the files that were only in prose or missing.
- 2026-10-19 — Phase 2 is active. Name the platform files the indexes skip.


## Deferred

| ID | Note |
|----|------|
| 10 | Promote the skill-match sentence in the agents paste only when asked. |
| — | `.git-mgr/` stays with the application work. |

## Not on this board

| Concern | Where |
|---------|--------|
| Session order | `AGENTS.md` |
| Agent notepad | `MEMORY.md` |
| Kit law | `kit/RULES.md` |

Check a phase off by setting its status. A registered program replaces the `—` rows.
