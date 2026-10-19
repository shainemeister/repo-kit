---
title: "Skill pack sequence"
description: "Closed repair queue for the skill-pack move and the later platform audit. Sections 1–10 keep the earlier path names."
version: "1.4.12"
status: deprecated
audience:
  - ai-agents
  - maintainers
doc_type: other
related:
  - ./repo-kit-rework.md
  - ../../kit/skills/README.md
  - ../../docs/library/kit-adopter/skills/kit-map-layers/SKILL.md
  - ../../kit/RULES.md
  - ../../kit/rules/path-pattern.md
  - ../../WORKBOARD.md
last_updated: "2026-10-19"
---

# Skill pack sequence

Closed repair queue for the skill-pack move and the later platform audit.

**Related:** [rework record](./repo-kit-rework.md) · [skills](../../kit/skills/README.md) · [layers](../../docs/library/kit-adopter/skills/kit-map-layers/SKILL.md) · [RULES](../../kit/RULES.md) · [path pattern](../../kit/rules/path-pattern.md) · [workboard](../../WORKBOARD.md)

Draft only. This note is the order of work and the inventory for that work. It is not kit law. The overlap tables below were taken on 2026-10-14, after the 3.0.0 move out of `kit/agents/`.

## How to use

Work one section at a time, in order. A later section starts when every section it depends on is `done` or `dropped`.

| Status | Meaning |
|--------|---------|
| `open` | Not started |
| `active` | The section in progress. One at a time |
| `done` | The "Done when" line is true, and the owners it names were updated together |
| `dropped` | Explicitly declined. Say why in the section log |
| `deferred` | Parked. Say what it is waiting on |

On each change of status, edit that section's status line and append a dated log line. When a section edits `kit/` or `library/`, register it on [docs/WORKBOARD.md](../../WORKBOARD.md) in the same change set. The board's own stale pointers are section 10, so the first registration also repairs the rows that registration would otherwise repeat.

Paths in sections 4–9 are `skills/`. Section 1 closed on root `skills/`. Section 2 recorded that home in `files.md`.

## Sequence

| # | Section | Status | Depends on |
|---|---------|--------|------------|
| 1 | Decide the skill home | done | — |
| 2 | Carry out the home decision | done | 1 |
| 3 | Correct the law the packs will cite | done | — |
| 4 | Repair skill links and anchors | done | 2 |
| 5 | Remove retired hub requirements | done | 3, 4 |
| 6 | Keep one copy of each Instruct rule | done | 5 |
| 7 | Make surviving packs cite owners | done | 6 |
| 8 | Refresh skill identity fields | done | 6, 7 |
| 9 | Index the skill directories that remain | done | 6 |
| 10 | Repair workboard pointers | done | 2 |
| 11 | Repair platform links | done | 2 |
| 12 | Align platform descriptions and indexes | done | 11 |
| 13 | Decide the platform changelog schema | done | 3 |
| 14 | Close the docs workspace gaps | done | — |
| 15 | Decide archive and research links | done | 10 |
| 16 | Record accepted exceptions | done | 1–15 |

## 1. Decide the skill home

| Field | Value |
|-------|--------|
| Status | done |
| Depends on | — |
| Owners this section edits | This file only |

### Subject

Choose where Agent Instruct and the orchestrator crew live before any skill file is rewritten.

### Evidence

The 3.0.0 record put Instruct in `library/skills/`. On 2026-10-15 that home was revised. Instruct and the orchestrator live in root `skills/`. The hub does not cite that tree. A skill cites the kit and does not restate it. Bare adopt still skips Instruct.

### Change

Closed. The choices below stay so a later reader can see what was declined.

| Choice | Result |
|--------|--------|
| A. Stay under `library/` | Superseded the same day. Procedure packs are not a reference set |
| B. Reintegrate under `kit/` | Declined |
| C. Point from the hub | Declined. `kit/RULES.md` does not gain a skills row |

**Decision:** Root `skills/`. `files.md` holds the category row. The hub stays silent.

**Chosen home:** `skills/`

### Done when

