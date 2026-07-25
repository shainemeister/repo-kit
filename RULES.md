---
title: Repository Maintenance Rules
description: Fundamental rules for documenting, changing, verifying, and versioning any repository consistently.
version: "1.1.0"
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
  - configs/pylintrc
last_updated: "2026-07-24"
---

# Repository Maintenance Rules

Fundamental rules for maintaining a professional, auditable repository. These rules govern documentation, architecture boundaries, contracts, git hygiene, and verification—not product tutorials.

**Document version:** 1.1.0  

**Related:** [README.md](./README.md) · [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) · [SETUP.md](./SETUP.md) · [configs/pylintrc](./configs/pylintrc)

---

## Summary

**RULES.md** is the maintenance policy. Detailed contracts live elsewhere (CLI guides, APIs, methodology, security notes). When those contracts change, update the **canonical** file in the same change set—do not leave docs, fixtures, or versions stale.

Copy this file into a project and **fill the authority map and verification table** with that project’s real paths and commands. On initiation, derive those paths from **project interest** (see [SETUP.md](./SETUP.md)) so this policy guides day-to-day development—not only post-hoc documentation. Keep product-specific policy here or in a thin overlay; keep authoring rules in [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md). Filled map examples: [examples/](./examples/).

| Must | Must not |
|------|----------|
| Update canonical docs with behavior changes | Commit secrets, regenerable outputs, or real sensitive data |
| Use conventional commit messages that match staged files | Mix unrelated packages or leave CLI/API/security docs stale |
| Keep packages composable at the workflow layer | Silently rename public APIs, CLI fields, or schema columns |
| Run **pylint** on Python product code after those edits | Treat pylint as a product runtime install for end users |
| Verify before sharing contract or behavior changes | Force-rewrite published shared history without coordination |
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
8. [Security baseline](#security-baseline)
9. [Versioning and change control](#versioning-and-change-control)
10. [Git rules](#git-rules)
11. [Verification before ship](#verification-before-ship)
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
| Kit / project history (optional) | [CHANGELOG.md](./CHANGELOG.md) |
| Filled authority-map examples (kit reference) | [examples/](./examples/) |
| Package overview | `{{PACKAGE}}/README.md` |
| CLI or automation contract | `{{PACKAGE}}/CLI-GUIDE.md` (or `API.md`) |
| Formulas / “how it works” | `{{PACKAGE}}/METHODOLOGY.md` (or design notes) |
| Security / trust boundary | `{{PACKAGE}}/SECURITY.md` (or `ENTERPRISE-SECURITY.md`) |
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
| `SETUP.md` | One-time only (then remove or archive) |
| `CHANGELOG.md` | History (recommended) |
| `FILE-CATALOG.md` | Optional inventory |
| Package or product entry files | Only when they are the natural top-level surface |

### What does not belong at root

| Concern | Preferred home |
|---------|----------------|
| Templates | `templates/` |
| Style configs | `configs/` (or package-local `.pylintrc` / tool config) |
| Filled examples | `examples/` |
| Scripts / helpers | `scripts/` or `tooling/` (keep minimal) |
| Package-level contracts | Inside the package |
| Regenerable output | Never committed |
| CI workflows | `.github/` (or equivalent) |

### Supporting practices

1. Update the authority map in the **same change set** whenever an intentional path is added, removed, or renamed (when the map lists that path).  
2. Prefer purpose directories over additional root files.  
3. Mark ephemeral files clearly (e.g. SETUP header) so they do not accumulate.  
4. Respect `.gitignore`; never force-add regenerable artifacts.

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
2. Set `py-version` to the project’s supported Python.  
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

Hard rules for product code and launchers. Full matrices live in the project security doc.

| Rule | Guidance |
|------|----------|
| Privilege | Prefer current user only; document any elevation requirement |
| Network | Document whether product code may reach the network or package indexes |
| Secrets | Never commit secrets; rotate if leaked; treat history cleanup as an incident |
| Dependencies | Match the declared dependency policy; no silent download-and-run |
| Host policy | Do not permanently weaken host security policy in product install steps without explicit, documented need |

Canonical detail: the package `SECURITY.md` / `ENTERPRISE-SECURITY.md` (or equivalent) listed in the authority map.

---

## Versioning and change control

| Surface | When to bump |
|---------|----------------|
| Package / library version | CLI contract, public API, scoring/export behavior, or stable output field names change |
| Document frontmatter `version` + `last_updated` | That document’s guidance or contract changes |
| Methodology **Document history** table | Material formula or interpretation changes |

Additional rules:

1. Frontmatter `version` and the in-doc status line must **match** when both exist.  
2. Docs that cite a product version must stay aligned with the code version they describe.  
3. Prefer **backward-compatible** additions (new columns, new optional flags) over silent renames. Breaking changes require explicit notes in the CLI/API guide and history.  
4. Design / concept docs may advance without implementing code; label implementation status clearly.

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

Useful when needed; **not** mandatory:

| Footer | Use when |
|--------|----------|
| `BREAKING CHANGE: <description>` | Public contract breaks; describe migration |
| `Refs: <issue-or-doc>` | Link a tracker item or canonical doc |
| `Co-authored-by: Name <email>` | Shared authorship |

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
| `feat: updates` (docs-only staged) | `docs: …` — do not use `feat` for markdown-only changes |

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
6. If product Python changed, will the pylint gate pass?  
7. Would a reviewer find the subject by searching the feature name used in the README?  
8. Would this subject still make sense **two years** from now without the PR description?

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

Fill concrete commands for your project. Rows that do not apply may be removed.

| Change type | Minimum verification |
|-------------|----------------------|
| Public behavior, scores, exports | Project tests / golden fixtures (define command for each primary platform) |
| Python product code style | `python -m pylint <package_or_paths>` (must pass; see [Python style gate](#python-style-gate-pylint)) |
| Other language product style | Project-declared gate (see [Non-Python style gates](#non-python-style-gates)) |
| Environment / packaging | Project probe or smoke script (define command; list Windows and Unix forms if both are supported) |
| Schema or sample data | Headers/fields match schema; consumers still load samples |
| Docs only | [Author checklist](./MARKDOWN-STANDARD.md#author-checklist); relative links resolve; platform examples consistent |
| New/removed source files | Inventory/catalog updated (if maintained) |

Fill commands for the host OS(es) the team develops on. When multi-platform, either one portable command or one row/note per OS. Do not claim a behavior change is complete if the relevant validation was skipped. Do not claim a Python product change is complete if the pylint gate was skipped or failed.

---

## Maintenance cadence

| Trigger | Action |
|---------|--------|
| Every source path add/remove/rename | Update inventory/catalog if maintained |
| Every release-worthy package behavior change | Bump code version; refresh CLI/API guide and status blocks |
| Every product Python edit | Run pylint gate; keep exit 0 / 10.00 score |
| Security-relevant change | Update matching security doc; re-run probes as appropriate |
| Fixture failure after intentional math/logic change | Refresh expected outputs only with methodology note |
| Stale `last_updated` on heavily edited docs | Set ISO date when merging |

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
| Code without CLI/methodology/security docs | Same change set as the canonical doc per authority map |
| `feat` commit that only edits markdown | Use `docs` / `docs(scope)` |
| Leaving SETUP.md forever at root after adoption | Delete or archive after initiation |
| Language style “somehow” without a named gate | Declare tool + pass criteria in RULES / verification table |

---

## Contributor checklist

Before you commit or share a change:

- [ ] Behavior matches the **canonical** doc for that surface (CLI / API / methodology / security / README)  
- [ ] Inventory/catalog updated if paths changed (when maintained)  
- [ ] Versions and `last_updated` bumped where contracts changed  
- [ ] Required **verification** from the table above has been run  
- [ ] If product Python changed: **pylint gate** passed (`python -m pylint <package_or_paths>`)  
- [ ] No secrets, sensitive production data, regenerable outputs, or caches staged  
- [ ] Markdown follows [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) when docs were edited  
- [ ] Commit message uses `type(scope):` format and matches the staged files  
- [ ] Subject would still make sense years later; one logical surface preferred  
- [ ] Canonical docs for any behavior change are in the same change set  

---

## Document history

| Version | Notes |
|---------|--------|
| 1.1.0 | Root hygiene; non-Python style gates; stronger commit-message modularity, scopes, body, examples, footers; SETUP/examples links; initiation pointer to SETUP.md |
| 1.0.1 | Initiation from project interest; platform-aware verify/examples; pylintrc path wording aligned |
| 1.0.0 | Initial portable maintenance rules: authority map, docs, format, pylint PEP-8 gate, architecture, contracts, security baseline, versioning, git, verification |
