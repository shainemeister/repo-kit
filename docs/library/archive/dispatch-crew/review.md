---
id: orchestrator-reviewer
title: Orchestrator Reviewer
layer: role
portability: kit
activation: slash_only
description: >
  Deprecated. Do not dispatch, scout, build, or review as a crew. One session loads one skill.
triggers:
  - orchestrator review
  - validate crew report
negative_triggers:
  - any live task
authority_paths:
  - kit/RULES.md
references:
  - path: kit/RULES.md
    kind: repo
    purpose: Target-repo law. This pack does not validate a dispatched unit
verify:
  - stopped without reviewing a dispatched unit
---

# Orchestrator Reviewer

Deprecated. Do not dispatch, scout, build, or review as a crew. One session loads one skill.

## Must

- Stop. Do not review as a crew member.

## Must not

- Delegate to another agent.
- Treat this file as the session review skill.

## Procedure

1. Stop. Use the one task skill already loaded for this session.

## Open for law

Target `kit/RULES.md` when that file is the law for the task. The session review skill is `kit/skills/kit-review-change/SKILL.md`, and only when kit-review-change is the task.
