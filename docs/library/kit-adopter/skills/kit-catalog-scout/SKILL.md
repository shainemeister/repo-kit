---
id: catalog-scout
title: Catalog scout
layer: playbook
portability: kit
activation: catalog_match
description: >
  The map rule is directory-index.md. That file stays the owner.
triggers:
  - catalog the target
  - map tracked paths
  - scout the tree
  - list the repository
  - adopt catalog
negative_triggers:
  - place the session file
  - write AGENTS.md
  - write a directory README
  - register a phase
  - commit the change
authority_paths:
  - kit/rules/directory-index.md
  - kit/rules/path-pattern.md
references:
  - path: kit/rules/directory-index.md
    kind: repo
    purpose: Map rule — which tracked paths a catalog keeps
  - path: kit/rules/path-pattern.md
    kind: repo
    purpose: One role — edit the listed file instead of adding one
  - path: docs/library/kit-adopter/skills/kit-discover-host/SKILL.md
    kind: repo
    purpose: Session file. Not this pack
verify:
  - tracked paths are the ones directory-index.md keeps
  - each kept path has one short line of context
  - excluded paths were skipped
  - an existing workboard or index was edited when it already listed the role
  - a new catalog was not added while that role was already listed
  - the session file was not placed
  - this task did not restate directory-index.md
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Catalog scout

The map rule is directory-index.md. That file stays the owner.

## Must not

- Do not add a catalog when the workboard or a directory index already lists the role.
- Do not place the session file. That is [kit-discover-host](../kit-discover-host/SKILL.md).
- Do not restate [directory-index.md](../../../../../kit/rules/directory-index.md).
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- `kit/rules/directory-index.md` — the map rule
- `kit/rules/path-pattern.md` — one role for a new file
- `docs/library/kit-adopter/skills/kit-discover-host/SKILL.md` — the session file, not this pack

### External (citations — guidance only)

- None.

## Procedure

1. Open the target and [directory-index.md](../../../../../kit/rules/directory-index.md).
2. List the tracked paths that rule keeps. Write one short line of context for each. Skip what that rule excludes.
3. When the workboard or a directory index already lists the role, edit that file and stop.
4. When the role is absent, keep that list and stop ([One role](../../../../../kit/rules/path-pattern.md#one-role)). Do not add a second catalog for a role that is already listed.

## Open for law

See authority_paths. The map rule stays in `kit/rules/directory-index.md`.
