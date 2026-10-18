---
id: orchestrator-router
title: Orchestrator Router
layer: playbook
portability: kit
activation: slash_only
description: >
  Deprecated. Do not dispatch, scout, build, or review as a crew. One session loads one skill.
triggers:
  - orchestrate
  - decompose
  - dispatch crew
  - master orchestrator
negative_triggers:
  - any live task
authority_paths:
  - kit/RULES.md
references:
  - path: kit/RULES.md
    kind: repo
    purpose: Target-repo law. This pack does not dispatch
verify:
  - stopped without dispatching a worker
---

# Orchestrator Router

Deprecated. Do not dispatch, scout, build, or review as a crew. One session loads one skill.

## Must

- Stop. Do not dispatch a worker.

## Must not

- Delegate to another agent.
- Load scout, builder, or review as a crew.

## Procedure

1. Stop. Use the one task skill already loaded for this session.

## Open for law

Target `kit/RULES.md` when that file is the law for the task. Do not open the other crew files.
