---
id: workboard-archive
title: Workboard archive
layer: playbook
portability: kit
activation: catalog_match
description: >
  Update the workboard for an authorized commit. File a named program when no phase is open, active, or blocked, and restore the blank.
triggers:
  - archive the workboard
  - reset the workboard
  - authorized commit
  - house cleaning
negative_triggers:
  - a commit has not been authorized
  - the board is already the blank
authority_paths:
  - WORKBOARD.md
  - kit/rules/directory-index.md
  - kit/rules/path-pattern.md
  - kit/rules/contracts.md
references:
  - path: WORKBOARD.md
    kind: repo
    purpose: The multi-phase record to file
  - path: kit/skills/kit-workboard-register/template/workboard.md
    kind: repo
    purpose: The blank that replaces the live board
  - path: kit/rules/directory-index.md
    kind: repo
    purpose: When the archive directory is new, it gets an index
  - path: kit/rules/path-pattern.md
    kind: repo
    purpose: The filed path and the blank path
  - path: kit/rules/contracts.md
    kind: repo
    purpose: An authorized commit updates the board before that commit is created
verify:
  - a named program with no open, active, or blocked phase is filed and the live board is the blank
  - links in that copy resolve from the archive file
  - phase drafts move with the board, and an absent `docs/plan/<program>/` directory is not created
  - an open, active, or blocked phase stays, with one new progress line inside the log cap
  - a program that already has a plan-index row does not gain a second one
  - a blank board is left as it is
  - this task did not edit MEMORY.md or AGENTS.md
  - this task did not commit
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Workboard archive

The record is [WORKBOARD.md](../../../WORKBOARD.md). The blank is [template/workboard.md](../kit-workboard-register/template/workboard.md). Those paths follow [path-pattern.md](../../rules/path-pattern.md). [Contracts](../../rules/contracts.md#boundaries) owns when this update files the board. Do this before that commit is created. This task does not create the commit.

## Must not

- File the board or restore the blank while a phase is `open`, `active`, or `blocked`.
- Add a second plan-index row for a program that already has one.
- Edit `MEMORY.md` or `AGENTS.md`.
- Commit. `kit-commit` creates the one commit that includes this edit. The blank does not name this pack again.
- Restate the status meanings. Those stay on the board.
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- `WORKBOARD.md` — the filled record
- `kit/skills/kit-workboard-register/template/workboard.md` — the blank
- `kit/rules/path-pattern.md` — the filed path and the blank path
- `kit/rules/directory-index.md` — when the archive directory gets an index
- `kit/rules/contracts.md` — an authorized commit updates the board before that commit is created

### External (citations — guidance only)

- None.

## Procedure

1. Open [WORKBOARD.md](../../../WORKBOARD.md).
2. If the primary program is `—`, stop.
3. If any phase is `open`, `active`, or `blocked`, add one progress line for the commit, newest first. Drop the oldest line when the log is over the cap. Stop.
4. Copy the file to `docs/plan/archive/<program>/WORKBOARD.md`. The directory name is the primary program. When `docs/plan/<program>/` exists, move its files into that archive directory and rewrite relative links in those files. Do not create `docs/plan/<program>/` when it is absent. Rewrite each relative link, and each `related:` path, so it resolves from the archive file to the same target. When that directory is new, follow [kit-index-directory](../kit-index-directory/SKILL.md). When the archive directory already has a README that lists the snapshot, leave that row. Add one row on [docs/plan/README.md](../../../docs/plan/README.md) only when that program has no row there.
5. Replace root `WORKBOARD.md` with the fenced body of [the blank](../kit-workboard-register/template/workboard.md). Remove the fence. Set `last_updated` to the day you copy it.
6. Stop. Do not commit. Do not open another skill.

## Open for law

See authority_paths. Do not restate those files.
