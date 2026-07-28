---
title: Repository Maintenance Rules
description: Fundamental rules for documenting, changing, verifying, and versioning any repository consistently.
version: "1.4.0"
status: current
audience:
  - developers
  - analysts
  - security
doc_type: other
related:
  - README.md
  - MARKDOWN-STANDARD.md
  - SETUP.md
  - CHANGELOG.md
  - configs/pylintrc
last_updated: "2026-07-28"
---

# Repository Maintenance Rules

Fundamental rules for maintaining a professional, auditable repository. These rules govern documentation, architecture boundaries, contracts, git hygiene, and verification—not product tutorials.

**Document version:** 1.4.0  

**Related:** [README.md](./README.md) · [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) · [SETUP.md](./SETUP.md) · [CHANGELOG.md](./CHANGELOG.md) · [configs/pylintrc](./configs/pylintrc)

---

## Summary

**RULES.md** is the maintenance policy. Detailed contracts live elsewhere (CLI guides, APIs, methodology, security notes). When those contracts change, update the **canonical** file in the same change set—do not leave docs, fixtures, or versions stale.

Copy this file into a project and **fill the authority map and verification table** with that project’s real paths and commands. On initiation, derive those paths from **project interest** (see [SETUP.md](./SETUP.md)) so this policy guides day-to-day development—not only post-hoc documentation. Keep product-specific policy here or in a thin overlay; keep authoring rules in [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md). Filled map examples: [examples/](./examples/).

