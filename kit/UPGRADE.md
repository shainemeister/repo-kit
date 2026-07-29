---
title: Upgrade repo-kit
description: Durable guide for upgrading an existing kit baseline, including 1.x to 2.0 path migration and merge options for live repositories.
version: "1.0.0"
status: current
audience:
  - developers
  - maintainers
doc_type: other
related:
  - RULES.md
  - SETUP.md
  - CHANGELOG.md
  - ../README.md
  - rules/versioning-and-git.md
  - rules/hygiene.md
last_updated: "2026-07-28"
---

# Upgrade repo-kit

Durable procedure for **repositories that already adopted** the Repository Standards Kit. Not deleted after initiation—keep a local copy or always open this file at Kit source.

**Document version:** 1.0.0  

**Related:** [RULES.md](./RULES.md) · [SETUP.md](./SETUP.md) · [CHANGELOG.md](./CHANGELOG.md) · [README.md](../README.md) · [versioning-and-git.md](./rules/versioning-and-git.md) · [hygiene.md](./rules/hygiene.md)

---

## Summary

| Situation | Use |
|-----------|-----|
| **No** Kit baseline / never adopted | Stop — use [SETUP.md](./SETUP.md) (first adopt) |
| Baseline **≥ 2.0.0** | [Routine upgrade procedure](#routine-upgrade-procedure) |
| Baseline **&lt; 2.0.0** (any 1.x) | [Migrate from kit 1.x to 2.0](#migrate-from-kit-1x-to-20), then apply any later deltas via routine upgrade |

**Prerequisite:** Kit baseline table exists in project `RULES.md` ([Kit baseline](./RULES.md#kit-baseline)).

---

## Contents

1. [Summary](#summary)
2. [Choose your path](#choose-your-path)
3. [Routine upgrade procedure](#routine-upgrade-procedure)
4. [Migrate from kit 1.x to 2.0](#migrate-from-kit-1x-to-20)
5. [Merge strategy options](#merge-strategy-options)
6. [Preserve list](#preserve-list)
7. [Copy-paste AI prompts](#copy-paste-ai-prompts)
8. [Document history](#document-history)

---

## Choose your path

| Path | Condition | Jump to |
|------|-----------|---------|
| **First adopt into existing repo** | No Kit baseline | [SETUP.md](./SETUP.md) (selective / align mode) |
| **Routine upgrade** | Baseline ≥ 2.0.0 | [Routine upgrade procedure](#routine-upgrade-procedure) |
| **Major path migration** | Baseline &lt; 2.0.0 (any 1.x) | [Migrate from kit 1.x to 2.0](#migrate-from-kit-1x-to-20) |

---

## Routine upgrade procedure

1. Read this project’s **Kit baseline** (Adopted kit version, Kit source, Adopted on) in `RULES.md`.  
2. Open **Kit source** (canonical: https://github.com/shainemeister/repo-kit) → [`kit/CHANGELOG.md`](./CHANGELOG.md) → `## repo-kit`.  
3. List releases **after** your Adopted kit version only.  
4. Build a **focused merge plan**: only pieces this project uses (hub `RULES.md` policy, `rules/*` modules, `MARKDOWN-STANDARD.md`, templates, `configs/pylintrc`, `.gitignore` patterns, examples as reference).  
5. **Preserve** project-specific values — see [Preserve list](#preserve-list).  
6. Apply the merge; fix relative links if the project keeps a `rules/` tree.  
7. Update **Adopted kit version** and **Adopted on**; keep Kit source unchanged (unless this repo is a deliberate fork).  
8. Project root `CHANGELOG.md`: short note under the current version section (e.g. under Changed: “Upgraded repo-kit baseline to X.Y.Z”)—**never** paste full kit history.  
9. Re-run the project verification table / [completion rule](./rules/verification-and-ops.md#completion-rule) for declared surfaces.  
10. Optional: refresh a local copy of this `UPGRADE.md` from the kit if you keep one in-tree.

No automation is required—policy and the [contributor checklist](./rules/verification-and-ops.md#contributor-checklist) enforce the practice.

---

## Migrate from kit 1.x to 2.0

Kit **2.0.0** moved the standards payload under `kit/` and split RULES into a hub plus domain modules. Upstream **reading** paths changed; adopting **project** roots usually stay the same.

### Upstream path migration (kit source)

| Old (1.x) | New (2.0) |
|-----------|-----------|
| `/RULES.md` | `/kit/RULES.md` + `/kit/rules/*` |
| `/SETUP.md` | `/kit/SETUP.md` |
| *(none)* | `/kit/UPGRADE.md` (this file) |
| `/MARKDOWN-STANDARD.md` | `/kit/MARKDOWN-STANDARD.md` |
| `/CHANGELOG.md` | `/kit/CHANGELOG.md` |
| `/configs/` | `/kit/configs/` |
| `/templates/` | `/kit/templates/` |
| `/examples/` | `/kit/examples/` |

Canonical release notes: [CHANGELOG.md — 2.0.0](./CHANGELOG.md) under `## repo-kit`.

### What changes in the adopting project

| Topic | Guidance |
|-------|----------|
| Project `RULES.md` location | **Usually stays at project root** |
| Modular rules | **Recommended:** add project `rules/` matching kit modules you care about; hub links to them **or** fold child content into a single RULES (document choice in the authority map) |
| New contracts module | Merge [contracts](./rules/contracts.md) policy; add authority-map row for contract policy |
| MARKDOWN-STANDARD / templates / pylintrc | Merge from `kit/…` as today |
| SETUP | Do not re-introduce permanent SETUP; use **this file** going forward |
| UPGRADE.md | Add or refresh durable upgrade guide (copy optional) |
| Deep links / AI prompts | Point at `kit/UPGRADE.md` and `kit/CHANGELOG.md` on Kit source |

### 1.x → 2.0 checklist

- [ ] Confirm baseline is 1.x  
- [ ] Read migration table above and CHANGELOG 2.0.0  
- [ ] Merge RULES **hub** shape (thin index + authority map + kit baseline)  
- [ ] Introduce or merge `rules/*` (at least contracts + security + verification if product code)  
- [ ] Update project docs that linked to old kit **root** paths on GitHub  
- [ ] Update AI/agent prompts and runbooks to `kit/UPGRADE.md` / `kit/CHANGELOG.md`  
- [ ] Set baseline to **2.0.0** (or latest 2.x after applying later deltas via routine upgrade)  
- [ ] Project CHANGELOG note for major kit upgrade  

Then run [Routine upgrade procedure](#routine-upgrade-procedure) for any releases after 2.0.0 if needed.

---

## Merge strategy options

| Strategy | When | How |
|----------|------|-----|
| **Selective file merge** | Default | Copy/merge only changed kit files into project paths |
| **Reference / submodule** | Want upstream tracking | Submodule or sibling clone of repo-kit; project RULES stays filled; compare `kit/CHANGELOG` on upgrade |
| **Single-file RULES** | Small teams | Keep one project RULES; on upgrade, manually port deltas from hub + children into that file; still record baseline |
| **Hub + rules/ tree** | Recommended for 2.x | Mirror kit shape under project root: `RULES.md` + `rules/*.md` |

Dual layout (kit packaging vs product root): [hygiene.md](./rules/hygiene.md).

---

## Preserve list

Never clobber on merge:

- Authority map **project paths**  
- Language surface inventory **filled rows**  
- Verification commands  
- Package CLI / SECURITY / METHODOLOGY content  
- Project CHANGELOG **history**  
- Kit baseline **Kit source** URL (unless deliberate fork)  

---

## Copy-paste AI prompts

### Routine upgrade

```text
Upgrade repo-kit for this repository (Kit baseline already present in RULES.md).

1. Read Kit baseline (Adopted kit version, Kit source).
2. Open kit/UPGRADE.md and kit/CHANGELOG.md under ## repo-kit at Kit source (https://github.com/shainemeister/repo-kit).
3. Follow UPGRADE routine procedure; merge only appropriate deltas; preserve authority map and verification.
4. Update Kit baseline; add project CHANGELOG note.
```

### 1.x → 2.0 migration

```text
Migrate this repository from repo-kit 1.x to 2.0 using kit/UPGRADE.md (Migrate from kit 1.x to 2.0).
Preserve project authority map paths and verification commands. Introduce rules/ modules or fold policy per UPGRADE merge options. Update baseline and project CHANGELOG.
```

### First adopt into existing repo (no baseline)

```text
This repository has no repo-kit baseline. Follow kit/SETUP.md selective adoption for an existing codebase; then record Kit baseline. Do not use UPGRADE until after first adopt.
```

---

## Document history

| Version | Notes |
|---------|--------|
| 1.0.0 | Initial durable upgrade guide for kit 2.0; routine procedure; 1.x→2.0 migration; merge options; AI prompts |
