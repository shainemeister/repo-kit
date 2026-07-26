---
title: "Plan — Modular Security Documentation & Multi-Language SAST Gates"
description: "Living plan to make security documentation fully optional for docs-only / no-execution packages and to expand RULES.md with advisory, low-dependency security gates across common languages (Python, PowerShell, Node.js, Go, Rust, Shell, and secrets scanning)."
version: "1.0.0"
status: current
audience:
  - maintainers
  - adopters
  - ai-agents
doc_type: other
related:
  - README.md
  - SETUP.md
  - RULES.md
  - MARKDOWN-STANDARD.md
  - templates/TEMPLATE-SECURITY.md
  - CHANGELOG.md
last_updated: "2026-07-26"
---

# Plan — Modular Security Documentation & Multi-Language SAST Gates

Living plan for the current enhancement cycle of the Repository Standards Kit. This document guides two related improvements:

1. Make security documentation **fully modular** so docs-only or pure-library packages are not forced to create empty `SECURITY.md` files.
2. Expand the kit’s guidance with **advisory, low-dependency, multi-language security / SAST gates** that cover the most common languages and work across Windows, Linux, and macOS.

**Document version:** 1.0.0  
**Related:** [README.md](./README.md) · [SETUP.md](./SETUP.md) · [RULES.md](./RULES.md) · [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) · [templates/TEMPLATE-SECURITY.md](./templates/TEMPLATE-SECURITY.md) · [CHANGELOG.md](./CHANGELOG.md)

---

## Summary

The kit already has a solid foundation:

- Short **Security baseline** in `RULES.md`
- High-quality `TEMPLATE-SECURITY.md`
- Authority-map row for security that can be removed

However, two gaps remain:

- Adopters of docs-only or pure-library packages still lack an explicit “you may omit SECURITY.md” rule.
- The Non-Python style gates section does not yet give concrete, official, low-dependency security tools for the most common languages.

This plan closes both gaps while preserving the kit’s core principles: modularity, developer-tooling-only gates, and platform awareness.

**Key design constraints**
- Prefer official or near-official tools.
- Minimize installation of extensive dependency trees.
- Cover multiple languages and all three major OS platforms.
- Remain fully dynamic — projects only declare the gates that apply to them.

---

## Contents

