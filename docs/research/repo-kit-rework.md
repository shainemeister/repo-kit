---
title: "Repo kit rework"
description: "Records settled rework decisions for a short agnostic kit whose descriptions stay generic, with library sets named platforms and skills and a condensed core. An adopted repository tailors its own descriptions. Not kit law until those owners change."
version: "1.6.0"
status: draft
audience:
  - ai-agents
  - developers
doc_type: other
related:
  - ../../kit/RULES.md
  - ../../kit/rules/files.md
  - ../../kit/rules/versioning-and-git.md
  - ../../kit/rules/contracts.md
  - ./repo-kit-rules-enhancement.md
  - ../../library/platforms/README.md
  - ../../library/skills/README.md
last_updated: "2026-10-13"
---

# Repo kit rework

Records settled rework decisions for a short agnostic kit whose descriptions stay generic, with library sets named platforms and skills and a condensed core.

**Related:** [RULES](../../kit/RULES.md) · [files.md](../../kit/rules/files.md) · [versioning-and-git](../../kit/rules/versioning-and-git.md) · [contracts](../../kit/rules/contracts.md) · [forked-path note](./repo-kit-rules-enhancement.md) · [platforms](../../library/platforms/README.md) · [skills](../../library/skills/README.md)

Draft only. Promoting it means editing those owners in one change set ([same-change-set](../../kit/rules/contracts.md#same-change-set-rule)).

## Summary

| Topic | Decision |
|-------|----------|
| Hub | [`kit/RULES.md`](../../kit/RULES.md) stays the authority map, written shorter and less directive |
| Changelog | A concise summary of notable changes. The git log holds the detail. Several commits in a day do not each earn a line |
| Commit law | New `kit/rules/git-commit.md` owns the template, its conditions, one example, and the required AI trailers |
| Paths | [`files.md`](../../kit/rules/files.md) keeps nouns, verbs, and fork awareness, in short form. Edge cases stay in the [forked-path note](./repo-kit-rules-enhancement.md) |
| Three trees | `kit/` is the core. `docs/` is the workspace. `library/` holds expansive reference sets |
| Platforms | [Platform packs](../../library/platforms/README.md) are the reference set. They now live at `library/platforms/` |
| Skills | [Skill packs](../../library/skills/README.md), including the orchestrator crew, now live at `library/skills/`. A skill cites the kit and does not restate it |
| Security | Language and OS detail stays inside those packs. A short fundamental baseline stays a workspace note until it grows into its own library set |
| Continuity overlay | Remove [`continuity.md`](../../kit/rules/continuity.md). The hub already covers that job. Do not keep a second copy |
| Workboard | [`docs/WORKBOARD.md`](../WORKBOARD.md) stays the multi-phase record. The kit states that practice in one line. An install maps the target repo on the board without waiting to be asked |
| `AGENTS.md` | Front-loads the hygiene principle and a short order. It points at [`files.md`](../../kit/rules/files.md) and does not collect policy |
| Hygiene | The principle lives in `AGENTS.md`: standards live in `kit/`, the project lives outside it, and a new path extends the file that already holds the role. [`hygiene.md`](../../kit/rules/hygiene.md) retires. Nouns, verbs, and the directory README stay in `files.md` |
| Architecture | Entry points, workflow composition, a documented cross-stack boundary, and a declared dependency policy become a few lines in [`contracts.md`](../../kit/rules/contracts.md). [`architecture.md`](../../kit/rules/architecture.md) retires. Source layout stays in `files.md` |
| Completion | One hub sentence: do not claim done if a check this repo declares was skipped. For this docs-only kit, that check is the markdown author checklist. [`verification-and-ops.md`](../../kit/rules/verification-and-ops.md) retires. Language gates leave with `library/platforms/` |
| README shape | [`MARKDOWN-STANDARD.md`](../../kit/MARKDOWN-STANDARD.md) stays and shrinks to the landing README, the directory-index README, and the minimum frontmatter. The author checklist enforces it |
| Install | [`SETUP.md`](../../kit/SETUP.md) and [`UPGRADE.md`](../../kit/UPGRADE.md) stay in this repository as a short install path. They are not copied into every product as standing law |
| Descriptions | Concise, maintainable, and definitional when a term needs a precise meaning. Kit text stays generic. An adopted repository replaces that with a description of its own files |

## Contents

1. [Core](#core)
2. [Workspace and library](#workspace-and-library)
3. [Commit law](#commit-law)
4. [Rewrite rules](#rewrite-rules)

## Core

The kit remains a modular, language-agnostic setup kit. An adopted copy contains the core only.

| Piece | Role |
|-------|------|
| `kit/RULES.md` | Map plus a short Must index. One line and a link per row |
| `kit/rules/files.md` | Where a path goes, noun modules, verb functions, and how to extend an existing file |
| `kit/rules/git-commit.md` | Commit template and conditions. Created on promotion |
| `kit/rules/contracts.md` | One owner per rule, same-change-set updates, and the short architecture lines |
| `kit/rules/versioning-and-git.md` | Version surfaces and what git tracks. Changelog detail leaves this file |
| `kit/MARKDOWN-STANDARD.md` | Landing README, directory-index README, and the minimum frontmatter. Kept smaller |
| `kit/SETUP.md`, `kit/UPGRADE.md` | Short install path for this repository. Not standing law in every product |
| `AGENTS.md` | Hygiene principle, then the session order. Points at `files.md` |
| `docs/WORKBOARD.md` | Open work for a project that runs more than one phase. Also the map an install builds |

The changelog rule is one hub sentence: notable changes get a summary line, and the commit history holds the detail. No category schema and no requirement to log every commit. [`versioning-and-git.md`](../../kit/rules/versioning-and-git.md) cites that sentence and drops the long changelog procedure.

`AGENTS.md` opens with the hygiene principle, then this order:

1. Confirm the request.
2. Check existing files before creating one. [`files.md`](../../kit/rules/files.md) owns nouns, verbs, and the directory README.
3. When installing this kit, open [`docs/WORKBOARD.md`](../WORKBOARD.md) and map the repository without waiting to be asked.
4. Update the workboard when the work has phases.
5. Leave this file at that order.

New policy goes into the path rules, a workspace note, or a library set. The kit does not cite the library.

Kit descriptions stay agnostic. A term that needs a precise meaning gets a short definition, not a project story and not an essay. [`MARKDOWN-STANDARD.md`](../../kit/MARKDOWN-STANDARD.md) owns that shape. An adopted repository keeps the shape and writes the words for its own tree: a directory index says what each file does there. A kit example is not copied in as that description.

## Workspace and library

| Tree | Role |
|------|------|
| `kit/` | Short git-honesty core |
| `docs/` | Workspace: research, workboard, plans, build notes, pointer list |
| `library/` | Reference sets and skill packs. Title index only. Each set stays silent until opened |

`docs/resources/` stays a list of pointers. It does not hold the packs.

`library/platforms/` is the reference set. It now lives at [library/platforms/](../../library/platforms/README.md). A language is a directory under `program-language/` with three packs: language, ecosystem, and OS carve-out. Operating-system placement is a directory under `os/`. Compose packs. Do not merge them into one rulebook, and do not add a `security/` or `certification/` child under a language. The root of that tree owns the composition rules. This note does not restate them.

`kit/configs/` is the old flat config set. Those checks belong to the matching language pack. A new language or operating system is a new directory inside `platforms/`. The core kit does not grow.

`docs/dev-policy/` has moved to `library/platforms/` in the working tree.

A fundamental security baseline (privilege, network, secrets, when a `SECURITY.md` exists) is one concept. Language packs and ecosystem packs keep their own checks. Repo-wide scanners such as Gitleaks stay with the baseline, because they are not a language. The baseline stays a short workspace note. If it becomes its own dataset, it gets a directory under `library/`.

| Current material | After the rework |
|------------------|------------------|
| Platform packs, language configs, style gates, per-language certification | `library/platforms/` |
| Fundamental security baseline | [docs/security.md](../security.md) |
| Skill packs and the orchestrator crew | `library/skills/` |
| AI-docs policy | Stays with the workspace, shortened. No kit citation |
| [`continuity.md`](../../kit/rules/continuity.md) and its template | Removed. No library copy and no workspace copy |
| [`hygiene.md`](../../kit/rules/hygiene.md) | Principle moves into `AGENTS.md`. The root catalog does not |
| [`architecture.md`](../../kit/rules/architecture.md) | A few lines in [`contracts.md`](../../kit/rules/contracts.md). Layout stays in `files.md` |
| [`verification-and-ops.md`](../../kit/rules/verification-and-ops.md) | One completion sentence in the hub. The step list does not get a new home |

An agent opens a platform family only when the task needs that language or operating system, and opens one skill only when the task matches that procedure.

## Commit law

Commit requirements are mandatory and get their own file so they can be cited and enforced without the rest of the versioning module.

**Future owner:** `kit/rules/git-commit.md`.

**Current statement, until the split:** [Commit message format](../../kit/rules/versioning-and-git.md#commit-message-format) through [AI-assisted commits](../../kit/rules/versioning-and-git.md#ai-assisted-commits-required-disclosure). The type table and the `Instructed-by` cascade move with the split. This note does not restate them.

The new file is concise and still complete enough to apply. It holds:

- The subject form `type(scope):` plus an imperative summary of the **staged** change.
- A body when the subject alone does not name the staged actions but concisely describes change made - should reasonably detail what was changed as a summary without becoming a paragraph.
- The identity conditions now in [commit-note identity](../../kit/rules/versioning-and-git.md#commit-note-identity).
- The AI trailer block, required when an AI assisted the change or the message. Human-only commits omit it.
- One filled example.
- The condition that published history is not rewritten to match the template.

Target shape (informative only; `git-commit.md` will own the enforceable text):

```text
<type>(<scope>): <imperative summary of the staged change>

<body when the subject does not name the staged actions>

Assisted-by: <AI make / model>
Compliance: RULES.md
Instructed-by: <directing human>
```

The hub keeps one authority-map row and one Must line that link here. It stops repeating the trailer block in the Must table and in the operator list.

`git-commit.md` does not own changelog wording, version numbers, or remotes.

## Rewrite rules

The rewrite follows [`files.md`](../../kit/rules/files.md): one purpose, one owner. A new file names the role it adds or the existing file it extends.

| Purpose | Owner after the rework | What must not gain a second copy |
|---------|------------------------|----------------------------------|
| Commit template, conditions, example, AI trailers | `kit/rules/git-commit.md` | Hub Must text, operator steps, `versioning-and-git.md` |
| Notable-change summary | One sentence in `kit/RULES.md` | A changelog procedure in `versioning-and-git.md` |
| Fork check | `kit/rules/files.md`, kept short | Edge-case writeups. Those stay in the [forked-path note](./repo-kit-rules-enhancement.md) until a real repo hits one |
| Expansive reference sets | `library/<set>/`, index is titles only | Pack text inside `kit/` or `docs/resources/` |
| Platform composition | `library/platforms/README.md` | A restatement in this note or in the hub |
| Skill procedures | `library/skills/`. One skill open when the task matches | A second RULES tree, a hub "when in use" section, or a skill that restates a kit Must |
| Fundamental security baseline | One short workspace note | A copy inside each language pack |
| Hygiene principle | `AGENTS.md` | A second `hygiene.md`, or the root catalog pasted into `AGENTS.md` |
| Path shape, including nouns, verbs, and the directory README | `kit/rules/files.md` | Those rules pasted into `AGENTS.md` |
| Architecture boundaries | A few lines in `kit/rules/contracts.md` | `architecture.md` kept beside that text |
| Completion | One sentence in `kit/RULES.md` | The verification step list moved whole |
| README shape | `kit/MARKDOWN-STANDARD.md`, reduced to landing, directory index, and minimum frontmatter | A second README format in `files.md` or `AGENTS.md` |
| Description wording | Generic in this kit. Tailored in an adopted repository | A product-specific sentence kept in `kit/`, or a kit definition pasted over a real directory index |
| Install | `kit/SETUP.md` and `kit/UPGRADE.md` in this repository | Copies carried as standing law in every product |
| Session order | `AGENTS.md` | Policy paragraphs pasted into `AGENTS.md` |
| Multi-phase continuity of work | `docs/WORKBOARD.md` | A long workboard essay beside the board |

The working tree now contains that promotion: `git-commit.md`, the short hub, the shorter markdown standard and install path, the retired modules, `library/platforms/`, and `library/skills/`. This file stays the research record. It is not committed.
