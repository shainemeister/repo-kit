---
title: Repository Maintenance Rules
description: Maintenance policy hub—authority map, kit baseline, and index to domain rule modules.
version: "2.0.0"
status: current
audience:
  - developers
  - analysts
  - security
doc_type: other
related:
  - ../README.md
  - SETUP.md
  - UPGRADE.md
  - MARKDOWN-STANDARD.md
  - CHANGELOG.md
  - rules/hygiene.md
  - rules/authoring-and-style.md
  - rules/architecture.md
  - rules/contracts.md
  - rules/security.md
  - rules/versioning-and-git.md
  - rules/verification-and-ops.md
  - configs/pylintrc
last_updated: "2026-07-28"
---

# Repository Maintenance Rules

Fundamental rules for maintaining a professional, auditable repository. This file is the **hub**: authority map, kit baseline, and Must / Must not. Domain detail lives in [rules/](./rules/).

**Document version:** 2.0.0  

**Related:** [README.md](../README.md) · [SETUP.md](./SETUP.md) · [UPGRADE.md](./UPGRADE.md) · [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) · [CHANGELOG.md](./CHANGELOG.md) · [rules/](./rules/) · [configs/pylintrc](./configs/pylintrc)

---

## Summary

**RULES.md** is the maintenance policy hub. Detailed contracts live in package guides and in domain modules under [rules/](./rules/). When contracts change, update the **canonical** file in the same change set—see [rules/contracts.md](./rules/contracts.md).

Copy this hub (and the `rules/` modules you need) into a project and **fill the authority map and verification table** with that project’s real paths and commands. On initiation, derive those paths from **project interest** (see [SETUP.md](./SETUP.md)). Keep product-specific policy here or in a thin overlay; keep authoring shape in [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md). Filled map examples: [examples/](./examples/).

