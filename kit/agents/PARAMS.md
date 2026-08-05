---
title: AgentPack Parameters
description: Schema, enums, validation, and emit shapes for Agent Instruct packs.
version: "1.0.3"
status: current
audience:
  - developers
  - maintainers
doc_type: other
related:
  - README.md
  - FRAMEWORK.md
  - CATALOG.md
  - BUILD.md
  - PLAN-HOOK.md
  - RUNTIME.md
last_updated: "2026-08-05"
---

# AgentPack Parameters

Every agent model is an **AgentPack**: a structured record with catalog fields (for match), a short body (procedure), and **authority_paths** / **verify** linking to canonical law.

**Document version:** 1.0.3  

**Related:** [README.md](./README.md) · [FRAMEWORK.md](./FRAMEWORK.md) · [CATALOG.md](./CATALOG.md) · [BUILD.md](./BUILD.md) · [PLAN-HOOK.md](./PLAN-HOOK.md) · [RUNTIME.md](./RUNTIME.md)

---

## Summary

| Must | Must not |
|------|----------|
| Use stable `id` values from CATALOG or PLAN overlays | Rename ids casually without PLAN/BUILD update |
| Include `authority_paths` and `verify` in **YAML frontmatter** | Ship packs with only vibe text |
| Put Must / Must not / Procedure in the **markdown body** | Require `must:` / `must_not:` / `body:` as YAML keys |
| Map user freeform requests into PLAN deltas | Silently invent durable policy only in chat |
| Keep enums constrained | Open-ended free strings for `layer` / `activation` |

---

## Contents

