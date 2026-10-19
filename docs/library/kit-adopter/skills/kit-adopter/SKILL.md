---
id: adopter
title: Kit adopter
layer: playbook
portability: kit
activation: catalog_match
description: >
  Copy the kit into the target, fill the baseline, and write the target's own indexes.
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
  - docs/library/kit-adopter/README.md
  - kit/RULES.md
  - AGENTS.md
  - kit/rules/path-pattern.md
  - kit/rules/directory-index.md
  - kit/UPGRADE.md
references:
  - path: ADOPTER.md
    kind: repo
    purpose: The order. That file stays the owner
  - path: docs/library/kit-adopter/README.md
    kind: repo
    purpose: Adopt order. This pack does the current row and names the next
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
  - map real paths; directory index from adopt date forward (directory-index.md)
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Kit adopter

Copy the kit into the target, fill the baseline, and write the target's own indexes.

## Must not

- Do not restate [ADOPTER.md](../../../../../ADOPTER.md).
- Do not delete Agent models.
- Do not open the next pack in this session.
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- `ADOPTER.md` — the deploy list. The orchestrator owns it
- `docs/library/kit-adopter/README.md` — adopt order for this shelf
- `kit/RULES.md` — hub and baseline
- `kit/UPGRADE.md` — later upgrades

### External (citations — guidance only)

- Kit source — https://github.com/shainemeister/repo-kit

## Handback

You are the sub-agent for this file. Do this procedure. Do not open another pack. Do not deploy a sub-agent. Return done, or a short fix list. Then stop.

## Procedure

1. Copy `kit/RULES.md`, `kit/rules/`, `kit/MARKDOWN-STANDARD.md`, `kit/UPGRADE.md`, and `kit/skills/` into the target. Leave product code, the project changelog, and `docs/` outside `kit/`. A copied skill names the shelf as a kit-source read. It does not require `docs/library/` in the target.
2. Fill the authority map with paths that exist in the target. Drop rows that do not apply. Cite [path-pattern.md](../../../../../kit/rules/path-pattern.md) and [directory-index.md](../../../../../kit/rules/directory-index.md). Do not paste those rules.
3. Record the adopted version and the Kit source in the target's kit baseline. The version is the latest dated section under `## repo-kit` in [CHANGELOG.md](../../../../../kit/CHANGELOG.md). The Kit source is the URL in [RULES.md](../../../../../kit/RULES.md#kit-baseline).
4. Write the target's root `README.md` and directory indexes for its own files. Use [MARKDOWN-STANDARD.md](../../../../../kit/MARKDOWN-STANDARD.md) for the shape. Do not paste kit examples in as those descriptions.
5. Do not delete [ADOPTER.md](../../../../../ADOPTER.md) in this session. That file owns when the target deletes it.

## Open for law

See authority_paths. Do not restate those files.
