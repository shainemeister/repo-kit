---
title: Repository Maintenance Rules
description: Maintenance policy hub—authority map, kit baseline, and index to domain rule modules.
version: "2.2.1"
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
  - agents/README.md
  - agents/OPS.md
  - rules/hygiene.md
  - rules/authoring-and-style.md
  - rules/architecture.md
  - rules/contracts.md
  - rules/security.md
  - rules/versioning-and-git.md
  - rules/verification-and-ops.md
  - configs/pylintrc
last_updated: "2026-08-10"
---

# Repository Maintenance Rules

Fundamental rules for maintaining a professional, auditable repository. This file is the **hub**: authority map, kit baseline, and Must / Must not. Domain detail lives in [rules/](./rules/). In adopting product repos this hub lives at **`kit/RULES.md`**.

**Document version:** 2.2.1  

**Related:** [README.md](../README.md) · [SETUP.md](./SETUP.md) · [UPGRADE.md](./UPGRADE.md) · [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) · [CHANGELOG.md](./CHANGELOG.md) · [agents/README.md](./agents/README.md) · [agents/OPS.md](./agents/OPS.md) · [rules/](./rules/) · [configs/pylintrc](./configs/pylintrc)

---

## Summary

**RULES.md** is the maintenance policy hub. Detailed contracts live in package guides and in domain modules under [rules/](./rules/). When contracts change, update the **canonical** file in the same change set—see [rules/contracts.md](./rules/contracts.md).

Copy this hub (and the `rules/` modules you need) into the project’s **`kit/`** directory and **fill the authority map and verification table** with real paths and commands. Product code stays **outside** `kit/` ([hygiene](./rules/hygiene.md)). On initiation, derive paths from **project interest** (see [SETUP.md](./SETUP.md)). Keep authoring shape in [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md). Filled map examples: [examples/](./examples/).

