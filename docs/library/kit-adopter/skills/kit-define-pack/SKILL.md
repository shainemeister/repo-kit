---
title: AgentPack Parameters
description: Every agent model is an AgentPack. A structured record with catalog fields for match, a short body for procedure and expertise, and authority_paths and verify linking to canonical law.
version: "1.8.0"
status: current
audience:
  - developers
  - maintainers
doc_type: other
related:
  - ../../../../../kit/skills/README.md
  - ../kit-use-instruct/SKILL.md
  - ../kit-map-layers/SKILL.md
  - ../kit-emit-packs/SKILL.md
  - ../kit-author-plan/SKILL.md
last_updated: "2026-10-17"
---

# AgentPack Parameters

Every agent model is an AgentPack. A structured record with catalog fields for match, a short body for procedure and expertise, and authority_paths and verify linking to canonical law. Packs are expert views, not freeform chat personas.

**Related:** [README.md](../../../../../kit/skills/README.md) · [kit-use-instruct](../kit-use-instruct/SKILL.md) · [kit-map-layers](../kit-map-layers/SKILL.md) · [kit-emit-packs](../kit-emit-packs/SKILL.md) · [kit-author-plan](../kit-author-plan/SKILL.md)

Related lists maintainer peers. Do not load them for this task.

---

## Summary

| Must |
|------|
| Use stable `id` values from CATALOG or PLAN overlays; keep enums constrained (`layer` / `activation` / `portability`) |
| Include `authority_paths` and `verify` in **YAML frontmatter**; document **expertise** (`references` and/or body **Expertise map**) |
| Put Must / Must not / Procedure / Expertise map in the **markdown body** (not required as YAML keys) |
| Map user freeform requests into PLAN deltas; do not silently invent durable policy only in chat |
| External URLs only as **citations** under references/expertise — never remote overlays or substitute law |

---

## Contents

