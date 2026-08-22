---
title: Verification and Operations
description: Verification before ship, completion rule, maintenance cadence, anti-patterns, and contributor checklist.
version: "1.7.1"
status: current
audience:
  - developers
  - security
doc_type: other
related:
  - ../RULES.md
  - ./security.md
  - ./authoring-and-style.md
  - ./contracts.md
  - ./versioning-and-git.md
  - ./workboard.md
  - ../MARKDOWN-STANDARD.md
last_updated: "2026-08-21"
---

# Verification and Operations

Ship gates, completion rules, cadence, anti-patterns, and the contributor checklist.

**Related:** [RULES.md](../RULES.md) · [security.md](./security.md) · [authoring-and-style.md](./authoring-and-style.md) · [contracts.md](./contracts.md) · [versioning-and-git.md](./versioning-and-git.md) · [workboard.md](./workboard.md) · [MARKDOWN-STANDARD.md](../MARKDOWN-STANDARD.md)

---

## Summary

| Must |
|------|
| Do **not** mark complete if any **declared** Domain B (style) or Domain A (SAST) gate for an inventory surface was skipped or failed; missing required tools is a **fail** |
| Docs-only: [author checklist](../MARKDOWN-STANDARD.md#author-checklist) (including [density](../MARKDOWN-STANDARD.md#density-force-and-incorporation)) + resolving links + last citations; no language gates unless the [inventory](./security.md#language-surface-inventory) lists them |
| Fill [Verification before ship](#verification-before-ship) from inventory; Domain B command strings from [authoring-and-style](./authoring-and-style.md) |

---

## Contents

1. [Verification before ship](#verification-before-ship)
2. [Completion rule](#completion-rule)
3. [Before marking work complete](#before-marking-work-complete)
4. [Maintenance cadence](#maintenance-cadence)
5. [Anti-patterns](#anti-patterns)
6. [Contributor checklist](#contributor-checklist)
7. [Document history](#document-history)

---

## Verification before ship

Fill concrete commands for your project from the [language surface inventory](./security.md#language-surface-inventory). Rows that do not apply may be removed. Docs-only / empty inventory: keep only the **Docs only** row (and any non-language rows that apply). Do **not** copy Python / Rust / C/C++ style rows into a project verify table unless that surface is declared. Canonical Domain B command strings live in [authoring-and-style](./authoring-and-style.md).

| Change type | Minimum verification |
|-------------|----------------------|
| Public behavior, scores, exports | Project tests / golden fixtures (define command for each primary platform) |
| Python product code style | Kit pylint command (**when Python is in inventory**; see [Python style gate](./authoring-and-style.md#python-style-gate-pylint)) |
| Rust product code style | `cargo fmt --check` + kit clippy command (**when Rust is in inventory**; see [Rust style gate](./authoring-and-style.md#rust-style-gate-rustfmt--clippy)) |
| C / C++ product code style | clang-format dry-run + clang-tidy (**when C / C++ is in inventory**; see [C / C++ style gate](./authoring-and-style.md#c--c-style-gate-clang-format--clang-tidy)) |
| Other language product style | Project-declared gate per inventory (see [Other language style gates](./authoring-and-style.md#other-language-style-gates)) |
| Security / SAST (language-specific) | Only the commands for **surfaces in the inventory** (see [Security / SAST gates](./security.md#security--sast-gates-required-when-declared)); omit entire row if inventory is empty |
| Formal certification | If `certification/` is maintained: regenerate `last_certification.json` / `.txt` after critical gates; confirm OverallPass; do not stage outputs |
| Environment / packaging | Project probe or smoke script (define command; list Windows and Unix forms if both are supported) |
| Schema or sample data | Headers/fields match schema; consumers still load samples |
| Docs only | [Author checklist](../MARKDOWN-STANDARD.md#author-checklist) (including [density](../MARKDOWN-STANDARD.md#density-force-and-incorporation) items); relative links resolve; last citations of used owners remain; platform examples consistent |
| New/removed source files | Inventory/catalog updated (if maintained); language surface inventory if languages added/removed |
| Agent template / catalog change | Pack samples validate ([agents/PARAMS.md](../agents/PARAMS.md)); expertise/references present; PLAN-HOOK fields still accurate; examples updated |
| BUILD regen only | Diff review; no authority path invention; respect PLAN disabled set; expertise filled |
| New project agent pack | Schema fields complete; expertise map + references; verify[] from inventory/table only; PLAN active_models/overlays updated |
| Feature / surface / durable task-class growth (Instruct in use) | PLAN Agent models lifecycle + [BUILD](../agents/BUILD.md); co-update canonical L4 ([agents/OPS.md](../agents/OPS.md)) |
| Research / multi-step plan / non-trivial build context | Maintain relevant root `docs/` modules ([ai-docs-workspace](./ai-docs-workspace.md)); keep `docs/README.md` index honest |
| Multi-phase program / phase ship | Update `docs/WORKBOARD.md` same change set ([workboard](./workboard.md)); L4 + CHANGELOG if contracts/behavior |
| Finding becomes public product promise | Promote from `docs/` to authority-map L4 owner ([contracts](./contracts.md)); same change set |

---

## Completion rule

Do **not** mark a change complete, and do **not** claim ship readiness, if any **declared** Domain B (code validation / style) or Domain A (security / SAST) gate for a **surface present in the inventory** was skipped or failed. Missing required developer tools is a **failed** gate, not a skip.

Docs-only inventories declare no language gates. Completing a docs-only change still requires the [author checklist](../MARKDOWN-STANDARD.md#author-checklist) (including [density](../MARKDOWN-STANDARD.md#density-force-and-incorporation)), resolving relative links, and last citations of used owners.

Fill commands for the host OS(es) the team develops on. When multi-platform, either one portable command or one row/note per OS.

---

## Before marking work complete

Ordered steps for humans and AI agents:

1. Follow [Operator enforcement](../RULES.md#operator-enforcement) (verify request, validate procedure, persona when Instruct, plan + `docs/` when needed).
2. **If Agent Instruct is in use:** follow [OPS O3](../agents/OPS.md#order-of-operations-o3)—match **one primary** expert pack, open expertise, co-maintain L4. Bare adopt (no Agent models) skips this step.
3. **If research / multi-step plan / non-trivial build:** ensure root `docs/` modules are scaffolded/updated ([ai-docs-workspace](./ai-docs-workspace.md)). **If a multi-phase phase shipped:** `docs/WORKBOARD.md` status `done` + commit SHA ([workboard](./workboard.md)).
4. Read **language surface inventory** ([security.md](./security.md#language-surface-inventory); pick only declared rows from the full kit catalog).
5. Run **Domain B** gates for every surface touched by the change.
6. Run **Domain A** gates for every surface touched (plus Secrets / Semgrep if those rows exist).
7. Update canonical L4 docs / `CHANGELOG.md` per the [authority map](../RULES.md#authority-map) and [contracts.md](./contracts.md); promote durable findings out of `docs/` when they become promises.
8. **If Agent Instruct is in use** and any of the following changed—PLAN Agent models, agent templates, agent-relevant authority paths, pack expertise, or durable feature/surface/task-class growth: re-run [BUILD](../agents/BUILD.md); validate packs per [PARAMS](../agents/PARAMS.md); respect PLAN `disabled`; review generated pack diffs. (Policy + AI convention—not a Domain A/B gate.)
9. If `certification/` is maintained: regenerate the certificate pair; confirm OverallPass; leave outputs unstaged.
10. End work-advancing replies with a [Progress Tracker](../RULES.md#progress-tracker-minimum-shape) (commit SHA for completed committed tasks).
11. Only then state the task is complete.

---

## Maintenance cadence

| Trigger | Action |
|---------|--------|
| Every source path add/remove/rename | Update inventory/catalog if maintained |
| Language surface added or removed | Update [language surface inventory](./security.md#language-surface-inventory) + verification rows (+ certification checks if maintained) |
| Every release-worthy package behavior change | Bump code version; refresh CLI/API guide and status blocks; update `CHANGELOG.md` |
| Every product Python edit | Run pylint gate; keep exit 0 / 10.00 score; run Bandit if Python is in inventory |
| Every product Rust edit | Run rustfmt + clippy gates; run cargo-audit if Rust is in inventory |
| Every product C / C++ edit | Run clang-format + clang-tidy gates; run cppcheck if C / C++ is in inventory |
| Every product edit in another declared language | Run that surface’s Domain B + Domain A gates |
| Security-relevant change | Update matching security doc; re-run declared SAST; CHANGELOG entry |
| Formal certification maintained | Regenerate `last_certification.*` after critical gates; do not commit outputs |
| Fixture failure after intentional math/logic change | Refresh expected outputs only with methodology note |
| Stale `last_updated` on heavily edited docs | Set ISO date when merging |
| Kit upgrade available upstream | Follow [UPGRADE.md](../UPGRADE.md); update baseline + project CHANGELOG |
| PLAN Agent models change (active/disabled/overlays/tuning) | Re-run [BUILD](../agents/BUILD.md); review generated pack diff |
| Kit agents templates / CATALOG upgrade | Merge `kit/agents/` (include OPS); preserve PLAN Agent models; BUILD regen ([UPGRADE](../UPGRADE.md)) |
| New durable project agent | Emit pack under `kit/agents/generated/` with expertise map; update PLAN; authority-map row only if durable and needed |
| New package, public surface, language, or durable task class (Instruct in use) | Update PLAN Agent models as needed; BUILD; co-update L4 contracts ([OPS lifecycle](../agents/OPS.md#lifecycle-features-and-core-tasks)) |
| Every substantive task when Instruct is in use | Primary pack match per [OPS](../agents/OPS.md); do not skip utilization |
| Research / multi-step plan / build notes | Update `docs/` modules; keep index accurate ([ai-docs-workspace](./ai-docs-workspace.md)) |
| Multi-phase phase or program ship | Workboard status + SHA; archive annex on program complete ([workboard](./workboard.md)) |
| First use of AI workspace | Scaffold `docs/README.md` + needed modules from [templates/docs](../templates/docs/) |

---

## Anti-patterns

| Avoid | Prefer |
|-------|--------|
| Shipping Domain B or Domain A tools as product runtime deps | Keep them developer-only ([authoring](./authoring-and-style.md) · [SAST](./security.md#security--sast-gates-required-when-declared)) |
| Forcing Rust/C++ gates on a docs-only or empty inventory | Leave those rows off the verify table; unused `kit/configs/*` stay dormant catalog |
| Committing regenerable outputs “for convenience” | Document regenerate commands in README / catalog |
| Silent public field or API rename | Coordinated contract bump + fixtures + docs ([contracts.md](./contracts.md)) |
| Long **policy** docs without a decision table **unless** they meet omit-Summary conditions | ≤ 5 Must rows, or omit Summary when body ≲ 60 lines ([density](../MARKDOWN-STANDARD.md#density-force-and-incorporation)) |
| Duplicating security matrices into README | Link to security doc |
| Merging unrelated runtimes into one process without design | Keep boundaries ([architecture.md](./architecture.md)) |
| Absolute machine-only paths as the only example | Placeholder + one repo-relative example |
| Orphan files missing from the inventory | Update catalog in the same change |
| Vague commits (`update stuff`, `wip`) | Conventional `type(scope):` subject ([versioning-and-git.md](./versioning-and-git.md)) |
| Code without CLI/methodology/security docs when those contracts apply | Same change set as the canonical doc; omit security when [modularity](./security.md#security-documentation-modularity) allows |
| Empty `SECURITY.md` for docs-only or pure libraries with no side effects | Omit the file and the authority-map row |
| Pasting the full multi-language SAST table into every project | Declare only tools for languages the repo ships |
| Committing `certification/last_certification.*` | Gitignore regenerable cert outputs; regenerate locally |
| Treating certification as a product launcher / diagnostics gate | Certification attests **source tree** policy only |
| Empty language inventory while shipping product code | Fill inventory when product languages exist |
| `feat` commit that only edits markdown | Use `docs` / `docs(scope)` |
| Leaving SETUP.md forever after adoption | Delete or archive after initiation; keep [Kit baseline](../RULES.md#kit-baseline); use [UPGRADE.md](../UPGRADE.md) |
| Language style “somehow” without a named gate | Declare tool + pass criteria in verification table |
| No project `CHANGELOG.md` | Maintain root CHANGELOG (repository H2 → version H3 → category H4) |
| Package version bump without CHANGELOG section | Add matching `### [X.Y.Z]` in the same change set |
| Shipping release-worthy behavior without CHANGELOG | Same change set: behavior + canonical docs + version + CHANGELOG |
| Kit upgrade with no baseline or CHANGELOG note | Update Adopted kit version/date and project CHANGELOG via [UPGRADE.md](../UPGRADE.md) |
| Inventing an alternate kit source URL | Use https://github.com/shainemeister/repo-kit (unless a deliberate fork) |
| Putting kit release history into a project `CHANGELOG.md` | Keep kit version only in the Kit baseline table |
| Pack body restates full domain modules | Link `authority_paths`; short procedure + expertise map ([agents](../agents/README.md)) |
| Treating Agent Instruct as a Domain A/B gate | Policy + AI convention; real gates = inventory ([Completion rule](#completion-rule)) |
| Instruct in use but skip primary-pack match | Follow [OPS O3](../agents/OPS.md) |
| Empty expertise / no references on expert packs | Curated authority_paths + references with purpose |
| External URL as overlay or substitute law | Citations only under references/expertise; L4 wins |
| Feature ships; packs unchanged (Instruct in use) | PLAN lifecycle + BUILD |
| Research only in chat; no `docs/` when multi-source work needed | Scaffold/maintain `docs/research/` ([ai-docs-workspace](./ai-docs-workspace.md)) |
| Chat-only “phase done” with no board update | Same-change-set `docs/WORKBOARD.md` ([workboard](./workboard.md)) |
| Live phase tables dumped into PLAN.md | Board + optional annex; PLAN stays doctrine |
| Public contract only under `docs/` | Promote to L4 package/kit owner |
| UPGRADE resets PLAN `active_models` | Preserve Agent models + BUILD regen ([UPGRADE](../UPGRADE.md)) |
| Full persona essays in `kit/RULES.md` | Map description + path only ([OPS](../agents/OPS.md) link) |
| Inventing pack verify tools not in RULES / inventory | `verify[]` only from declared verification table |
| Gitignoring generated packs with no rebuild path | Track thin packs under `kit/agents/generated/` or document regen |

---

## Contributor checklist

Before you commit or share a change:

- [ ] Behavior matches the **canonical** doc for that surface (CLI / API / methodology / security / README)
- [ ] Inventory/catalog updated if paths changed (when maintained)
- [ ] [Language surface inventory](./security.md#language-surface-inventory) still matches languages the repo ships
- [ ] Versions and `last_updated` bumped where contracts changed
- [ ] **CHANGELOG.md** updated when required (release-worthy behavior, version bump, security, kit adopt/upgrade)
- [ ] Required **verification** from the table above has been run ([Completion rule](#completion-rule))
- [ ] If product Python changed: **pylint** passed; **Bandit** passed when Python is in inventory
- [ ] If product Rust changed: **rustfmt** + **clippy** passed; **cargo-audit** passed when Rust is in inventory
- [ ] If product C / C++ changed: **clang-format** + **clang-tidy** passed; **cppcheck** passed when C / C++ is in inventory
- [ ] Other declared language surfaces: Domain B + Domain A gates passed for surfaces touched
- [ ] If `certification/` is maintained: certificate regenerated; OverallPass true; outputs not staged
- [ ] No secrets, sensitive production data, regenerable outputs, or caches staged
- [ ] Markdown follows [MARKDOWN-STANDARD.md](../MARKDOWN-STANDARD.md) when docs were edited
- [ ] Last citation to each used owner remains; no second-home reprint of an owned rule ([contracts](./contracts.md#incorporation))
- [ ] Contents only if ≥ 5 H2s or ≳ 150 lines ([canonical order](../MARKDOWN-STANDARD.md#canonical-document-order))
- [ ] Commit message uses `type(scope):` format and matches the staged files
- [ ] Subject would still make sense years later; one logical surface preferred
- [ ] Canonical docs for any behavior change are in the same change set ([contracts.md](./contracts.md))
- [ ] If kit pieces changed: [Kit baseline](../RULES.md#kit-baseline) version/date updated and CHANGELOG notes the upgrade ([UPGRADE.md](../UPGRADE.md))
- [ ] [Operator enforcement](../RULES.md#operator-enforcement) followed (request verify, procedure, plan + `docs/` when needed)
- [ ] If research/multi-step/build context: relevant `docs/` modules updated; index honest ([ai-docs-workspace](./ai-docs-workspace.md))
- [ ] If a multi-phase phase shipped: workboard updated (status + SHA) in the same change set ([workboard](./workboard.md))
- [ ] If Agent Instruct used: primary pack matched per [OPS](../agents/OPS.md); expertise opened; L4 co-maintained
- [ ] If Agent Instruct used and enablement/templates/authority paths/expertise or feature/surface growth for agents changed: [BUILD](../agents/BUILD.md) regen; thin packs reviewed
- [ ] Agent packs do not redefine L4 law; `authority_paths` / expertise / `verify` align with RULES ([agents](../agents/README.md))
- [ ] PLAN Agent models preserved across kit upgrade (when agents are in use)
- [ ] Progress Tracker included on work-advancing replies ([RULES](../RULES.md#progress-tracker-minimum-shape))
- [ ] If AI assisted: commit includes `Assisted-by` / `Compliance` / `Instructed-by` with `Instructed-by` resolved dynamically (`git config user.name` → ask+record → `User`; no `Directed-by`) ([versioning-and-git](./versioning-and-git.md#ai-assisted-commits-required-disclosure))

---

## Document history

| Version | Notes |
|---------|--------|
| 1.7.1 | Density restyle (kit 2.8.0 in progress); verify table, completion, cadence, and checklist unchanged |
| 1.7.0 | Docs-only verify includes density checklist + last citations; omit-Summary anti-pattern (kit 2.7.0) |
| 1.6.1 | Verify-table prune sentence; Domain B rows point at style-gate Command cells (kit 2.5.1) |
| 1.6.0 | Inventory-gated Rust and C/C++ style verify rows, cadence, checklist (kit 2.5.0) |
| 1.5.0 | Multi-phase workboard before-complete, cadence, anti-pattern, checklist (kit 2.4.0) |
| 1.4.1 | AI disclosure checklist: dynamic Instructed-by cascade; no Directed-by (kit 2.3.1) |
| 1.4.0 | AI docs workspace verification, cadence, anti-patterns, checklist (kit 2.3.0) |
| 1.3.1 | Operator enforcement + Progress Tracker in before-complete and checklist (kit 2.2.1) |
| 1.3.0 | Instruct O3 in before-complete; lifecycle cadence; expertise anti-patterns; checklist OPS (kit 2.2.0) |
| 1.2.0 | Agent Instruct: verification rows for template/catalog/BUILD; cadence; anti-patterns; before-complete step; contributor checklist (editorial 1.1.0 intermediate folded here—not a separate kit release) |
| 1.0.0 | Extracted from RULES 1.4.1 for kit 2.0 |
