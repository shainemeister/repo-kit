---
title: "Skill pack sequence"
description: "Numbered working sequence for the skill-pack fix, the choice to keep or reintegrate that tree, and the other audit findings that follow."
version: "1.0.0"
status: draft
audience:
  - ai-agents
  - maintainers
doc_type: other
related:
  - ./skills-evaluation-rework.md
  - ./repo-kit-rework.md
  - ../../library/skills/README.md
  - ../../kit/RULES.md
  - ../../kit/rules/files.md
  - ../WORKBOARD.md
last_updated: "2026-10-15"
---

# Skill pack sequence

Numbered working sequence for the skill-pack fix, the choice to keep or reintegrate that tree, and the other audit findings that follow.

**Related:** [overlap map](./skills-evaluation-rework.md) · [rework record](./repo-kit-rework.md) · [skills](../../library/skills/README.md) · [RULES](../../kit/RULES.md) · [files](../../kit/rules/files.md) · [workboard](../WORKBOARD.md)

Draft only. This note is the order of work. It is not kit law. The overlap inside `library/skills/` stays in [skills-evaluation-rework.md](./skills-evaluation-rework.md). Do not paste that map here again.

## How to use

Work one section at a time, in order. A later section starts when every section it depends on is `done` or `dropped`.

| Status | Meaning |
|--------|---------|
| `open` | Not started |
| `active` | The section in progress. One at a time |
| `done` | The "Done when" line is true, and the owners it names were updated together |
| `dropped` | Explicitly declined. Say why in the section log |
| `deferred` | Parked. Say what it is waiting on |

On each change of status, edit that section's status line and append a dated log line. When a section edits `kit/` or `library/`, register it on [docs/WORKBOARD.md](../WORKBOARD.md) in the same change set. The board's own stale pointers are section 10, so the first registration also repairs the rows that registration would otherwise repeat.

Paths in sections 4–9 are the current tree, `library/skills/`. If section 2 moves that tree, apply those edits at the new paths and retarget the links in this note in that same change set.

## Sequence