1. [Summary](#summary)
2. [Pack format doctrine](#pack-format-doctrine)
3. [Field location](#field-location)
4. [AgentPack fields](#agentpack-fields)
5. [Enums](#enums)
6. [User instruction → PLAN deltas](#user-instruction--plan-deltas)
7. [Emit shapes](#emit-shapes)
8. [Validation rules](#validation-rules)
9. [Document history](#document-history)

---

## Pack format doctrine

| Artifact | Canonical format |
|----------|------------------|
| Instruct law docs under `kit/agents/*.md` (FRAMEWORK, this file, …) | [MARKDOWN-STANDARD](../MARKDOWN-STANDARD.md) |
| Templates under `kit/agents/templates/` and generated packs under `kit/agents/generated/` | **AgentPack** YAML frontmatter (catalog fields) + short markdown body |

AgentPack frontmatter is **not** required to carry full MARKDOWN-STANDARD fields (`doc_type`, `audience`, document history tables). BUILD and humans validate against this schema.

---

## Field location

| Location | What lives there |
|----------|------------------|
| **YAML frontmatter** | Match/catalog metadata: `id`, `title`, `layer`, `portability`, `activation`, `description`, `triggers`, `authority_paths`, `verify`, optional `compose_with`, `negative_triggers`, `stage_min`, `user_tuning_keys`, `references` |
| **Markdown body** (after closing `---`) | Role content: `## Must`, `## Must not`, `## Procedure` (or ordered steps), `## Open for law` (or authority_paths pointer) |

**`body` is not a YAML key.** The body is the markdown after frontmatter. Seed templates under [templates/](./templates/) follow this shape.

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
| `compose_with` | no | YAML | Other pack ids to consider loading (not automatic) |
| `authority_paths` | yes | YAML | Canonical docs/code paths (repo-relative) |
| `verify` | yes | YAML | Gates before claiming done |
| `user_tuning_keys` | no | YAML | PLAN tuning keys that affect this pack |
| `references` | no | YAML | Optional deeper files (load on demand) |
| Must | yes | **Body** (`## Must`) | Hard requirements for this role |
| Must not | yes | **Body** (`## Must not`) | Hard prohibitions |
| Procedure / body | yes | **Body** (markdown after frontmatter) | Short ordered procedure + Open for law |

Project tuning (`must_not_extra`) injects under **Must not** or a **Tuning** subsection—never under Must alone as a false positive requirement.

---

## Enums

### `layer`

| Value | Use |
|-------|-----|
| `environment` | Host/runtime constraints (prefer L0, not full packs) |
| `role` | Maintainer, implementer, security, … |
| `doctrine` | Correctness/quality rules |
| `playbook` | Ordered adopt/plan workflows |
| `pipeline` | Scripted execution (platform/adopter only) |
| `reference` | Large lookup (avoid in kit defaults) |

### `activation`

| Value | Behavior |
|-------|----------|
| `always_on` | Body (or summary) in standing context — **use sparingly** |
| `catalog_match` | Auto when task matches description/triggers |
| `tool_gated` | Load when a named tool/class of tool is about to run |
| `slash_only` | Only explicit user/skill invocation |
| `stage_gated` | Only if PLAN current stage ≥ `stage_min` |

### `portability`

| Value | Allowed in kit CATALOG defaults? |
|-------|----------------------------------|
| `kit` | Yes |
| `adopter` | No — PLAN overlays / project generation |
| `platform` | No — optional emit |

---

## User instruction → PLAN deltas

Freeform user language is **not** written directly into pack law. Map to structured PLAN fields ([PLAN-HOOK.md](./PLAN-HOOK.md)):

| User says (examples) | PLAN delta |
|----------------------|------------|
| “Turn on security agent” | `active_models` += `security` |
| “We don’t need adopt help anymore” | `disabled` += `adopter` |
| “Prefer docs discipline” | `tuning.emphasize` += `docs-author` |
| “Never force Python pylint here” | Prefer inventory/verify edit; else `tuning.must_not_extra` |
| “After stage 7 enable reviewer always” | `stage_gates` / `stage_min` for `reviewer` |
| “Add a design-review agent” | overlay or new generated pack + map row + `active_models` |

| Durability | Action |
|------------|--------|
| Should matter next month | Write into PLAN, then BUILD |
| This task only | Session compose; do not edit PLAN unless asked |

---

## Emit shapes

### A. Kit markdown pack (default)

```text
kit/agents/generated/<id>.md
```

Structure: YAML frontmatter with schema fields + short markdown body (Must / Must not / Procedure / Open for law). See [examples/](./examples/) and [templates/](./templates/).

### B. Optional host skill-shaped emit (adopter/platform)

Map AgentPack fields to the host’s skill format without changing this schema. Prefer adapters over forking CATALOG. Kit correctness does **not** depend on any host skill directory.

---

## Validation rules

BUILD (and humans) reject or fix packs that:

1. Lack **YAML** `authority_paths` or `verify`  
2. Lack **body** Must / Must not sections (or empty placeholders only)  
3. Lack a short procedure body after frontmatter  
4. Leave raw `{{PLACEHOLDER}}` tokens in **generated** packs (BUILD must omit empty optionals or fill; see [BUILD fill rules](./BUILD.md#template-fill-rules))  
5. Use unknown `id` not in CATALOG, PLAN overlays, or existing adopter-generated packs  
6. Set `portability: kit` for product-only content  
7. Set `activation: always_on` without explicit PLAN approval  
8. Body restates full domain modules instead of linking  
9. `compose_with` references missing ids  
10. Invent verify tools not present in RULES verification table / language inventory  

Do **not** reject packs solely because `must`, `must_not`, or `body` are absent as YAML keys when the markdown body carries them.

---

## Document history

| Version | Notes |
|---------|--------|
| 1.0.3 | PLAN delta table: `tuning.must_not_extra` (aligned with PLAN-HOOK/BUILD) |
| 1.0.2 | Validation: forbid raw placeholders in generated packs; unknown id vs adopter packs |
| 1.0.1 | Field location: YAML vs body; must/must_not/body are not required YAML keys |
| 1.0.0 | Initial schema (kit 2.1.0) |
