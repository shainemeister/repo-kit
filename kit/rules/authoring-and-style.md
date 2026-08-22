---
title: Authoring and Style
description: Documentation rules, formatting conventions, inventory-gated style gates for Python, Rust, and C/C++, and other language style gates.
version: "1.2.1"
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
  - ./security.md
last_updated: "2026-08-21"
---

# Authoring and Style

How to write documentation and how to gate product code style (Domain B). **Declared** Domain B gates apply only when that language is in the [language surface inventory](./security.md#language-surface-inventory); this file owns command strings, pass criteria, and adopt steps.

**Related:** [RULES.md](../RULES.md) · [MARKDOWN-STANDARD.md](../MARKDOWN-STANDARD.md) · [contracts.md](./contracts.md) · [verification-and-ops.md](./verification-and-ops.md) · [security.md](./security.md)

---

## Summary

| Must |
|------|
| Follow [MARKDOWN-STANDARD](../MARKDOWN-STANDARD.md) required core (root `README.md` uses the [landing](../MARKDOWN-STANDARD.md#landing--root-readme-no-frontmatter) outline); leave no `{{PLACEHOLDERS}}` in finished docs |
| Cite, don’t reprint; keep the last citation of each owner ([contracts](./contracts.md#incorporation)) |
| Run **declared** style gates before complete; pylint, rustfmt, clippy, clang-format, and clang-tidy are **not** product runtime dependencies |
| Update canonical docs with behavior in the same change set ([contracts](./contracts.md)) |

---

## Contents

1. [Documentation rules](#documentation-rules)
2. [Formatting and style](#formatting-and-style)
3. [Python style gate (pylint)](#python-style-gate-pylint)
4. [Rust style gate (rustfmt + clippy)](#rust-style-gate-rustfmt--clippy)
5. [C / C++ style gate (clang-format + clang-tidy)](#c--c-style-gate-clang-format--clang-tidy)
6. [Other language style gates](#other-language-style-gates)
7. [Document history](#document-history)

---

## Documentation rules

1. **Substantial documents** follow [MARKDOWN-STANDARD.md](../MARKDOWN-STANDARD.md): YAML frontmatter, single H1, lead, then the **required core** for the type ([density](../MARKDOWN-STANDARD.md#density-force-and-incorporation)). Summary and Contents only when those rules require them. **Root `README.md`** uses the [landing](../MARKDOWN-STANDARD.md#landing--root-readme-no-frontmatter) outline only: no frontmatter; **Overview** then **Operator prompts**.
2. **New docs** start from [templates/](../templates/); leave no unresolved `{{PLACEHOLDERS}}`. Pick templates from [project interest](../SETUP.md#5-pick-templates-by-interest) so contracts exist before or with first code.
3. **Behavior change ⇒ doc change** in the same commit or PR ([contracts](./contracts.md#same-change-set-rule)):
   - CLI verbs, flags, exit codes, JSON shapes → matching CLI / API guide
   - Formulas, output columns, validation → methodology (+ fixtures if contract shifts)
   - Trust boundary or execution model → matching security doc
4. **Cite, don’t reprint:** one sentence + deep link ([contracts](./contracts.md#incorporation)); do not paste another document in full.
5. **Root README** stays an overview; deep contracts stay in package docs ([landing](../MARKDOWN-STANDARD.md#landing--root-readme-no-frontmatter)).
6. **Status honesty:** set frontmatter `status` to `draft` / `current` / `deprecated` accurately ([field reference](../MARKDOWN-STANDARD.md#field-reference)).
7. **Platform-aware examples** follow [MARKDOWN-STANDARD — Platform-aware examples](../MARKDOWN-STANDARD.md#platform-aware-examples): declare primary OS when examples are OS-specific; dual fences when multi-platform.

Starter configs: [pylintrc](../configs/pylintrc) · [rustfmt.toml](../configs/rustfmt.toml) · [clippy.toml](../configs/clippy.toml) · [clang-format](../configs/clang-format) · [clang-tidy](../configs/clang-tidy). Copy **only** files for languages the inventory lists.

---

## Formatting and style

Writing conventions, fences, relative links, and platform-aware examples: [MARKDOWN-STANDARD](../MARKDOWN-STANDARD.md#writing-conventions). Domain B gates when the surface is **declared**:

| Area | Rule |
|------|------|
| Python | **PEP-8 via pylint** — [Python style gate (pylint)](#python-style-gate-pylint) |
| Rust | **rustfmt + clippy** — [Rust style gate](#rust-style-gate-rustfmt--clippy) |
| C / C++ | **clang-format + clang-tidy** — [C / C++ style gate](#c--c-style-gate-clang-format--clang-tidy) |
| Other languages | Declare **one** primary gate — [Other language style gates](#other-language-style-gates) |

---

## Python style gate (pylint)

When Python product code is in the [language surface inventory](./security.md#language-surface-inventory). All **product** Python under the packages this project ships must stay **pylint-clean** under the project’s gate config before sharing behavior or packaging changes.

| Item | Rule |
|------|------|
| **Config** | [configs/pylintrc](../configs/pylintrc) — copy to the package or repo as `.pylintrc` (or pass `--rcfile`). PEP-8–aligned conventions (line length 100, docstrings, names, unused imports/vars, selected errors) |
| **Scope** | Product packages and modules only (not one-off scratch scripts unless the project says so) |
| **Command** | `python -m pylint <package_or_paths>` (or `py -3.x -m pylint …` on Windows) |
| **Pass criteria** | Exit code **0** and score **10.00/10** under that config |
| **When to run** | After any edit to product `*.py`, `.pylintrc` / `pylintrc`, or packaging that can affect style |
| **Product dependency** | **No.** Pylint is **developer tooling** only. Do **not** add pylint as a required install for end users of the product. |
| **Out of gate** | Design/refactor metrics (`too-many-*`, large-file complexity) are intentionally relaxed in the default config; do not “fix” them by silent API rewrites. Full default pylint without the gate config is informational only. |

If pylint is not installed on a developer machine, install it into the **developer environment** (user/global Python or a dev extra), never into a product runtime path meant only for end users.

**Adopt steps** (when Python is declared or first introduced):

1. Add the **Python** inventory row and verification commands in the **same change set** (skip if already declared).
2. Copy `configs/pylintrc` (from kit: `kit/configs/pylintrc`) to the package or repo root as `.pylintrc`.
3. **Must:** set `py-version` to the project’s supported Python (the file ships a starter default only—change it).
4. Point the [verification table](./verification-and-ops.md#verification-before-ship) at the real package path.
5. Extend `good-names` only when short identifiers are intentional and repeated.

---

## Rust style gate (rustfmt + clippy)

When Rust is in the [language surface inventory](./security.md#language-surface-inventory) (typically a product `Cargo.toml`).

| Item | Rule |
|------|------|
| **Config** | [configs/rustfmt.toml](../configs/rustfmt.toml) and [configs/clippy.toml](../configs/clippy.toml) — copy to the crate or repo root (or pass rustfmt/clippy config flags). Line width 100; complexity lints out of gate |
| **Scope** | Product crates and modules only (not one-off scratch crates unless the project says so) |
| **Command** | `cargo fmt --check` and `cargo clippy --all-targets -- -D clippy::correctness -D clippy::suspicious -D clippy::style -A clippy::complexity` |
| **Pass criteria** | Both commands exit **0** under the kit starter configs. Non-Python gates **do not** inherit pylint’s 10.00/10 score rule |
| **When to run** | After any edit to product Rust, `rustfmt.toml` / `clippy.toml`, or packaging that can affect style |
| **Product dependency** | **No.** rustfmt and clippy are **developer tooling** only |
| **Out of gate** | Clippy **complexity** (too-many-*, cognitive-complexity) stays allowed; do not “fix” them by silent API rewrites |
| **Domain A** | **cargo-audit** (`cargo audit`) — command only; no kit `audit.toml` (Bandit pattern). Catalog: [SAST gates](./security.md#security--sast-gates-required-when-declared) |

If rustfmt/clippy/cargo-audit are not installed, install them into the **developer** environment (rustup components / `cargo install cargo-audit`), never into a product runtime path meant only for end users.

**Adopt steps** (when Rust is declared or first introduced):

1. Add the **Rust** inventory row and verification commands in the **same change set**.
2. Copy `kit/configs/rustfmt.toml` and `kit/configs/clippy.toml` to the crate or repo root.
3. **Must:** set rustfmt `edition` to the crate edition (the file ships a starter default only—change it).
4. Point the [verification table](./verification-and-ops.md#verification-before-ship) at `cargo fmt --check` and the clippy command above; add `cargo audit` for Domain A.
5. Missing required tools (or skipping a declared command) is a **failed** gate.

---

## C / C++ style gate (clang-format + clang-tidy)

When C / C++ is in the [language surface inventory](./security.md#language-surface-inventory) (product `*.c` / `*.h` / `*.cc` / `*.cpp` / `*.cxx` / `*.hpp`).

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
| **Domain A** | **cppcheck** (`cppcheck --error-exitcode=1 --enable=warning,style,performance,portability <src>`) — command only; no kit `cppcheck.cfg` (Bandit pattern). Catalog: [SAST gates](./security.md#security--sast-gates-required-when-declared) |

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

Named kit gates (inventory-gated):

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
3. Docs-only repositories may omit language style gates entirely ([inventory](./security.md#language-surface-inventory)).
4. Copy **only** the starter configs for languages the inventory lists. A whole-`kit/` copy may leave unused files under `kit/configs/` — that is dormant catalog, not a live gate.

---

## Document history

| Version | Notes |
|---------|--------|
| 1.2.1 | Density restyle (kit 2.8.0); gate catalogs unchanged |
| 1.2.0 | Cite, don’t reprint; density + required core pointer (kit 2.7.0) |
| 1.1.2 | Root README landing shape required (kit 2.6.2) |
| 1.1.1 | Python adopt steps start with inventory (parity with Rust/C++); kit 2.5.1 |
| 1.1.0 | Named Rust and C/C++ style gates + starter configs; inventory is the on/off switch (kit 2.5.0) |
| 1.0.0 | Extracted from RULES 1.4.1 for kit 2.0 |