| # | Section | Status | Depends on |
|---|---------|--------|------------|
| 1 | [Decide the skill home](#1-decide-the-skill-home) | open | — |
| 2 | [Carry out the home decision](#2-carry-out-the-home-decision) | open | 1 |
| 3 | [Correct the law the packs will cite](#3-correct-the-law-the-packs-will-cite) | open | — |
| 4 | [Repair skill links and anchors](#4-repair-skill-links-and-anchors) | open | 2 |
| 5 | [Remove retired hub requirements](#5-remove-retired-hub-requirements) | open | 3, 4 |
| 6 | [Keep one copy of each Instruct rule](#6-keep-one-copy-of-each-instruct-rule) | open | 5 |
| 7 | [Make surviving packs cite owners](#7-make-surviving-packs-cite-owners) | open | 6 |
| 8 | [Refresh skill identity fields](#8-refresh-skill-identity-fields) | open | 6, 7 |
| 9 | [Index the skill directories that remain](#9-index-the-skill-directories-that-remain) | open | 6 |
| 10 | [Repair workboard pointers](#10-repair-workboard-pointers) | open | 2 |
| 11 | [Repair platform links](#11-repair-platform-links) | open | 2 |
| 12 | [Align platform descriptions and indexes](#12-align-platform-descriptions-and-indexes) | open | 11 |
| 13 | [Decide the platform changelog schema](#13-decide-the-platform-changelog-schema) | open | 3 |
| 14 | [Close the docs workspace gaps](#14-close-the-docs-workspace-gaps) | open | — |
| 15 | [Decide archive and research links](#15-decide-archive-and-research-links) | open | 10 |
| 16 | [Record accepted exceptions](#16-record-accepted-exceptions) | open | 1–15 |

## 1. Decide the skill home

| Field | Value |
|-------|--------|
| Status | open |
| Depends on | — |
| Owners this section edits | This file only |

### Subject

Choose where Agent Instruct and the orchestrator crew live before any skill file is rewritten.

### Evidence

Kit 3.0.0 (`kit/CHANGELOG.md`, 2026-10-13) moved Instruct and the orchestrator to `library/skills/` and left the hub silent about that tree. [repo-kit-rework.md](./repo-kit-rework.md) records the reason: the core stays small, and the kit does not cite the library. A skill cites `kit/` and does not restate it. Bare adopt still skips Instruct.

The category table in [files.md](../../kit/rules/files.md#categories) has no row for `library/`. Ninety-two tracked files sit outside every named home. Eighty-three of them are under `library/`.

### Change

Pick one row. Write it into **Decision** and **Chosen home** below. Do not move files in this section.

| Choice | Result | What changes with it |
|--------|--------|----------------------|
| A. Stay | `library/skills/` remains the skill home. The hub stays silent | Section 2 adds a `library/` category row and does not move the tree |
| B. Reintegrate | The skill tree moves back under `kit/` and `library/skills/` is removed in that change set | The hub gains an owner row. The core cites the procedure again. Every relative link retargets with the move |
| C. Point from the hub | The tree stays in `library/skills/`, and `kit/RULES.md` gains one map row that names it | The "kit does not cite the library" rule is amended in the same change set |

**Decision:** undecided

**Chosen home:** —

### Done when

The two lines above name A, B, or C, and a log line records the date and the reason.

### Log

- 2026-10-15 — Opened. Decision not made.

## 2. Carry out the home decision

| Field | Value |
|-------|--------|
| Status | open |
| Depends on | 1 |
| Owners this section edits | The paths named by the choice in section 1, plus [files.md](../../kit/rules/files.md) and [kit/RULES.md](../../kit/RULES.md) when that choice adds a row |

### Subject

Make the repository match the decision in section 1. This is the placement change, not the prose repair.

### Evidence

`library/skills/` holds the instruct docs, `templates/`, `examples/`, `generated/.gitkeep`, and `orchestrator/`. Root [README.md](../../README.md) and [library/README.md](../../library/README.md) already point at that tree. [files.md](../../kit/rules/files.md#categories) does not.

### Change

| Choice from section 1 | Work |
|-----------------------|------|
| A. Stay | Add one category row whose home is `library/`. Name platforms and skills in the notes. Leave the files where they are. Update the research and rework notes that describe the category table in the same change set |
| B. Reintegrate | Move the skill tree to the path chosen in section 1. Update the hub map, the root README, `library/README.md`, and every link that named `library/skills/`. Remove the empty directory in that change set. Retarget sections 4–9 of this note |
| C. Point from the hub | Add the category row from choice A, and add one authority-map row for the skill index. Amend the sentence that says the kit does not cite the library, in the same change set |

Do not rewrite pack procedures here. Sections 4–8 do that.

### Done when

`git` shows the tree in the chosen home, the category table names that home, and no current file still points at the old home.

### Log

## 3. Correct the law the packs will cite

| Field | Value |
|-------|--------|
| Status | open |
| Depends on | — |
| Owners this section edits | [contracts.md](../../kit/rules/contracts.md), [files.md](../../kit/rules/files.md) |

### Subject

Give the skill packs a true sentence to cite for style and SAST gates, for the files.md history, and for the markdown-standard anchor.

### Evidence

- [contracts.md](../../kit/rules/contracts.md) lists style and SAST gates under "language inventory + verification". The hub has no inventory and no verification table. The live baseline is [docs/security.md](../security.md). Language checks live under `library/platforms/`. The kit does not cite `library/`, so the contracts row has to name the baseline without pointing into the library unless section 1 choice C changed that rule.
- [files.md](../../kit/rules/files.md) front matter says `version: "1.3.2"` (commit `9a7a637`, 2026-10-14). The document history stops at 1.3.0.
- The same file links to `MARKDOWN-STANDARD.md#when-to-use-this-standard`. The heading is "When this applies" (`#when-this-applies`).

### Change

- Rewrite the contracts style/SAST row so it names [docs/security.md](../security.md) and says language checks sit outside the kit. Drop the inventory and verification-table wording.
- Add the missing files.md history rows for 1.3.1 and 1.3.2, or set `version` back to the latest history row if those bumps were only the version field. One outcome per bump.
- Retarget the files.md anchor to `#when-this-applies`.

Section 2 owns the new category row. This section does not add it.

### Done when

The three evidence items are gone, and each edited file's `description`, `version`, and `last_updated` match the edit.

### Log

## 4. Repair skill links and anchors

| Field | Value |
|-------|--------|
| Status | open |
| Depends on | 2 |
| Owners this section edits | The skill files named below |

### Subject

Make every relative link and every `related` path in the skill tree resolve. Leave procedure wording to section 5.

### Evidence

Front matter `related` still uses the old `kit/agents/` relative depth:

| File | `related` entry that does not resolve |
|------|----------------------------------------|
| [BUILD.md](../../library/skills/BUILD.md) | `../UPGRADE.md` |
| [RUNTIME.md](../../library/skills/RUNTIME.md) | `../RULES.md` |
| [OPS.md](../../library/skills/OPS.md) | `../rules/contracts.md` |
| [HABITAT.md](../../library/skills/HABITAT.md) | `../RULES.md`, `../rules/hygiene.md`, `../rules/files.md` |

Body links on existing files use anchors the targets no longer have:

| From | Anchor |
|------|--------|
| [OPS.md](../../library/skills/OPS.md) | `kit/RULES.md#operator-enforcement`, `#progress-tracker-minimum-shape` |
| [RUNTIME.md](../../library/skills/RUNTIME.md) | `MARKDOWN-STANDARD.md#density-force-and-incorporation` |
| [docs-author.md](../../library/skills/templates/docs-author.md) | `#density-force-and-incorporation`, `#when-to-use-this-standard`, `#description-identity` |
| [maintainer.md](../../library/skills/templates/maintainer.md), [reviewer.md](../../library/skills/templates/reviewer.md) | `versioning-and-git.md#commit-note-identity` |

[HABITAT.md](../../library/skills/HABITAT.md) links `kit/templates/TEMPLATE-HOST-ALIAS.md`. The file is [library/skills/templates/TEMPLATE-HOST-ALIAS.md](../../library/skills/templates/TEMPLATE-HOST-ALIAS.md).

[FRAMEWORK.md](../../library/skills/FRAMEWORK.md) and [RUNTIME.md](../../library/skills/RUNTIME.md) still name `kit/agents` as a living path.

### Change

Retarget each row to a file and an anchor that exist after sections 2 and 3. Where the body link was already corrected and only `related` is stale, fix `related`. Drop a `related` entry whose target was retired (`hygiene.md`) instead of inventing a new peer.

### Done when

A link check of the skill tree reports no missing file and no missing anchor, outside fenced samples.

### Log

## 5. Remove retired hub requirements

| Field | Value |
|-------|--------|
| Status | open |
| Depends on | 3, 4 |
| Owners this section edits | [OPS.md](../../library/skills/OPS.md), [FRAMEWORK.md](../../library/skills/FRAMEWORK.md), [RUNTIME.md](../../library/skills/RUNTIME.md), [CATALOG.md](../../library/skills/CATALOG.md), [BUILD.md](../../library/skills/BUILD.md), [PLAN-HOOK.md](../../library/skills/PLAN-HOOK.md), [HABITAT.md](../../library/skills/HABITAT.md), and the seed templates that still require the retired gates |

### Subject

Stop the skill procedure from requiring hub sections that 3.0.0 removed.

### Evidence

The live hub's completion rule is [kit/RULES.md#completion](../../kit/RULES.md#completion): do not claim the work done if a declared check was skipped. This repository's check is the [author checklist](../../kit/MARKDOWN-STANDARD.md#author-checklist).

[OPS.md](../../library/skills/OPS.md) still tells step 2 to open a language inventory and a verification table, step 10 and the report shape to run Domain A/B gates, and the parent to own a progress tracker. The same requirements remain in FRAMEWORK, RUNTIME, CATALOG, BUILD, PLAN-HOOK, HABITAT, and in the implementer, security, docs-author, maintainer, and reviewer packs. [skills-evaluation-rework.md](./skills-evaluation-rework.md#packs-restate-kit-owners) lists the packs.

### Change

Replace those requirements with the completion sentence and, for security and style, the owner section 3 wrote. Delete Domain A/B, the inventory, the verification table, operator enforcement, and the progress tracker from procedure, verify lists, and report shape. Do not add those sections back to the hub.

### Done when

A search of the skill tree finds those retired requirements only inside a log or a "removed" history row.

### Log

## 6. Keep one copy of each Instruct rule

| Field | Value |
|-------|--------|
| Status | open |
| Depends on | 5 |
| Owners this section edits | The skill files the overlap map names. Survivors keep the rule. The other copies lose it |

### Subject

Leave each Instruct rule in one owner. The overlap map is the inventory. This section is the cut.

### Evidence

[skills-evaluation-rework.md](./skills-evaluation-rework.md#same-rule-several-files) lists ten rules that are copied across README, FRAMEWORK, PARAMS, RUNTIME, OPS, HABITAT, BUILD, PLAN-HOOK, CATALOG, and the examples. Personas are stored in [CATALOG.md](../../library/skills/CATALOG.md), [templates/](../../library/skills/templates/), and [generated-maintainer.sample.md](../../library/skills/examples/generated-maintainer.sample.md). The crew is indexed in CATALOG, [orchestrator/README.md](../../library/skills/orchestrator/README.md), and [orchestrator/INSTALL.md](../../library/skills/orchestrator/INSTALL.md).

Four surfaces are the owners to keep, already named in the overlap map: PARAMS (schema), BUILD (emit), HABITAT (host catalog), and the orchestrator reporting contracts.

### Change

For each row in the overlap map, name the single owner in this section's log, delete the repeated prose from the other files, and leave a link to that owner. Decide the fate of the maintainer sample and the PLAN snippet: keep one example, or drop both if the template is the example. Do this after section 5 so the surviving copy is the corrected procedure.

### Done when

Each overlap-map row has one owner recorded here, and the other files link to it.

### Log

## 7. Make surviving packs cite owners

| Field | Value |
|-------|--------|
| Status | open |
| Depends on | 6 |
| Owners this section edits | The seed templates and crew packs that section 6 kept |

### Subject

A pack points at the kit owner. It does not restate the owner's rule.

### Evidence

The maintainer pack still requires a project-root changelog in Keep a Changelog form and cites `https://keepachangelog.com/en/1.1.0/`. The kit changelog is the one-sentence index in [kit/CHANGELOG.md](../../kit/CHANGELOG.md). Commit law lives in [git-commit.md](../../kit/rules/git-commit.md) and [versioning-and-git.md](../../kit/rules/versioning-and-git.md).

The other seeds restate contracts, files, the markdown standard, SETUP, UPGRADE, the workboard, and completion. The security pack still owns the retired inventory. The table is [skills-evaluation-rework.md](./skills-evaluation-rework.md#packs-restate-kit-owners).

### Change

Reduce each surviving pack to the job, the triggers, the authority paths, and the procedure steps that are not already in those paths. Point the maintainer at the changelog sentence. Point security at [docs/security.md](../security.md). Leave schema and emit detail in PARAMS and BUILD.

### Done when

Reading a pack and then its authority path does not produce two different statements of the same rule.

### Log

## 8. Refresh skill identity fields

| Field | Value |
|-------|--------|
| Status | open |
| Depends on | 6, 7 |
| Owners this section edits | Each skill markdown file that sections 4–7 changed |

### Subject

After the prose is cut, make front matter and the opening paragraph describe the file as it is.

### Evidence

The author checklist requires the first sentence of `description` to match the lead under the title. These current leads do not match:

- [README.md](../../library/skills/README.md), [FRAMEWORK.md](../../library/skills/FRAMEWORK.md), [PARAMS.md](../../library/skills/PARAMS.md), [CATALOG.md](../../library/skills/CATALOG.md), [PLAN-HOOK.md](../../library/skills/PLAN-HOOK.md), [BUILD.md](../../library/skills/BUILD.md), [RUNTIME.md](../../library/skills/RUNTIME.md), [OPS.md](../../library/skills/OPS.md), [HABITAT.md](../../library/skills/HABITAT.md)
- [orchestrator/README.md](../../library/skills/orchestrator/README.md), [orchestrator/INSTALL.md](../../library/skills/orchestrator/INSTALL.md)

`last_updated` is 2026-08-21 on FRAMEWORK and RUNTIME, and 2026-09-01 on OPS, while the bodies already mention `library/skills/`. Document versions sit on the 2.x kit. Refresh them only for files this sequence actually changes. A version-only edit does not bump `last_updated`. A structural edit bumps `version` and adds a history row where the file already has one.

### Change

Rewrite `description` and the lead so they are the same sentence and would be wrong on a sibling file. Set `last_updated` to the date of the structural edit. Bump `version` and add the history row.

### Done when

Every file this sequence edited passes the author checklist.

### Log

## 9. Index the skill directories that remain

| Field | Value |
|-------|--------|
| Status | open |
| Depends on | 6 |
| Owners this section edits | `library/skills/examples/`, `library/skills/templates/`, `library/skills/generated/`, and [library/skills/README.md](../../library/skills/README.md) |

### Subject

Give each remaining skill directory the index the placement rule requires, and settle the empty emit target.

### Evidence

[files.md](../../kit/rules/files.md#directory-index) requires a directory README in the same change set as a new navigable directory of intentional files. `examples/` and `templates/` have no README. The parent README names both. `generated/` is tracked and contains only `.gitkeep`. The placement rule calls regenerable output gitignored. BUILD still expects that keep file so the emit directory exists.

### Change

If section 6 keeps `examples/` or `templates/`, add a file-to-function README whose function cell is the role in that folder, one line, and is not a paste of YAML `description`. If a directory is removed, delete it in section 6 and skip its index here.

For `generated/`, either keep `.gitkeep` and say in the parent index that the directory is the emit target and ships empty, or stop tracking it and say where an adopter creates it. One of those, recorded in the log.

### Done when

Every remaining skill directory that holds intentional files has an index, and `generated/` matches the sentence chosen above.

### Log

## 10. Repair workboard pointers

| Field | Value |
|-------|--------|
| Status | open |
| Depends on | 2 |
| Owners this section edits | [docs/WORKBOARD.md](../WORKBOARD.md) |

### Subject

Make the current workboard point at owners that exist.

### Evidence

[docs/WORKBOARD.md](../WORKBOARD.md) is dated 2026-09-22. Primary program is `none`. These links do not resolve:

- `kit/rules/workboard.md` in front matter and in two body links. The hub names this board as the multi-phase owner.
- `kit/agents/orchestrator/README.md` in the completed-program table. The crew index is [library/skills/orchestrator/README.md](../../library/skills/orchestrator/README.md), unless section 2 moved it.

The progress log ends at orchestrator-portability 2.15.0. Kit 3.0.0 is not on the board. `related` also lists seven archive annexes. A substantial doc keeps 3–7 peers. After the retired path is removed, recount.

### Change

Retarget the policy links to this board and to [kit/RULES.md](../../kit/RULES.md). Retarget the orchestrator row to the home from section 2. Add a log line that 3.0.0 shipped, with the changelog section, only if that line is still true when this section runs. Drop `related` entries until the list is in range. Refresh `description`, the lead, `version`, and `last_updated`.

### Done when

Every link in the workboard resolves, and the board's status lines match the programs that are actually open.

### Log

## 11. Repair platform links

| Field | Value |
|-------|--------|
| Status | open |
| Depends on | 2 |
| Owners this section edits | [style-gates.md](../../library/platforms/style-gates.md), [TEMPLATE-CERTIFICATION-README.md](../../library/platforms/TEMPLATE-CERTIFICATION-README.md), and the four files in [library/platforms/examples/](../../library/platforms/examples/) |

### Subject

Retarget platform documents that still link as if they lived under `kit/`.

### Evidence

Outside fenced blocks, current files have these missing targets:

| Area | Missing links | Pattern |
|------|---------------|---------|
| The four example fills | 44 | `../rules/`, `../agents/`, `../templates/`, `../MARKDOWN-STANDARD.md` |
| [style-gates.md](../../library/platforms/style-gates.md) | 37 | `../configs/`, `./verification-and-ops.md`, `./security.md`, `./contracts.md` |
| [TEMPLATE-CERTIFICATION-README.md](../../library/platforms/TEMPLATE-CERTIFICATION-README.md) | 5 | `../rules/security.md`, `../RULES.md`, `../CHANGELOG.md` |

Tool configs now sit beside the language: `pylintrc`, `rustfmt.toml`, `clippy.toml`, `clang-format`, `clang-tidy`. The security baseline is [docs/security.md](../security.md). Markdown law is [kit/MARKDOWN-STANDARD.md](../../kit/MARKDOWN-STANDARD.md). Several of those links also use retired anchors (`#density-force-and-incorporation`, `#language-surface-inventory`).

### Change

Point each link at the current file and a heading that exists. Where the example is an illustrative fill for an adopted repo, keep the adopted-repo path in the example body and fix the links that claim to be this repository. Record that split in the log so a later pass does not "fix" an adopted-repo path back into `library/`.

### Done when

A link check of `library/platforms/` reports no missing target outside `archive/` and outside fenced adopted-repo samples.

### Log

## 12. Align platform descriptions and indexes

| Field | Value |
|-------|--------|
| Status | open |
| Depends on | 11 |
| Owners this section edits | The platform policy packs, their READMEs, and [library/platforms/README.md](../../library/platforms/README.md) |

### Subject

Make platform descriptions match their leads, and name the intentional files the indexes skip.

### Evidence

The language and OS policy packs use "Curated map of…" in `description` and "Reference pack for…" under the title. The family READMEs use "Modular … policy maps" in `description` and "Curated maps of what each layer actually checks" as the lead. The author checklist requires one sentence.

[library/platforms/README.md](../../library/platforms/README.md) does not name `CHANGELOG.md`, `LICENSE`, `TEMPLATE-CERTIFICATION-README.md`, or `pyproject.toml`. The Python directory README does not name `pylintrc`. The C and Rust READMEs do name their tool configs.

### Change

Pick one opening sentence per file and use it in both places. Add index rows for the files a reader can open. Leave `.gitignore` off the index. A function cell is one line and is not a paste of `description`.

### Done when

Those descriptions match their leads, and each named sibling appears in its directory README.

### Log

## 13. Decide the platform changelog schema

| Field | Value |
|-------|--------|
| Status | open |
| Depends on | 3 |
| Owners this section edits | [library/platforms/CHANGELOG.md](../../library/platforms/CHANGELOG.md), and the maintainer pack only if section 7 has not already removed the Keep a Changelog citation |

### Subject

Choose whether the platform history file keeps Keep a Changelog categories.

### Evidence

[kit/CHANGELOG.md](../../kit/CHANGELOG.md) is one sentence per notable version under `## repo-kit`. [library/platforms/CHANGELOG.md](../../library/platforms/CHANGELOG.md) requires Keep a Changelog categories under `## dev-policy`. Its current section is `[1.1.0] - 2026-10-02`. The maintainer pack repeats the Keep a Changelog citation. Section 7 removes that from the pack if the pack survives.

### Change

Either rewrite the platform changelog to the kit's one-sentence shape, or record in this log that `## dev-policy` keeps its own schema and the kit sentence does not govern it. Do not leave both files claiming to be the same rule.

### Done when

The log names the schema, and both changelog files follow that decision.

### Log

## 14. Close the docs workspace gaps

| Field | Value |
|-------|--------|
| Status | open |
| Depends on | — |
| Owners this section edits | [docs/README.md](../README.md), [docs/security.md](../security.md), [docs/plan/README.md](../plan/README.md), [docs/project_build/README.md](../project_build/README.md), [docs/resources/README.md](../resources/README.md) |

### Subject

Make the docs indexes and the security baseline match the markdown standard.

### Evidence

- [docs/README.md](../README.md) does not list [TEMPLATE-SECURITY.md](../TEMPLATE-SECURITY.md).
- [docs/security.md](../security.md) has two `related` peers. A substantial doc lists 3–7.
- These leads do not match their descriptions: [docs/plan/README.md](../plan/README.md) ("Detailed execution plans for kit work."), [docs/project_build/README.md](../project_build/README.md), [docs/resources/README.md](../resources/README.md). The plan index was last updated 2026-09-22.

### Change

Add the template to the docs index, or move it next to the other skeletons under `kit/templates/` if that is its role. Bring `related` on the security baseline into range with peers that exist. Align the three index leads with the first sentence of `description`.

### Done when

The docs index names every intentional child, the security baseline has 3–7 `related` peers, and the three leads match.

### Log

## 15. Decide archive and research links

| Field | Value |
|-------|--------|
| Status | open |
| Depends on | 10 |
| Owners this section edits | `docs/plan/archive/`, `docs/research/repo-kit-rework.md`, `docs/research/repo-kit-rules-enhancement.md`, and the platform `archive/` READMEs only if this section chooses to retarget them |

### Subject

Decide whether historical notes keep broken links to retired modules.

### Evidence

Current research notes contain 9 relative links to retired files (`continuity.md`, `hygiene.md`, `architecture.md`, `verification-and-ops.md`). `docs/plan/archive/` contains 27, mostly `kit/rules/workboard.md` and `kit/agents/`. Three density ledgers have no front matter. Archive packs use `status: archived` or `status: archive`, outside `draft` | `current` | `deprecated`.

These files are the record of the deletion. Retargeting every historical citation rewrites the record. Leaving them makes the author checklist fail if someone treats archive as current.

### Change

Pick one and write it here:

| Choice | Work |
|--------|------|
| Keep the record | Add one sentence to [docs/plan/README.md](../plan/README.md) and [docs/research/README.md](./README.md) that archive links and archive `status` values are historical and are not a current-file defect. Do not retarget |
| Retarget | Point each link at the successor, or convert it to plain text when the successor is "removed". Leave status values as they are if the keep-the-record sentence covers them |

### Done when

The log names the choice, and the files match it.

### Log

## 16. Record accepted exceptions

| Field | Value |
|-------|--------|
| Status | open |
| Depends on | 1–15 |
| Owners this section edits | This file |

### Subject

Close the audit items that are already consistent with the kit, so a later pass does not reopen them.

### Evidence

Checked on 2026-10-15 and left alone:

| Item | Why it stays |
|------|----------------|
| Root [README.md](../../README.md) | `## Overview`, then `## Operator prompts`. No front matter |
| Root [AGENTS.md](../../AGENTS.md) | The five-step session order |
| No root `CHANGELOG.md` | This repository is the kit. History is [kit/CHANGELOG.md](../../kit/CHANGELOG.md) |
| No `src/` | Docs-only kit. The placement rule allows that |
| No product `SECURITY.md` | The repo does not execute, take the network, elevate, or handle secrets. The baseline note is [docs/security.md](../security.md) |
| Product skeletons | `TEMPLATE-CLI`, `TEMPLATE-README`, `TEMPLATE-CONCEPT`, `TEMPLATE-METHODOLOGY`, `TEMPLATE-LANDING-README`, and `docs/TEMPLATE-SECURITY.md` use placeholder dates, extra `doc_type` values, and sibling links (`README.md`, `SECURITY.md`, `CLI-GUIDE.md`) that exist after the skeleton is copied into a package |
| AgentPack YAML | The twelve pack files use `id` / `layer` / `activation` front matter. That is the pack format, not a missing markdown-standard block |
| `kit/` without a directory README | The index rule is forward-only. `kit/`, `kit/rules/`, `kit/templates/`, and `kit/examples/` predate that rule |

### Change

After sections 1–15 are `done` or `dropped`, reread this table. Delete any row that a section changed. Add a row for any new exception a section recorded. Set this section to `done` only when the table matches the tree.

### Done when

The table matches the tree, and no open audit item is missing from sections 1–15 or from this table.

### Log

## Progress

| Date | Event |
|------|--------|
| 2026-10-15 | Sequence opened from the repository audit. Sections 1–16 are `open`. Decision in section 1 is undecided. |
