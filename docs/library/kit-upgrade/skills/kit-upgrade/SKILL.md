---
id: upgrade
title: Kit upgrade
layer: playbook
portability: kit
activation: catalog_match
description: >
  Merge the newer kit files and record the adopted version.
triggers:
  - upgrade repo-kit
  - newer kit
  - kit baseline
  - notable changes since the adopted version
negative_triggers:
  - first adopt
  - delete ADOPTER.md
  - routine feature work
  - check the upgrade diff
authority_paths:
  - kit/UPGRADE.md
  - docs/library/kit-upgrade/README.md
  - kit/RULES.md
  - ADOPTER.md
references:
  - path: kit/UPGRADE.md
    kind: repo
    purpose: The routes. That file stays the owner
  - path: docs/library/kit-upgrade/README.md
    kind: repo
    purpose: Upgrade order. This pack names the next row and stops
  - path: kit/RULES.md
    kind: repo
    purpose: Kit baseline and Kit source
  - path: ADOPTER.md
    kind: repo
    purpose: Adopt file. An upgrade does not delete it
  - path: docs/library/kit-adopter/skills/kit-context-register/SKILL.md
    kind: repo
    purpose: Next row. Cited, not copied
  - path: docs/library/kit-adopter/skills/kit-map-layers/SKILL.md
    kind: repo
    purpose: Shared pack. Cited, not copied
  - path: docs/library/kit-adopter/skills/kit-define-pack/SKILL.md
    kind: repo
    purpose: Shared pack. Cited, not copied
  - path: docs/library/kit-adopter/skills/kit-author-plan/SKILL.md
    kind: repo
    purpose: Shared pack. Cited, not copied
  - path: docs/library/kit-adopter/skills/kit-emit-packs/SKILL.md
    kind: repo
    purpose: Shared pack. Cited, not copied
  - path: docs/library/kit-adopter/skills/kit-use-instruct/SKILL.md
    kind: repo
    purpose: Shared pack. Cited, not copied
  - url: https://github.com/shainemeister/repo-kit
    kind: external
    purpose: Kit source recorded in the baseline
    trust_note: Citation only. The routes stay in kit/UPGRADE.md
verify:
  - the Kit source and the notable changes since the adopted version were read
  - project MEMORY.md and WORKBOARD.md were kept
  - AGENTS.md was refreshed from the agents paste and the project's path note was kept
  - product text was not replaced
  - a filled MEMORY.md was not replaced
  - this kit's changelog was not pasted into the project changelog
  - ADOPTER.md was not deleted
  - no shared pack was copied into docs/library/kit-upgrade/
  - the next row on docs/library/kit-upgrade/README.md was named
  - that next pack was not opened in this session
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Kit upgrade

Merge the newer kit files and record the adopted version.

## Must not

- Do not paste this kit's changelog into the project changelog.
- Do not replace product text. Refresh `AGENTS.md` from the agents paste and keep the project's path note.
- Do not replace a filled MEMORY.md.
- Do not copy a shared pack into `docs/library/kit-upgrade/`.
- Do not delete [ADOPTER.md](../../../../../ADOPTER.md) during an upgrade. That deletion belongs to the finished adopt.
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- [kit/UPGRADE.md](../../../../../kit/UPGRADE.md) — the routes. That file stays the owner
- [docs/library/kit-upgrade/README.md](../../README.md) — upgrade order. The orchestrator deploys the next row
- [kit/RULES.md](../../../../../kit/RULES.md) — kit baseline and Kit source
- [ADOPTER.md](../../../../../ADOPTER.md) — adopt file. An upgrade does not delete it
- [kit-context-register](../../../kit-adopter/skills/kit-context-register/SKILL.md) — next row. Cite it. Do not open it in this session
- [kit-map-layers](../../../kit-adopter/skills/kit-map-layers/SKILL.md) — shared pack. Cite it. Do not copy it
- [kit-define-pack](../../../kit-adopter/skills/kit-define-pack/SKILL.md) — shared pack. Cite it. Do not copy it
- [kit-author-plan](../../../kit-adopter/skills/kit-author-plan/SKILL.md) — shared pack. Cite it. Do not copy it
- [kit-emit-packs](../../../kit-adopter/skills/kit-emit-packs/SKILL.md) — shared pack. Cite it. Do not copy it
- [kit-use-instruct](../../../kit-adopter/skills/kit-use-instruct/SKILL.md) — shared pack. Cite it. Do not copy it

### External (citations — guidance only)

- Kit source — https://github.com/shainemeister/repo-kit — citation only. The routes stay in `kit/UPGRADE.md`

## Handback

You are the sub-agent for this file. Do this procedure. Do not open another pack. Do not deploy a sub-agent. Return done, or a short fix list. Then stop.

## Procedure

1. Read the Kit source and the adopted version in the [kit baseline](../../../../../kit/RULES.md#kit-baseline). Read the `## repo-kit` sections newer than that version in [CHANGELOG.md](../../../../../kit/CHANGELOG.md). The git history holds the detail.
2. Merge the kit files the project uses from that source. Keep the project's authority-map paths, [MEMORY.md](../../../../../MEMORY.md), and [WORKBOARD.md](../../../../../WORKBOARD.md). A missing historical directory index, or programming source that still lives somewhere other than `src/`, is not a failed upgrade.
3. Refresh [AGENTS.md](../../../../../AGENTS.md) from [agents.md](../../../kit-adopter/skills/kit-discover-host/template/agents.md). Keep the project's path note.
4. Update the adopted version in the project's kit baseline.
5. Add one line to the project's own changelog. Do not paste this kit's history into that file.

## Open for law

See authority_paths. Do not restate those files.
