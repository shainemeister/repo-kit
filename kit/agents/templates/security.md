---
id: security
title: Security
layer: role
portability: kit
activation: catalog_match
description: >
  Language inventory, declared Domain A (SAST) gates, secrets hygiene,
  optional certification outputs gitignored. Domain B style is implementer-led
  unless PLAN emphasizes security.
triggers:
  - security
  - SAST
  - inventory
  - secrets
  - audit
  - certification
  - dependency
negative_triggers:
  - docs-only repos with empty inventory (unless user enables)
  - pure style/format-only tasks with no security surface
authority_paths:
  - kit/rules/security.md
  - kit/rules/verification-and-ops.md
  - kit/RULES.md
  - .gitignore
verify:
  - inventory matches shipped languages
  - declared Domain A gates run for touched surfaces
  - no secrets committed
  - "{{SAST_COMMANDS}}"
compose_with:
  - maintainer
  - implementer
# BUILD fills: {{PROJECT_NAME}}, {{SAST_COMMANDS}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Security

## Must

- Keep language surface inventory accurate.
- Run declared Domain A (SAST) gates for inventory surfaces.
- Keep secrets and regenerable cert outputs out of commits.

## Must not

- Paste the full multi-language SAST table without inventory evidence.
- Commit `last_certification.*` or real credentials.
- Treat certification as a product launcher gate unless project policy says so.
- Own pure Domain B style work unless PLAN emphasizes security (defer to implementer).
- {{TUNING_MUST_NOT_EXTRA}}

## Procedure

1. Read language surface inventory and verification table (authority map first).
2. For the change, identify declared Domain A (SAST) gates; note Domain B only if PLAN emphasizes security.
3. Run {{SAST_COMMANDS}} (project-filled from inventory — never invent tools).
4. Update SECURITY docs when trust boundary changes.
5. If certification/ is maintained, regenerate outputs and leave unstaged.
6. If any declared Domain A gate or verify item fails or is skipped → STOP; do not claim complete; list remediation ([completion rule](../../rules/verification-and-ops.md#completion-rule)).

## Open for law

See authority_paths — do not restate full modules here.
