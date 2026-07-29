---
title: Root Hygiene
description: What belongs at repository root versus purpose directories; kit-repo vs adopter layout; SETUP and UPGRADE lifecycles.
version: "1.0.0"
status: current
audience:
  - developers
  - technical-writers
doc_type: other
related:
  - ../RULES.md
  - ../SETUP.md
  - ../UPGRADE.md
  - ../CHANGELOG.md
last_updated: "2026-07-28"
---

# Root Hygiene

Keep the repository root **scannable**: entry points and policy first; purpose directories for everything else.

**Document version:** 1.0.0  

**Related:** [RULES.md](../RULES.md) · [SETUP.md](../SETUP.md) · [UPGRADE.md](../UPGRADE.md) · [CHANGELOG.md](../CHANGELOG.md)

---

## Summary

Root hygiene differs slightly for **this kit repository** versus **adopting product repositories**. Adopters copy standards **from** `kit/` **into** their project layout; they do not have to nest product code under `kit/`.

| Must | Must not |
|------|----------|
| Prefer purpose directories over extra root files | Accumulate ephemeral SETUP after initiation |
| Update the authority map when listed paths change | Force-add regenerable artifacts |
| Keep UPGRADE durable (or re-fetch from Kit source) | Treat kit packaging layout as mandatory product tree shape |

---

## Contents

1. [Summary](#summary)
2. [Dual layout](#dual-layout)
3. [Adopter project — what belongs at root](#adopter-project--what-belongs-at-root)
4. [This kit repository](#this-kit-repository)
5. [What does not belong at root](#what-does-not-belong-at-root)
6. [Supporting practices](#supporting-practices)
7. [SETUP and UPGRADE lifecycles](#setup-and-upgrade-lifecycles)
8. [Document history](#document-history)

---

## Dual layout

| Context | Layout |
|---------|--------|
| **This repository (repo-kit)** | Payload under [`kit/`](../); root holds only `README.md`, `LICENSE`, and `.gitignore` |
| **Adopting product repo** | Copy or merge pieces **from** upstream `kit/` **into** the **target project root** (or link/submodule and overlay). Product code, packages, and project `RULES.md` / `CHANGELOG.md` stay root-oriented unless the team chooses otherwise |

**Kit packaging ≠ adopter hygiene.** Do not force every product repo into `product/kit/RULES.md`.

---

## Adopter project — what belongs at root

After first adopt, a typical product repository root includes:

| File / item | Role |
|-------------|------|
| `README.md` | Landing / use-cases (no frontmatter) |
| `LICENSE` | License |
| `.gitignore` | Ignore rules |
| `RULES.md` | Maintenance hub + authority map + kit baseline |
| `MARKDOWN-STANDARD.md` | Writing and structure standard (or link to kit) |
| `CHANGELOG.md` | Project history (**required**) |
| `rules/` | Optional domain modules mirrored from kit (recommended for 2.x) |
| `SETUP.md` | One-time only — **delete or archive after initiation** |
| `UPGRADE.md` | Optional local copy of durable upgrade guide (or always open from Kit source) |
| `FILE-CATALOG.md` | Optional inventory |
| Package or product entry files | Only when they are the natural top-level surface |

---

## This kit repository

| Path | Role |
|------|------|
| Root `README.md` | Landing, mandatory governance, source inventory |
| Root `LICENSE` | MIT |
| Root `.gitignore` | Starter ignore list |
| [`kit/`](../) | Entire standards payload (SETUP, UPGRADE, RULES, children, templates, configs, examples, kit CHANGELOG) |

Permanent **kit** contracts live under `kit/`. Permanent **adopter** contracts after copy remain README / RULES / MARKDOWN-STANDARD / CHANGELOG (project root) plus kit baseline in RULES.

---

## What does not belong at root

| Concern | Preferred home |
|---------|----------------|
| Templates | `templates/` |
| Style configs | `configs/` (or package-local `.pylintrc` / tool config) |
| Filled examples | `examples/` (kit reference) |
| RULES domain modules | `rules/` (hub links here) |
| Scripts / helpers | `scripts/` or `tooling/` (keep minimal) |
| Formal security + code-validation certificates | `certification/` (see [security.md](./security.md)); regenerable outputs gitignored |
| Package-level contracts | Inside the package |
| Regenerable output | Never committed |
| CI workflows | `.github/` (or equivalent) |

---

## Supporting practices

1. Update the [authority map](../RULES.md#authority-map) in the **same change set** whenever an intentional path is added, removed, or renamed (when the map lists that path).  
2. Prefer purpose directories over additional root files.  
3. Mark ephemeral files clearly (e.g. SETUP header) so they do not accumulate.  
4. Respect `.gitignore`; never force-add regenerable artifacts.  
5. Prefer [contracts.md](./contracts.md) cross-link rules when docs move.

---

## SETUP and UPGRADE lifecycles

| File | Lifecycle | Audience |
|------|-----------|----------|
| [SETUP.md](../SETUP.md) | **Ephemeral** in adopting projects — follow, then delete or archive | First adopt (greenfield or existing repo without baseline) |
| [UPGRADE.md](../UPGRADE.md) | **Durable** — keep a local copy or always open from Kit source | Already adopted; routine upgrades and 1.x → 2.0 migration |
| [Kit baseline](../RULES.md#kit-baseline) | **Durable** in project RULES | Survives SETUP removal; required for upgrades |

First adopt: [SETUP.md](../SETUP.md). Later kit bumps: [UPGRADE.md](../UPGRADE.md).

---

## Document history

| Version | Notes |
|---------|--------|
| 1.0.0 | Extracted from RULES 1.4.1 for kit 2.0; dual layout (kit/ vs adopter root); UPGRADE durable lifecycle |