1. [Summary](#summary)
2. [Goals](#goals)
3. [Non-goals](#non-goals)
4. [Current state](#current-state)
5. [Target state](#target-state)
6. [Recommended tools (advisory)](#recommended-tools-advisory)
7. [Implementation steps](#implementation-steps)
8. [Success criteria](#success-criteria)
9. [Verification](#verification)
10. [Related files & ownership](#related-files--ownership)
11. [Document history](#document-history)

---

## Goals

| # | Goal | Why it matters |
|---|------|----------------|
| 1 | Explicit modularity rule for security docs | Docs-only and pure-library packages should never feel forced to create empty security files |
| 2 | Expand RULES.md with advisory multi-language security / SAST gates | Give adopters concrete, official, low-dependency starting points for the languages they actually use |
| 3 | Keep every security gate optional and declared only when applicable | Matches the existing pylint / Non-Python style-gate pattern |
| 4 | Prefer official resources with minimal install footprint | Reduces friction and supply-chain risk for adopters |
| 5 | Cover the most common languages + secrets scanning | Python, PowerShell, Node.js/TypeScript, Go, Rust, Shell, and whole-repo secrets |

---

## Non-goals

- Turning any security tool into a required runtime dependency.
- Creating a full security matrix for the kit itself (the kit has almost no execution surface).
- Shipping filled example SECURITY.md files in this cycle (can be a later enhancement).
- Replacing or heavily rewriting `TEMPLATE-SECURITY.md` structure.
- Adding CI workflows or GitHub Actions in this cycle.

---

## Current state

- `RULES.md` § Security baseline is short and correct but does not say when a package may omit security documentation.
- `TEMPLATE-SECURITY.md` is high quality and already uses placeholders; it does not yet tell authors which sections are safe to delete.
- Authority map lists “Security / trust boundary” as a normal row; examples correctly omit it for docs-only in some places, but the rule is not written down.
- Non-Python style gates section exists but does not yet cover security-focused tools.

---

## Target state

After this enhancement:

1. `RULES.md` contains a clear decision rule:

   > Create or maintain a package `SECURITY.md` only when the package has an execution surface, network access, elevated privilege, or handles secrets. Pure documentation or pure library packages with no runtime side effects may omit it entirely.

2. The Non-Python style gates section (or a new short “Security / SAST gates” subsection) lists the advisory tools table below and tells adopters to declare only the rows that apply in their verification table.

3. `TEMPLATE-SECURITY.md` contains brief “Delete this section if not applicable” guidance where helpful.

4. `SETUP.md` (or the initiation checklist) briefly points to the new modularity rule.

5. The change is recorded in `CHANGELOG.md` under a new kit version section.

---

## Recommended tools (advisory)

Prefer official or near-official tools with low install footprint. All work across Windows, Linux, and macOS unless noted.

| Language / Surface | Recommended tool | Official / low-dep notes | Typical command (pass = clean / exit 0) |
|--------------------|------------------|---------------------------|-----------------------------------------|
| **Python** | **Bandit** | PyCQA | `python -m bandit -r <package>` |
| **Python deps** | **pip-audit** | Official PyPA | `pip-audit` |
| **PowerShell** | **PSScriptAnalyzer** | Official Microsoft module | `Invoke-ScriptAnalyzer -Path . -Severity Error` (or security rules only) |
| **JavaScript / Node.js / TypeScript** | **npm audit** (+ optional eslint-plugin-security) | npm is official | `npm audit --audit-level=moderate` |
| **Go** | **govulncheck** | Official Go team | `govulncheck ./...` |
| **Rust** | **cargo-audit** | Official RustSec | `cargo audit` |
| **Shell (bash/sh)** | **ShellCheck** | De-facto standard, single binary | `shellcheck *.sh` |
| **Any language / whole repo** | **Gitleaks** or **TruffleHog** | Secrets detection | `gitleaks detect` |
| **Multi-language SAST (optional)** | **Semgrep** | When language-specific tools are insufficient | `semgrep --config=auto` |

**Usage rule for adopters**  
In the project’s verification table, list **only** the rows that apply. Docs-only packages list none.

---

## Implementation steps

| Step | Action | Notes |
|------|--------|-------|
| 1 | Add the modularity decision rule to `RULES.md` § Security baseline | One clear paragraph or table row |
| 2 | Expand the Non-Python style gates section (or add a short “Security / SAST gates” subsection) with the tools table above | Keep the tone advisory; point back to the verification table |
| 3 | Add brief “Delete this section if not applicable” notes to key parts of `TEMPLATE-SECURITY.md` | Do not change the overall structure |
| 4 | Add a one-line pointer in `SETUP.md` (initiation checklist or authority-map step) | “Security documentation is optional for packages with no execution surface — see RULES.md” |
| 5 | Optionally update `examples/docs-only.md` to show the security row explicitly omitted or marked N/A | Low priority |
| 6 | Record the enhancement under a new kit version section in `CHANGELOG.md` | e.g. `### [1.1.5] - YYYY-MM-DD` |
| 7 | After the changes land, this `PLAN.md` may be archived or kept as the living plan for the cycle | Follow the same pattern used for the previous README enhancement |

---

## Success criteria

- [ ] `RULES.md` contains an explicit statement that security documentation may be omitted for packages with no execution surface.
- [ ] Advisory multi-language security / SAST tools table is present and clearly marked as optional starting points.
- [ ] `TEMPLATE-SECURITY.md` tells authors which sections can be deleted when not needed.
- [ ] `SETUP.md` briefly references the modularity rule.
- [ ] All new guidance continues to treat security tools as developer-only (never runtime dependencies).
- [ ] CHANGELOG records the enhancement under a new kit version.
- [ ] Docs-only example continues to demonstrate that security rows can be absent.

---

## Verification

| Check | Method |
|-------|--------|
| RULES.md still validates against MARKDOWN-STANDARD | Manual review |
| New text does not force any package to create SECURITY.md | Read the decision rule |
| Tools table uses only official / low-dependency options | Review against the table in this plan |
| Links and relative paths remain correct | Visual check |
| No unresolved placeholders introduced | Visual scan |

---

## Related files & ownership

| File | Role in this plan |
|------|-------------------|
| [RULES.md](./RULES.md) | Primary target — Security baseline + style/security gates expansion |
| [templates/TEMPLATE-SECURITY.md](./templates/TEMPLATE-SECURITY.md) | Light guidance additions only |
| [SETUP.md](./SETUP.md) | One-line modularity pointer |
| [examples/docs-only.md](./examples/docs-only.md) | Optional demonstration of omission |
| [CHANGELOG.md](./CHANGELOG.md) | Records the completed enhancement |
| This PLAN.md | Living plan for the cycle; high-quality context for the implementing AI |

---

## Document history

| Version | Date | Notes |
|---------|------|-------|
| 1.0.0 | 2026-07-26 | Initial plan created for modular security documentation and multi-language SAST gates enhancement. |
