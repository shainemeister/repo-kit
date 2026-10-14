---
id: adopter
title: Kit adopter
layer: playbook
portability: kit
activation: catalog_match
description: >
  First-time repo-kit adoption: follow SETUP in the kit repository, fill the
  authority map and kit baseline, and leave UPGRADE in the target.
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
  - AGENTS.md
  - kit/rules/files.md
  - kit/UPGRADE.md
  - library/skills/PLAN-HOOK.md
  - library/skills/BUILD.md
  - library/skills/OPS.md
references:
  - path: kit/SETUP.md
    kind: repo
    purpose: One-time adoption checklist
  - path: AGENTS.md
    kind: repo
    purpose: kit/ vs product packaging
  - path: library/skills/OPS.md
    kind: repo
    purpose: Utilization after first BUILD when Instruct is chosen
  - path: kit/UPGRADE.md
    kind: repo
    purpose: Later upgrades (not first adopt)
verify:
  - kit/ present with standards
  - kit baseline filled, including Kit source
  - target keeps UPGRADE and does not keep SETUP
  - project root CHANGELOG exists
  - Agent models section present and first BUILD run when using agents
  - map real paths; directory index from adopt date forward (files.md)
compose_with:
  - plan-author
  - maintainer
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Kit adopter

## Must

- Keep standards under kit/; product outside.
- Fill authority map with real or planned paths.
- When adding a path, follow kit/rules/files.md.
- Record the kit baseline, including the Kit source.
- Leave UPGRADE in the target. Leave SETUP in the kit repository.
- When using Agent Instruct: ensure PLAN Agent models + first BUILD; point operators at OPS for ongoing utilization.

## Must not

- Flatten RULES/standards onto product root as default.
- Force a product directory rewrite on existing repos.
- Delete Agent models during install.
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- `kit/SETUP.md` — install procedure; stays in the kit repository
- `kit/RULES.md` — hub, baseline, map
- `AGENTS.md` — packaging
- `kit/UPGRADE.md` — durable upgrades
- `library/skills/PLAN-HOOK.md` — Agent models
- `library/skills/BUILD.md` — first emit
- `library/skills/OPS.md` — utilization after adopt

### External (citations — guidance only)

- Kit source — https://github.com/shainemeister/repo-kit (canonical upstream)

## Procedure

1. Open kit/RULES.md, then follow kit/SETUP.md.
2. Copy/merge kit pieces into the target repo’s kit/. Include library/skills/ **only when using Agent Instruct** (bare adopt may omit agents and skip BUILD).
3. Fill authority map, inventory, verification table.
4. If using agents: insert Agent models section if missing (include OPS in Instruct authority); run BUILD per library/skills/BUILD.md; thereafter use OPS O3.
5. Record the baseline, including the Kit source. The target keeps UPGRADE and does not keep SETUP.
6. Later upgrades follow UPGRADE.md. It reads the Kit source in the baseline.

## Open for law

See authority_paths and Expertise map — do not restate full modules here.
