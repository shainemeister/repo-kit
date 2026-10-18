---
title: "Skill template"
description: "Frontmatter keys for one verb. Each value is that field's job."
version: "1.0.3"
status: draft
audience:
  - ai-agents
  - maintainers
doc_type: other
related:
  - ../kit-adopter/skills/kit-define-pack/SKILL.md
  - ../kit-adopter/skills/kit-map-layers/SKILL.md
  - ../kit-adopter/skills/kit-emit-packs/SKILL.md
  - ../../../kit/MARKDOWN-STANDARD.md
  - ../../../kit/rules/path-pattern.md
  - ../../research/kit-skills.md
last_updated: "2026-10-17"
---

# Skill template

Frontmatter keys for one verb. Each value is that field's job.

**Related:** [define-pack](../kit-adopter/skills/kit-define-pack/SKILL.md) · [map-layers](../kit-adopter/skills/kit-map-layers/SKILL.md) · [emit-packs](../kit-adopter/skills/kit-emit-packs/SKILL.md) · [markdown](../../../kit/MARKDOWN-STANDARD.md) · [path pattern](../../../kit/rules/path-pattern.md) · [kit and skills](../../research/kit-skills.md)

Draft. Emit does not read this note. This note follows the [markdown standard](../../../kit/MARKDOWN-STANDARD.md#frontmatter). The table is the verb's frontmatter ([fields](../kit-adopter/skills/kit-define-pack/SKILL.md#agentpack-fields)). A seed is `kit/skills/kit-<action>/SKILL.md` ([path pattern](../../../kit/rules/path-pattern.md)).

## Frontmatter keys

| Key | Value | Description |
|-----|-------|-------------|
| `id` | `stable id` | Stable identifier. It may differ from the directory stem. |
| `title` | `Action` | Imperative name of the action. The H1 repeats it. |
| `layer` | `job type` | One job type. The list is the [taxonomy](../kit-adopter/skills/kit-map-layers/SKILL.md#job-types-taxonomy). |
| `portability` | `kit` | A repeated verb uses `kit`. A project agent uses `adopter`. |
| `activation` | `catalog_match` | Loads when the task matches the description or a trigger. |
| `description` | `State the action. Cite the principle.` | Match text. The lead repeats its first sentence. |
| `triggers` | `the task, as the user states it` | Phrases that select this verb. |
| `negative_triggers` | `the next task` | Phrases that belong to the next task. |
| `authority_paths` | `kit/RULES.md`, `the principle` | Repo-relative owners. |
| `references` | one entry per path | Why the verb opens a path. The entry keys are below. |
| `verify` | `the check the authority map names for this action` | The declared check for this action. |
| `# BUILD fills` | `{{PROJECT_NAME}}`, `{{TUNING_MUST_NOT_EXTRA}}` | Comment. The [fill](../kit-adopter/skills/kit-emit-packs/SKILL.md#template-fill-rules) replaces these tokens. |

## Reference entry

| Key | Value | Description |
|-----|-------|-------------|
| `path` | `the principle` | Repo-relative path when `kind` is `repo`. |
| `kind` | `repo` | `repo` or `external`. |
| `purpose` | `The principle this verb cites` | Why the verb opens it. |

An external entry uses `url` and `trust_note` ([references](../kit-adopter/skills/kit-define-pack/SKILL.md#expertise-and-references)).

## Template

```markdown
---
id: stable id
title: Action
layer: job type
portability: kit
activation: catalog_match
description: >
  State the action. Cite the principle.
triggers:
  - the task, as the user states it
negative_triggers:
  - the next task
authority_paths:
  - kit/RULES.md
  - the principle
references:
  - path: the principle
    kind: repo
    purpose: The principle this verb cites
  - path: kit/RULES.md
    kind: repo
    purpose: Authority map and completion
verify:
  - the check the authority map names for this action
# BUILD fills: {{PROJECT_NAME}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Action

State the action. Cite the principle.

The principle is the owner file. That file stays the owner.

## Must

- Open the principle and apply it.
- Cite the owner.

## Must not

- Restate the principle in this pack.
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- `kit/RULES.md` — authority map and completion
- the principle — the owner this verb cites

### External (citations — guidance only)

- None.

## Procedure

1. Open the authority map and the principle.
2. Carry out the action.
3. When a second concern appears, name that task and stop.
4. If a declared check failed or was skipped, stop.

## Open for law

See authority_paths. The principle stays in the owner file.
```

## Document history

| Version | Notes |
|---------|--------|
| 1.0.3 | Home is `docs/library/kit-skill-template/SKILL.md` |
| 1.0.2 | Frontmatter is a key and value table |
| 1.0.1 | The fence uses the kit's names for each field |
| 1.0.0 | Unfilled seed shape. Not a seed |
