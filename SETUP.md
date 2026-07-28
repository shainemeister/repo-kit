# Setup — One-time adoption guide

> **One-time adoption guide — follow, then delete or archive.**

Use this file when starting or aligning a repository so **formal markdown guides development**, not only documents finished work. After you have filled the authority map, verification table, kit baseline, and first contracts, **delete or archive this file** so it does not accumulate as stale root noise.

This kit **intentionally ships** `SETUP.md` at root for first-time adopters. Adopting projects remove it after initiation. Future major kit releases may move or remove root `SETUP.md`. **Permanent contracts** remain [README.md](./README.md), [RULES.md](./RULES.md), [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md), and [CHANGELOG.md](./CHANGELOG.md). The [Kit baseline](./RULES.md#kit-baseline) in RULES survives this file’s removal so you can upgrade from [https://github.com/shainemeister/repo-kit](https://github.com/shainemeister/repo-kit).

---

## Summary

1. Choose an [adoption mode](#adoption-modes).  
2. [State the interest](#1-state-the-interest) and [platform context](#2-set-platform-context).  
3. [Copy](#3-copy-kit-pieces) the pieces you need.  
4. [Fill the authority map](#4-fill-the-authority-map), [language surface inventory](./RULES.md#language-surface-inventory), and verification table (see [examples/](./examples/)).  
5. [Record kit baseline](#4b-record-kit-baseline) and ensure root `CHANGELOG.md` exists.  
6. [Pick templates](#5-pick-templates-by-interest), scaffold docs, and [verify](#8-first-verification-commands).  
7. [Delete or archive this file](#after-setup).

---

## Adoption modes

| Mode | When to use | What to do |
|------|-------------|------------|
| **Full copy** | New greenfield repo that wants the complete kit | Copy MARKDOWN-STANDARD, RULES, templates, and `configs/pylintrc` (if Python). Use this SETUP checklist end-to-end. |
| **Selective copy** | Existing repo; only need structure and policy | Pull MARKDOWN-STANDARD, RULES, needed templates, and pylintrc if relevant. Skip unused templates. |
| **Reference / submodule** | Want to track upstream kit changes without local copies | Link or submodule this kit; keep project-specific filled RULES (or a thin overlay) in the consuming repo. |

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

Into the target repository (or keep a reference per your adoption mode):

| Piece | Always? | Notes |
|-------|---------|--------|
| [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) | Yes (or link) | Authoring rules |
| [RULES.md](./RULES.md) | Yes | Fill authority map, verification, and kit baseline |
| [CHANGELOG.md](./CHANGELOG.md) | **Yes** | Project history is **required** (repository H2 → version H3 → category H4); start from kit pattern or a fresh file |
| [templates/](./templates/) | As needed | Copy only the skeletons you will fill (include TEMPLATE-CERTIFICATION-README when formal certs are wanted) |
| [configs/pylintrc](./configs/pylintrc) | If Python product code | Copy as `.pylintrc` at package or repo root |
| This `SETUP.md` | Temporary | Follow, then delete or archive |

---

## 4. Fill the authority map

In [RULES.md — Authority map](./RULES.md#authority-map), replace placeholders with **real or planned** paths—even before code exists—so every concern has a canonical home.

**Security documentation is optional** for packages with no execution surface, network access, elevated privilege, or secrets handling—omit `SECURITY.md` and the authority-map security row rather than creating an empty file. See [RULES — Security documentation modularity](./RULES.md#security-documentation-modularity).

Also fill:

1. **[Language surface inventory](./RULES.md#language-surface-inventory)** — copy **only** rows for languages this project will ship from the full kit catalog (Python, Python deps, PowerShell, JavaScript/TypeScript/Node, Go, Rust, Shell, Other/mixed, Secrets, Semgrep). Docs-only → empty inventory.  
2. **[Verification before ship](./RULES.md#verification-before-ship)** — commands for each declared surface (Domain B style + Domain A SAST). Declared gates are **required** before task completion.  
3. **Optional `certification/`** — when the project ships product code and wants formal self-attestation certificates, add `certification/README.md` (see [templates/TEMPLATE-CERTIFICATION-README.md](./templates/TEMPLATE-CERTIFICATION-README.md) and [RULES — Certification](./RULES.md#security-and-code-validation-certification)); gitignore regenerable `last_certification.*`.

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

Also ensure root `CHANGELOG.md` exists with structure `## <Repository Name>` → `### [X.Y.Z] - YYYY-MM-DD` → `####` categories. Record first adoption under the initial project version section (e.g. under `#### Added`: “Adopted repo-kit X.Y.Z from https://github.com/shainemeister/repo-kit”).

Upgrades later: [Upgrading the kit](./RULES.md#upgrading-the-kit-post-initiation).

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

Templates live under [templates/](./templates/).

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
| New behavior | Update the **canonical** authority-map file in the same change set |
| New public surface | CLI/API or README section before the feature is “done” |
| Verification exists | Fill real commands in the verification table; run them before ship |

---

## 8. First verification commands

Fill and run the rows in [RULES.md — Verification before ship](./RULES.md#verification-before-ship). Until project-specific commands exist, use placeholders like:

**Docs only**

```text
# Relative links and structure — author checklist
# See MARKDOWN-STANDARD.md#author-checklist
```

**Python product code** (if applicable)

```text
python -m pylint <package_or_paths>
```

On Windows you may use `py -3.x -m pylint …`. Install pylint in the **developer** environment only—not as a product runtime dependency. Details: [RULES — Python style gate](./RULES.md#python-style-gate-pylint).

**Non-Python languages:** declare a style gate (tool + pass criteria) in RULES or a thin overlay—see [Non-Python style gates](./RULES.md#non-python-style-gates).

**Security / SAST gates (required when declared):** declare only tools for **surfaces in the language inventory** (e.g. Bandit for Python product code, npm audit for Node, govulncheck for Go). Once declared, they must pass before task completion—do not silently skip. Docs-only projects declare none. See [RULES — Security / SAST gates](./RULES.md#security--sast-gates-required-when-declared) and [Completion rule](./RULES.md#completion-rule).

**Formal certification (optional):** if you maintain `certification/`, regenerate `last_certification.json` / `.txt` after critical gates; never commit those outputs. Schema: [RULES — Certification](./RULES.md#security-and-code-validation-certification).

---

## 9. Optional next steps

- Maintain a `FILE-CATALOG.md` (or similar) and update it on path add/remove/rename.  
- Copy `configs/pylintrc` → `.pylintrc`, set `py-version`, point the verification table at the real package path.  
- Add `certification/` + operator README when product code warrants formal self-attestation certificates.  
- Read [How overlays work](./README.md#how-overlays-work) so stack-specific rules stay in the project map, not a forked kit.

**Checklists:** [Author checklist](./MARKDOWN-STANDARD.md#author-checklist) · [Contributor checklist](./RULES.md#contributor-checklist)

---

## After setup

| Keep (permanent) | Remove or archive |
|------------------|-------------------|
| Root README, RULES, MARKDOWN-STANDARD | **This `SETUP.md`** |
| Root **CHANGELOG.md** (required) | — |
| Kit baseline filled in RULES | — |
| Filled package docs and templates you still use | Unfilled template copies you do not need |
| `.pylintrc` / style configs you adopted | — |
| Optional FILE-CATALOG | — |

Root hygiene: [RULES — Root hygiene](./RULES.md#root-hygiene). Kit upgrades: [RULES — Upgrading the kit](./RULES.md#upgrading-the-kit-post-initiation) via https://github.com/shainemeister/repo-kit.