| Must | Must not |
|------|----------|
| Update canonical docs with behavior changes | Commit secrets, regenerable outputs, or real sensitive data |
| Maintain root **CHANGELOG.md** (Keep a Changelog) | Ship version bumps or release-worthy changes without CHANGELOG |
| Keep [Kit baseline](#kit-baseline) current after adopt/upgrade | Lose track of kit version after deleting SETUP |
| Use conventional commit messages that match staged files | Mix unrelated packages or leave CLI/API/security docs stale |
| Keep packages composable at the workflow layer | Silently rename public APIs, CLI fields, or schema columns |
| Run **pylint** on Python product code after those edits | Treat pylint as a product runtime install for end users |
| Fill [language surface inventory](#language-surface-inventory); run declared style + SAST before complete | Paste the full multi-language SAST table without inventory evidence |
| Verify before sharing contract or behavior changes | Claim complete when a **declared** style or SAST gate was skipped or failed |
| Regenerate `certification/` outputs when that folder is maintained | Commit `last_certification.*` or treat certification as a product launcher gate |
| Fill authority map + verification from project interest at start | Leave contracts empty until “docs later” after behavior ships |

---

## Contents

1. [Summary](#summary)
2. [Authority map](#authority-map)
3. [Root hygiene](#root-hygiene)
4. [Documentation rules](#documentation-rules)
5. [Formatting and style](#formatting-and-style) (includes [Python style gate (pylint)](#python-style-gate-pylint) and [Non-Python style gates](#non-python-style-gates))
6. [Architecture and boundaries](#architecture-and-boundaries)
7. [Data and contract rules](#data-and-contract-rules)
8. [Security baseline](#security-baseline) (includes [Language surface inventory](#language-surface-inventory), [Security / SAST gates](#security--sast-gates-required-when-declared), and [Security and code-validation certification](#security-and-code-validation-certification))
9. [Versioning and change control](#versioning-and-change-control)
10. [Git rules](#git-rules)
11. [Verification before ship](#verification-before-ship) (includes [Before marking work complete](#before-marking-work-complete))
12. [Maintenance cadence](#maintenance-cadence)
13. [Anti-patterns](#anti-patterns)
14. [Contributor checklist](#contributor-checklist)
15. [Document history](#document-history)

---

## Authority map

Update the **owner** document for a change. Cross-link; do not duplicate full contracts.

Replace paths below with your project’s real files. Rows that do not apply may be removed; add rows for domain-specific contracts. For filled skeletons by interest, see [examples/](./examples/).

| Concern | Canonical source |
|---------|------------------|
| Repo purpose and quick start | [README.md](./README.md) |
| One-time adoption (ephemeral) | [SETUP.md](./SETUP.md) — follow, then delete or archive |
| Path-level file inventory (optional) | `FILE-CATALOG.md` (or equivalent) |
| Markdown structure, frontmatter, author checklist | [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) · [templates/](./templates/) |
| Maintenance policy (this file) | [RULES.md](./RULES.md) |
| Project history (**required**) | [CHANGELOG.md](./CHANGELOG.md) |
| Standards kit baseline | [Kit baseline](#kit-baseline) in this file (version + source) |
| Filled authority-map examples (kit reference) | [examples/](./examples/) |
| Package overview | `{{PACKAGE}}/README.md` |
| CLI or automation contract | `{{PACKAGE}}/CLI-GUIDE.md` (or `API.md`) |
| Formulas / “how it works” | `{{PACKAGE}}/METHODOLOGY.md` (or design notes) |
| Security / trust boundary | `{{PACKAGE}}/SECURITY.md` (or `ENTERPRISE-SECURITY.md`) — **omit this row** when [Security documentation modularity](#security-documentation-modularity) says `SECURITY.md` is not required |
| Language surface inventory | [Language surface inventory](#language-surface-inventory) in this file (filled rows for languages this repo ships) |
| Security & code-validation certification | `certification/README.md` — **omit** when the project does not maintain a `certification/` folder (docs-only or no formal cert yet) |
| Data or schema definitions | `{{SCHEMA_PATH}}` |
| Default config | `{{CONFIG_PATH}}` |
| Golden tests / fixtures | `{{FIXTURES_PATH}}` |
| Python style / PEP-8 gate | [configs/pylintrc](./configs/pylintrc) (copy as `.pylintrc` at package or repo root, or pass `--rcfile`) |

**Rule:** Adding, removing, or renaming intentional source files should update the inventory (catalog or equivalent) in the same change set when the project maintains one.

---

## Root hygiene

Keep the repository root **scannable**: entry points and policy first; purpose directories for everything else. These rules apply to this kit and to projects that adopt it.

### What belongs at root

| File / item | Role |
|-------------|------|
| `README.md` | Landing / use-cases (no frontmatter) |
| `LICENSE` | License |
| `.gitignore` | Ignore rules |
| `RULES.md` | Maintenance policy + authority map |
| `MARKDOWN-STANDARD.md` | Writing and structure standard |
| `SETUP.md` | One-time only (then remove or archive); kit may ship it for first-time adopters |
| `CHANGELOG.md` | Project history (**required**) |
| `FILE-CATALOG.md` | Optional inventory |
| Package or product entry files | Only when they are the natural top-level surface |

### What does not belong at root

| Concern | Preferred home |
|---------|----------------|
| Templates | `templates/` |
| Style configs | `configs/` (or package-local `.pylintrc` / tool config) |
| Filled examples | `examples/` |
| Scripts / helpers | `scripts/` or `tooling/` (keep minimal) |
| Formal security + code-validation certificates | `certification/` (see [Security and code-validation certification](#security-and-code-validation-certification)); regenerable outputs gitignored |
| Package-level contracts | Inside the package |
| Regenerable output | Never committed |
| CI workflows | `.github/` (or equivalent) |

### Supporting practices

1. Update the authority map in the **same change set** whenever an intentional path is added, removed, or renamed (when the map lists that path).  
2. Prefer purpose directories over additional root files.  
3. Mark ephemeral files clearly (e.g. SETUP header) so they do not accumulate.  
4. Respect `.gitignore`; never force-add regenerable artifacts.  
5. **SETUP.md lifecycle:** this kit ships `SETUP.md` at root for first-time adopters. Adopting projects **delete or archive** it after initiation. Future major kit releases may move or remove root `SETUP.md`; permanent contracts remain `README.md`, `RULES.md`, `MARKDOWN-STANDARD.md`, and `CHANGELOG.md`. The [Kit baseline](#kit-baseline) in RULES survives SETUP removal so upgrades stay trackable.

---

## Documentation rules

1. **Substantial documents** follow [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md): YAML frontmatter, single H1, lead, Summary before Contents, body, history when versioned.  
2. **New docs** start from [templates/](./templates/); leave no unresolved `{{PLACEHOLDERS}}`. Pick templates from [project interest](./SETUP.md#5-pick-templates-by-interest) so contracts exist before or with first code.  
3. **Behavior change ⇒ doc change** in the same commit or PR:  
   - CLI verbs, flags, exit codes, JSON shapes → matching CLI / API guide  
   - Formulas, output columns, validation → methodology (+ fixtures if contract shifts)  
   - Trust boundary or execution model → matching security doc  
4. **Prefer link + short summary** over pasting another document in full.  
5. **Root README** stays an overview; deep contracts stay in package docs.  
6. **Status honesty:** set frontmatter `status` to `draft` / `current` / `deprecated` accurately.  
7. **Platform-aware examples** follow [MARKDOWN-STANDARD — Platform-aware examples](./MARKDOWN-STANDARD.md#platform-aware-examples): declare primary OS when examples are OS-specific; dual fences when multi-platform.

---

## Formatting and style

| Area | Rule |
|------|------|
| Voice | Complete sentences; direct and professional; tables for parallel facts |
| Emphasis | **Bold** for critical terms and UI labels |
| Identifiers | `` `inline code` `` for paths, flags, column names, module names |
| Markdown structure | Per [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md); language-tagged code fences |
| Links | Relative from the file’s directory (`./CLI-GUIDE.md`, `../README.md`) |
| Paths in prose | Consistent separators within a file; match [platform-aware rules](./MARKDOWN-STANDARD.md#platform-aware-examples) |
| Examples | Prefer placeholders (`C:\path\to\...` and/or `/path/to/...`) plus one concrete repo-relative example; dual shell fences when multi-OS |
| Platform | State primary platform(s) for verify/build examples; fill verification table with the command(s) the team actually runs |
| Python | When the project ships Python product code: **PEP-8 via pylint** — see [Python style gate (pylint)](#python-style-gate-pylint) |
| Other languages | Declare a style gate — see [Non-Python style gates](#non-python-style-gates) |

### Python style gate (pylint)

All **product** Python under the packages this project ships must stay **pylint-clean** under the project’s gate config before sharing behavior or packaging changes.

| Item | Rule |
|------|------|
| **Config** | [configs/pylintrc](./configs/pylintrc) — copy to the package or repo as `.pylintrc` (or pass `--rcfile`). PEP-8–aligned conventions (line length 100, docstrings, names, unused imports/vars, selected errors) |
| **Scope** | Product packages and modules only (not one-off scratch scripts unless the project says so) |
| **Command** | `python -m pylint <package_or_paths>` (or `py -3.x -m pylint …` on Windows) |
| **Pass criteria** | Exit code **0** and score **10.00/10** under that config |
| **When to run** | After any edit to product `*.py`, `.pylintrc` / `pylintrc`, or packaging that can affect style |
| **Product dependency** | **No.** Pylint is **developer tooling** only. Do **not** add pylint as a required install for end users of the product. |
| **Out of gate** | Design/refactor metrics (`too-many-*`, large-file complexity) are intentionally relaxed in the default config; do not “fix” them by silent API rewrites. Full default pylint without the gate config is informational only. |
| **Non-Python repos** | This gate does not apply. |

If pylint is not installed on a developer machine, install it into the **developer environment** (user/global Python or a dev extra), never into a product runtime path meant only for end users.

**Adopt steps:**

1. Copy `configs/pylintrc` to the package or repo root as `.pylintrc`.  
2. **Must:** set `py-version` to the project’s supported Python (the file ships a starter default only—change it).  
3. Point the verification table at the real package path.  
4. Extend `good-names` only when short identifiers are intentional and repeated.

### Non-Python style gates

Projects that ship non-Python product code should declare **one primary gate per language surface** in this file or a thin overlay: tool name, command, and pass criteria. Put the command in the [verification table](#verification-before-ship). Non-Python gates **do not** inherit the pylint 10.00 score rule.

Recommended starting points (advisory—choose what the team will actually run):

| Language / ecosystem | Common gate tools | Typical pass criteria |
|----------------------|-------------------|------------------------|
| JavaScript / TypeScript | eslint, prettier | Lint exit 0; format clean (or check mode clean) |
| Go | gofmt / go fmt, golangci-lint | Format clean; linter exit 0 under project config |
| Rust | rustfmt, clippy | Format clean; clippy clean under project flags |
| Shell | shellcheck | No errors (or project-defined severity) |
| Other / mixed | Document tool + command in verification table | Exit 0 / project-defined |

**Rules:**

1. Name the tool and pass criteria explicitly—do not leave “we lint somehow” implied.  
2. Keep style tools as **developer tooling** unless the product truly requires them at runtime.  
3. Docs-only repositories may omit language style gates entirely.

---

## Architecture and boundaries

| Rule | Detail |
|------|--------|
| **Clear entry points** | Prefer documented CLI launchers, `__main__` modules, or public package APIs over ad-hoc scripts as the primary surface |
| **Composition** | Join packages at the **workflow** layer (files, CLI, messages), not by merging unrelated engines into one process unless that is an explicit design |
| **Runtime separation** | Do not call one stack from another in product code without an intentional, documented boundary |
| **Dependencies** | Declare the dependency policy in README and security docs (e.g. stdlib-only, locked set, or full package index). No hidden downloads or telemetry in product paths unless documented |
| **Domain hard-coding** | Prefer schema-, config-, or interface-driven behavior over hard-coded business field lists buried in engines |

Fill project-specific rows (runtimes, “never do X”) in a thin overlay or by expanding this table for the repo.

---

## Data and contract rules

1. **Schema or API owns definitions** (names, types, nullability, display names). **Samples own example rows.** Headers and field names must match the contract.  
2. **Field renames and type changes are breaking.** Update together: schema, samples, default config, fixtures, and affected docs.  
3. **Public automation surfaces** (CLI flags, exit codes, stable output columns, JSON shapes) require guide updates and a version bump when they change.  
4. **Explainability** (if the product scores, ranks, or attributes metrics): keep intermediate audit fields; do not collapse into a single misleading total without documentation.  
5. **Fixtures / golden tests** are contracts. Behavior changes must keep validation green or deliberately refresh expected outputs with a documented reason.  
6. **No real credentials, tokens, regulated personal data, or production dumps** in the repository. Samples are synthetic or non-sensitive illustrations.  
7. **Regenerable output directories** (e.g. `output/`, build artifacts, diagnostics certificates) are workspace only—not source of truth and not versioned.

---

## Security baseline

Hard rules for product code and launchers. Full matrices live in the project security doc when one is required.

| Rule | Guidance |
|------|----------|
| Privilege | Prefer current user only; document any elevation requirement |
| Network | Document whether product code may reach the network or package indexes |
| Secrets | Never commit secrets; rotate if leaked; treat history cleanup as an incident |
| Dependencies | Match the declared dependency policy; no silent download-and-run |
| Host policy | Do not permanently weaken host security policy in product install steps without explicit, documented need |

Canonical detail (when applicable): the package `SECURITY.md` / `ENTERPRISE-SECURITY.md` (or equivalent) listed in the authority map.

### Security documentation modularity

Create or maintain a package `SECURITY.md` (or equivalent) **only when** the package has an **execution surface**, **network access**, **elevated privilege**, or **handles secrets**. Pure documentation packages and pure libraries with **no runtime side effects** may **omit** security documentation entirely—do not create empty files to satisfy a template habit.

| Situation | `SECURITY.md` |
|-----------|---------------|
| Docs-only / standards repo | **Omit** |
| Pure library, no network / privilege / secrets handling | **Omit** (optional short note in package README if helpful) |
| CLI, service, automation, or other execution surface | **Required** |
| Handles credentials, tokens, or elevated install | **Required** |
| Monorepo | Per package: required only for packages that meet the triggers above |

When omitted, remove the Security / trust boundary row from the [authority map](#authority-map). When present, keep trust-boundary detail in that canonical file—not duplicated into README.

### Language surface inventory

Declare **which product language and security surfaces this repository ships**. The inventory is the **source of truth** for style gates, SAST gates, verification rows, and (when maintained) formal certification checks. Copy **only** rows that apply—never paste the full catalog into a docs-only project.

Fill a project table (examples: [examples/](./examples/)). Kit catalog of surfaces (Domain B = code validation / style; Domain A = security / SAST):

| Surface | Evidence it exists | Domain B — style / validation | Domain A — security / SAST | Typical pass | Omit when… |
|---------|-------------------|-------------------------------|----------------------------|--------------|------------|
| *(none — docs-only)* | No product code | — | — | Author checklist | Standards / design repos |
| **Python** product code | Product `*.py` packages | **pylint** (exit 0, score **10.00/10**) | **Bandit** (`python -m bandit -r <package>`) | Style + SAST clean | No product Python |
| **Python** dependencies | Third-party deps (not stdlib-only) | — | **pip-audit** | Exit 0 / clean | No Python deps / pure docs / stdlib-only |
| **PowerShell** | Product `*.ps1` / modules | Project primary (e.g. PS AST parse, BOM policy) | **PSScriptAnalyzer** (`-Severity Error`); optional security-rules subset | Zero Error findings | No PowerShell surface |
| **JavaScript / TypeScript** (Node) | `package.json` / Node surface | **eslint**, **prettier** (or project primary) | **npm audit** (`--audit-level=moderate`); secondary: eslint-plugin-security | Lint/format clean; audit clean | No Node surface |
| **Go** | Go modules | **gofmt** / `go fmt`, **golangci-lint** | **govulncheck** (`govulncheck ./...`) | Format + lint clean; SAST clean | No Go modules |
| **Rust** | `Cargo.toml` | **rustfmt**, **clippy** | **cargo-audit** (`cargo audit`) | Format + clippy clean; audit clean | No `Cargo.toml` |
| **Shell** (bash/sh product) | Product shell scripts | **shellcheck** | **ShellCheck** (same tool may cover both domains—one declaration is enough) | No errors (or project severity) | No shell product scripts |
| **Other / mixed** | Other product languages | Document tool + command | Language-appropriate tool, or **Semgrep** | Exit 0 / project-defined | No other product languages |
| **Secrets** (whole repo) | Team chooses to scan | — | **Gitleaks** (preferred); secondary TruffleHog | No leaks | Explicit opt-out (e.g. pure public docs) |
| **Multi-language / custom rules** | Cross-language or org rules | — | **Semgrep** | Exit 0 / clean | Language-specific tools already cover |

**Rules:**

1. Inventory drives the [verification table](#verification-before-ship)—each declared surface needs named commands and pass criteria.  
2. Adding a language later updates inventory, verification, authority map (if needed), and certification checks in the **same change set**.  
3. **Python product** and **Python dependencies** are separate rows (Bandit vs pip-audit).  
4. **Secrets** and **Semgrep** are inventory surfaces even though they are not programming languages.  
5. Prefer declared inventory over heuristic filesystem scans. At initiation, derive rows from [project interest](./SETUP.md) and planned layout.

### Security / SAST gates (required when declared)

**Developer-tooling** gates for security-oriented static analysis. These are **not** style gates (see [Non-Python style gates](#non-python-style-gates) and [Language surface inventory](#language-surface-inventory)) and are **not** product runtime dependencies.

**Posture:** When a language or security surface is **present in the inventory**, its Domain A tool is **required** before task completion and ship (see [Completion rule](#completion-rule)). Surfaces not in the inventory must not be implied. Docs-only inventories declare **zero** SAST gates.

**Modularity rule:** Declare **only** tools for **languages and surfaces the repo actually ships**. Copy **zero** rows for docs-only projects. Multi-language monorepos add **one verification row per language surface that exists**—never paste the full kit table. List chosen commands in the [verification table](#verification-before-ship).

Prefer official or near-official tools with a small install footprint. All work across Windows, Linux, and macOS unless noted by the tool vendor.

| If the repo ships… | Primary tool | Typical command (pass = exit 0 / clean) | Secondary (optional) | Skip if… |
|--------------------|--------------|------------------------------------------|----------------------|----------|
| **Python** product code | **Bandit** (PyCQA) | `python -m bandit -r <package>` | — | No product `*.py` packages |
| **Python** dependencies | **pip-audit** (PyPA) | `pip-audit` | — | No Python deps / pure docs |
| **PowerShell** (`*.ps1`, modules) | **PSScriptAnalyzer** (Microsoft) | `Invoke-ScriptAnalyzer -Path . -Severity Error` | Security rules subset only | No PowerShell surface |
| **JavaScript / Node.js / TypeScript** | **npm audit** | `npm audit --audit-level=moderate` | eslint-plugin-security | No `package.json` / Node surface |
| **Go** | **govulncheck** (Go team) | `govulncheck ./...` | — | No Go modules |
| **Rust** | **cargo-audit** (RustSec) | `cargo audit` | — | No `Cargo.toml` |
| **Shell** (bash/sh as product surface) | **ShellCheck** | `shellcheck *.sh` | — | No shell product scripts *(also a common [style gate](#non-python-style-gates)—one declaration is enough)* |
| **Secrets** (whole repo) | **Gitleaks** (preferred) | `gitleaks detect` | TruffleHog | Team chooses not to scan (e.g. pure public docs with no secret risk) |
| **Multi-language / custom rules** | **Semgrep** | `semgrep --config=auto` | — | Language-specific tools already cover the surface |

**Product dependency:** **No.** Bandit, pip-audit, npm audit, govulncheck, cargo-audit, ShellCheck, Gitleaks, Semgrep, and similar tools are **developer tooling** only. Do **not** add them as required installs for end users of the product.

**Rules:**

1. Name the tool and pass criteria in the verification table—do not leave “we scan somehow” implied.  
2. Install tools in the **developer** environment only. Missing required tools fail the gate (install hints)—do not silently skip.  
3. Docs-only repositories may omit every security / SAST gate.  
4. Do not treat the full table above as a checklist for every project.  
5. Warning-level findings (e.g. PSScriptAnalyzer **Warning**) stay advisory unless the project promotes them to critical.

### Security and code-validation certification

Optional formal **developer self-attestation** that, for git commit *C* at time *T*, declared product surfaces passed **Domain A (security / SAST)** and **Domain B (code validation)**. This is **not** a third-party audit, SOC 2, ISO seal, or product runtime diagnostics gate.

| This **is** | This **is not** |
|-------------|-----------------|
| Self-attestation of automated checks bound to a commit | Third-party certification or compliance logo |
| Security **and** code validation in one certificate pair | A second product CLI / diagnostics gate for end users |
| Suitable for IT tickets and pre-ship review packets | Proof of regulated Safe Harbor or data claims |
| Regenerable, gitignored output under one folder | A substitute for human threat modeling |

#### Single-folder rule

When the project maintains formal certificates, **all** of them live under one folder:

```text
certification/
  README.md                    # operator guide + disclaimer (versioned)
  last_certification.json      # gitignored, regenerable
  last_certification.txt       # gitignored, regenerable
  # optional later: logs/ (gitignored); orchestrator harness (deferred)
```

| Rule | Detail |
|------|--------|
| One folder | No split `security-cert/` vs `validation-cert/`; no extra root purpose directories |
| One certificate pair | Both domains appear **inside** the same JSON/TXT |
| Regenerable | Never commit `last_certification.*` |
| Optional | Docs-only and early projects may omit the folder until product code warrants it |

#### Domains and OverallPass

```text
Domains.Security.OverallPass
Domains.CodeValidation.OverallPass
OverallPass = AND of domains that apply for declared inventory surfaces
```

**OverallPass** means: every **critical** check that ran passed, **and** no required critical tool was missing.

| Domain | Covers |
|--------|--------|
| **Security** | Declared Domain A tools from the inventory (Bandit, pip-audit, PSScriptAnalyzer Error, npm audit, govulncheck, cargo-audit, ShellCheck, Gitleaks, Semgrep, …) |
| **Code validation** | Declared Domain B style gates (pylint, eslint, gofmt, …) plus project contract checks (tests, probes, parse) listed in verification |

#### Certificate shape (illustrative)

**Machine-readable** (`certification/last_certification.json`) should include:

- `CertificateType`: `SecurityAndCodeValidationCertification`
- `OverallPass`, `Success`, timestamps, `RepoRoot`
- `GitCommit`, `GitBranch`, `GitDirty`
- `LanguageSurfaces[]` (from inventory; e.g. Python, PythonDeps, PowerShell, JavaScriptTypeScript, Go, Rust, Shell, Other, Secrets, Semgrep)
- `PackageVersions`, `ToolVersions`, `PassCriteria`
- `Domains.Security` / `Domains.CodeValidation` with `OverallPass`, `CriticalFailed`
- `Checks[]`: `Name`, `Domain`, `Language` (optional), `Passed`, `Severity`, `Detail`, optional `DurationMs`
- `Disclaimer`, `Message`

**Human-readable** (`last_certification.txt`): same facts in sections (`== Security ==`, `== Code validation ==`, disclaimer).

**Privacy:** paths, versions, rule ids, counts only—never secrets, passwords, PHI, or production claim rows.

#### Certification rule

When the repository maintains `certification/`, regenerate `last_certification.json` and `.txt` after critical gates for the change set; leave regenerable outputs **untracked**. Missing required tools yield `OverallPass = false`, not a silent skip. A future kit harness may automate generation; until then, operators may produce the pair manually or with project scripts that match this schema.

**Relationship to package diagnostics:** package probes answer “can **this machine** run the product?” Certification answers “does **this source tree** meet security + validation policy?” Do not merge package diagnostics into `certification/`.

---

## Versioning and change control

Every adopting repository follows these rules. They distinguish **three version surfaces**, require a project **CHANGELOG**, and keep a durable **kit baseline** so standards upgrades remain possible after `SETUP.md` is removed.

### Three version surfaces

| Surface | What it is | Authority |
|---------|------------|-----------|
| **Kit version** | Semver of the Repository Standards Kit as a whole | Kit root [CHANGELOG.md](https://github.com/shainemeister/repo-kit/blob/main/CHANGELOG.md) dated sections (`### [X.Y.Z] - YYYY-MM-DD`) under `## repo-kit`. Document frontmatter on kit files may move between kit releases; a **release** cuts one kit version as a dated section. |
| **Project / package version** | The adopting repo’s product or library semver | Project packaging metadata **and** project [CHANGELOG.md](./CHANGELOG.md) |
| **Document version** | Per-document frontmatter `version` + `last_updated` | That document only—not automatically equal to package or kit version |

| Surface | When to bump |
|---------|----------------|
| Package / library version | CLI contract, public API, scoring/export behavior, or stable output field names change |
| Document frontmatter `version` + `last_updated` | That document’s guidance or contract changes |
| Methodology **Document history** table | Material formula or interpretation changes |
| Project `CHANGELOG.md` | See [Mandatory project CHANGELOG](#mandatory-project-changelog) |
| Kit baseline (adopted kit version) | On first adopt and every kit upgrade — see [Kit baseline](#kit-baseline) |

### Mandatory project CHANGELOG

Every repository that adopts this kit **must** maintain a root **`CHANGELOG.md`**. Docs-only and standards repos are not exempt: they version documentation and policy releases the same way.

| Rule | Detail |
|------|--------|
| **Required file** | Root `CHANGELOG.md` — listed in the [authority map](#authority-map) and [root hygiene](#root-hygiene) |
| **Format** | [Keep a Changelog](https://keepachangelog.com/) categories; dates ISO 8601 (`YYYY-MM-DD`) |
| **Structure** | `## <Repository Name>` (integrated repository) → dated `### [X.Y.Z] - YYYY-MM-DD` (version change/update) → `#### Added` / `#### Changed` / … (categories) |
| **Categories** | Use as needed: **Added**, **Changed**, **Deprecated**, **Removed**, **Fixed**, **Security** |
| **Same change set** | Release-worthy behavior or contract changes include the CHANGELOG entry with the code/docs that ship them |

There is **no Unreleased section**. Record each change under the `### [X.Y.Z]` version section that ships it (create or update that section in the same change set when cutting the release).

**When a CHANGELOG entry is required**

| Change | CHANGELOG |
|--------|-----------|
| Package / public contract version bump | **Required** — matching `### [X.Y.Z]` under the repository H2 for that release |
| Behavior, CLI, API, schema, security-model change | **Required** under the version section that ships the change |
| Kit adoption or kit upgrade | **Required** (note kit version; do **not** paste kit release history) |
| Security fix | **Required** |
| Pure typo or non-contract wording | Optional; **must not** ship a package version bump without a matching version section for that version |

Do not ship a package version tag or release without a matching `### [X.Y.Z]` CHANGELOG section under the repository H2.

### Kit baseline

After initiation, `SETUP.md` is gone. Projects still need a durable record of **which kit version** they adopted and **where upgrades come from**.

Fill and keep this table in every adopting project’s `RULES.md` (this section). Update it on every kit upgrade.

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

At adopt time: read the kit’s `CHANGELOG.md` (latest released `### [X.Y.Z]` under `## repo-kit`, or note latest released version + commit SHA if copying a non-release tip), set **Adopted kit version** and **Adopted on**, keep **Kit source** as above, then delete or archive `SETUP.md`.

### Upgrading the kit (post-initiation)

1. Open **https://github.com/shainemeister/repo-kit** and read `CHANGELOG.md` (and releases if present).  
2. Compare the project’s **Adopted kit version** to the latest kit version.  
3. Read only the kit CHANGELOG entries since your current Adopted kit version; merge only what you need; never copy the full kit history into the project CHANGELOG.  
4. Copy or merge wanted pieces (`RULES.md` policy sections, `MARKDOWN-STANDARD.md`, `templates/`, `configs/pylintrc`, `.gitignore`, examples patterns). Preserve project-specific authority-map paths and verification commands.  
5. Update **Adopted kit version** and **Adopted on**; keep Kit source unchanged.  
6. Add a project CHANGELOG entry (e.g. under Changed: “Upgraded repo-kit baseline to X.Y.Z”).  
7. Re-check authority map, verification table, and any new kit contracts.

No automation is required—policy and the [contributor checklist](#contributor-checklist) enforce the practice. Copy-paste AI prompt for this flow: [README — Upgrading an existing adoption](./README.md#upgrading-an-existing-adoption).

### Consistency rules

1. Frontmatter `version` and the in-doc status line must **match** when both exist.  
2. Docs that cite a product version must stay aligned with the code version they describe.  
3. Prefer **backward-compatible** additions (new columns, new optional flags) over silent renames. Breaking changes require explicit notes in the CLI/API guide, history, and CHANGELOG.  
4. Design / concept docs may advance without implementing code; label implementation status clearly.  
5. Behavior or contract changes, their **canonical** docs, the appropriate **version bump**, and the **CHANGELOG** entry belong in the **same change set** when the change is release-worthy.  
6. Kit version and project/package version are **independent**. Adopting a new kit does not force a product version bump unless product behavior also changes.

---

## Git rules

### What to track

| Track | Do not track |
|-------|----------------|
| Source (language sources, modules, launchers) | Regenerable `output/`, build dirs |
| Schema, sample data, fixtures | `__pycache__/`, `*.pyc`, `.venv/`, `venv/` |
| Docs, templates, `.gitignore`, style configs | `.env`, secrets, IDE-only folders already ignored |
| | Generated diagnostics or certificates meant to be local |

Respect `.gitignore`. Do not force-add ignored generated artifacts “for convenience.”

### Commits and history

1. **Review before commit:** `git status` and `git diff`. Confirm no accidental large dumps, credentials, or regenerable artifacts.  
2. **Small, focused commits** preferred over mixed unrelated changes—one logical concern / one authority-map surface when practical. Prefer a **short stack** over a single mixed mega-commit.  
3. **Messages** follow [Commit message format](#commit-message-format) below.  
4. **Do not rewrite published shared history** (`push --force` to a shared default branch) without explicit coordination.  
5. **Branches (recommended):** `feature/…`, `fix/…`, `docs/…` when work is non-trivial.  
6. **Contract-breaking changes:** prefer review (PR) when a remote exists; call out migration notes in the commit or PR body.  
7. **No secrets in history.** If leaked, rotate credentials and treat history cleanup as an incident—not a casual amend.

### Commit message format

**Principle:** The commit subject (and body, when present) should remain understandable **years later** when searching history—name the real surface and intent, not a temporary mood.

Use a **Conventional Commits–style** subject so history stays scannable.

```text
<type>(<scope>): <imperative summary>
```

| Part | Rule |
|------|------|
| **type** | One of the types in the table below |
| **scope** | Package or area; see [Scope conventions](#scope-conventions). Omit for true repo-wide root files when no better scope fits |
| **summary** | Imperative mood, specific, ≤ ~72 characters; no trailing period |
| **body** (optional) | For non-trivial commits: **why** the change matters and any **migration** notes; link to the canonical doc if non-obvious. Tiny one-line docs fixes may omit a body |

| type | Use when |
|------|----------|
| `feat` | User-visible behavior: new CLI verb/flag, API, export capability, diagnostics |
| `fix` | Correct wrong behavior without changing the intended contract |
| `docs` | Documentation only (README, CLI guide, methodology, security, catalog, templates) |
| `chore` | Version bumps, `.gitignore`, packaging/layout hygiene with no product behavior change |
| `refactor` | Internal structure only; same public contracts |
| `test` | Fixtures, validation harness, probes (no product API change) |

#### Scope conventions

| Context | Preferred scopes | Notes |
|---------|------------------|--------|
| **This kit** | `rules`, `markdown`, `templates`, `setup`, `examples` | Use when the change is limited to that surface |
| **Adopting projects** | Package folder name, `cli`, `security`, `methodology` | Or omit for root-wide policy/README/shared schema |
| **Omit scope** | — | Root-wide files with no single package owner |

Scopes are advisory: consistency within a repo matters more than matching this table exactly.

#### Optional footers

Useful when needed; **not** mandatory (except the AI disclosure block, which is **required when applicable**):

| Footer | Use when |
|--------|----------|
| `BREAKING CHANGE: <description>` | Public contract breaks; describe migration |
| `Refs: <issue-or-doc>` | Link a tracker item or canonical doc |
| `Co-authored-by: Name <email>` | Shared authorship |
| AI disclosure block (`Assisted-by` / `Compliance` / `Instructed-by`) | **Required** when AI meaningfully assisted; `Assisted-by` = actual make/model; `Instructed-by` = `git config user.name`; see [AI-assisted commits](#ai-assisted-commits-required-disclosure) |

#### AI-assisted commits (required disclosure)

When an AI system meaningfully assists with the **change itself** (code, docs, configuration, or the commit message), the commit **must** include the following footer block. Pure human-only commits omit it.

| Trailer | Required content |
|---------|------------------|
| `Assisted-by:` | AI make / model (and optional tool) that assisted **this** commit — fill at commit time |
| `Compliance:` | Explicit reference to this file (`RULES.md`) |
| `Instructed-by:` | Directing human — **value of** `git config user.name` for the committer |

**Template form** (copy structure; resolve fields at commit time):

```text
Assisted-by: <AI make / model>
Compliance: RULES.md
Instructed-by: <git config user.name>
```

**How to resolve fields**

| Field | Resolution |
|-------|------------|
| `Assisted-by` | Name the AI make/model/tool that actually performed the work for this commit (examples below). Do not hardcode a vendor from documentation. |
| `Instructed-by` | Run `git config user.name` and use that exact string. If unset, configure it before committing so disclosure matches Git author identity. |

```text
git config user.name
```

**Example values for `Assisted-by`** (use the one that actually did the work):

| Situation | Example value |
|-----------|----------------|
| xAI Grok assistant | `Grok (xAI)` |
| Anthropic Claude | `Claude 4 Sonnet` (or the exact model name used) |
| GitHub Copilot | `GitHub Copilot` |
| Cursor agent | `Cursor Agent` |
| Other | Name the primary assistant for this commit |

**Rules**

1. Place the three lines at the end of the commit message (after any body or other footers).
2. **`Assisted-by` is dynamic:** use the real AI make/model (and tool if useful) that performed the work for **this** commit. Never treat a single brand in the docs as the only allowed value.
3. **`Instructed-by` is dynamic:** set it to the output of `git config user.name`. Never omit it; do not invent a different name unless it is also the configured Git user for that commit.
4. The presence of this block asserts that the human (Git-configured committer) reviewed the result and that the change follows the contracts in this RULES.md.
5. Do **not** put the AI disclosure in the subject line. Keep the subject focused on the change.

**When it is required**

| Situation | Disclosure |
|-----------|------------|
| AI wrote or substantially edited product code, docs, or config | **Required** |
| AI drafted the commit message itself | **Required** |
| AI only suggested a one-line fix that the human rewrote | Optional (prefer to include) |
| Pure human work | Omit |

**Good example** (illustrative AI only; `Instructed-by` must match `git config user.name` on the machine that commits — `Jane Developer` is a placeholder illustration, not a required name):

```text
docs(rules): require AI disclosure footer on assisted commits

Add Assisted-by / Compliance / Instructed-by trailers so AI
participation is transparent and auditable years later.

Assisted-by: Grok (xAI)
Compliance: RULES.md
Instructed-by: Jane Developer
```

#### Examples (match this voice)

**Good:**

```text
feat(my-service): add validate command and exit-code contract
chore(my-service): bump package version to 1.2.0
docs(my-service): document validate command and CLI contract
docs: catalog new package layout
fix(cli): retry failed remote call with backoff
docs(rules): clarify non-Python style gate expectations
```

**Bad → good:**

| Avoid | Prefer |
|-------|--------|
| `update stuff` | `docs(my-cli): document validate exit codes` |
| `wip` | `feat(my-cli): add validate command (draft)` only if you must; better finish then commit a clear subject |
| `fix bugs` | `fix(my-cli): handle missing config path without traceback` |
| `feat: updates` (docs-only staged) | `docs: …` — do not use `feat` for documentation-only changes |

**Multi-commit stack example** (one feature, modular history):

```text
feat(my-cli): add validate command and exit-code contract
chore(my-cli): bump package version to 1.2.0
docs(my-cli): document validate command and CLI contract
```

### Documentation consistency in commits

Commit messages and **what is staged** must stay consistent with the documentation authority map.

| Situation | Commit practice |
|-----------|-----------------|
| Behavior / CLI / API / security model changes | Update the **canonical** doc in the **same change set**. Do not ship code that leaves guides stale. |
| Prefer readability of history | Prefer **one logical surface per commit** (one authority-map concern). Avoid “mega-commits” that mix unrelated packages. |
| Code + matching docs for one feature | Either (a) one commit with code **and** its canonical docs, or (b) a short stack with subjects that name the same feature. |
| Path add/remove/rename | Include inventory/catalog update when the project maintains one. |
| Package version bump | Subject uses `chore(<scope>): bump … to X.Y.Z`. Docs that cite the product version get matching `docs` updates. |
| Docs-only edits | Use `docs` / `docs(<scope>)`. Do not use `feat` for documentation. |
| Message content | Subject describes **what changed in the staged files**, not a vague “updates”. Prefer the same nouns as the docs. |

**Pre-commit message check:**

1. Does the subject type match the staged content (`docs` only if no product code/config behavior)?  
2. Is this **one logical surface** (or an intentional code+docs pair for the same feature)?  
3. If CLI/API verbs, flags, exit codes, or JSON shapes changed, is the matching guide updated?  
4. If trust/execution model changed, is the matching security doc updated?  
5. If formulas or public output fields changed, are methodology + fixtures updated?  
6. If product Python changed, will the pylint gate pass? If Python is in the language inventory, will Bandit pass?  
7. Were **declared** Domain A/B gates for other touched language surfaces run?  
8. Would a reviewer find the subject by searching the feature name used in the README?  
9. Would this subject still make sense **two years** from now without the PR description?  
10. If AI assisted: are `Assisted-by` / `Compliance` / `Instructed-by` present? Does `Assisted-by` name the AI that did the work? Does `Instructed-by` match `git config user.name`?

### Suggested commit workflow

Prefer platform-neutral git steps (same on Windows, Linux, and macOS):

```text
git status
git diff
git add path/to/file
git commit -m "type(scope): imperative summary of this file or surface"
git status
```

On Windows Command Prompt, path separators may be `\`; Git accepts `/` in paths on all common platforms. Stage one focused surface (or one logical pair) per commit.

For a multi-file feature, a typical stack is: implementation → package version → docs (CLI, README, security, methodology as needed) → inventory / RULES if those inventories or policies changed.

### Remotes

A remote is optional. When one exists, do not assume write access to `main`/`master` without team convention. Tags for releases are optional but should match the package version if used.

---

## Verification before ship

Fill concrete commands for your project from the [language surface inventory](#language-surface-inventory). Rows that do not apply may be removed.

| Change type | Minimum verification |
|-------------|----------------------|
| Public behavior, scores, exports | Project tests / golden fixtures (define command for each primary platform) |
| Python product code style | `python -m pylint <package_or_paths>` (must pass; see [Python style gate](#python-style-gate-pylint)) |
| Other language product style | Project-declared gate per inventory (see [Non-Python style gates](#non-python-style-gates)) |
| Security / SAST (language-specific) | Only the commands for **surfaces in the inventory** (see [Security / SAST gates](#security--sast-gates-required-when-declared)); omit entire row if inventory is empty |
| Formal certification | If `certification/` is maintained: regenerate `last_certification.json` / `.txt` after critical gates; confirm OverallPass; do not stage outputs |
| Environment / packaging | Project probe or smoke script (define command; list Windows and Unix forms if both are supported) |
| Schema or sample data | Headers/fields match schema; consumers still load samples |
| Docs only | [Author checklist](./MARKDOWN-STANDARD.md#author-checklist); relative links resolve; platform examples consistent |
| New/removed source files | Inventory/catalog updated (if maintained); language surface inventory if languages added/removed |

### Completion rule

Do **not** mark a change complete, and do **not** claim ship readiness, if any **declared** Domain B (code validation / style) or Domain A (security / SAST) gate for a **surface present in the inventory** was skipped or failed. Docs-only inventories declare no language gates. Missing required developer tools is a **failed** gate, not a skip.

Fill commands for the host OS(es) the team develops on. When multi-platform, either one portable command or one row/note per OS.

### Before marking work complete

Ordered steps for humans and AI agents:

1. Read **language surface inventory** in this file (pick only declared rows from the full kit catalog: Python, Python deps, PowerShell, JS/TS/Node, Go, Rust, Shell, Other/mixed, Secrets, Semgrep).  
2. Run **Domain B** gates for every surface touched by the change.  
3. Run **Domain A** gates for every surface touched (plus Secrets / Semgrep if those rows exist).  
4. Update canonical docs / `CHANGELOG.md` per the authority map.  
5. If `certification/` is maintained: regenerate the certificate pair; confirm OverallPass; leave outputs unstaged.  
6. Only then state the task is complete.

---

## Maintenance cadence

| Trigger | Action |
|---------|--------|
| Every source path add/remove/rename | Update inventory/catalog if maintained |
| Language surface added or removed | Update [language surface inventory](#language-surface-inventory) + verification rows (+ certification checks if maintained) |
| Every release-worthy package behavior change | Bump code version; refresh CLI/API guide and status blocks; update `CHANGELOG.md` |
| Every product Python edit | Run pylint gate; keep exit 0 / 10.00 score; run Bandit if Python is in inventory |
| Every product edit in another declared language | Run that surface’s Domain B + Domain A gates |
| Security-relevant change | Update matching security doc; re-run declared SAST; CHANGELOG entry |
| Formal certification maintained | Regenerate `last_certification.*` after critical gates; do not commit outputs |
| Fixture failure after intentional math/logic change | Refresh expected outputs only with methodology note |
| Stale `last_updated` on heavily edited docs | Set ISO date when merging |
| Kit upgrade available upstream | Follow [Upgrading the kit](#upgrading-the-kit-post-initiation); update baseline + project CHANGELOG |

---

## Anti-patterns

| Avoid | Prefer |
|-------|--------|
| Shipping pylint as a product runtime dependency | Keep pylint developer-only |
| Skipping pylint after Python product edits | Run `python -m pylint <package_or_paths>` |
| Committing regenerable outputs “for convenience” | Document regenerate commands in README / catalog |
| Silent public field or API rename | Coordinated contract bump + fixtures + docs |
| Long docs without Summary | MARKDOWN-STANDARD order |
| Duplicating security matrices into README | Link to security doc |
| Merging unrelated runtimes into one process without design | Keep boundaries; compose via files/CLI/APIs |
| Absolute machine-only paths as the only example | Placeholder + one repo-relative example |
| Orphan files missing from the inventory | Update catalog in the same change |
| Vague commits (`update stuff`, `wip`) | Conventional `type(scope):` subject naming the real surface |
| Code without CLI/methodology/security docs when those contracts apply | Same change set as the canonical doc per authority map; omit security docs when [modularity](#security-documentation-modularity) allows |
| Empty `SECURITY.md` for docs-only or pure libraries with no side effects | Omit the file and the authority-map row |
| Pasting the full multi-language SAST table into every project | Declare only tools for languages the repo ships ([language surface inventory](#language-surface-inventory)) |
| Claiming complete while skipping a **declared** style or SAST gate | Run inventory gates; see [Completion rule](#completion-rule) |
| Shipping Bandit / npm audit / Gitleaks / etc. as product runtime deps | Keep security / SAST tools developer-only |
| Committing `certification/last_certification.*` | Gitignore regenerable cert outputs; regenerate locally |
| Treating certification as a product launcher / diagnostics gate | Certification attests **source tree** policy only |
| Empty language inventory while shipping product code | Fill inventory when product languages exist |
| `feat` commit that only edits markdown | Use `docs` / `docs(scope)` |
| Leaving SETUP.md forever at root after adoption | Delete or archive after initiation; keep [Kit baseline](#kit-baseline) |
| Language style “somehow” without a named gate | Declare tool + pass criteria in RULES / verification table |
| No project `CHANGELOG.md` | Maintain root CHANGELOG (repository H2 → version H3 → category H4); required for all adopters |
| Package version bump without CHANGELOG section | Add matching `### [X.Y.Z]` under the repository H2 in the same change set |
| Shipping release-worthy behavior without CHANGELOG | Same change set: behavior + canonical docs + version + CHANGELOG |
| Kit upgrade with no baseline or CHANGELOG note | Update Adopted kit version/date and project CHANGELOG |
| Inventing an alternate kit source URL | Use https://github.com/shainemeister/repo-kit (unless a deliberate fork) |
| Putting kit release history into a project `CHANGELOG.md` | Keep kit version only in the Kit baseline table (and, for the kit repo itself, under `## repo-kit` dated `###` sections) |

---

## Contributor checklist

Before you commit or share a change:

- [ ] Behavior matches the **canonical** doc for that surface (CLI / API / methodology / security / README)  
- [ ] Inventory/catalog updated if paths changed (when maintained)  
- [ ] [Language surface inventory](#language-surface-inventory) still matches languages the repo ships  
- [ ] Versions and `last_updated` bumped where contracts changed  
- [ ] **CHANGELOG.md** updated when required (release-worthy behavior, version bump, security, kit adopt/upgrade)  
- [ ] Required **verification** from the table above has been run ([Completion rule](#completion-rule))  
- [ ] If product Python changed: **pylint** passed; **Bandit** passed when Python is in inventory  
- [ ] Other declared language surfaces: Domain B + Domain A gates passed for surfaces touched  
- [ ] If `certification/` is maintained: certificate regenerated; OverallPass true; outputs not staged  
- [ ] No secrets, sensitive production data, regenerable outputs, or caches staged  
- [ ] Markdown follows [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) when docs were edited  
- [ ] Commit message uses `type(scope):` format and matches the staged files  
- [ ] Subject would still make sense years later; one logical surface preferred  
- [ ] Canonical docs for any behavior change are in the same change set  
- [ ] If kit pieces changed: [Kit baseline](#kit-baseline) version/date updated and CHANGELOG notes the upgrade  
- [ ] If AI assisted: commit includes `Assisted-by` / `Compliance` / `Instructed-by` (`Assisted-by` = actual make/model; `Instructed-by` = `git config user.name`)  

---

## Document history

| Version | Notes |
|---------|--------|
| 1.4.0 | Language surface inventory (full RULES catalog); SAST **required when declared**; security & code-validation certification schema (single `certification/` folder); completion rule + before-complete steps; verification/checklist/anti-pattern updates |
| 1.3.1 | Upgrade procedure: explicit CHANGELOG discipline (read only entries since baseline; never copy full kit history into project CHANGELOG); link to README AI upgrade prompt |
| 1.3.0 | Security documentation modularity (omit SECURITY.md when no execution/network/privilege/secrets surface); advisory multi-language Security / SAST gates keyed by language; verification and anti-pattern updates |
| 1.2.2 | Required AI-assisted commit disclosure: dynamic `Assisted-by` (make/model), `Compliance: RULES.md`, dynamic `Instructed-by` from `git config user.name`; checklist updates |
| 1.2.1 | Hierarchical CHANGELOG structure (repository H2 → version H3 → category H4); Unreleased workflow removed; kit version authority = `### [X.Y.Z]` under `## repo-kit` |
| 1.2.0 | Mandatory project CHANGELOG; three version surfaces; kit baseline + upgrade path (source https://github.com/shainemeister/repo-kit); SETUP lifecycle note; stronger versioning consistency |
| 1.1.0 | Root hygiene; non-Python style gates; stronger commit-message modularity, scopes, body, examples, footers; SETUP/examples links; initiation pointer to SETUP.md |
| 1.0.1 | Initiation from project interest; platform-aware verify/examples; pylintrc path wording aligned |
| 1.0.0 | Initial portable maintenance rules: authority map, docs, format, pylint PEP-8 gate, architecture, contracts, security baseline, versioning, git, verification |
