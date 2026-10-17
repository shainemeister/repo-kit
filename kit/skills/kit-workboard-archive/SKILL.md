---
id: workboard-archive
title: Workboard archive
layer: playbook
portability: kit
activation: catalog_match
description: >
  File a finished workboard and restore the blank. Run only after the commit that left every phase done.
triggers:
  - archive the workboard
  - reset the workboard
  - finished program
  - restore the workboard blank
negative_triggers:
  - a phase is still open, active, blocked, deferred, or cancelled
  - no commit of this finished program yet
  - the board is already the blank
authority_paths:
  - WORKBOARD.md
  - kit/rules/files.md
  - kit/rules/contracts.md
references:
  - path: WORKBOARD.md
    kind: repo
    purpose: The multi-phase record to file
  - path: kit/skills/kit-workboard-register/template/workboard.md
    kind: repo
    purpose: The blank that replaces the live board
  - path: kit/rules/files.md
    kind: repo
    purpose: Where the filed copy and the blank live
  - path: kit/rules/contracts.md
    kind: repo
    purpose: The finishing commit leaves the board in place
verify:
  - the filed copy is at the path files.md names
  - root WORKBOARD.md is the blank and its primary program is —
  - this task did not edit MEMORY.md or AGENTS.md
  - this task did not commit
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Workboard archive

File a finished workboard and restore the blank. Run only after the commit that left every phase done.

The record is [WORKBOARD.md](../../../WORKBOARD.md). The blank is [template/workboard.md](../kit-workboard-register/template/workboard.md). [files.md](../../rules/files.md) owns those paths.

## Must

- Copy the filled [WORKBOARD.md](../../../WORKBOARD.md) to `docs/plan/archive/<program>/WORKBOARD.md`. The directory name is the primary program.
- When that directory is new, add the directory README [files.md](../../rules/files.md#directory-index) requires, with one row for the snapshot. When a README is already there, add one row.
- Add one row for that snapshot on [docs/plan/README.md](../../../docs/plan/README.md).
- Replace root `WORKBOARD.md` with the fenced body of the blank. Remove the fence. Set `last_updated` to the day you copy it.
- Leave `MEMORY.md` and `AGENTS.md` as they are.

## Must not

- Run this task when any phase is not `done`, or when the primary program is `—`.
- Edit `MEMORY.md` or `AGENTS.md`.
- Commit. A later `kit-commit` is a separate task. The blank does not name this pack again.
- Restate the status meanings. Those stay on the board.
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- `WORKBOARD.md` — the filled record
- `kit/skills/kit-workboard-register/template/workboard.md` — the blank
- `kit/rules/files.md` — the filed path and the directory index
- `kit/rules/contracts.md` — the finishing commit leaves the board in place

### External (citations — guidance only)

- None.

## Procedure

1. Open [WORKBOARD.md](../../../WORKBOARD.md).
2. If the primary program is `—`, or any phase is not `done`, stop.
3. Copy that file to `docs/plan/archive/<program>/WORKBOARD.md`. Follow [files.md](../../rules/files.md#directory-index) for a new directory, and add one row on [docs/plan/README.md](../../../docs/plan/README.md).
4. Replace root `WORKBOARD.md` with the fenced body of [the blank](../kit-workboard-register/template/workboard.md). Remove the fence. Set `last_updated` to the day you copy it.
5. Stop. Do not commit. Do not open another skill.

## Open for law

See authority_paths. Do not restate those files.
