---
id: plan-author
title: PLAN author
layer: playbook
portability: kit
activation: catalog_match
description: >
  Draft or revise project PLAN.md from project interest: goals, non-goals,
  stages, and Agent models section.
triggers:
  - plan
  - PLAN.md
  - project interest
  - roadmap
  - stages
  - non-goals
negative_triggers:
  - pure code bugfix with no plan impact
authority_paths:
  - PLAN.md
  - kit/agents/PLAN-HOOK.md
  - kit/MARKDOWN-STANDARD.md
  - README.md
verify:
  - PLAN has mission-level summary
  - Agent models section present per PLAN-HOOK when using Agent Instruct (omit for bare adopt)
  - stages consistent if used
compose_with:
  - docs-author
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# PLAN author

## Must

- Capture mission, non-goals, and constraints clearly.
- Include Agent models section (active/disabled/overlays/tuning) when using Agent Instruct.
- Prefer durable PLAN edits over chat-only intent.

## Must not

- Invent product architecture not implied by interest or user.
- Duplicate full kit Instruct docs inside PLAN.
- Require Agent models for bare kit adopt (no Instruct).
- {{TUNING_MUST_NOT_EXTRA}}

## Procedure

1. Restate project interest in one sentence.
2. Draft/update mission, non-goals, stages as needed.
3. If using Agent Instruct: ensure Agent models section matches PLAN-HOOK; link kit/agents/ authority paths; hand off to BUILD after enablement changes.
4. If bare adopt (no Instruct): omit Agent models and skip BUILD; mission/non-goals verify is enough.

## Open for law

See authority_paths — do not restate full modules here.