| Must | Must not |
|------|----------|
| Update canonical docs with behavior changes ([contracts](./rules/contracts.md)) | Commit secrets, regenerable outputs, or real sensitive data |
| Maintain root **CHANGELOG.md** (Keep a Changelog) | Ship version bumps or release-worthy changes without CHANGELOG |
| Keep [Kit baseline](#kit-baseline) current after adopt/upgrade | Lose track of kit version after deleting SETUP |
| Use conventional commit messages that match staged files ([versioning-and-git](./rules/versioning-and-git.md)) | Mix unrelated packages or leave CLI/API/security docs stale |
| Keep packages composable at the workflow layer ([architecture](./rules/architecture.md)) | Silently rename public APIs, CLI fields, or schema columns |
| Run **pylint** on Python product code after those edits ([authoring-and-style](./rules/authoring-and-style.md)) | Treat pylint as a product runtime install for end users |
| Fill [language surface inventory](./rules/security.md#language-surface-inventory); run declared style + SAST before complete | Paste the full multi-language SAST table without inventory evidence |
| Verify before sharing contract or behavior changes ([verification-and-ops](./rules/verification-and-ops.md)) | Claim complete when a **declared** style or SAST gate was skipped or failed |
| Regenerate `certification/` outputs when that folder is maintained | Commit `last_certification.*` or treat certification as a product launcher gate |
| Fill authority map + verification from project interest at start | Leave contracts empty until “docs later” after behavior ships |

**First adopt:** [SETUP.md](./SETUP.md) (then delete or archive). **Later kit upgrades:** [UPGRADE.md](./UPGRADE.md) (durable).

---

## Contents

1. [Summary](#summary)
2. [Authority map](#authority-map)
3. [Domain modules](#domain-modules)
4. [Kit baseline](#kit-baseline)
5. [Upgrading the kit](#upgrading-the-kit)
6. [Document history](#document-history)

---

## Authority map

Update the **owner** document for a change. Cross-link; do not duplicate full contracts ([contracts.md](./rules/contracts.md)).

Replace paths below with your project’s real files. Rows that do not apply may be removed; add rows for domain-specific contracts. For filled skeletons by interest, see [examples/](./examples/).

| Concern | Canonical source |
|---------|------------------|
| Repo purpose and quick start | Project root [README.md](../README.md) (kit landing) or project `README.md` |
| One-time adoption (ephemeral) | [SETUP.md](./SETUP.md) — follow, then delete or archive |
| Kit upgrade / migration (durable) | [UPGRADE.md](./UPGRADE.md) |
| Path-level file inventory (optional) | `FILE-CATALOG.md` (or equivalent) |
| Markdown structure, frontmatter, author checklist | [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) · [templates/](./templates/) |
| Maintenance policy hub (this file) | [RULES.md](./RULES.md) |
| Contract policy (breaking changes, co-updates, cross-links) | [rules/contracts.md](./rules/contracts.md) |
| Root hygiene / dual layout | [rules/hygiene.md](./rules/hygiene.md) |
| Authoring + style gates | [rules/authoring-and-style.md](./rules/authoring-and-style.md) |
| Architecture boundaries | [rules/architecture.md](./rules/architecture.md) |
| Security, inventory, SAST, certification | [rules/security.md](./rules/security.md) |
| Versioning, CHANGELOG rules, git | [rules/versioning-and-git.md](./rules/versioning-and-git.md) |
| Verification, completion, checklist | [rules/verification-and-ops.md](./rules/verification-and-ops.md) |
| Project history (**required** for adopters) | Project root `CHANGELOG.md` |
| Kit version history (upstream) | [CHANGELOG.md](./CHANGELOG.md) under `## repo-kit` |
| Standards kit baseline | [Kit baseline](#kit-baseline) in this file (version + source) |
| Filled authority-map examples (kit reference) | [examples/](./examples/) |
| Package overview | `{{PACKAGE}}/README.md` |
| CLI or automation contract | `{{PACKAGE}}/CLI-GUIDE.md` (or `API.md`) |
| Formulas / “how it works” | `{{PACKAGE}}/METHODOLOGY.md` (or design notes) |
| Security / trust boundary | `{{PACKAGE}}/SECURITY.md` — **omit** when [security modularity](./rules/security.md#security-documentation-modularity) allows |
| Language surface inventory | Project copy of inventory (policy: [security.md](./rules/security.md#language-surface-inventory)) |
| Security & code-validation certification | `certification/README.md` — **omit** when not maintained |
| Data or schema definitions | `{{SCHEMA_PATH}}` |
| Default config | `{{CONFIG_PATH}}` |
| Golden tests / fixtures | `{{FIXTURES_PATH}}` |
| Python style / PEP-8 gate | [configs/pylintrc](./configs/pylintrc) (copy as `.pylintrc`, or pass `--rcfile`) |

**Rule:** Adding, removing, or renaming intentional source files should update the inventory (catalog or equivalent) in the same change set when the project maintains one.

---

## Domain modules

| Module | Topic |
|--------|--------|
| [rules/hygiene.md](./rules/hygiene.md) | Root vs purpose dirs; kit-repo vs adopter layout; SETUP/UPGRADE lifecycle |
| [rules/authoring-and-style.md](./rules/authoring-and-style.md) | Docs rules; formatting; pylint; non-Python style |
| [rules/architecture.md](./rules/architecture.md) | Entry points, composition, runtime separation, dependencies |
| [rules/contracts.md](./rules/contracts.md) | What is a contract; co-updates; cross-reference policy |
| [rules/security.md](./rules/security.md) | Trust baseline; inventory; SAST; certification |
| [rules/versioning-and-git.md](./rules/versioning-and-git.md) | Version surfaces; CHANGELOG; commits; AI disclosure |
| [rules/verification-and-ops.md](./rules/verification-and-ops.md) | Verify table; completion; cadence; anti-patterns; checklist |

Adopters may keep a `rules/` tree next to project `RULES.md`, or fold selected modules into a single file—document the choice in the authority map. See [UPGRADE.md](./UPGRADE.md) merge options.

---

## Kit baseline

After initiation, `SETUP.md` is gone. Projects still need a durable record of **which kit version** they adopted and **where upgrades come from**.

Fill and keep this table in every adopting project’s `RULES.md`. Update it on every kit upgrade.

| Field | Value |
|-------|--------|
| Adopted kit version | `{{KIT_VERSION}}` |
| Adopted on | `{{KIT_ADOPTED_ON}}` |
| Kit source | https://github.com/shainemeister/repo-kit |

**Kit source** is always **https://github.com/shainemeister/repo-kit** for this standards kit (not a free-form alternate). Forks that deliberately diverge document their own source.

**This repository (the kit itself):**

| Field | Value |
|-------|--------|
| Adopted kit version | *(this repo **is** the kit — current kit version = latest dated `### [X.Y.Z]` under `## repo-kit` in [CHANGELOG.md](./CHANGELOG.md))* |
| Adopted on | — |
| Kit source | https://github.com/shainemeister/repo-kit |

At adopt time: read the kit’s [CHANGELOG.md](./CHANGELOG.md) (latest released `### [X.Y.Z]` under `## repo-kit`), set **Adopted kit version** and **Adopted on**, keep **Kit source** as above, then delete or archive `SETUP.md`. Prefer keeping or re-fetching [UPGRADE.md](./UPGRADE.md) for later bumps.

---

## Upgrading the kit

**Do not use SETUP after initiation.** Follow the durable guide:

→ **[UPGRADE.md](./UPGRADE.md)** — routine upgrade procedure, **1.x → 2.0 path migration**, merge options, and copy-paste AI prompts.

Short reminder: read Kit baseline → open Kit source `kit/CHANGELOG.md` under `## repo-kit` → merge only needed deltas → preserve project authority map and verification → update baseline + project CHANGELOG note.

Copy-paste prompt also on root [README — Upgrade repo-kit](../README.md#upgrade-repo-kit).

---

## Document history

| Version | Notes |
|---------|--------|
| 2.0.0 | Kit 2.0 hub: authority map + kit baseline + domain module index; body content moved to `rules/*`; upgrade deferred to UPGRADE.md |
| 1.4.1 | (pre-split) Upgrade procedure from Kit baseline; README AI prompt deep link |
| 1.4.0 | Language inventory; SAST required when declared; certification schema; completion rule |
| 1.3.1–1.0.0 | See kit CHANGELOG history under `## repo-kit` for full lineage before modular split |