The two lines above name A, B, or C, and a log line records the date and the reason.

### Log

- 2026-10-15 — Opened. Decision not made.
- 2026-10-15 — Closed on A. The rework record is the decision. This queue does not reopen it.
- 2026-10-15 — Home revised. Root `skills/`, noun and verb filenames, agent-model contract folded into `plan.md`. B and C stay declined.

## 2. Carry out the home decision

| Field | Value |
|-------|--------|
| Status | done |
| Depends on | 1 |
| Owners this section edits | files.md, and the remainder row in [repo-kit-rework.md](./repo-kit-rework.md) |

### Subject

Record the root `skills/` home in the category table. Do not add a hub row.

### Evidence

`skills/` holds the procedure packs, `templates/`, `examples/`, `generated/.gitkeep`, and `orchestrator/`. `library/platforms/` stays the reference set. [library/README.md](../library/README.md) indexes platforms only.

### Change

One category row, home root `skills/`. [kit/RULES.md](../../kit/RULES.md) stays silent. The rework record names that home and drops the old remainder row.

Do not rewrite pack procedures here. Sections 4–8 do that.

### Done when

The category table names `skills/`, the packs are at that root, and the hub still has no skills row.

### Log

- 2026-10-15 — Done. Category row added. Packs moved out of `library/`.

## 3. Correct the law the packs will cite

| Field | Value |
|-------|--------|
| Status | done |
| Depends on | — |
| Owners this section edits | [contracts.md](../../kit/rules/contracts.md), files.md |

### Subject

Give the skill packs a true sentence to cite for style and SAST gates, for the files.md history, and for the markdown-standard anchor.

### Evidence

- [contracts.md](../../kit/rules/contracts.md) lists style and SAST gates under "language inventory + verification". The hub has no inventory and no verification table. The live baseline is [docs/security.md](../security.md). Language checks live under `library/platforms/`. The kit does not cite `library/`, so the contracts row names the baseline and says the language checks sit outside the kit.
- files.md front matter says `version: "1.3.2"` (commit `9a7a637`, 2026-10-14). The document history stops at 1.3.0.
- The same file links to `MARKDOWN-STANDARD.md#when-to-use-this-standard`. The heading is "When this applies" (`#when-this-applies`).

### Change

- Rewrite the contracts style/SAST row so it names [docs/security.md](../security.md) and says language checks sit outside the kit. Drop the inventory and verification-table wording.
- Add the missing files.md history rows for 1.3.1 and 1.3.2, or set `version` back to the latest history row if those bumps were only the version field. One outcome per bump.
- Retarget the files.md anchor to `#when-this-applies`.

Section 2 owns the new category row. This section does not add it.

### Done when

The three evidence items are gone, and each edited file's `description`, `version`, and `last_updated` match the edit.

### Log

- 2026-10-15 — Done. Style and SAST cite `docs/security.md`. `files.md` records 1.3.2 (no separate 1.3.1) and cites `#when-this-applies`.

## 4. Repair skill links and anchors

| Field | Value |
|-------|--------|
| Status | done |
| Depends on | 2 |
| Owners this section edits | The skill files named below |

### Subject

Make every relative link and every `related` path in the skill tree resolve. Leave procedure wording to section 5.

### Evidence

The home move retargeted the old `related` depths to files that exist, and pointed the host alias at `skills/kit-discover-host/TEMPLATE-HOST-ALIAS.md`. What remains is anchors the targets no longer have:

| From | Anchor |
|------|--------|
| run.md | `kit/RULES.md#operator-enforcement`, `#progress-tracker-minimum-shape` |
| RUNTIME.md | `MARKDOWN-STANDARD.md#density-force-and-incorporation` |
| docs-author.md | `#density-force-and-incorporation`, `#when-to-use-this-standard`, `#description-identity` |
| maintainer.md, reviewer.md | `versioning-and-git.md#commit-note-identity` |

### Change

Retarget each row to a file and an anchor that exist after sections 2 and 3. Where the body link was already corrected and only `related` is stale, fix `related`. Drop a `related` entry whose target was retired (`hygiene.md`) instead of inventing a new peer.

