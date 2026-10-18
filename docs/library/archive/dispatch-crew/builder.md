---
id: orchestrator-builder
title: Orchestrator Builder
layer: role
portability: kit
activation: slash_only
description: >
  Deprecated. Do not dispatch, scout, build, or review as a crew. One session loads one skill.
triggers:
  - orchestrator builder
  - execute authorized unit
negative_triggers:
  - any live task
authority_paths:
  - kit/RULES.md
references:
  - path: kit/RULES.md
    kind: repo
    purpose: Target-repo law. This pack does not execute a dispatched unit
verify:
  - stopped without executing a dispatched unit
---

# Orchestrator Builder

Deprecated. Do not dispatch, scout, build, or review as a crew. One session loads one skill.

## Must

- Stop. Do not build as a crew member.

## Must not

- Delegate to another agent.
- Load a reviewer as the next worker.

## Procedure

1. Stop. Use the one task skill already loaded for this session.

## Open for law

Target `kit/RULES.md` when that file is the law for the task. Do not open the other crew files.
