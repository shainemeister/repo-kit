---
id: adopter
title: Kit adopter
layer: playbook
portability: kit
activation: catalog_match
description: >
  Adopt the kit once by following ADOPTER.md. When Agent Instruct is in use, the next task is kit-author-plan, then kit-emit-packs.
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
  - ADOPTER.md
  - kit/RULES.md
  - AGENTS.md
  - kit/rules/path-pattern.md
  - kit/rules/directory-index.md
  - kit/UPGRADE.md
references:
  - path: ADOPTER.md
    kind: repo
    purpose: One-time adoption checklist
  - path: AGENTS.md
    kind: repo
    purpose: kit/ vs product packaging
  - path: kit/UPGRADE.md
    kind: repo
    purpose: Later upgrades (not first adopt)
verify:
  - kit/ present with standards
  - kit baseline filled, including Kit source
  - target keeps UPGRADE and deletes ADOPTER.md when the adopt is finished
  - project root CHANGELOG exists
  - Agent models section present and first BUILD run when using agents
  - map real paths; directory index from adopt date forward (directory-index.md)
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Kit adopter

The checklist is ADOPTER.md. That file stays the owner.

## Must not

- Restate the steps in [ADOPTER.md](../../../../../ADOPTER.md).
- Delete Agent models during install.
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- `ADOPTER.md` — one-time adopt. This repository keeps it. An adopted repository deletes it when the adopt is finished
- `kit/UPGRADE.md` — later upgrades
- `kit/RULES.md` — hub and baseline
- `template/docs-only.md` — filled map for a docs-only repository

### External (citations — guidance only)

- Kit source — https://github.com/shainemeister/repo-kit

## Procedure

1. Open `kit/RULES.md`, then follow `ADOPTER.md`.
2. When using Agent Instruct, the next task is kit-author-plan, then kit-emit-packs. Stop. Do not open those skills in this session.
3. When adding a path, follow `kit/rules/path-pattern.md`. A new directory index follows `kit/rules/directory-index.md`. Do not paste those files.

## Open for law

See authority_paths. Do not restate those files.
