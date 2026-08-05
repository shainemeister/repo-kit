---
id: adopter
title: Kit adopter
layer: playbook
portability: kit
activation: catalog_match
description: >
  First-time repo-kit adoption: SETUP checklist, kit/ layout, authority map,
  kit baseline, delete SETUP.
triggers:
  - adopt repo-kit
  - SETUP
  - first kit
  - authority map
  - kit baseline
negative_triggers:
  - kit already adopted (baseline present)
  - routine feature work
authority_paths:
  - kit/SETUP.md
  - kit/RULES.md
  - kit/rules/hygiene.md
  - kit/UPGRADE.md
  - kit/agents/PLAN-HOOK.md
  - kit/agents/BUILD.md
verify:
  - kit/ present with standards
  - kit baseline filled
  - SETUP removed or archived
  - project root CHANGELOG exists
  - Agent models section present and first BUILD run when using agents
compose_with:
  - plan-author
  - maintainer
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Kit adopter

## Must

- Keep standards under kit/; product outside.
- Fill authority map with real or planned paths.
- Record kit baseline before deleting SETUP.
- When using Agent Instruct: ensure PLAN Agent models + first BUILD.

## Must not

- Flatten RULES/standards onto product root as default.
- Force a product directory rewrite on existing repos.
- Delete Agent models when deleting SETUP.
- {{TUNING_MUST_NOT_EXTRA}}

## Procedure

1. Open kit/RULES.md authority map intent, then follow kit/SETUP.md adoption mode (greenfield or existing).
2. Copy/merge kit pieces into the target repo’s kit/. Include kit/agents/ **only when using Agent Instruct** (bare adopt may omit agents and skip BUILD).
3. Fill authority map, inventory, verification table.
4. If using agents: insert Agent models section if missing; run BUILD per kit/agents/BUILD.md.
5. Record baseline; delete or archive SETUP.
6. Point future upgrades at UPGRADE.md.

## Open for law

See authority_paths — do not restate full modules here.
