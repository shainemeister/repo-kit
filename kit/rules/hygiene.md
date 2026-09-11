---
title: Root Hygiene
description: Unified packaging—standards under kit/, programming source under src/ (files.md), repository-specific data outside; SETUP and UPGRADE lifecycles.
version: "1.7.0"
status: current
audience:
  - developers
  - technical-writers
doc_type: other
related:
  - ../RULES.md
  - ../SETUP.md
  - ../UPGRADE.md
  - ./files.md
  - ./ai-docs-workspace.md
  - ./workboard.md
  - ../../README.md
last_updated: "2026-09-10"
---

# Root Hygiene

Keep the repository root **scannable**: entry points and project-specific surfaces first; **standards under `kit/`**; programming source under `src/` ([files.md](./files.md)); product and AI workspace in purpose directories outside `kit/`.

**Related:** [RULES.md](../RULES.md) · [SETUP.md](../SETUP.md) · [UPGRADE.md](../UPGRADE.md) · [files.md](./files.md) · [ai-docs-workspace.md](./ai-docs-workspace.md) · [workboard.md](./workboard.md) · [README.md](../../README.md)

---

## Summary

| Must |
|------|
| Keep adopted standards under `kit/`; product code, project CHANGELOG, PLAN, and live `docs/` stay **outside** `kit/` |
| Greenfield default: `kit/RULES.md` + `kit/rules/*`, not root `RULES.md` |
| Treat [SETUP](../SETUP.md) as ephemeral; keep [UPGRADE](../UPGRADE.md) and [Kit baseline](../RULES.md#kit-baseline) durable |
| Update the [authority map](../RULES.md#authority-map) in the same change set when listed paths change |
| Existing 1.x adoptions may migrate gradually; greenfield **must** use this layout ([UPGRADE](../UPGRADE.md)) |

---

## Contents

1. [Unified packaging](#unified-packaging)
2. [What belongs at project root](#what-belongs-at-project-root)
3. [What belongs under kit/](#what-belongs-under-kit)
4. [What does not belong at root or under kit/](#what-does-not-belong-at-root-or-under-kit)
5. [Separation rules](#separation-rules)
6. [Supporting practices](#supporting-practices)
7. [SETUP and UPGRADE lifecycles](#setup-and-upgrade-lifecycles)
8. [Document history](#document-history)

---

## Unified packaging

| Context | Standards | Repository-specific |
|---------|-----------|---------------------|
| **This repository (repo-kit)** | Entire payload under [`kit/`](../) | Root README (kit landing), LICENSE, `.gitignore`; kit history in `kit/CHANGELOG.md` under `## repo-kit` |
| **Adopting product repo** | Same: standards under **`kit/`** (copy/merge from upstream `kit/`, or link/submodule) | Root product README, **project** `CHANGELOG.md`, optional `PLAN.md`, optional/dynamic **`docs/`**, programming source under `src/` ([files.md](./files.md)), certification |

**Default for new implementations:** `kit/RULES.md` (filled hub) + `kit/rules/*` — not root-level `RULES.md`.

**Escape hatch:** reference or submodule the upstream kit without a local copy; still treat *project* history and product code as outside any standards tree, and record Kit baseline in the project’s maintenance hub path you document in the authority map.

---

## What belongs at project root

When to create a path, how to name it, and when a directory needs an index README: [files.md](./files.md) (this table catalogs homes).

| File / item | Role |
|-------------|------|
| `README.md` | Product / public landing ([landing](../MARKDOWN-STANDARD.md#landing--root-readme-no-frontmatter)) |
| `LICENSE` | License |
| `.gitignore` | Ignore rules |
| `CHANGELOG.md` | **Project** history (**required**) — **not** kit release notes ([versioning](./versioning-and-git.md#mandatory-project-changelog)) |
| `PLAN.md` | Project plan (not shipped by the kit). **Required if Instruct**; optional for bare adopt ([PLAN-HOOK](../agents/PLAN-HOOK.md#plan-dual-path)) |
| `docs/` | **AI resource workspace** when used — outside `kit/` ([ai-docs-workspace](./ai-docs-workspace.md)) |
| `docs/WORKBOARD.md` | **Multi-phase execution board** when used — project data, not kit law ([workboard](./workboard.md)) |
| Package or product entry files | Only when they are the natural top-level surface |
| `.pylintrc` | Optional at root **if** Python is in the [inventory](./security.md#language-surface-inventory) (or package-local / under `kit/configs/`) |
| `rustfmt.toml` / `clippy.toml` | Optional at root **if** Rust is in the [inventory](./security.md#language-surface-inventory) |
| `.clang-format` / `.clang-tidy` | Optional at root **if** C / C++ is in the [inventory](./security.md#language-surface-inventory) |
| `AGENTS.md` | L0 pointer **only if** a coding agent is used — thin pointer to `kit/RULES.md` ([HABITAT](../agents/HABITAT.md)); not kit law |
| Thin host alias (e.g. `CLAUDE.md`) | Only if a **detected** host will not see `AGENTS.md`; 1–3 lines ([HABITAT](../agents/HABITAT.md)) |

---

## What belongs under `kit/`

| File / item | Role |
|-------------|------|
| `RULES.md` | Maintenance hub + authority map + kit baseline (**project-filled**) |
| `rules/` | Domain modules from upstream `kit/rules/` |
| `MARKDOWN-STANDARD.md` | Authoring standard (or link to upstream) |
| `UPGRADE.md` | Durable upgrade guide (local copy optional; may always open from Kit source) |
| `SETUP.md` | One-time only — **delete or archive after initiation** |
| `configs/` | Optional local style configs (pylintrc, rustfmt.toml, clippy.toml, clang-format, clang-tidy). Copy to the product root **only** for languages in the [inventory](./security.md#language-surface-inventory); leftover files after a whole-`kit/` copy are dormant catalog |
| `templates/` | Optional local document skeletons |
| `examples/` | Optional reference only (usually not required in product repos) |
| `agents/` | Agent Instruct **L2** law, templates, examples; project-filled packs under `agents/generated/` (views). Not the host auto-load file ([HABITAT](../agents/HABITAT.md)) |

**Do not** treat kit `CHANGELOG.md` as the product’s project history. Read Kit source `kit/CHANGELOG.md` under `## repo-kit` when upgrading.

---

## What does not belong at root or under `kit/`

| Concern | Preferred home |
|---------|----------------|
| Product packages / services | Programming source: repo-root `src/` ([files.md](./files.md)). Workflow-joined package dirs (e.g. `packages/<name>/`) may remain **if** their source still lives under `src/<segment>/` |
| Package-level contracts (CLI, SECURITY, methodology) | Inside the package |
| Formal security + code-validation certificates | `certification/` at repo root (or documented path); regenerable outputs gitignored |
| AI research / detailed plans / build notes | Root **`docs/`** — not under `kit/` and not as ad-hoc root `notes.md` sprawl ([ai-docs-workspace](./ai-docs-workspace.md)) |
| Scripts / helpers | Developer/build helpers: `src/build/` procedure segment ([files.md](./files.md)). Do not use `scripts/` or `tooling/` as a competing home |
| Regenerable output | Never committed |
| CI workflows | `.github/` (or equivalent) |
| Regenerable **mirrors** of agent packs in a host skill/rules dir | Prefer gitignore; keep packs under `kit/agents/generated/` |

---

## Separation rules

1. **Do not** put product code under `kit/`.  
2. **Do not** put kit release history into project root `CHANGELOG.md`.  
3. **Do not** use the project root as a dump of all standards files; keep standards under `kit/`.  
4. **Do not** put project AI research or build notes under `kit/`; use root `docs/` ([ai-docs-workspace](./ai-docs-workspace.md)).  
5. Authority map lists **owners**: standards paths under `kit/`, product and `docs/` paths outside (e.g. `packages/my-service/CLI-GUIDE.md`, `docs/plan/…`).  
6. Relative links from files under `kit/` to root or product use `../` (e.g. `../README.md`, `../CHANGELOG.md`, `../docs/…`, `../packages/…`).  
7. Existing 1.x adoptions may gradually move root-level standards into `kit/`; greenfield **must** use this layout — see [UPGRADE.md](../UPGRADE.md).

---

## Supporting practices

1. Update the [authority map](../RULES.md#authority-map) in the **same change set** whenever an intentional path is added, removed, or renamed (when the map lists that path).  
2. Prefer purpose directories over additional root files.  
3. Mark ephemeral files clearly (e.g. SETUP header) so they do not accumulate.  
4. Respect `.gitignore`; never force-add regenerable artifacts.  
5. When docs move, apply [contracts](./contracts.md#cross-reference-rules) (one sentence + deep link; retarget inbound links).

---

## SETUP and UPGRADE lifecycles

| File | Lifecycle | Audience |
|------|-----------|----------|
| [SETUP.md](../SETUP.md) | **Ephemeral** — follow, then delete or archive from the project’s `kit/` | First adopt (greenfield or existing repo without baseline) |
| [UPGRADE.md](../UPGRADE.md) | **Durable** — keep under `kit/` or always open from Kit source | Already adopted; routine upgrades and 1.x → 2.x layout migration |
| [Kit baseline](../RULES.md#kit-baseline) | **Durable** in project `kit/RULES.md` | Survives SETUP removal; required for upgrades |

---

## Document history

| Version | Notes |
|---------|--------|
| 1.7.0 | Programming source cites files.md (`src/`); helpers `src/build/`; `scripts/` is not a competing home (kit 2.14.0) |
| 1.6.1 | Cite files.md for create/place/name/index; packaging Musts unchanged |
| 1.6.0 | Restyle to density shape (kit 2.7.0); unique packaging rules unchanged |
| 1.5.1 | Root README landing shape required (kit 2.6.2) |
| 1.5.0 | Optional root `AGENTS.md` / thin host alias; regenerable host mirrors (kit 2.6.0) |
| 1.4.1 | Optional root rustfmt/clippy/clang configs when those languages ship (kit 2.5.0) |
| 1.4.0 | `docs/WORKBOARD.md` allowed at docs root (kit 2.4.0) |
| 1.3.0 | Root `docs/` AI workspace outside kit; separation rules (kit 2.3.0) |
| 1.2.0 | Agent Instruct: `kit/agents/`; PLAN required when using agents; generated packs are project-filled views under `kit/` |
| 1.1.0 | Unified packaging: adopters keep standards under `kit/`; product and project CHANGELOG outside; remove “flatten to root” default |
| 1.0.0 | Extracted from RULES 1.4.1 for kit 2.0; dual layout (later superseded) |