| Must | Must not |
|------|----------|
| Update canonical docs with behavior changes ([contracts](./rules/contracts.md)) | Commit secrets, regenerable outputs, or real sensitive data |
| Maintain **project root** `CHANGELOG.md` (Keep a Changelog) | Ship version bumps or release-worthy changes without CHANGELOG |
| Keep standards under **`kit/`**; product outside | Flatten RULES/standards onto product root as default |
| Keep [Kit baseline](#kit-baseline) current after adopt/upgrade | Lose track of kit version after deleting SETUP |
| Use conventional commit messages that match staged files ([versioning-and-git](./rules/versioning-and-git.md)) | Mix unrelated packages or leave CLI/API/security docs stale |
| Keep packages composable at the workflow layer ([architecture](./rules/architecture.md)) | Silently rename public APIs, CLI fields, or schema columns |
| Run **pylint** on Python product code after those edits ([authoring-and-style](./rules/authoring-and-style.md)) | Treat pylint as a product runtime install for end users |
| Fill [language surface inventory](./rules/security.md#language-surface-inventory); run declared style + SAST before complete | Paste the full multi-language SAST table without inventory evidence |
| Verify before sharing contract or behavior changes ([verification-and-ops](./rules/verification-and-ops.md)) | Claim complete when a **declared** style or SAST gate was skipped or failed |
| Regenerate `certification/` outputs when that folder is maintained | Commit `last_certification.*` or treat certification as a product launcher gate |
| Fill authority map + verification from project interest at start | Leave contracts empty until “docs later” after behavior ships |
| Treat Agent Instruct packs as **views** over this hub + domain modules ([agents](./agents/README.md)) | Embed full persona bodies in this hub; invent a second RULES tree in packs |
| **When Agent Instruct is in use:** match the user task to **one primary** expert pack; follow [OPS](./agents/OPS.md) O3 before substantive work | Ignore active packs and improvise durable policy only in chat |
| **When Instruct is in use:** open pack expertise (`authority_paths` + references); co-update **canonical L4** docs/rules in the same change set ([contracts](./rules/contracts.md)) | Load all generated packs, or use remote URLs as overlays/law |
| **When Instruct is in use:** evolve agents (PLAN + [BUILD](./agents/BUILD.md)) when features, packages, surfaces, languages, or durable task classes appear | Leave packs stale after authority map / inventory / enablement change |
| Follow [Operator enforcement](#operator-enforcement) on every maintenance turn | Skip request verify, procedure check, or Progress Tracker when advancing repo work |

**First adopt:** [SETUP.md](./SETUP.md) (then delete or archive). **Later kit upgrades:** [UPGRADE.md](./UPGRADE.md) (durable). **Agent Instruct:** [agents/README.md](./agents/README.md) · utilization **[agents/OPS.md](./agents/OPS.md)** (description + link only in this hub). **Operator checklist:** [Operator enforcement](#operator-enforcement).

---

## Operator enforcement

Standing checklist for AI and humans **maintaining this repository**. Domain detail stays in linked modules—do **not** treat this list as a second RULES tree or paste full persona bodies here.

| # | Must | Detail / owner |
|---|------|----------------|
| 1 | **Verify the user request** and comply with this hub + domain modules | Open the [authority map](#authority-map); do not invent policy outside L4 |
| 2 | **Validate the procedure** before execution | When Instruct: [OPS O3](./agents/OPS.md). Always: declared gates and completion ([verification-and-ops](./rules/verification-and-ops.md)) |
| 3 | **Apply the appropriate Agent / Persona** for the task | When Instruct is in use: one primary expert pack ([OPS](./agents/OPS.md), [When Instruct is in use](#when-agent-instruct-is-in-use)). Bare adopt: this hub + domain modules only |
| 4 | **Ensure or build a plan** when work is multi-step or durable | Prefer root `PLAN.md` / task plan; Agent models when Instruct ([PLAN-HOOK](./agents/PLAN-HOOK.md)). Skip for trivial single-step replies |
| 5 | **Git format + confirm complete** | Conventional commits match staged files ([versioning-and-git](./rules/versioning-and-git.md)); confirm docs co-updates and declared gates before “done” ([completion rule](./rules/verification-and-ops.md#completion-rule)) |
| 6 | **Progress Tracker** at the end of each reply that advances work | Ordered tasks with status; **commit SHA** for each completed task that was committed; `—` if not committed |

### Progress Tracker (minimum shape)

End every reply that advances repository work with:

```markdown
### Progress Tracker
| # | Task | Status | Commit |
|---|------|--------|--------|
| 1 | … | done | `abc1234` |
| 2 | … | in progress | — |
```

| Field | Values / rule |
|-------|----------------|
| **Status** | `done` · `in progress` · `blocked` · `skipped` |
| **Commit** | Short or full SHA when that ordered task produced a git commit; otherwise `—` |
| Pure Q&A (no repo work) | One line is enough: `Progress: no repo changes` |

Do not invent commit SHAs. Do not require a commit for every tracker row.

---

## Contents

1. [Summary](#summary)
2. [Operator enforcement](#operator-enforcement)
3. [Authority map](#authority-map)
4. [Domain modules](#domain-modules)
5. [When Agent Instruct is in use](#when-agent-instruct-is-in-use)
6. [Kit baseline](#kit-baseline)
7. [Upgrading the kit](#upgrading-the-kit)
8. [Document history](#document-history)

---

## Authority map

Update the **owner** document for a change. Cross-link; do not duplicate full contracts ([contracts.md](./rules/contracts.md)).

Replace paths below with your project’s real files. Rows that do not apply may be removed; add rows for domain-specific contracts. For filled skeletons by interest, see [examples/](./examples/).

| Concern | Canonical source |
|---------|------------------|
| Repo purpose and quick start | Project root [README.md](../README.md) |
| One-time adoption (ephemeral) | [SETUP.md](./SETUP.md) — under `kit/`; follow, then delete or archive |
| Kit upgrade / migration (durable) | [UPGRADE.md](./UPGRADE.md) — under `kit/` |
| Path-level file inventory (optional) | Root `FILE-CATALOG.md` (or equivalent) |
| Markdown structure, frontmatter, author checklist | [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) · [templates/](./templates/) |
| Maintenance policy hub (this file) | **`kit/RULES.md`** ([RULES.md](./RULES.md)) |
| Contract policy (breaking changes, co-updates, cross-links) | [rules/contracts.md](./rules/contracts.md) |
| Root hygiene / packaging (`kit/` vs product) | [rules/hygiene.md](./rules/hygiene.md) |
| Authoring + style gates | [rules/authoring-and-style.md](./rules/authoring-and-style.md) |
| Architecture boundaries | [rules/architecture.md](./rules/architecture.md) |
| Security, inventory, SAST, certification | [rules/security.md](./rules/security.md) |
| Versioning, CHANGELOG rules, git | [rules/versioning-and-git.md](./rules/versioning-and-git.md) |
| Verification, completion, checklist | [rules/verification-and-ops.md](./rules/verification-and-ops.md) |
| Project history (**required**) | Adopters: **project root** `CHANGELOG.md`. This kit repo: [CHANGELOG.md](./CHANGELOG.md) under `## repo-kit` |
| Kit version history (upstream) | Kit source `kit/CHANGELOG.md` under `## repo-kit` |
| Standards kit baseline | [Kit baseline](#kit-baseline) in this file (version + source) |
| Filled authority-map examples (kit reference) | [examples/](./examples/) |
| Package overview | `{{PACKAGE}}/README.md` (**outside** `kit/`) |
| CLI or automation contract | `{{PACKAGE}}/CLI-GUIDE.md` (or `API.md`) |
| Formulas / “how it works” | `{{PACKAGE}}/METHODOLOGY.md` (or design notes) |
| Security / trust boundary | `{{PACKAGE}}/SECURITY.md` — **omit** when [security modularity](./rules/security.md#security-documentation-modularity) allows |
| Language surface inventory | Filled inventory (policy: [security.md](./rules/security.md#language-surface-inventory)) |
| Security & code-validation certification | Root `certification/README.md` — **omit** when not maintained |
| Data or schema definitions | `{{SCHEMA_PATH}}` (outside `kit/` unless pure standards) |
| Default config | `{{CONFIG_PATH}}` |
| Golden tests / fixtures | `{{FIXTURES_PATH}}` |
| Python style / PEP-8 gate | [configs/pylintrc](./configs/pylintrc) (copy as `.pylintrc` at package or repo root, or pass `--rcfile`) |
| Agent Instruct (framework, catalog, BUILD, runtime, OPS) | [agents/README.md](./agents/README.md) — index to FRAMEWORK, PARAMS, CATALOG, PLAN-HOOK, BUILD, RUNTIME, **OPS** |
| Agent utilization (order of operations) | [agents/OPS.md](./agents/OPS.md) — required O3 when Instruct is in use |
| Project agent control surface | Root `PLAN.md` (**Agent models** section) — required when using agents; see [agents/PLAN-HOOK.md](./agents/PLAN-HOOK.md) |
| Generated agent packs | [agents/generated/](./agents/generated/) — project-filled expert views; track thin packs recommended |

**Rule:** Adding, removing, or renaming intentional source files should update the inventory (catalog or equivalent) in the same change set when the project maintains one.

---

## Domain modules

| Module | Topic |
|--------|--------|
| [rules/hygiene.md](./rules/hygiene.md) | Packaging: standards under `kit/`; product outside; SETUP/UPGRADE lifecycle |
| [rules/authoring-and-style.md](./rules/authoring-and-style.md) | Docs rules; formatting; pylint; non-Python style |
| [rules/architecture.md](./rules/architecture.md) | Entry points, composition, runtime separation, dependencies |
| [rules/contracts.md](./rules/contracts.md) | What is a contract; co-updates; cross-reference policy |
| [rules/security.md](./rules/security.md) | Trust baseline; inventory; SAST; certification |
| [rules/versioning-and-git.md](./rules/versioning-and-git.md) | Version surfaces; CHANGELOG; commits; AI disclosure |
| [rules/verification-and-ops.md](./rules/verification-and-ops.md) | Verify table; completion; cadence; anti-patterns; checklist |

Adopters keep domain modules under **`kit/rules/`**, or fold selected modules into a single `kit/RULES.md`—document the choice in the authority map. See [UPGRADE.md](./UPGRADE.md) merge options.

### Optional Instruct (not foldable)

| Path | Topic |
|------|--------|
| [agents/](./agents/) | Agent Instruct — L3 **views** over this hub + `rules/*`; **not** a replacement for domain modules |
| [agents/OPS.md](./agents/OPS.md) | Utilization O3 when Instruct is in use |

**Do not fold** full Agent Instruct personas, templates, or generated packs into this hub. Keep **description + link only** in the [authority map](#authority-map). See [agents/README.md](./agents/README.md) · [When Agent Instruct is in use](#when-agent-instruct-is-in-use).

---

## When Agent Instruct is in use

**Bare adopt** (no PLAN Agent models, no Instruct packs) skips this section—use this hub and domain modules only.

When Agent Instruct **is** adopted (PLAN **Agent models** present and/or tracked packs under `kit/agents/generated/`):

1. Follow **[agents/OPS.md](./agents/OPS.md)** order of operations (O3): detect → PLAN → L4 map → **match one primary expert pack** → expertise → act → **co-maintain** docs/rules → lifecycle BUILD if needed → verify.  
2. Packs are **views** over this hub + `rules/*` + product contracts. On conflict, **L4 (this hub and domain modules) wins**.  
3. Open pack `authority_paths` and curated **expertise** (in-repo + trusted external **citations** only). Remote URLs are never overlays or substitute law.  
4. Co-update the **canonical** owner document for any behavior/contract change in the **same change set** ([contracts](./rules/contracts.md)).  
5. When features, packages, public surfaces, languages, or durable task classes appear: update PLAN Agent models and re-run [BUILD](./agents/BUILD.md).  
6. Do **not** claim complete if a **declared** Domain A/B gate or required pack verify item failed or was skipped ([verification-and-ops](./rules/verification-and-ops.md#completion-rule)).

Index: [agents/README.md](./agents/README.md). Matching detail: [agents/RUNTIME.md](./agents/RUNTIME.md).

---

## Kit baseline

After initiation, `SETUP.md` is gone. Projects still need a durable record of **which kit version** they adopted and **where upgrades come from**.

Fill and keep this table in every adopting project’s **`kit/RULES.md`**. Update it on every kit upgrade.

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

→ **[UPGRADE.md](./UPGRADE.md)** — routine upgrade procedure, **1.x / root-layout → 2.x** migration (standards into `kit/`), merge options, and copy-paste AI prompts.

Short reminder: read Kit baseline in `kit/RULES.md` → open Kit source `kit/CHANGELOG.md` under `## repo-kit` → merge deltas into project `kit/` → preserve product paths and verification → update baseline + project root CHANGELOG note.

Copy-paste prompt also on root [README — Upgrade repo-kit](../README.md#upgrade-repo-kit).

---

## Document history

| Version | Notes |
|---------|--------|
| 2.2.1 | Operator enforcement checklist + Progress Tracker (request verify, procedure, persona, plan, git/complete, tracker) |
| 2.2.0 | Instruct utilization: O3 Musts when Instruct in use; OPS authority-map row; When Agent Instruct is in use subsection (kit 2.2.0) |
| 2.1.1 | Agent Instruct: optional Instruct subsection; agents **not foldable** into hub (description + link only) |
| 2.1.0 | Agent Instruct: authority map rows (agents README, PLAN control surface, generated/); packs are views; domain index line for `kit/agents/` |
| 2.0.1 | Adopter packaging: standards under `kit/`; project CHANGELOG and product paths outside; hygiene-aligned authority map |
| 2.0.0 | Kit 2.0 hub: authority map + kit baseline + domain module index; body content moved to `rules/*`; upgrade deferred to UPGRADE.md |
| 1.4.1 | (pre-split) Upgrade procedure from Kit baseline; README AI prompt deep link |
| 1.4.0 | Language inventory; SAST required when declared; certification schema; completion rule |
| 1.3.1–1.0.0 | See kit CHANGELOG history under `## repo-kit` for full lineage before modular split |
