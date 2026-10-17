---
title: Orchestrator crew packs
description: Deprecated. Do not dispatch this crew. One session loads one skill.
version: "1.4.4"
status: deprecated
audience:
  - developers
  - maintainers
doc_type: other
related:
  - ../../../../README.md
  - ../../kit-adopter/skills/kit-use-instruct/SKILL.md
  - ../../kit-adopter/skills/kit-define-pack/SKILL.md
  - ../../../../kit/skills/README.md
  - ../../kit-adopter/skills/kit-map-layers/SKILL.md
last_updated: "2026-10-17"
---

# Orchestrator crew packs

Deprecated. Do not dispatch this crew. One session loads one skill.

This kit does not delegate to another agent. If the work splits, name the next task and stop. Do not load [router.md](router.md), [scout.md](scout.md), [builder.md](builder.md), or [review.md](review.md) as workers. The ids stay so old references resolve. BUILD does not emit them. Do not register them.

**Related:** [README](../../../../README.md) · [run](../../kit-adopter/skills/kit-use-instruct/SKILL.md) · [kit-define-pack](../../kit-adopter/skills/kit-define-pack/SKILL.md) · [skills index](../../../../kit/skills/README.md) · [kit-map-layers](../../kit-adopter/skills/kit-map-layers/SKILL.md)

Related lists maintainer peers. Do not load them for this task.

## Stop

1. Do not dispatch, scout, build, or review as a crew.
2. Use the one task skill already loaded for this session.
3. Install steps in [INSTALL.md](INSTALL.md) are retired.

## Document history

| Version | Notes |
|---------|--------|
| 1.4.4 | Live pack links follow `docs/library/kit-adopter/skills/` |
| 1.4.3 | The match rows are the skills index |
| 1.4.2 | Live pack links follow `kit/skills/` |
| 1.4.1 | Live links use the `kit-` directories. Ids stay |
| 1.4.0 | Archived at `library/archive/dispatch-crew/`. Not a live pack |
| 1.3.0 | Deprecated. Do not dispatch. This kit does not delegate to another agent |
| 1.2.3 | The directory is `dispatch-crew`. This file is `SKILL.md` |
| 1.2.2 | Related paths follow the pack directories. The catalog reviewer stays a different pack |
| 1.2.1 | Crew home was `skills/orchestrator/`. The reviewer pack file is `review.md` |
| 1.2.0 | `slash_only` smallest-set dispatch; host invocation stays outside this directory (kit 2.15.0) |
| 1.1.0 | Handoff digest/act/report; host launcher added (removed in 1.2.0) |
| 1.0.0 | Initial Router / Scout / Builder / Reviewer crew packs |
