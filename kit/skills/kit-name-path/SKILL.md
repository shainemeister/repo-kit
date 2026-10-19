---
id: name-path
title: Name path
layer: playbook
portability: kit
activation: catalog_match
description: >
  Name, move, or split a path by applying the path pattern. Cite that file. Do not restate it.
triggers:
  - name a path
  - new file
  - new directory
  - move a file
  - split a file
  - source layout
negative_triggers:
  - write a directory README
  - commit the change
  - adopt or upgrade the kit
  - language packaging
authority_paths:
  - kit/rules/path-pattern.md
  - kit/RULES.md
  - kit/rules/contracts.md
references:
  - path: kit/rules/path-pattern.md
    kind: repo
    purpose: Principle — how a path is segmented, named, and patterned
  - path: kit/RULES.md
    kind: repo
    purpose: Authority map and completion
  - path: kit/rules/contracts.md
    kind: repo
    purpose: A public promise moves with its owner
verify:
  - the path follows path-pattern.md
  - a new path had evidence, and its role was absent
  - this task did not write the directory index
  - this task did not restate the principle
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Name path

The principle is [path-pattern.md](../../rules/path-pattern.md). That file stays the owner.

## Must not

- Restate the principle in this pack.
- Write the directory index in this task.
- Treat a language tree as a second source home.
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- `kit/rules/path-pattern.md` — the path pattern
- `kit/RULES.md` — authority map and completion
- `kit/rules/contracts.md` — a public promise and the same change set

### External (citations — guidance only)

- None.

## Procedure

1. Open the authority map and [path-pattern.md](../../rules/path-pattern.md).
2. Require evidence before a new path.
3. Read the parent index. When the role is listed, edit that file and stop.
4. Name the path from the pattern.
5. When that path creates a directory of intentional files, the next task is `kit-index-directory`. Stop.
6. When the path is a public promise, the next task is the contract owner. Stop.
7. If a declared check failed or was skipped, stop ([completion](../../RULES.md#completion)).

## Open for law

See authority_paths. The principle stays in `kit/rules/path-pattern.md`.
