---
title: Security Baseline
description: Trust baseline, security doc modularity, language surface inventory, SAST gates, and certification schema.
version: "1.1.1"
status: current
audience:
  - developers
  - security
doc_type: other
related:
  - ../RULES.md
  - ./contracts.md
  - ./authoring-and-style.md
  - ./verification-and-ops.md
  - ../templates/TEMPLATE-SECURITY.md
  - ../templates/TEMPLATE-CERTIFICATION-README.md
last_updated: "2026-08-21"
---

# Security Baseline

Hard rules for product code and launchers, inventory-driven SAST, and optional formal certification. This file owns the inventory on/off switch for Domain A and Domain B.

**Related:** [RULES.md](../RULES.md) · [contracts.md](./contracts.md) · [authoring-and-style.md](./authoring-and-style.md) · [verification-and-ops.md](./verification-and-ops.md) · [TEMPLATE-SECURITY](../templates/TEMPLATE-SECURITY.md) · [TEMPLATE-CERTIFICATION-README](../templates/TEMPLATE-CERTIFICATION-README.md)

---

## Summary

| Must |
|------|
| Fill [language surface inventory](#language-surface-inventory) for shipped surfaces; do not paste the full SAST catalog without inventory evidence |
| Run **declared** Domain A (SAST) gates before complete ([completion](./verification-and-ops.md#completion-rule)); SAST tools are **not** product runtime dependencies |
| Omit empty SECURITY docs when [modularity](#security-documentation-modularity) allows |
| Gitignore `last_certification.*`; certification is **not** a product launcher / diagnostics gate |

---

## Contents

1. [Security baseline](#security-baseline)
2. [Security documentation modularity](#security-documentation-modularity)
3. [Language surface inventory](#language-surface-inventory)
4. [Security / SAST gates (required when declared)](#security--sast-gates-required-when-declared)
5. [Security and code-validation certification](#security-and-code-validation-certification)
6. [Document history](#document-history)

---

## Security baseline

When a package security doc is required, it owns full matrices ([authority map](../RULES.md#authority-map)).

| Rule | Guidance |
|------|----------|
| Privilege | Prefer current user only; document any elevation requirement |
| Network | Document whether product code may reach the network or package indexes |
| Secrets | Never commit secrets; rotate if leaked; treat history cleanup as an incident |
| Dependencies | Match the declared dependency policy; no silent download-and-run |
| Host policy | Do not permanently weaken host security policy in product install steps without explicit, documented need |

---

## Security documentation modularity

Create or maintain a package `SECURITY.md` (or equivalent) **only when** the package has an **execution surface**, **network access**, **elevated privilege**, or **handles secrets**. Pure documentation packages and pure libraries with **no runtime side effects** may **omit** security documentation entirely—do not create empty files to satisfy a template habit.

| Situation | `SECURITY.md` |
|-----------|---------------|
| Docs-only / standards repo | **Omit** |
| Pure library, no network / privilege / secrets handling | **Omit** (optional short note in package README if helpful) |
| CLI, service, automation, or other execution surface | **Required** |
| Handles credentials, tokens, or elevated install | **Required** |
| Monorepo | Per package: required only for packages that meet the triggers above |

When omitted, remove the Security / trust boundary row from the [authority map](../RULES.md#authority-map). When present, keep trust-boundary detail in that canonical file—not duplicated into README. Trust surfaces are contracts when present—see [contracts.md](./contracts.md).

---

## Language surface inventory

Declare **which product language and security surfaces this repository ships**. The inventory is the **source of truth** for style gates, SAST gates, verification rows, and (when maintained) formal certification checks. Copy **only** rows that apply—never paste the full catalog into a docs-only project.

Fill a project table (examples: [examples/](../examples/)). Kit catalog of surfaces (Domain B = code validation / style; Domain A = security / SAST):

| Surface | Evidence it exists | Domain B — style / validation | Domain A — security / SAST | Typical pass | Omit when… |
|---------|-------------------|-------------------------------|----------------------------|--------------|------------|
| *(none — docs-only)* | No product code | — | — | Author checklist | Standards / design repos |
| **Python** product code | Product `*.py` packages | **pylint** (exit 0, score **10.00/10**; [style gate](./authoring-and-style.md#python-style-gate-pylint)) | **Bandit** (`python -m bandit -r <package>`) | Style + SAST clean | No product Python |
| **Python** dependencies | Third-party deps (not stdlib-only) | — | **pip-audit** | Exit 0 / clean | No Python deps / pure docs / stdlib-only |
| **PowerShell** | Product `*.ps1` / modules | Project primary (e.g. PS AST parse, BOM policy) | **PSScriptAnalyzer** (`-Severity Error`); optional security-rules subset | Zero Error findings | No PowerShell surface |
| **JavaScript / TypeScript** (Node) | `package.json` / Node surface | **eslint**, **prettier** (or project primary) | **npm audit** (`--audit-level=moderate`); secondary: eslint-plugin-security | Lint/format clean; audit clean | No Node surface |
| **Go** | Go modules | **gofmt** / `go fmt`, **golangci-lint** | **govulncheck** (`govulncheck ./...`) | Format + lint clean; SAST clean | No Go modules |
| **Rust** | `Cargo.toml` | **rustfmt**, **clippy** ([style gate](./authoring-and-style.md#rust-style-gate-rustfmt--clippy)) | **cargo-audit** (`cargo audit`) | Format + clippy clean; audit clean | No `Cargo.toml` / no product Rust |
| **C / C++** | Product `*.c` / `*.h` / `*.cc` / `*.cpp` / `*.cxx` / `*.hpp` | **clang-format**, **clang-tidy** ([style gate](./authoring-and-style.md#c--c-style-gate-clang-format--clang-tidy)) | **cppcheck** (`cppcheck --error-exitcode=1 --enable=warning,style,performance,portability <src>`) | Format + tidy clean; cppcheck exit 0 | No C/C++ product sources |
| **Shell** (bash/sh product) | Product shell scripts | **shellcheck** | **ShellCheck** (same tool may cover both domains—one declaration is enough) | No errors (or project severity) | No shell product scripts |
| **Other / mixed** | Other product languages | Document tool + command | Language-appropriate tool, or **Semgrep** | Exit 0 / project-defined | No other product languages |
| **Secrets** (whole repo) | Team chooses to scan | — | **Gitleaks** (preferred); secondary TruffleHog | No leaks | Explicit opt-out (e.g. pure public docs) |
| **Multi-language / custom rules** | Cross-language or org rules | — | **Semgrep** | Exit 0 / clean | Language-specific tools already cover |

**Rules:**

1. Inventory drives the [verification table](./verification-and-ops.md#verification-before-ship)—each declared surface needs named commands and pass criteria.
2. Adding a language later updates inventory, verification, authority map (if needed), and certification checks in the **same change set**.
3. **Python product** and **Python dependencies** are separate rows (Bandit vs pip-audit). Rust Domain A is **cargo-audit** (crate graph). C / C++ has **no** separate dependencies row (no standard lockfile analog).
4. **Secrets** and **Semgrep** are inventory surfaces even though they are not programming languages.
5. Prefer declared inventory over heuristic filesystem scans. At initiation, derive rows from [project interest](../SETUP.md) and planned layout.

Domain B tool detail and starter configs: [authoring-and-style.md](./authoring-and-style.md) ([pylintrc](../configs/pylintrc) · [rustfmt.toml](../configs/rustfmt.toml) · [clang-format](../configs/clang-format) as inventory requires).

---

## Security / SAST gates (required when declared)

**Developer-tooling** gates for security-oriented static analysis. These are **not** style gates and are **not** product runtime dependencies.

**Posture:** When a language or security surface is **present in the inventory**, its Domain A tool is **required** before task completion and ship (see [Completion rule](./verification-and-ops.md#completion-rule)). Surfaces not in the inventory must not be implied. Docs-only inventories declare **zero** SAST gates.

**Modularity rule:** Declare **only** tools for **languages and surfaces the repo actually ships**. Copy **zero** rows for docs-only projects. Multi-language monorepos add **one verification row per language surface that exists**—never paste the full kit table. List chosen commands in the [verification table](./verification-and-ops.md#verification-before-ship).

Prefer official or near-official tools with a small install footprint. All work across Windows, Linux, and macOS unless noted by the tool vendor.

| If the repo ships… | Primary tool | Typical command (pass = exit 0 / clean) | Secondary (optional) | Skip if… |
|--------------------|--------------|------------------------------------------|----------------------|----------|
| **Python** product code | **Bandit** (PyCQA) | `python -m bandit -r <package>` | — | No product `*.py` packages |
| **Python** dependencies | **pip-audit** (PyPA) | `pip-audit` | — | No Python deps / pure docs |
| **PowerShell** (`*.ps1`, modules) | **PSScriptAnalyzer** (Microsoft) | `Invoke-ScriptAnalyzer -Path . -Severity Error` | Security rules subset only | No PowerShell surface |
| **JavaScript / Node.js / TypeScript** | **npm audit** | `npm audit --audit-level=moderate` | eslint-plugin-security | No `package.json` / Node surface |
| **Go** | **govulncheck** (Go team) | `govulncheck ./...` | — | No Go modules |
| **Rust** | **cargo-audit** (RustSec) | `cargo audit` | — | No `Cargo.toml` / no product Rust |
| **C / C++** | **cppcheck** | `cppcheck --error-exitcode=1 --enable=warning,style,performance,portability <src>` | Semgrep C/C++ rules | No C/C++ product sources |
| **Shell** (bash/sh as product surface) | **ShellCheck** | `shellcheck *.sh` | — | No shell product scripts *(also a common style gate—one declaration is enough)* |
| **Secrets** (whole repo) | **Gitleaks** (preferred) | `gitleaks detect` | TruffleHog | Team chooses not to scan (e.g. pure public docs with no secret risk) |
| **Multi-language / custom rules** | **Semgrep** | `semgrep --config=auto` | — | Language-specific tools already cover the surface |

**Product dependency:** **No.** Bandit, pip-audit, npm audit, govulncheck, cargo-audit, cppcheck, ShellCheck, Gitleaks, Semgrep, and similar tools are **developer tooling** only. Do **not** add them as required installs for end users of the product.

**Rules:**

1. Name the tool and pass criteria in the verification table—do not leave “we scan somehow” implied.
2. Install tools in the **developer** environment only. Missing required tools fail the gate (install hints)—do not silently skip.
3. Docs-only repositories may omit every security / SAST gate.
4. Do not treat the full table above as a checklist for every project.
5. Warning-level findings (e.g. PSScriptAnalyzer **Warning**) stay advisory unless the project promotes them to critical.

---

## Security and code-validation certification

Optional formal **developer self-attestation** that, for git commit *C* at time *T*, declared product surfaces passed **Domain A (security / SAST)** and **Domain B (code validation)**. This is **not** a third-party audit, SOC 2, ISO seal, or product runtime diagnostics gate.

| This **is** | This **is not** |
|-------------|-----------------|
| Self-attestation of automated checks bound to a commit | Third-party certification or compliance logo |
| Security **and** code validation in one certificate pair | A second product CLI / diagnostics gate for end users |
| Suitable for IT tickets and pre-ship review packets | Proof of regulated Safe Harbor or data claims |
| Regenerable, gitignored output under one folder | A substitute for human threat modeling |

### Single-folder rule

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

### Domains and OverallPass

```text
Domains.Security.OverallPass
Domains.CodeValidation.OverallPass
OverallPass = AND of domains that apply for declared inventory surfaces
```

**OverallPass** means: every **critical** check that ran passed, **and** no required critical tool was missing.

| Domain | Covers |
|--------|--------|
| **Security** | Declared Domain A tools from the inventory (Bandit, pip-audit, PSScriptAnalyzer Error, npm audit, govulncheck, cargo-audit, cppcheck, ShellCheck, Gitleaks, Semgrep, …) |
| **Code validation** | Declared Domain B style gates (pylint, rustfmt, clippy, clang-format, clang-tidy, eslint, gofmt, …) plus project contract checks (tests, probes, parse) listed in verification |

### Certificate shape (illustrative)

**Machine-readable** (`certification/last_certification.json`) should include:

- `CertificateType`: `SecurityAndCodeValidationCertification`
- `OverallPass`, `Success`, timestamps, `RepoRoot`
- `GitCommit`, `GitBranch`, `GitDirty`
- `LanguageSurfaces[]` (from inventory; e.g. Python, PythonDeps, PowerShell, JavaScriptTypeScript, Go, Rust, CCpp, Shell, Other, Secrets, Semgrep)
- `PackageVersions`, `ToolVersions`, `PassCriteria`
- `Domains.Security` / `Domains.CodeValidation` with `OverallPass`, `CriticalFailed`
- `Checks[]`: `Name`, `Domain`, `Language` (optional), `Passed`, `Severity`, `Detail`, optional `DurationMs`
- `Disclaimer`, `Message`

**Human-readable** (`last_certification.txt`): same facts in sections (`== Security ==`, `== Code validation ==`, disclaimer).

**Privacy:** paths, versions, rule ids, counts only—never secrets, passwords, PHI, or production claim rows.

### Certification rule

When the repository maintains `certification/`, regenerate `last_certification.json` and `.txt` after critical gates for the change set; leave regenerable outputs **untracked**. Missing required tools yield `OverallPass = false`, not a silent skip. A future kit harness may automate generation; until then, operators may produce the pair manually or with project scripts that match this schema.

**Relationship to package diagnostics:** package probes answer “can **this machine** run the product?” Certification answers “does **this source tree** meet security + validation policy?” Do not merge package diagnostics into `certification/`.

Operator skeleton: [TEMPLATE-CERTIFICATION-README.md](../templates/TEMPLATE-CERTIFICATION-README.md).

---

## Document history

| Version | Notes |
|---------|--------|
| 1.1.1 | Density restyle (kit 2.8.0); inventory, SAST, and certification catalogs unchanged |
| 1.1.0 | Named C/C++ surface (clang-format + clang-tidy / cppcheck); Rust Domain B points at style-gate chapter (kit 2.5.0) |
| 1.0.0 | Extracted from RULES 1.4.1 for kit 2.0 |