### Done when

A link check of the skill tree reports no missing file and no missing anchor, outside fenced samples.

### Log

- 2026-10-15 — Done with the compliance pass. Dead anchors in the evidence table were removed from the packs. Each pack now lives in its own directory.

## 5. Remove retired hub requirements

| Field | Value |
|-------|--------|
| Status | done |
| Depends on | 3, 4 |
| Owners this section edits | run.md, FRAMEWORK.md, RUNTIME.md, catalog.md, build.md, plan.md, habitat.md, and the seed templates that still require the retired gates |

### Subject

Stop the skill procedure from requiring hub sections that 3.0.0 removed.

### Evidence

The live hub's completion rule is [kit/RULES.md#completion](../../kit/RULES.md#completion): do not claim the work done if a declared check was skipped. This repository's check is the [author checklist](../../kit/MARKDOWN-STANDARD.md#author-checklist).

Before this pass, run.md told step 2 to open a language inventory and a verification table, step 10 and the report shape to run Domain A/B gates, and the parent to own a progress tracker. The same requirements were in framework, runtime, catalog, build, plan, habitat, and in the implementer, security, docs-author, maintainer, and reviewer packs. Section 7 names each pack and the owner it repeated.

### Change

Replace those requirements with the completion sentence and, for security and style, the owner section 3 wrote. Delete Domain A/B, the inventory, the verification table, operator enforcement, and the progress tracker from procedure, verify lists, and report shape. Do not add those sections back to the hub.

### Done when

A search of the skill tree finds those retired requirements only inside a log or a "removed" history row.

### Log

- 2026-10-15 — Done. Packs cite completion and `docs/security.md`. The retired gate names are gone from procedure text.

## 6. Keep one copy of each Instruct rule

| Field | Value |
|-------|--------|
| Status | done |
| Depends on | 5 |
| Owners this section edits | The skill files named in the tables below. Survivors keep the rule. The other copies lose it |

### Subject

Leave each Instruct rule in one owner. The tables below are the inventory. This section is the cut.

### Evidence

The same rule is written in several files:

| Rule | Copies |
|------|--------|
| L0–L4, and L4 wins | README layers, FRAMEWORK layers and hard rules, HABITAT three habitats, PARAMS trust, OPS steps 2 and 7 |
| One primary pack; compose only for a second concern | FRAMEWORK compose default, RUNTIME compose default, OPS steps 4–5 and parent/child, CATALOG compose-matrix intro |
| Bare adopt skips BUILD and O3 | PLAN-HOOK dual path, README, FRAMEWORK, RUNTIME, OPS, HABITAT, BUILD resolution, PLAN snippet |
| Active models: absent, unset, or empty | PLAN-HOOK field contract and BUILD resolution rules, plus the snippet comment |
| Overlays stay in-repo; citations are not law | PLAN-HOOK, BUILD fill rules, PARAMS expertise, OPS expertise, FRAMEWORK hard rules 7 and 12, anti-patterns |
| Activation modes and size budgets | PARAMS enums and RUNTIME activation and budgets; FRAMEWORK repeats the size table |
| O3 steps | Full text in OPS. Shortened again in RUNTIME matching guidance and FRAMEWORK hard rule 11 |
| Regen, new persona, durable vs this session | OPS lifecycle and creating a persona, PLAN-HOOK mid-project and durable vs session, BUILD regen triggers, PARAMS user-instruction deltas |
| Anti-patterns | Short table in OPS; longer table in anti-patterns covering the same failures |
| Pack shape and the doc index | README pack-format note and PARAMS pack-format doctrine. README start-here and document index list the same files |

Before this pass, catalog rows copied each seed's authority paths and verify list, `templates/` held the same YAML, and a generated maintainer sample was a third maintainer pack. Those extra copies are gone. The paste example is kit-author-plan/example.md. The failure list is kit-use-instruct/example.md.

The seven seeds are plan-author, adopter, maintainer, implementer, docs-author, security, and reviewer. `generated/` has no live packs.

The four crew ids are listed in CATALOG, [dispatch-crew/SKILL.md](../library/archive/dispatch-crew/SKILL.md), and [orchestrator/INSTALL.md](../library/archive/dispatch-crew/INSTALL.md): [orchestrator-router](../library/archive/dispatch-crew/router.md), [orchestrator-scout](../library/archive/dispatch-crew/scout.md), [orchestrator-builder](../library/archive/dispatch-crew/builder.md), and [orchestrator-reviewer](../library/archive/dispatch-crew/review.md). [orchestrator-reviewer](../library/archive/dispatch-crew/review.md) and the seed reviewer are two review roles. The [router](../library/archive/dispatch-crew/router.md) procedure repeats the OPS smallest-set rule. Section 7 separates that role pair. This section only stops the router from repeating OPS.

These four surfaces stay. They are the owners, not extra copies:

| Surface | Owns |
|---------|------|
| params.md | AgentPack schema, enums, and validation |
| build.md | Emit algorithm and source load order |
| habitat.md | Host catalog and alias evidence |
| Orchestrator reporting contracts | What each crew pack returns to the parent |

### Change

For each row in the rule table, name the single owner in this section's log, delete the repeated prose from the other files, and leave a link to that owner. Decide the fate of the maintainer sample and the PLAN snippet: keep one example, or drop both if the template is the example. Do this after section 5 so the surviving copy is the corrected procedure.

### Done when

Each rule-table row has one owner recorded here, and the other files link to it.

### Log

- 2026-10-15 — Done. Owners: layers in framework.md; one primary and O3 in run.md; bare adopt, active models, trust, durable versus session, and mid-project edits in plan.md; activation enums and pack shape in params.md; load and size budgets in runtime.md; regen in build.md; failures in kit-use-instruct/example.md; the paste specimen in kit-author-plan/example.md; the host alias in TEMPLATE-HOST-ALIAS.md; the tree index in skills/README.md; the match index in catalog.md; the crew list in [dispatch-crew/SKILL.md](../library/archive/dispatch-crew/SKILL.md). The generated maintainer sample is dropped. Shared `examples/` and `templates/` are gone.
- 2026-10-15 — Later cut, outside sections 11–16. One skill per task. `dispatch-crew` is deprecated. This kit does not delegate to another agent. The evidence above records the tree before that cut. Sections 11–16 stay open.

## 7. Make surviving packs cite owners

| Field | Value |
|-------|--------|
| Status | done |
| Depends on | 6 |
| Owners this section edits | The seed templates and crew packs that section 6 kept |

### Subject

A pack points at the kit owner. It does not restate the owner's rule.

### Evidence

Before this pass, each surviving pack restated a kit owner:

| Pack | Owner it repeats |
|------|------------------|
| maintainer | Commit messages, versioning, and the changelog sentence. It also cites Keep a Changelog and `https://keepachangelog.com/en/1.1.0/`. This kit's history is the one-sentence index in [kit/CHANGELOG.md](../../kit/CHANGELOG.md). Commit law is [git-commit.md](../../kit/rules/git-commit.md) and [versioning-and-git.md](../../kit/rules/versioning-and-git.md) |
| implementer | [contracts.md](../../kit/rules/contracts.md), files.md, and completion |
| docs-author | [MARKDOWN-STANDARD.md](../../kit/MARKDOWN-STANDARD.md) |
| adopter | SETUP.md, [UPGRADE.md](../../kit/UPGRADE.md), and the kit baseline |
| plan-author | PLAN-HOOK and [docs/WORKBOARD.md](../../WORKBOARD.md) |
| security | The old language inventory and Domain A/B gates. The live baseline is [docs/security.md](../security.md) |
| reviewer | Completion, plus the other packs' checks. [orchestrator-reviewer](../library/archive/dispatch-crew/review.md) is a second review role |
| HABITAT | TEMPLATE-AGENTS.md and the session order |

Current [kit/RULES.md](../../kit/RULES.md) is a short map. It has no language inventory, verification table, or progress tracker.

### Change

Reduce each surviving pack to the job, the triggers, the authority paths, and the procedure steps that are not already in those paths. Point the maintainer at the changelog sentence. Point security at [docs/security.md](../security.md). Leave schema and emit detail in PARAMS and BUILD.

### Done when

Reading a pack and then its authority path does not produce two different statements of the same rule.

### Log

- 2026-10-15 — Done. Seeds cite the owner and keep the job. Security no longer requires a language inventory. The crew no longer names an inventory or a verify table.

## 8. Refresh skill identity fields

| Field | Value |
|-------|--------|
| Status | done |
| Depends on | 6, 7 |
| Owners this section edits | Each skill markdown file that sections 4–7 changed |

### Subject

After the prose is cut, make front matter and the opening paragraph describe the file as it is.

### Evidence

The author checklist requires the first sentence of `description` to match the lead under the title. These current leads do not match:

- README.md, FRAMEWORK.md, params.md, catalog.md, plan.md, build.md, RUNTIME.md, run.md, habitat.md
- [dispatch-crew/SKILL.md](../library/archive/dispatch-crew/SKILL.md), [orchestrator/INSTALL.md](../library/archive/dispatch-crew/INSTALL.md)

`last_updated` is 2026-08-21 on FRAMEWORK and RUNTIME, and 2026-09-01 on OPS, while the bodies already mention `skills/`. Document versions sit on the 2.x kit. Refresh them only for files this sequence actually changes. A version-only edit does not bump `last_updated`. A structural edit bumps `version` and adds a history row where the file already has one.

### Change

Rewrite `description` and the lead so they are the same sentence and would be wrong on a sibling file. Set `last_updated` to the date of the structural edit. Bump `version` and add the history row.

### Done when

Every file this sequence edited passes the author checklist.

### Log

- 2026-10-15 — Done for the skill tree. The description's first sentence matches the lead on the instruct docs, the directory indexes, the rewritten seeds, and the four crew role files. `kit/rules/contracts.md` was not in this section. Platform examples stay in section 12.

## 9. Index the skill directories that remain

| Field | Value |
|-------|--------|
| Status | done |
| Depends on | 6 |
| Owners this section edits | `skills/examples/`, `skills/templates/`, `skills/generated/`, and skills/README.md |

### Subject

Give each remaining skill directory the index the placement rule requires, and settle the empty emit target.

### Evidence

files.md requires a directory README in the same change set as a new navigable directory of intentional files. The home move added those indexes. `generated/` is tracked and contains only `.gitkeep`. The parent index says it ships empty. Section 6 still decides whether `examples/` and `templates/` stay.

### Change

If section 6 keeps `examples/` or `templates/`, add a file-to-function README whose function cell is the role in that folder, one line, and is not a paste of YAML `description`. If a directory is removed, delete it in section 6 and skip its index here.

For `generated/`, either keep `.gitkeep` and say in the parent index that the directory is the emit target and ships empty, or stop tracking it and say where an adopter creates it. One of those, recorded in the log.

### Done when

Every remaining skill directory that holds intentional files has an index, and `generated/` matches the sentence chosen above.

### Log

- 2026-10-15 — Done. Section 6 removed shared `examples/` and `templates/`. Each pack directory has a thin index. A companion file exists only where a specimen already did: kit-author-plan/example.md, kit-use-instruct/example.md, and TEMPLATE-HOST-ALIAS.md. `generated/` stays an empty emit target named from skills/README.md, with no index of its own.

## 10. Repair workboard pointers

| Field | Value |
|-------|--------|
| Status | done |
| Depends on | 2 |
| Owners this section edits | [docs/WORKBOARD.md](../../WORKBOARD.md) |

### Subject

Make the current workboard point at owners that exist.

### Evidence

[docs/WORKBOARD.md](../../WORKBOARD.md) is dated 2026-09-22. Primary program is `none`. These links do not resolve:

- `kit/rules/workboard.md` in front matter and in two body links. The hub names this board as the multi-phase owner.
- `kit/agents/dispatch-crew/SKILL.md` in the completed-program table. The crew index is [skills/dispatch-crew/SKILL.md](../library/archive/dispatch-crew/SKILL.md), unless section 2 moved it.

The progress log ends at orchestrator-portability 2.15.0. Kit 3.0.0 is not on the board. `related` also lists seven archive annexes. A substantial doc keeps 3–7 peers. After the retired path is removed, recount.

### Change

Retarget the policy links to this board and to [kit/RULES.md](../../kit/RULES.md). Retarget the orchestrator row to the home from section 2. Add a log line that 3.0.0 shipped, with the changelog section, only if that line is still true when this section runs. Drop `related` entries until the list is in range. Refresh `description`, the lead, `version`, and `last_updated`.

### Done when

Every link in the workboard resolves, and the board's status lines match the programs that are actually open.

### Log

- 2026-10-15 — Done with the home move. Retired paths retargeted. Active program is `skills-home`.

## 11. Repair platform links

| Field | Value |
|-------|--------|
| Status | done |
| Depends on | 2 |
| Owners this section edits | [style-gates.md](../library/platforms/style-gates.md), [TEMPLATE-CERTIFICATION-README.md](../library/platforms/TEMPLATE-CERTIFICATION-README.md), and the four files in [library/platforms/examples/](../library/platforms/examples/) |

### Subject

Retarget platform documents that still link as if they lived under `kit/`.

### Evidence

Outside fenced blocks, current files have these missing targets:

| Area | Missing links | Pattern |
|------|---------------|---------|
| The four example fills | 44 | `../rules/`, `../agents/`, `../templates/`, `../MARKDOWN-STANDARD.md` |
| [style-gates.md](../library/platforms/style-gates.md) | 37 | `../configs/`, `./verification-and-ops.md`, `./security.md`, `./contracts.md` |
| [TEMPLATE-CERTIFICATION-README.md](../library/platforms/TEMPLATE-CERTIFICATION-README.md) | 5 | `../rules/security.md`, `../RULES.md`, `../CHANGELOG.md` |

Tool configs now sit beside the language: `pylintrc`, `rustfmt.toml`, `clippy.toml`, `clang-format`, `clang-tidy`. The security baseline is [docs/security.md](../security.md). Markdown law is [kit/MARKDOWN-STANDARD.md](../../kit/MARKDOWN-STANDARD.md). Several of those links also use retired anchors (`#density-force-and-incorporation`, `#language-surface-inventory`).

### Change

Point each link at the current file and a heading that exists. Where the example is an illustrative fill for an adopted repo, keep the adopted-repo path in the example body and fix the links that claim to be this repository. Record that split in the log so a later pass does not "fix" an adopted-repo path back into `library/`.

### Done when

A link check of `library/platforms/` reports no missing target outside `archive/` and outside fenced adopted-repo samples.

### Log

- 2026-10-19 — A link check of docs/library/platforms outside archive/ found no missing target. The old kit/ paths in that evidence are the record of what was repaired.

## 12. Align platform descriptions and indexes

| Field | Value |
|-------|--------|
| Status | done |
| Depends on | 11 |
| Owners this section edits | The platform policy packs, their READMEs, and [library/platforms/README.md](../library/platforms/README.md) |

### Subject

Make platform descriptions match their leads, and name the intentional files the indexes skip.

### Evidence

The language and OS policy packs use "Curated map of…" in `description` and "Reference pack for…" under the title. The family READMEs use "Modular … policy maps" in `description` and "Curated maps of what each layer actually checks" as the lead. The author checklist requires one sentence.

[library/platforms/README.md](../library/platforms/README.md) does not name `CHANGELOG.md`, `LICENSE`, `TEMPLATE-CERTIFICATION-README.md`, or `pyproject.toml`. The Python directory README does not name `pylintrc`. The C and Rust READMEs do name their tool configs.

### Change

Pick one opening sentence per file and use it in both places. Add index rows for the files a reader can open. Leave `.gitignore` off the index. A function cell is one line and is not a paste of `description`.

### Done when

Those descriptions match their leads, and each named sibling appears in its directory README.

### Log

- 2026-10-19 — Leads match descriptions. The indexes name CHANGELOG.md, LICENSE, examples/, TEMPLATE-CERTIFICATION-README.md, pylintrc, clang-format, clang-tidy, rustfmt.toml, and clippy.toml. pyproject.toml and sources.yaml are gone, so they are not indexed.

## 13. Decide the platform changelog schema

| Field | Value |
|-------|--------|
| Status | done |
| Depends on | 3 |
| Owners this section edits | [library/platforms/CHANGELOG.md](../library/platforms/CHANGELOG.md), and the maintainer pack only if section 7 has not already removed the Keep a Changelog citation |

### Subject

Choose whether the platform history file keeps Keep a Changelog categories.

### Evidence

[kit/CHANGELOG.md](../../kit/CHANGELOG.md) is one sentence per notable version under `## repo-kit`. [library/platforms/CHANGELOG.md](../library/platforms/CHANGELOG.md) requires Keep a Changelog categories under `## dev-policy`. Its current section is `[1.1.0] - 2026-10-02`. The maintainer pack repeats the Keep a Changelog citation. Section 7 removes that from the pack if the pack survives.

### Change

Either rewrite the platform changelog to the kit's one-sentence shape, or record in this log that `## dev-policy` keeps its own schema and the kit sentence does not govern it. Do not leave both files claiming to be the same rule.

### Done when

The log names the schema, and both changelog files follow that decision.

### Log

- 2026-10-19 — docs/library/platforms/CHANGELOG.md is one sentence per version under ## dev-policy and points at the kit sentence. kit/skills/kit-commit/SKILL.md does not cite Keep a Changelog.

## 14. Close the docs workspace gaps

| Field | Value |
|-------|--------|
| Status | done |
| Depends on | — |
| Owners this section edits | [docs/README.md](../README.md), [docs/security.md](../security.md), [docs/plan/README.md](../plan/README.md), [docs/project_build/README.md](../project_build/README.md), [docs/resources/README.md](../resources/README.md) |

### Subject

Make the docs indexes and the security baseline match the markdown standard.

### Evidence

- [docs/README.md](../README.md) does not list TEMPLATE-SECURITY.md.
- [docs/security.md](../security.md) has two `related` peers. A substantial doc lists 3–7.
- These leads do not match their descriptions: [docs/plan/README.md](../plan/README.md) ("Detailed execution plans for kit work."), [docs/project_build/README.md](../project_build/README.md), [docs/resources/README.md](../resources/README.md). The plan index was last updated 2026-09-22.

### Change

Add the template to the docs index, or move it next to the other skeletons under `kit/templates/` if that is its role. Bring `related` on the security baseline into range with peers that exist. Align the three index leads with the first sentence of `description`.

### Done when

The docs index names every intentional child, the security baseline has 3–7 `related` peers, and the three leads match.

### Log

- 2026-10-19 — TEMPLATE-SECURITY.md, docs/plan/SKILL.md, and docs/project_build/SKILL.md are not in the tree. docs/README.md names the children that exist. docs/security.md has three related peers. The plan, project-build, and resources leads match their descriptions.

## 15. Decide archive and research links

| Field | Value |
|-------|--------|
| Status | done |
| Depends on | 10 |
| Owners this section edits | `docs/plan/archive/` and the platform `archive/` READMEs, only if this section chooses to retarget them |

### Subject

Decide whether archive notes keep broken links to retired modules.

### Evidence

[repo-kit-rework.md](./repo-kit-rework.md) and [repo-kit-rules-enhancement.md](./repo-kit-rules-enhancement.md) name removed modules in plain text and link only to owners that exist. `docs/plan/archive/` still contains 27 links, mostly `kit/rules/workboard.md` and `kit/agents/`. Three density ledgers have no front matter. Archive packs use `status: archived` or `status: archive`, outside `draft` | `current` | `deprecated`.

These packs are the record of the deletion. Retargeting every historical citation rewrites that record. Leaving the links makes the author checklist fail if someone treats an archive pack as a current file.

### Change

Pick one and write it here:

| Choice | Work |
|--------|------|
| Keep the record | The sentence is on [docs/research/README.md](./README.md). The archive directories are not retargeted |
| Retarget | Point each link at the successor, or convert it to plain text when the successor is "removed". Leave status values as they are if the keep-the-record sentence covers them |

### Done when

The log names the choice, and the files match it.

### Log

- 2026-10-19 — Choice is keep the record. Archive links and archive status values stay historical. docs/plan/archive/ was not retargeted. The research index carries that sentence.

## 16. Record accepted exceptions

| Field | Value |
|-------|--------|
| Status | done |
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
| Product skeletons | Blanks live in `kit/skills/kit-author-docs/template/` and `kit/skills/kit-apply-security/template/security.md`. Placeholder tokens stay until an adopter fills them. |
| AgentPack YAML | Seed and shelf packs use id, layer, and activation. That is the pack format, not a missing markdown-standard block. |
| `kit/` without a directory README | The index rule is forward-only. `kit/rules/` has an index. `kit/templates/` and `kit/examples/` are gone. |

### Change

After sections 1–15 are `done` or `dropped`, reread this table. Delete any row that a section changed. Add a row for any new exception a section recorded. Set this section to `done` only when the table matches the tree.

### Done when

The table matches the tree, and no open audit item is missing from sections 1–15 or from this table.

### Log

- 2026-10-19 — The table matches the tree. Sections 1–15 are done.

## Progress

| Date | Event |
|------|--------|
| 2026-10-19 | Sections 11–16 are done. Sections 1–10 keep their earlier path names as plain text where the old target is gone. |
| 2026-10-15 | Sequence opened from the repository audit. Sections 1–16 are `open`. Decision in section 1 is undecided. |
| 2026-10-15 | Overlap inventory from `skills-evaluation-rework.md` folded into sections 6 and 7. That file is removed. This note is the working copy. |
| 2026-10-15 | Section 1 closed on A, then the home was revised to root `skills/`. |
| 2026-10-15 | Sections 2 and 10 done with that move. Compliance of the packs stays in sections 4–9. |
| 2026-10-15 | Later cut, outside sections 11–16: one skill per task. `dispatch-crew` is deprecated. No sub-agent delegation. Sections 11–16 stay open. |
| 2026-10-15 | The retired crew is archived at `library/archive/dispatch-crew/`. Sections 11–16 stay open. |
| 2026-10-15 | Seven action directories renamed: `emit-packs`, `use-instruct`, `apply-change`, `commit-version`, `author-docs`, `author-plan`, `review-change`. Ids stay. Sections 11–16 stay open. Section 14 still cites `docs/plan/SKILL.md`. |
| 2026-10-15 | The commit verb is `skills/commit/` (id `maintainer`). [git-commit.md](../../kit/rules/git-commit.md) keeps the principle. Sections 11–16 stay open. `kit-adopter` is not applied. |
| 2026-10-15 | The adopt verb is `skills/kit-adopter/` (id `adopter`). Sections 11–16 stay open. |
| 2026-10-15 | Pack cut. `apply-change` is the agnostic verb. Match rows live in `skills/README.md`. The other named packs cite their owners. Sections 11–16 stay open. |
| 2026-10-15 | Kit packs are `skills/kit-<action>/`. Ids stay. `kit-adopter` and `generated/` stay. Sections 11–16 stay open. |
| 2026-10-17 | Later program `kit-skill-path` moved the packs to `kit/skills/kit-<action>/`. Sections 1–10 keep the root-`skills/` record, so those links name the previous home. Sections 11–16 stay open. |
| 2026-10-17 | Later program `kit-skill-fold` removed `kit-load-packs` and `kit-match-agents`. Activation and size live in `kit-map-layers`. Match rows stay on the skills index. Sections 1–10 keep the earlier record. Sections 11–16 stay open. |
| 2026-10-17 | Later program `kit-homes` left eight repeated verbs in `kit/skills/`. Adopt and upgrade packs are `docs/library/kit-adopter/`. Sections 1–10 keep the earlier record. Sections 11–16 stay open. |
