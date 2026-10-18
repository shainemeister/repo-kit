---
title: "Kit and skills"
description: "Working model for how the kit and the skill set fit together. The user states the task, and the agent matches one SKILL.md. A specific verb carries a fixed procedure. An agnostic verb adopts the repository's own skills and docs."
version: "1.6.1"
status: draft
audience:
  - ai-agents
  - maintainers
doc_type: other
related:
  - ../../kit/RULES.md
  - ../../kit/rules/git-commit.md
  - ../../kit/rules/path-pattern.md
  - ../../docs/library/kit-adopter/skills/kit-discover-host/template/agents.md
  - ../../kit/skills/README.md
  - ./skill-pack-sequence.md
  - ../../WORKBOARD.md
last_updated: "2026-10-17"
---

# Kit and skills

Working model for how the kit and the skill set fit together. The user states the task, and the agent matches one SKILL.md. A specific verb carries a fixed procedure. An agnostic verb adopts the repository's own skills and docs.

**Related:** [RULES](../../kit/RULES.md) · [git-commit](../../kit/rules/git-commit.md) · [path pattern](../../kit/rules/path-pattern.md) · [AGENTS template](../../docs/library/kit-adopter/skills/kit-discover-host/template/agents.md) · [skills](../../kit/skills/README.md) · [sequence](./skill-pack-sequence.md) · [workboard](../../WORKBOARD.md)

Draft only. This note is not kit law. The owners stay [kit/RULES.md](../../kit/RULES.md) and the file the authority map names. Promotion means editing that owner and the skill in one change set.

Recorded 2026-10-17. The commit verb is [kit/skills/kit-commit/SKILL.md](../../kit/skills/kit-commit/SKILL.md). The adopt verb is [kit-adopter](../../docs/library/kit-adopter/skills/kit-adopter/SKILL.md). The agnostic verb is [kit/skills/kit-apply-change/SKILL.md](../../kit/skills/kit-apply-change/SKILL.md). A repeated verb stays in `kit/skills/`. Adopt and upgrade packs are `docs/library/kit-adopter/skills/`. Ids stay. `docs/library/kit-adopter/generated/` is the emit target. A repository skill stays unprefixed at root `skills/`.

## Grain

| Layer | What it holds | When it loads |
|-------|----------------|---------------|
| Constitution | Short principles and the authority map, under `kit/` | Session start. [kit/RULES.md](../../kit/RULES.md) is the map |
| Verb | One procedure, `kit/skills/kit-<action>/SKILL.md` | When that action is the task |
| Adoption | Whether the verb set is present | [ADOPTER.md](../../ADOPTER.md), carried out by [kit-adopter](../../docs/library/kit-adopter/skills/kit-adopter/SKILL.md) |

The constitution is the lightweight rule book. An agent can read the map without opening the procedure tree. The user states the task. The agent matches one verb and follows it. The user does not name the skill and does not recite the rule.

`SKILL.md` is the procedure file agents already know how to open. The kit uses that name so the match can come from the task. The verb cites the principle it uses. It stays agnostic of any one product, the way the kit stays agnostic. It does not restate the principle, and it does not outrank the kit.

One task loads one skill. When the work changes, the session names the next task and stops. It does not load the next skill, and it does not delegate.

## Two kinds of verb

| Kind | Procedure | How it meets a repository |
|------|-----------|---------------------------|
| Specific | Fixed steps for one kit action | Used unchanged. Commit is the specimen |
| Agnostic | Lightweight law for shaping the work | Adopts the skills and documents the repository already has. A new repository grows its structure from that law |

A specific verb may name types, checks, and order. It uses the kit mechanics: one task, cite the owner, stop when a check this repository declares was skipped. It does not narrate this repository.

An agnostic verb is lighter. It tells the agent how to find the structure that already exists and how to extend the file that holds the role. The repository's own skill or document stays the local owner. The kit verb cites that file. A new repository has no local file yet, so the same law is the seed the agent builds from. The agent adds a path when the role is absent.

Both kinds are `SKILL.md`. Both cite the kit owner. The kit owner wins.

