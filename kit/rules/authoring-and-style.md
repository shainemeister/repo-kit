---
title: Authoring and Style
description: Documentation rules, formatting conventions, inventory-gated style gates for Python, Rust, and C/C++, and other language style gates.
version: "1.1.2"
status: current
audience:
  - developers
  - technical-writers
doc_type: other
related:
  - ../RULES.md
  - ../MARKDOWN-STANDARD.md
  - ./contracts.md
  - ./verification-and-ops.md
  - ../configs/pylintrc
  - ../configs/rustfmt.toml
  - ../configs/clippy.toml
  - ../configs/clang-format
  - ../configs/clang-tidy
last_updated: "2026-08-14"
---

# Authoring and Style

How to write and structure documentation, and how to gate product code style (Domain B). Named kit style gates (pylint, rustfmt+clippy, clang-format+clang-tidy) apply **only when that language is in the [language surface inventory](./security.md#language-surface-inventory)**. Empty / docs-only inventories declare no language style gates.

**Document version:** 1.1.2  

**Related:** [RULES.md](../RULES.md) · [MARKDOWN-STANDARD.md](../MARKDOWN-STANDARD.md) · [contracts.md](./contracts.md) · [verification-and-ops.md](./verification-and-ops.md) · [pylintrc](../configs/pylintrc) · [rustfmt.toml](../configs/rustfmt.toml) · [clippy.toml](../configs/clippy.toml) · [clang-format](../configs/clang-format) · [clang-tidy](../configs/clang-tidy)

---

## Summary

| Must | Must not |
|------|----------|
| Follow MARKDOWN-STANDARD for substantial docs | Leave `{{PLACEHOLDERS}}` in finished docs |
| Update canonical docs with behavior changes | Use README as the only deep contract |
| Run **declared** style gates before complete (inventory switch) | Ship pylint, rustfmt, clippy, clang-format, or clang-tidy as a product runtime dependency |

Canonical owner policy: [contracts.md](./contracts.md). Document shape: [MARKDOWN-STANDARD.md](../MARKDOWN-STANDARD.md).

---

## Contents

1. [Summary](#summary)
2. [Documentation rules](#documentation-rules)
3. [Formatting and style](#formatting-and-style)
4. [Python style gate (pylint)](#python-style-gate-pylint)
5. [Rust style gate (rustfmt + clippy)](#rust-style-gate-rustfmt--clippy)
6. [C / C++ style gate (clang-format + clang-tidy)](#c--c-style-gate-clang-format--clang-tidy)
7. [Other language style gates](#other-language-style-gates)
8. [Document history](#document-history)

---

## Documentation rules

1. **Substantial documents** follow [MARKDOWN-STANDARD.md](../MARKDOWN-STANDARD.md): YAML frontmatter, single H1, lead, Summary before Contents, body, history when versioned. **Root `README.md`** uses the [landing](../MARKDOWN-STANDARD.md#landing--root-readme-no-frontmatter) outline only: no frontmatter; **Overview** then **Operator prompts**.  
2. **New docs** start from [templates/](../templates/); leave no unresolved `{{PLACEHOLDERS}}`. Pick templates from [project interest](../SETUP.md#5-pick-templates-by-interest) so contracts exist before or with first code.  
3. **Behavior change ⇒ doc change** in the same commit or PR — see [contracts.md](./contracts.md):  
   - CLI verbs, flags, exit codes, JSON shapes → matching CLI / API guide  
   - Formulas, output columns, validation → methodology (+ fixtures if contract shifts)  
   - Trust boundary or execution model → matching security doc  
4. **Prefer link + short summary** over pasting another document in full.  
5. **Root README** stays an overview; deep contracts stay in package docs.  
6. **Status honesty:** set frontmatter `status` to `draft` / `current` / `deprecated` accurately.  
7. **Platform-aware examples** follow [MARKDOWN-STANDARD — Platform-aware examples](../MARKDOWN-STANDARD.md#platform-aware-examples): declare primary OS when examples are OS-specific; dual fences when multi-platform.

---

## Formatting and style

| Area | Rule |
|------|------|
| Voice | Complete sentences; direct and professional; tables for parallel facts |
| Emphasis | **Bold** for critical terms and UI labels |
| Identifiers | `` `inline code` `` for paths, flags, column names, module names |
| Markdown structure | Per [MARKDOWN-STANDARD.md](../MARKDOWN-STANDARD.md); language-tagged code fences |
| Links | Relative from the file’s directory (`./CLI-GUIDE.md`, `../README.md`) |
| Paths in prose | Consistent separators within a file; match [platform-aware rules](../MARKDOWN-STANDARD.md#platform-aware-examples) |
| Examples | Prefer placeholders (`C:\path\to\...` and/or `/path/to/...`) plus one concrete repo-relative example; dual shell fences when multi-OS |
| Platform | State primary platform(s) for verify/build examples; fill verification table with the command(s) the team actually runs |
| Python | When Python is **in the inventory**: **PEP-8 via pylint** — see [Python style gate (pylint)](#python-style-gate-pylint) |
| Rust | When Rust is **in the inventory**: **rustfmt + clippy** — see [Rust style gate](#rust-style-gate-rustfmt--clippy) |
| C / C++ | When C / C++ is **in the inventory**: **clang-format + clang-tidy** — see [C / C++ style gate](#c--c-style-gate-clang-format--clang-tidy) |
| Other languages | Declare a style gate — see [Other language style gates](#other-language-style-gates) |

---

## Python style gate (pylint)

Applies **only when Python product code is in the [language surface inventory](./security.md#language-surface-inventory)**. Docs-only and non-Python inventories skip this chapter; unused `kit/configs/pylintrc` is dormant catalog.

All **product** Python under the packages this project ships must stay **pylint-clean** under the project’s gate config before sharing behavior or packaging changes.

| Item | Rule |
|------|------|
| **Config** | [configs/pylintrc](../configs/pylintrc) — copy to the package or repo as `.pylintrc` (or pass `--rcfile`). PEP-8–aligned conventions (line length 100, docstrings, names, unused imports/vars, selected errors) |
| **Scope** | Product packages and modules only (not one-off scratch scripts unless the project says so) |
| **Command** | `python -m pylint <package_or_paths>` (or `py -3.x -m pylint …` on Windows) |
| **Pass criteria** | Exit code **0** and score **10.00/10** under that config |
| **When to run** | After any edit to product `*.py`, `.pylintrc` / `pylintrc`, or packaging that can affect style |
| **Product dependency** | **No.** Pylint is **developer tooling** only. Do **not** add pylint as a required install for end users of the product. |
| **Out of gate** | Design/refactor metrics (`too-many-*`, large-file complexity) are intentionally relaxed in the default config; do not “fix” them by silent API rewrites. Full default pylint without the gate config is informational only. |
| **Non-Python repos** | This gate does not apply. |

If pylint is not installed on a developer machine, install it into the **developer environment** (user/global Python or a dev extra), never into a product runtime path meant only for end users.

**Adopt steps** (when Python is declared or first introduced):

1. Add the **Python** inventory row and verification commands in the **same change set** (skip if already declared).  
2. Copy `configs/pylintrc` (from kit: `kit/configs/pylintrc`) to the package or repo root as `.pylintrc`.  
3. **Must:** set `py-version` to the project’s supported Python (the file ships a starter default only—change it).  
4. Point the [verification table](./verification-and-ops.md#verification-before-ship) at the real package path.  
5. Extend `good-names` only when short identifiers are intentional and repeated.

---

## Rust style gate (rustfmt + clippy)

Applies **only when Rust is in the [language surface inventory](./security.md#language-surface-inventory)** (typically a product `Cargo.toml`). Docs-only and non-Rust inventories skip this chapter; unused files under `kit/configs/` are dormant catalog.

| Item | Rule |
|------|------|
| **Config** | [configs/rustfmt.toml](../configs/rustfmt.toml) and [configs/clippy.toml](../configs/clippy.toml) — copy to the crate or repo root (or pass rustfmt/clippy config flags). Line width 100; complexity lints out of gate |
| **Scope** | Product crates and modules only (not one-off scratch crates unless the project says so) |
| **Command** | `cargo fmt --check` and `cargo clippy --all-targets -- -D clippy::correctness -D clippy::suspicious -D clippy::style -A clippy::complexity` |
| **Pass criteria** | Both commands exit **0** under the kit starter configs. Non-Python gates **do not** inherit pylint’s 10.00/10 score rule |
| **When to run** | After any edit to product Rust, `rustfmt.toml` / `clippy.toml`, or packaging that can affect style |
| **Product dependency** | **No.** rustfmt and clippy are **developer tooling** only |
| **Out of gate** | Clippy **complexity** (too-many-*, cognitive-complexity) stays allowed; do not “fix” them by silent API rewrites |
| **Domain A** | **cargo-audit** (`cargo audit`) — command only; no kit `audit.toml` (Bandit pattern) |
| **Non-Rust repos** | This gate does not apply |

If rustfmt/clippy/cargo-audit are not installed, install them into the **developer** environment (rustup components / `cargo install cargo-audit`), never into a product runtime path meant only for end users.

**Adopt steps** (when Rust is declared or first introduced):

1. Add the **Rust** inventory row and verification commands in the **same change set**.  
2. Copy `kit/configs/rustfmt.toml` and `kit/configs/clippy.toml` to the crate or repo root.  
3. **Must:** set rustfmt `edition` to the crate edition (the file ships a starter default only—change it).  
4. Point the [verification table](./verification-and-ops.md#verification-before-ship) at `cargo fmt --check` and the clippy command above; add `cargo audit` for Domain A.  
5. Missing required tools (or skipping a declared command) is a **failed** gate.

---

## C / C++ style gate (clang-format + clang-tidy)

Applies **only when C / C++ is in the [language surface inventory](./security.md#language-surface-inventory)** (product `*.c` / `*.h` / `*.cc` / `*.cpp` / `*.cxx` / `*.hpp`). Docs-only and non-C/C++ inventories skip this chapter; unused files under `kit/configs/` are dormant catalog.

| Item | Rule |
|------|------|
| **Config** | [configs/clang-format](../configs/clang-format) and [configs/clang-tidy](../configs/clang-tidy) — copy as `.clang-format` and `.clang-tidy` at package or repo root. Column limit 100; 4-space indent |
| **Scope** | Product C / C++ sources only (not generated sources unless the project says so) |
| **Command** | `clang-format --dry-run --Werror <sources>` and `clang-tidy -p compile_commands.json <sources>` |
| **Pass criteria** | Both commands exit **0** under the kit starter configs. Non-Python gates **do not** inherit pylint’s 10.00/10 score rule |
| **When to run** | After any edit to product C / C++, `.clang-format` / `.clang-tidy`, or packaging that can affect style |
| **Product dependency** | **No.** clang-format and clang-tidy are **developer tooling** only |
| **Compile database** | Product build must emit `compile_commands.json`. The kit does **not** ship a compilation database or a CMake/Meson/Bazel template. Missing DB when C / C++ is **declared** is a **failed** gate unless the project documents a header-only `--` compile-flag fallback |
| **Out of gate** | Large modernize-the-codebase CERT dumps and design/refactor metrics stay out of the starter `.clang-tidy` Checks list |
| **Domain A** | **cppcheck** (`cppcheck --error-exitcode=1 --enable=warning,style,performance,portability <src>`) — command only; no kit `cppcheck.cfg` (Bandit pattern) |
| **Non-C/C++ repos** | This gate does not apply |

If clang-format, clang-tidy, or cppcheck are not installed, install them into the **developer** environment, never into a product runtime path meant only for end users.

**Adopt steps** (when C / C++ is declared or first introduced):

1. Add the **C / C++** inventory row and verification commands in the **same change set**.  
2. Copy `kit/configs/clang-format` → `.clang-format` and `kit/configs/clang-tidy` → `.clang-tidy`.  
3. **Must:** set `BasedOnStyle` if the tree already uses Google / WebKit / Mozilla / other (LLVM is a starter default only—change it).  
4. Arrange the product build to write `compile_commands.json`; point clang-tidy at it.  
5. Point the [verification table](./verification-and-ops.md#verification-before-ship) at the format, tidy, and cppcheck commands.  
6. Missing required tools, a missing compile DB (without a documented fallback), or skipping a declared command is a **failed** gate.

---

## Other language style gates

Projects that ship product code in a language **without** a named kit style chapter should declare **one primary gate per language surface** in RULES or a thin overlay: tool name, command, and pass criteria. Put the command in the [verification table](./verification-and-ops.md#verification-before-ship). Those gates **do not** inherit the pylint 10.00 score rule.

Named kit gates (inventory-gated — do not run when the row is absent):

| Language / ecosystem | Kit gate | Typical pass criteria |
|----------------------|----------|------------------------|
| Python | [pylint](#python-style-gate-pylint) | Exit 0 and score **10.00/10** under kit `pylintrc` |
| Rust | [rustfmt + clippy](#rust-style-gate-rustfmt--clippy) | `cargo fmt --check` clean; clippy exit 0 under kit flags |
| C / C++ | [clang-format + clang-tidy](#c--c-style-gate-clang-format--clang-tidy) | Format check clean; tidy exit 0 under kit file + compile DB |

Advisory starting points for other surfaces (choose what the team will actually run):

| Language / ecosystem | Common gate tools | Typical pass criteria |
|----------------------|-------------------|------------------------|
| JavaScript / TypeScript | eslint, prettier | Lint exit 0; format clean (or check mode clean) |
| Go | gofmt / go fmt, golangci-lint | Format clean; linter exit 0 under project config |
| Shell | shellcheck | No errors (or project-defined severity) |
| Other / mixed | Document tool + command in verification table | Exit 0 / project-defined |

**Rules:**

1. Name the tool and pass criteria explicitly—do not leave “we lint somehow” implied.  
2. Keep style tools as **developer tooling** unless the product truly requires them at runtime.  
3. Docs-only repositories may omit language style gates entirely.  
4. Copy **only** the starter configs for languages the inventory lists. A whole-`kit/` copy may leave unused files under `kit/configs/` — that is dormant catalog, not a live gate.

Language inventory (which surfaces exist) lives in [security.md](./security.md#language-surface-inventory).

---

## Document history

| Version | Notes |
|---------|--------|
| 1.1.2 | Root README landing shape required (kit 2.6.2) |
| 1.1.1 | Python adopt steps start with inventory (parity with Rust/C++); kit 2.5.1 |
| 1.1.0 | Named Rust and C/C++ style gates + starter configs; inventory is the on/off switch (kit 2.5.0) |
| 1.0.0 | Extracted from RULES 1.4.1 for kit 2.0 |