1. [Pack format doctrine](#pack-format-doctrine)
2. [Field location](#field-location)
3. [AgentPack fields](#agentpack-fields)
4. [Expertise and references](#expertise-and-references)
5. [Enums](#enums)
6. [User instruction → PLAN deltas](#user-instruction--plan-deltas)
7. [Emit shapes](#emit-shapes)
8. [Validation rules](#validation-rules)
9. [Document history](#document-history)

---

## Pack format doctrine

| Artifact | Canonical format |
|----------|------------------|
| Instruct docs under `kit/skills/` (this file, kit-map-layers, kit-use-instruct, kit-emit-packs) | [MARKDOWN-STANDARD](../../../../../kit/MARKDOWN-STANDARD.md) |
| Seed packs and generated packs | **AgentPack** YAML frontmatter (catalog fields) + short markdown body |
| Archived crew role files | The same AgentPack shape, outside `kit/skills/`. Do not dispatch them |

AgentPack frontmatter is **not** required to carry full MARKDOWN-STANDARD fields (`doc_type`, `audience`, document history tables). BUILD and humans validate against this schema.

---

## Field location

| Location | What lives there |
|----------|------------------|
| **YAML frontmatter** | Match/catalog metadata: `id`, `title`, `layer`, `portability`, `activation`, `description`, `triggers`, `authority_paths`, `verify`, optional `compose_with`, `negative_triggers`, `stage_min`, `user_tuning_keys`, `references` |
| **Markdown body** (after closing `---`) | Role content: `## Must`, `## Must not`, `## Expertise map`, `## Procedure` (or ordered steps), `## Open for law` (or authority_paths pointer) |

**`body` is not a YAML key.** The body is the markdown after frontmatter. Seed files under `kit/skills/` follow this shape.

**`must` / `must_not` are not required YAML keys.** Prefer body headings `## Must` and `## Must not`. Optional YAML lists are allowed if an adopter emit path needs them; templates and kit defaults use the body.

---

## AgentPack fields

| Field | Required | Location | Description |
|-------|----------|----------|-------------|
| `id` | yes | YAML | Stable identifier (`maintainer`, `security`, …) |
| `title` | yes | YAML | Human label |
| `layer` | yes | YAML | Job type enum |
| `portability` | yes | YAML | `kit` \| `adopter` \| `platform` |
| `activation` | yes | YAML | When body loads |
| `stage_min` | no | YAML | Optional stage index from project PLAN |
| `description` | yes | YAML | Catalog match text (what + when) |
| `triggers` | yes | YAML | Phrases / task classes that activate |
| `negative_triggers` | recommended | YAML | When **not** to take over |
| `compose_with` | no | YAML | Omit it. If present, at most one id, and only as the name of the next task. It is not a load list |
| `authority_paths` | yes | YAML | Canonical **repo-relative** law paths only |
| `verify` | yes | YAML | Gates before claiming done |
| `user_tuning_keys` | no | YAML | PLAN tuning keys that affect this pack |
| `references` | **yes** for generated packs | YAML | Expertise list: in-repo paths and/or external citation objects (see below) |
| Must | yes | **Body** (`## Must`) | Hard requirements for this role |
| Must not | yes | **Body** (`## Must not`) | Hard prohibitions |
| Expertise map | **yes** for generated packs | **Body** (`## Expertise map`) | Scannable in-repo + external citations with purpose |
| Procedure / body | yes | **Body** (markdown after frontmatter) | Short ordered procedure + Open for law |

Project tuning (`must_not_extra`) injects under **Must not** or a **Tuning** subsection—never under Must alone as a false positive requirement.

**Seed files** may ship with `references` and Expertise map filled as kit defaults so BUILD can emit them.

---

## Expertise and references

Packs are **experts** for a tailored use case. Expertise is documented so operators open the right law and supporting material instead of inventing context.

### `authority_paths` (law)

| Rule | Detail |
|------|--------|
| Required | Always |
| Paths | **Repo-relative** only |
| Remote URLs | **Forbidden** in `authority_paths` |
| Role | Primary L4 / product contract owners |

### `references` (YAML)

List of entries. Prefer objects for clarity; plain path strings allowed for in-repo only.

```yaml
references:
  - path: kit/rules/versioning-and-git.md
    kind: repo
    purpose: Commit and CHANGELOG law
  - url: https://www.conventionalcommits.org/en/v1.0.0/
    kind: external
    purpose: Subject-line guidance when the repository uses that form
    trust_note: Citation only. Commit law is kit/rules/git-commit.md
```

| Field | Required | Description |
|-------|----------|-------------|
| `path` | for `kind: repo` | Repo-relative markdown or code path |
| `url` | for `kind: external` | `https://` citation only |
| `kind` | yes when object form | `repo` \| `external` |
| `purpose` | **yes** for every entry | Why this expert opens it |
| `trust_note` | recommended for external | Reminder that citation is guidance only |

### Body `## Expertise map`

Mirror the YAML for humans (scannable bullets):

```markdown
## Expertise map

### In-repo
- `kit/RULES.md` — maintenance hub / authority map
- `kit/rules/contracts.md` — same-change-set co-updates

### External (citations — guidance only)
- Conventional Commits — https://www.conventionalcommits.org/en/v1.0.0/ — subject-line guidance
```

### Trust boundary

| Allowed | Forbidden |
|---------|-----------|
| External `https://` under `references` / Expertise map as **citations** | External URLs in `authority_paths` |
| Curated standards (Conventional Commits, OWASP, vendor docs) as citations | Remote overlay pack loads ([kit-author-plan trust boundary](../kit-author-plan/SKILL.md#trust-boundary)) |
| Prefer stable / versioned doc URLs | Treating external prose as overriding L4 |
| Few high-signal links | Large uncurated link dumps |

BUILD does not fetch remote content into the repository. On conflict with a pack, the layer rule in [kit-map-layers](../kit-map-layers/SKILL.md#layers-l0l4) wins.

---

## Enums

Meaning for each value is [kit-map-layers](../kit-map-layers/SKILL.md). This list is the set a pack may use.

| Field | Values |
|-------|--------|
| `layer` | `environment`, `role`, `doctrine`, `playbook`, `pipeline`, `reference` |
| `activation` | `always_on`, `catalog_match`, `tool_gated`, `slash_only`, `stage_gated` |
| `portability` | `kit`, `adopter`, `platform` |

Job types: [kit-map-layers](../kit-map-layers/SKILL.md#job-types-taxonomy). When a body loads: [kit-map-layers](../kit-map-layers/SKILL.md#activation-modes). Where a pack lives: [kit-map-layers](../kit-map-layers/SKILL.md#portability). Only `portability: kit` belongs in the kit match index.

---

## User instruction → PLAN deltas

Freeform user language is not written into pack law. Map it onto the PLAN fields in [kit-author-plan](../kit-author-plan/SKILL.md#durable-vs-session-only).

---

## Emit shapes

The emit path and the fill rules are [kit-emit-packs](../kit-emit-packs/SKILL.md#outputs). A host-shaped copy is an adopter option and does not change this schema. Kit correctness does not depend on a host skill directory ([kit-discover-host](../kit-discover-host/SKILL.md#mirrors-vs-law)).

---

## Validation rules

BUILD (and humans) reject or fix packs that:

1. Lack **YAML** `authority_paths` or `verify`  
2. Lack **body** Must / Must not sections (or empty placeholders only)  
3. Lack a short procedure body after frontmatter  
4. Leave raw `{{PLACEHOLDER}}` tokens in **generated** packs (BUILD must omit empty optionals or fill; see [BUILD fill rules](../kit-emit-packs/SKILL.md#template-fill-rules))  
5. Use unknown `id` not in CATALOG, PLAN overlays, or existing adopter-generated packs  
6. Set `portability: kit` for product-only content  
7. Set `activation: always_on` without explicit PLAN approval  
8. Body restates full domain modules instead of linking  
9. `compose_with` references missing ids  
10. Invent verify tools the authority map does not name  
11. Put `http://` or `https://` in `authority_paths`  
12. **Generated packs** lack `references` **and** lack body `## Expertise map` (at least one structured expertise surface required; prefer both aligned)  
13. External reference entries missing `purpose` (or equivalent purpose text in Expertise map)  
14. Use a remote URL as an overlay source ([kit-author-plan trust boundary](../kit-author-plan/SKILL.md#trust-boundary))

Do **not** reject packs solely because `must`, `must_not`, or `body` are absent as YAML keys when the markdown body carries them.

Kit **seed files** should pre-fill expertise so emit succeeds without freeform invention.

---

## Document history

| Version | Notes |
|---------|--------|
| 1.8.0 | Enum meaning, PLAN deltas, and emit paths cite their owners. The values and the validation list stay |
| 1.7.0 | Home is `kit/skills/kit-<action>/`. A blank is `template/<noun>.md` |
| 1.6.0 | Kit packs are `skills/kit-<action>/`. Ids stay. `kit-adopter` and `generated/` stay |
| 1.5.0 | Citation rules stay here. A conflict with a pack cites the layer rule |
| 1.4.2 | Link labels use the action directories. Ids stay |
| 1.4.1 | Archived crew files stay AgentPack shaped and stay outside `skills/` |
| 1.4.0 | `compose_with` is not a load list. The crew format is deprecated |
| 1.3.1 | Pack path is `skills/<action>/SKILL.md` |
| 1.3.0 | Schema stays here. Changelog citations follow the kit sentence, not an external changelog schema |
| 1.2.0 | Seed packs live beside this file. The host alias lives with habitat |
| 1.1.2 | Drop in-body document-version echo (kit 2.8.1) |
| 1.1.1 | Density restyle (kit 2.8.0); unique AgentPack field schema and validation unchanged |
| 1.1.0 | Expertise/references required for generated packs; external citation rules; validation 11–14 (kit 2.2.0) |
| 1.0.3 | PLAN delta table: `tuning.must_not_extra` (aligned with PLAN-HOOK/BUILD) |
| 1.0.2 | Validation: forbid raw placeholders in generated packs; unknown id vs adopter packs |
| 1.0.1 | Field location: YAML vs body; must/must_not/body are not required YAML keys |
| 1.0.0 | Initial schema (kit 2.1.0) |