## Routing

The match belongs in the session order, beside the authority map. [path-pattern.md](../../kit/rules/path-pattern.md) places `kit/skills/kit-<action>/SKILL.md` and says one task loads one skill. The hub stays a map. It does not grow a skill index.

Promoting the match means editing the paste block in [agents.md](../../docs/library/kit-adopter/skills/kit-discover-host/template/agents.md) and the owners that block cites, in one change set. This note does not do that.

When the skill file exists, the agent opens it and follows it. When the tree is absent, the principle in the kit file is the procedure. A bare adopt keeps the kit core and the agents blank. It does not require the adopt shelf. [kit-adopter](../../docs/library/kit-adopter/skills/kit-adopter/SKILL.md) is what attaches the set.

A host may index a skill by `name` and `description`. These packs carry AgentPack `id` and `triggers`. The session-order match is the router that still works when a host scan does not see the pack.

## Optional set

`kit/skills/` is included when Agent Instruct is adopted. A bare adopt keeps the kit core and the agents blank. It does not require the rest of the verb set.

The principle in the kit file remains enough to do that task when the skill is absent. An agnostic verb, when the set is present, is what lets the repository keep its own skills and documents.

## First cut: commit

[git-commit.md](../../kit/rules/git-commit.md) is established. It stays the owner of commit messages. The cut moves the procedure into the verb and leaves the principle in the kit. Commit is a specific verb.

| Stays in the constitution | Becomes the commit verb |
|---------------------------|-------------------------|
| The subject names the staged change | Type table, body shape, and the identity checks |
| An assisted commit carries the trailer block | The trailer template and where it sits |
| A notable change gets one changelog sentence. The detail stays in git | The steps: review, stage one surface, write the message, stop if a declared check was skipped |

Version numbers and what git tracks stay in [versioning-and-git.md](../../kit/rules/versioning-and-git.md). The changelog sentence stays in [kit/RULES.md](../../kit/RULES.md#changelog). The commit verb cites those. It does not carry them.

The verb is [kit/skills/kit-commit/SKILL.md](../../kit/skills/kit-commit/SKILL.md). [git-commit.md](../../kit/rules/git-commit.md) **2.0.0** keeps the subject principle and the trailer block. The id stays `maintainer`.

| Directory | State | Id | Kind |
|-----------|--------|----|------|
| `kit/skills/kit-commit/` | Written | `maintainer` | Specific |
| `docs/library/kit-adopter/skills/kit-adopter/` | Written | `adopter` | Specific |
| `kit/skills/kit-apply-change/` | Written | `implementer` | Agnostic |

Recorded 2026-10-17. `kit-skill-fold` left twelve packs. Activation and size budgets are [kit-map-layers](../../docs/library/kit-adopter/skills/kit-map-layers/SKILL.md). Match rows for the repeated verbs stay on the skills index. `kit-load-packs` and `kit-match-agents` are gone. Ids stay.

Recorded 2026-10-17. `kit-homes` left eight repeated verbs in `kit/skills/`. Adopt and upgrade packs are [the shelf](../../docs/library/kit-adopter/README.md). Root `ADOPTER.md` is the one-time adopt. The multi-phase record is root `WORKBOARD.md`.

## Load order

1. The user states the task.
2. Open the authority map.
3. Match one verb. When `kit/skills/kit-<action>/SKILL.md` exists, open it, follow its procedure, and cite the principle it names.
4. A specific verb carries out its fixed procedure.
5. An agnostic verb reads the skills and documents this repository already has for that action and treats them as the local structure. A repository without them takes the lightweight law as the seed.
6. If a second concern appears, name that task and stop.

## Open

A `verb` field on the owning document, and a `then` list of later tasks, are not settled. `verb` would confirm the skill once that document is open. `then` would name the next tasks and would not load them in the current one. The skill description remains the match before any owner is open.

## Not in this note

- Do not start sequence sections 11–16.
- Do not make the hub list the skill tree.
- Do not copy a principle into a skill.
- Do not promote the session-order match in this pass.
- Do not copy a repository's local skill or document into the kit verb.
