---
id: index-directory
title: Index directory
layer: playbook
portability: kit
activation: catalog_match
description: >
  Write the index for a new navigable directory. Cite the directory-index rule. Do not restate it.
triggers:
  - directory README
  - directory index
  - index a directory
  - new folder of files
negative_triggers:
  - name a source file
  - backfill an old directory
  - landing README
  - commit the change
authority_paths:
  - kit/rules/directory-index.md
  - kit/MARKDOWN-STANDARD.md
  - kit/rules/contracts.md
  - kit/rules/path-pattern.md
  - kit/skills/kit-index-directory/template/index.md
references:
  - path: kit/rules/directory-index.md
    kind: repo
    purpose: Principle — when a directory gets an index
  - path: kit/MARKDOWN-STANDARD.md
    kind: repo
    purpose: Cell shape of a directory index
  - path: kit/rules/contracts.md
    kind: repo
    purpose: Same change set
  - path: kit/rules/path-pattern.md
    kind: repo
    purpose: A procedure pack is indexed by SKILL.md
  - path: kit/skills/kit-index-directory/template/index.md
    kind: repo
    purpose: Blank copied to README.md
verify:
  - a new directory of intentional files has its index in the same change set
  - a historical directory was not backfilled
  - a procedure pack was left indexed by SKILL.md
  - this task did not restate the principle
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Index directory

Write the index for a new navigable directory. Cite the directory-index rule. Do not restate it.

The principle is [directory-index.md](../../rules/directory-index.md). That file stays the owner.

## Must

- Open [directory-index.md](../../rules/directory-index.md) and apply it.
- Use the cell shape in the [markdown standard](../../MARKDOWN-STANDARD.md#directory-index).
- Put the index in the same change set ([contracts](../../rules/contracts.md#same-change-set-rule)).

## Must not

- Restate the principle in this pack.
- Backfill a historical directory.
- Name or create the sibling files in this task.
- Add `README.md` beside `SKILL.md`.
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- `kit/rules/directory-index.md` — when the index is required
- `kit/MARKDOWN-STANDARD.md` — cell shape
- `kit/rules/contracts.md` — same change set
- `template/index.md` — the blank

### External (citations — guidance only)

- None.

## Procedure

1. Open [directory-index.md](../../rules/directory-index.md).
2. When the directory is a procedure pack, confirm `SKILL.md` is the index ([path pattern](../../rules/path-pattern.md)). Stop.
3. Copy [template/index.md](template/index.md) to `README.md` in that directory. Retarget the links. One file-to-function row for each intentional file.
4. When a listed name breaks the pattern, the next task is `kit-name-path`. Stop.
5. If a declared check failed or was skipped, stop ([completion](../../RULES.md#completion)).

## Open for law

See authority_paths. The principle stays in `kit/rules/directory-index.md`.
