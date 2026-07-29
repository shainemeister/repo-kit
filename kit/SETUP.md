# Setup — One-time adoption guide

> **One-time adoption guide — follow, then delete or archive.**

Use this file when starting or aligning a repository so **formal markdown guides development**, not only documents finished work. After you have filled the authority map, verification table, kit baseline, and first contracts, **delete or archive this file** so it does not accumulate as stale root noise.

This kit ships `SETUP.md` under [`kit/`](./) for first-time adopters. Adopting projects remove it after initiation. **Permanent contracts** for adopters: project root `README.md`, `RULES.md`, `MARKDOWN-STANDARD.md`, and `CHANGELOG.md`. The [Kit baseline](./RULES.md#kit-baseline) in RULES survives this file’s removal. **Later kit upgrades:** durable [UPGRADE.md](./UPGRADE.md) (do not rely on SETUP).

**Already have a Kit baseline?** Stop and use [UPGRADE.md](./UPGRADE.md).

---

## Summary

1. Choose an [adoption mode](#adoption-modes) (greenfield, existing repo, or reference).  
2. [State the interest](#1-state-the-interest) and [platform context](#2-set-platform-context).  
3. [Copy](#3-copy-kit-pieces) pieces **from `kit/`** into the **target project** (usually project root).  
4. [Fill the authority map](#4-fill-the-authority-map), [language inventory](./rules/security.md#language-surface-inventory), and verification table (see [examples/](./examples/)).  
5. [Record kit baseline](#4b-record-kit-baseline) and ensure project root `CHANGELOG.md` exists.  
6. [Pick templates](#5-pick-templates-by-interest), scaffold docs, and [verify](#8-first-verification-commands).  
7. [Delete or archive this file](#after-setup); point maintainers at [UPGRADE.md](./UPGRADE.md).

---

## Adoption modes

| Mode | Audience | What to do |
|------|----------|------------|
| **Full copy** | Greenfield (new repo) | Copy MARKDOWN-STANDARD, RULES hub, `rules/*` (as needed), templates, and `configs/pylintrc` (if Python). Use this checklist end-to-end. |
| **Selective copy / align** | **Existing repo, first kit adopt** | Same pieces, but **do not rewrite** product code layout; fill authority map with **real existing paths**; add only missing contracts; follow [Existing repository (first adopt)](#existing-repository-first-adopt). |
| **Reference / submodule** | Either | Link or submodule this kit; keep filled project RULES (hub + optional `rules/`) in the consuming repo. |

---

## Existing repository (first adopt)

For a **live codebase** that has never recorded a Kit baseline:

1. **Inventory current state** — languages, packages, existing README/docs, CI, secrets posture.  
2. **Do not force a directory rewrite** of product code to match kit examples; map reality into the authority map.  
3. **Minimal viable adopt:** project root `RULES.md` hub + kit baseline + root `CHANGELOG.md` + MARKDOWN-STANDARD (or link) + language inventory + verification rows for languages you already ship.  
4. **Add contracts only where surfaces exist** (CLI guide if a CLI exists; skip empty SECURITY per [modularity](./rules/security.md#security-documentation-modularity)).  
5. **Adopt contract policy** — copy [rules/contracts.md](./rules/contracts.md) (or fold its rules into project RULES) so co-update rules apply going forward.  
6. **Record Kit baseline** from [CHANGELOG.md](./CHANGELOG.md) under `## repo-kit`.  
7. **Project CHANGELOG** adoption entry under the current version.  
8. **Delete or archive this SETUP**; future kit bumps use **[UPGRADE.md](./UPGRADE.md)**.  
9. Prefer a project `rules/` tree (hub + modules) or document a single-file RULES choice in the authority map.

Dual layout (kit packaging vs product root): [rules/hygiene.md](./rules/hygiene.md).

---

## 1. State the interest

One sentence: product type (library / CLI / service / data tool / docs-only / monorepo) and primary user outcome.

**Example:** “CLI that validates config files and exits non-zero on contract failures.”

---

## 2. Set platform context

Primary OS for examples and verify commands: **Windows**, **Linux**, **macOS**, or **multi**.

Follow [Platform-aware examples](./MARKDOWN-STANDARD.md#platform-aware-examples): declare primary platform when examples are OS-specific; use dual shell fences when the team is multi-OS.

---

## 3. Copy kit pieces

Sources live under this kit’s `kit/` directory (this folder). Targets are usually the **adopting project root** (or a reference/submodule layout):

| Piece | Always? | Notes |
|-------|---------|--------|
| [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) | Yes (or link) | Authoring rules |
| [RULES.md](./RULES.md) | Yes | Fill authority map and kit baseline |
| [rules/](./rules/) | Recommended | Domain modules (contracts, security, verification, …); or fold into single RULES |
| Project root `CHANGELOG.md` | **Yes** | Project history required (repository H2 → version H3 → category H4); do **not** copy kit release history as product history |
| [templates/](./templates/) | As needed | Include TEMPLATE-CERTIFICATION-README when formal certs are wanted |
| [configs/pylintrc](./configs/pylintrc) | If Python product code | Copy as `.pylintrc` at package or repo root |
| [UPGRADE.md](./UPGRADE.md) | Optional local copy | Durable upgrade guide—or always open from Kit source |
| This `SETUP.md` | Temporary | Follow, then delete or archive |

---

## 4. Fill the authority map

In [RULES.md — Authority map](./RULES.md#authority-map), replace placeholders with **real or planned** paths—even before code exists—so every concern has a canonical home.

**Security documentation is optional** for packages with no execution surface, network access, elevated privilege, or secrets handling—omit `SECURITY.md` and the authority-map security row rather than creating an empty file. See [Security documentation modularity](./rules/security.md#security-documentation-modularity).

Also fill:

1. **[Language surface inventory](./rules/security.md#language-surface-inventory)** — copy **only** rows for languages this project will ship. Docs-only → empty inventory.  
2. **[Verification before ship](./rules/verification-and-ops.md#verification-before-ship)** — commands for each declared surface (Domain B style + Domain A SAST). Declared gates are **required** before task completion.  
3. **Contract policy** — ensure [rules/contracts.md](./rules/contracts.md) (or equivalent section) is available to the team.  
4. **Optional `certification/`** — see [templates/TEMPLATE-CERTIFICATION-README.md](./templates/TEMPLATE-CERTIFICATION-README.md) and [certification policy](./rules/security.md#security-and-code-validation-certification); gitignore regenerable `last_certification.*`.

**Filled examples (copy the pattern, not the product names):**

| Interest | Example file |
|----------|--------------|
| CLI / automation | [examples/cli-tool.md](./examples/cli-tool.md) |
| Python library | [examples/python-library.md](./examples/python-library.md) |
| Docs-only / standards | [examples/docs-only.md](./examples/docs-only.md) |

---

## 4b. Record kit baseline

Before deleting this file, fill [Kit baseline](./RULES.md#kit-baseline) in the project’s `RULES.md`:

| Field | What to set |
|-------|-------------|
| **Adopted kit version** | Latest released `### [X.Y.Z]` under `## repo-kit` in the kit [CHANGELOG.md](./CHANGELOG.md) (or latest released version + commit SHA if copying a non-release tip) |
| **Adopted on** | Today’s date (`YYYY-MM-DD`) |
| **Kit source** | Always **https://github.com/shainemeister/repo-kit** |

Also ensure project root `CHANGELOG.md` exists with structure `## <Repository Name>` → `### [X.Y.Z] - YYYY-MM-DD` → `####` categories. Record first adoption under the initial project version section (e.g. under `#### Added`: “Adopted repo-kit X.Y.Z from https://github.com/shainemeister/repo-kit”).

Upgrades later: [README — Upgrade repo-kit](../README.md#upgrade-repo-kit) · [UPGRADE.md](./UPGRADE.md).

---

## 5. Pick templates by interest

| Project interest | Start with templates | First contracts to write |
|------------------|----------------------|---------------------------|
| Library / package API | README | Overview + consume example |
| CLI / automation | README + CLI | Invocation, exit codes, verbs |
| Service / long-running | README + SECURITY (+ CLI if any) | Trust boundary, run/verify |
| Methodology / scoring / formulas | README + METHODOLOGY | Pipeline, formulas, outputs |
| Security-sensitive tool | README + SECURITY | Trust boundary before features sprawl |
| Design / multi-phase concept | CONCEPT | Principles + phases; label implementation status |
| Docs-only / standards | GENERIC + root landing | Summary, use cases, history |
| Monorepo multi-package | Per-package README (+ CLI/SECURITY as needed) | Shared RULES; thin per-package overlays |

Templates live under [templates/](./templates/). Co-update rules: [rules/contracts.md](./rules/contracts.md).

---

## 6. Scaffold docs first

Scaffold formal docs **before** or **in the same change set as** first code:

1. Copy the chosen template(s).  
2. Replace every `{{PLACEHOLDER}}`.  
3. Refresh Contents links.  
4. Leave frontmatter `status: draft` until the contract matches behavior.  
5. Root README: follow the [landing pattern](./MARKDOWN-STANDARD.md#landing--root-readme-no-frontmatter) (no frontmatter; use cases first).

---

## 7. Use docs as the development guide

| Trigger | Action |
|---------|--------|
| New behavior | Update the **canonical** authority-map file in the same change set ([contracts](./rules/contracts.md)) |
| New public surface | CLI/API or README section before the feature is “done” |
| Verification exists | Fill real commands in the verification table; run them before ship |

---

## 8. First verification commands

Fill and run the rows in [Verification before ship](./rules/verification-and-ops.md#verification-before-ship). Until project-specific commands exist, use placeholders like:

**Docs only**

```text
# Relative links and structure — author checklist
# See MARKDOWN-STANDARD.md#author-checklist
```

**Python product code** (if applicable)

```text
python -m pylint <package_or_paths>
```

On Windows you may use `py -3.x -m pylint …`. Install pylint in the **developer** environment only—not as a product runtime dependency. Details: [Python style gate](./rules/authoring-and-style.md#python-style-gate-pylint).

**Non-Python languages:** declare a style gate (tool + pass criteria)—see [Non-Python style gates](./rules/authoring-and-style.md#non-python-style-gates).

**Security / SAST gates (required when declared):** declare only tools for **surfaces in the language inventory**. Once declared, they must pass before task completion. See [Security / SAST gates](./rules/security.md#security--sast-gates-required-when-declared) and [Completion rule](./rules/verification-and-ops.md#completion-rule).

**Formal certification (optional):** if you maintain `certification/`, regenerate `last_certification.json` / `.txt` after critical gates; never commit those outputs. Schema: [Certification](./rules/security.md#security-and-code-validation-certification).

---

## 9. Optional next steps

- Maintain a `FILE-CATALOG.md` (or similar) and update it on path add/remove/rename.  
- Copy `configs/pylintrc` → `.pylintrc`, set `py-version`, point the verification table at the real package path.  
- Add `certification/` + operator README when product code warrants formal self-attestation certificates.  
- Read [How overlays work](../README.md#how-overlays-work) so stack-specific rules stay in the project map, not a forked kit.

**Checklists:** [Author checklist](./MARKDOWN-STANDARD.md#author-checklist) · [Contributor checklist](./rules/verification-and-ops.md#contributor-checklist)

---

## After setup

| Keep (permanent) | Remove or archive |
|------------------|-------------------|
| Root README, RULES, MARKDOWN-STANDARD | **This `SETUP.md`** |
| Root **CHANGELOG.md** (required) | — |
| Kit baseline filled in RULES | — |
| `rules/` modules or folded policy | — |
| [UPGRADE.md](./UPGRADE.md) path known (local copy optional) | — |
| Filled package docs and templates you still use | Unfilled template copies you do not need |
| `.pylintrc` / style configs you adopted | — |
| Optional FILE-CATALOG | — |

Root hygiene: [rules/hygiene.md](./rules/hygiene.md). Kit upgrades: [UPGRADE.md](./UPGRADE.md) · [README — Upgrade repo-kit](../README.md#upgrade-repo-kit) via https://github.com/shainemeister/repo-kit.
