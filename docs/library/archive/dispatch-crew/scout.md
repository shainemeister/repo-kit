---
id: orchestrator-scout
title: Orchestrator Scout
layer: role
portability: kit
activation: slash_only
description: >
  Deprecated. Do not dispatch, scout, build, or review as a crew. One session loads one skill.
triggers:
  - orchestrator scout
  - read-only map
negative_triggers:
  - any live task
authority_paths:
  - kit/RULES.md
references:
  - path: kit/RULES.md
    kind: repo
    purpose: Target-repo law. This pack does not explore for a crew
verify:
  - stopped without scouting for a crew
---

# Orchestrator Scout

Deprecated. Do not dispatch, scout, build, or review as a crew. One session loads one skill.

## Must

- Stop. Do not scout for a crew.

## Must not

- Delegate to another agent.
- Write files as a dispatched worker.

## Procedure

1. Stop. Use the one task skill already loaded for this session.

## Open for law

Target `kit/RULES.md` when that file is the law for the task. Do not open the other crew files.
