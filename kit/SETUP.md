# Setup — One-time adoption guide

> **One-time adoption guide — follow, then delete or archive.**

Use this file when starting or aligning a repository so **formal markdown guides development**, not only documents finished work. After you have filled the authority map, verification table, kit baseline, and first contracts, **delete or archive this file** so it does not accumulate as stale root noise.

This kit ships `SETUP.md` under [`kit/`](./). **Copy standards into the target repository’s `kit/`** (same packaging as this repo). Keep **product code** and **project** `CHANGELOG.md` **outside** `kit/`. Adopting projects remove SETUP after initiation.

**Permanent after initiation:** root `README.md`, root **project** `CHANGELOG.md`, **`kit/RULES.md`** (hub + kit baseline), `kit/MARKDOWN-STANDARD.md` (or link), and `kit/rules/` as needed. **When using Agent Instruct:** keep `kit/agents/` (include [OPS.md](./agents/OPS.md)), root `PLAN.md` Agent models, and track thin `generated/` packs. **AI workspace:** root **`docs/`** when research/plan/build context is used ([ai-docs-workspace](./rules/ai-docs-workspace.md); templates [templates/docs/](./templates/docs/)). **Multi-phase execution:** optional `docs/WORKBOARD.md` ([workboard](./rules/workboard.md)). **Later kit upgrades:** durable [UPGRADE.md](./UPGRADE.md).

**Already have a Kit baseline?** Stop and use [UPGRADE.md](./UPGRADE.md).

---

## Summary

1. Choose an [adoption mode](#adoption-modes) (greenfield, existing repo, or reference).  
2. [State the interest](#1-state-the-interest) and [platform context](#2-set-platform-context).  
3. [Copy](#3-copy-kit-pieces) pieces **from upstream `kit/` into the target repo’s `kit/`** (include `kit/agents/` when using Agent Instruct).  
4. Ensure **project root** has README, `CHANGELOG.md`, LICENSE, `.gitignore`.  
   - **With Agent Instruct:** root **`PLAN.md` is required** — include an **Agent models** section ([agents/PLAN-HOOK.md](./agents/PLAN-HOOK.md)).  
   - **Bare adopt (no agents):** `PLAN.md` remains optional; skip BUILD.  
5. [Fill the authority map](#4-fill-the-authority-map) (product paths **outside** `kit/`), [language inventory](./rules/security.md#language-surface-inventory), and verification table.  
6. [Record kit baseline](#4b-record-kit-baseline) in `kit/RULES.md`.  
7. [Optional workboard](#4c-optional-workboard) if the interest is already multi-phase.  
8. [Pick templates](#5-pick-templates-by-interest), scaffold package docs **outside** `kit/`, and [verify](#8-first-verification-commands).  
9. **If using Agent Instruct:** ensure Agent models section, then run **[BUILD](./agents/BUILD.md)** → `kit/agents/generated/` ([Agent Instruct path](#agent-instruct-path)). Ongoing tasks use **[OPS](./agents/OPS.md)** O3.  
10. [Delete or archive this file](#after-setup); point maintainers at [UPGRADE.md](./UPGRADE.md). **Keep** `kit/agents/` and PLAN Agent models. **Keep** `docs/WORKBOARD.md` if you scaffolded it.

Layout doctrine: [rules/hygiene.md](./rules/hygiene.md). Agent Instruct: [agents/README.md](./agents/README.md) · [agents/OPS.md](./agents/OPS.md).

---

## Adoption modes

| Mode | Audience | What to do |
|------|----------|------------|
| **Full copy** | Greenfield (new repo) | Create target `kit/`; copy MARKDOWN-STANDARD, RULES hub, `rules/*`, templates/configs as needed. Root: product README + project CHANGELOG. Use this checklist end-to-end. |
| **Selective copy / align** | **Existing repo, first kit adopt** | Add `kit/` with needed standards; **do not rewrite** product layout; fill authority map with **real existing paths**; follow [Existing repository (first adopt)](#existing-repository-first-adopt). |
| **Reference / submodule** | Either | Link or submodule upstream kit; keep filled **`kit/RULES.md`** (or documented hub path) in the consumer; product stays outside. |

---

## Existing repository (first adopt)

For a **live codebase** that has never recorded a Kit baseline:

1. **Inventory current state** — languages, packages, existing README/docs, CI, secrets posture.  
2. **Do not force a directory rewrite** of product code; map reality into the authority map.  
3. **Add `kit/`** — do **not** place RULES / MARKDOWN-STANDARD / rules modules on the product root as the default.  
4. **Minimal viable adopt:** `kit/RULES.md` hub + kit baseline + root project `CHANGELOG.md` + `kit/MARKDOWN-STANDARD.md` (or link) + language inventory + verification rows for languages you already ship.  
5. **Add contracts only where surfaces exist** (package CLI guide if a CLI exists; skip empty SECURITY per [modularity](./rules/security.md#security-documentation-modularity)).  
6. **Adopt contract policy** — keep [rules/contracts.md](./rules/contracts.md) under `kit/rules/`.  
7. **Optional Agent Instruct** — if using agents: PLAN Agent models + first [BUILD](./agents/BUILD.md); see [Agent Instruct path](#agent-instruct-path).  
8. **Optional workboard** — if the repo already has (or is about to start) multi-phase work: [4c](#4c-optional-workboard). Map any existing planning folder; do not invent a second board.  
9. **Record Kit baseline** from upstream [CHANGELOG.md](./CHANGELOG.md) under `## repo-kit`.  
10. **Project root CHANGELOG** adoption entry under the current version.  
11. **Delete or archive this SETUP** from the project’s `kit/`; keep `kit/agents/` and PLAN Agent models if present; keep `docs/WORKBOARD.md` if scaffolded; future kit bumps use **[UPGRADE.md](./UPGRADE.md)**.

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

**Sources:** this upstream `kit/` directory.  
**Standards target:** **`your-repo/kit/`** (same tree shape).  
**Root target:** product landing + **project** history only.

| Piece | Target | Always? | Notes |
|-------|--------|---------|--------|
| [MARKDOWN-STANDARD.md](./MARKDOWN-STANDARD.md) | `kit/` | Yes (or link) | Authoring rules |
| [RULES.md](./RULES.md) | `kit/` | Yes | Fill authority map and kit baseline |
| [rules/](./rules/) | `kit/rules/` | Recommended | Domain modules; or fold into single `kit/RULES.md` (document in authority map) |
| Project `CHANGELOG.md` | **repo root** | **Yes** | Project history (H2 → H3 → H4); **not** a copy of kit release history |
| Root `README.md` | **repo root** | Yes | Product landing (no frontmatter) |
| [templates/](./templates/) | `kit/templates/` or package paths | As needed | Scaffold into **packages** outside `kit/` |
| [templates/docs/](./templates/docs/) | Project root **`docs/`** | When AI workspace needed | Copy skeletons to root `docs/` (not under kit as live notes) |
| [rules/ai-docs-workspace.md](./rules/ai-docs-workspace.md) | `kit/rules/` | Recommended | AI docs workspace policy |
| [rules/workboard.md](./rules/workboard.md) | `kit/rules/` | Recommended | Multi-phase board / annex / archive |
| [rules/continuity.md](./rules/continuity.md) | `kit/rules/` | Optional | Portable surgical-edit policy (empty surface table) |
| [TEMPLATE-CONTINUITY.md](./templates/TEMPLATE-CONTINUITY.md) | Project overlay (e.g. `docs/project_build/continuity.md`) | If high-blast-radius code | Filled overlay — **not** this kit module; preserve on upgrade |
| [templates/docs/WORKBOARD.md](./templates/docs/WORKBOARD.md) | Project root **`docs/WORKBOARD.md`** | If multi-phase | Live board — project data; do not leave placeholders |
| [agents/](./agents/) | `kit/agents/` | If Agent Instruct | Instruct docs, templates; then BUILD → `generated/` |
| [configs/pylintrc](./configs/pylintrc) | `kit/configs/` or `.pylintrc` at package/repo | If Python | Developer tooling only |
| [UPGRADE.md](./UPGRADE.md) | `kit/` | Recommended | Durable upgrade guide—or always open from Kit source |
| This `SETUP.md` | `kit/` | Temporary | Follow, then delete or archive |

**Do not** copy product code into `kit/`. **Do not** flatten standards onto the product root.

---

## 4. Fill the authority map

In [RULES.md — Authority map](./RULES.md#authority-map), replace placeholders with **real or planned** paths—even before code exists—so every concern has a canonical home.

- Standards owners: under `kit/` (e.g. `./rules/contracts.md`).  
- Product owners: **outside** `kit/` (e.g. `../packages/my-service/CLI-GUIDE.md` from files inside `kit/`).  
- Project history: root `../CHANGELOG.md`.

**Security documentation is optional** for packages with no execution surface, network access, elevated privilege, or secrets handling—omit `SECURITY.md` and the authority-map security row rather than creating an empty file. See [Security documentation modularity](./rules/security.md#security-documentation-modularity).

Also fill:

1. **[Language surface inventory](./rules/security.md#language-surface-inventory)** — copy **only** rows for languages this project will ship. Docs-only → empty inventory.  
2. **[Verification before ship](./rules/verification-and-ops.md#verification-before-ship)** — commands for each declared surface. Declared gates are **required** before task completion.  
3. **Contract policy** — [rules/contracts.md](./rules/contracts.md).  
4. **Optional `certification/`** at **repo root** (not under product packages by default)—see [templates/TEMPLATE-CERTIFICATION-README.md](./templates/TEMPLATE-CERTIFICATION-README.md) and [certification policy](./rules/security.md#security-and-code-validation-certification).

**Filled examples (copy the pattern, not the product names):**

| Interest | Example file |
|----------|--------------|
| CLI / automation | [examples/cli-tool.md](./examples/cli-tool.md) |
| Python library | [examples/python-library.md](./examples/python-library.md) |
| Docs-only / standards | [examples/docs-only.md](./examples/docs-only.md) |

---

## 4b. Record kit baseline

Before deleting this file, fill [Kit baseline](./RULES.md#kit-baseline) in the project’s **`kit/RULES.md`**:

| Field | What to set |
|-------|-------------|
| **Adopted kit version** | Latest released `### [X.Y.Z]` under `## repo-kit` in the kit [CHANGELOG.md](./CHANGELOG.md) (or latest released version + commit SHA if copying a non-release tip) |
| **Adopted on** | Today’s date (`YYYY-MM-DD`) |
| **Kit source** | Always **https://github.com/shainemeister/repo-kit** |

Also ensure **project root** `CHANGELOG.md` exists with structure `## <Repository Name>` → `### [X.Y.Z] - YYYY-MM-DD` → `####` categories. Record first adoption under the initial project version section (e.g. under `#### Added`: “Adopted repo-kit X.Y.Z from https://github.com/shainemeister/repo-kit”).

Upgrades later: [README — Upgrade repo-kit](../README.md#upgrade-repo-kit) · [UPGRADE.md](./UPGRADE.md).

---

## 4c. Optional workboard

Scaffold **only** when the interest is already multi-phase or the first work will span multiple sessions. Trivial / single-task adopt may skip.

1. Copy [templates/docs/WORKBOARD.md](./templates/docs/WORKBOARD.md) → project `docs/WORKBOARD.md`.  
2. Replace every `{{PLACEHOLDER}}`. Primary program may be `none`.  
3. Enable the `docs/plan/` module (from [templates/docs/plan/](./templates/docs/plan/)) if an annex will be needed.  
4. Add authority-map rows: active multi-phase work → `docs/WORKBOARD.md`; policy → `kit/rules/workboard.md`.  
5. If the repo already has another planning folder (e.g. `docs/planning/`), **map it** — do not invent a second board ([path aliases](./rules/workboard.md#path-aliases)).

Policy: [workboard.md](./rules/workboard.md). The board is **project data**: keep it when you delete this SETUP file.

**Optional continuity overlay:** if the repo has high-blast-radius surfaces, copy [TEMPLATE-CONTINUITY.md](./templates/TEMPLATE-CONTINUITY.md) to a recorded project path (typical: `docs/project_build/continuity.md`). Do **not** fill product paths into portable `kit/rules/continuity.md`.

---

## Agent Instruct path

Optional but recommended for AI-maintained repos. Full index: [agents/README.md](./agents/README.md).

| Step | Action |
|------|--------|
| 1 | Copy/merge `kit/agents/**` with the rest of `kit/` |
| 2 | Ensure root **PLAN.md** exists from project interest |
| 3 | Ensure **`## Agent models`** section exists — insert from [agents/PLAN-HOOK.md](./agents/PLAN-HOOK.md) or [agents/examples/PLAN-agent-models-snippet.md](./agents/examples/PLAN-agent-models-snippet.md) |
| 4 | Fill authority map + language inventory (existing SETUP steps) |
| 5 | Run **BUILD** per [agents/BUILD.md](./agents/BUILD.md) → emit `kit/agents/generated/<id>.md` (expert packs with expertise map) |
| 6 | Prefer **tracking** thin generated packs in git so clones work offline |
| 7 | Point operators at **[OPS.md](./agents/OPS.md)** for task utilization (match primary pack, co-maintain docs/rules, lifecycle) |
| 8 | When deleting this SETUP file: **keep** `kit/agents/` and PLAN Agent models |

**Bare adopt:** omit Agent models and skip BUILD. You can add Agent Instruct later via PLAN-HOOK + BUILD without re-running full SETUP.

Packs are **views** over L4 law (`kit/RULES.md` + `kit/rules/*` + product contracts). On conflict, law wins. When Instruct is in use, [RULES — When Agent Instruct is in use](./RULES.md#when-agent-instruct-is-in-use) and [OPS](./agents/OPS.md) apply.

---

## 5. Pick templates by interest

| Project interest | Start with templates | First contracts to write |
|------------------|----------------------|---------------------------|
| Library / package API | README | Overview + consume example (**in package**, outside `kit/`) |
| CLI / automation | README + CLI | Invocation, exit codes, verbs |
| Service / long-running | README + SECURITY (+ CLI if any) | Trust boundary, run/verify |
| Methodology / scoring / formulas | README + METHODOLOGY | Pipeline, formulas, outputs |
| Security-sensitive tool | README + SECURITY | Trust boundary before features sprawl |
| Design / multi-phase concept | CONCEPT + [workboard](./templates/docs/WORKBOARD.md) | Principles in PLAN/CONCEPT; live phases on `docs/WORKBOARD.md` |
| Docs-only / standards | GENERIC + root landing | Summary, use cases, history |
| Monorepo multi-package | Per-package README (+ CLI/SECURITY as needed) | Shared `kit/RULES`; thin per-package overlays |

Templates live under [templates/](./templates/). Scaffold finished docs into **product paths**, not into `kit/` as permanent package docs. Co-update rules: [rules/contracts.md](./rules/contracts.md).

---

## 6. Scaffold docs first

Scaffold formal docs **before** or **in the same change set as** first code:

1. Copy the chosen template(s) into the **package** path (outside `kit/`).  
2. Replace every `{{PLACEHOLDER}}`.  
3. Refresh Contents links.  
4. Leave frontmatter `status: draft` until the contract matches behavior.  
5. Root README: follow the [landing pattern](./MARKDOWN-STANDARD.md#landing--root-readme-no-frontmatter) (no frontmatter; use cases first).

---

## 7. Use docs as the development guide

| Trigger | Action |
|---------|--------|
| New behavior | Update the **canonical** authority-map file in the same change set ([contracts](./rules/contracts.md)) |
| New public surface | CLI/API or package README section before the feature is “done” |
| Verification exists | Fill real commands in the verification table; run them before ship |

---

## 8. First verification commands

Fill and run the rows in [Verification before ship](./rules/verification-and-ops.md#verification-before-ship). Until project-specific commands exist, use placeholders like:

**Docs only**

```text
# Relative links and structure — author checklist
# See kit/MARKDOWN-STANDARD.md#author-checklist
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

- Maintain a root `FILE-CATALOG.md` (or similar) and update it on path add/remove/rename.  
- Copy `configs/pylintrc` → `.pylintrc` (package or repo root), set `py-version`, point the verification table at the real package path.  
- Add root `certification/` + operator README when product code warrants formal self-attestation certificates.  
- Enable or tune Agent Instruct: PLAN Agent models + [BUILD](./agents/BUILD.md); use [OPS](./agents/OPS.md) each task ([agents/README.md](./agents/README.md)).  
- Scaffold root **`docs/`** from [templates/docs/](./templates/docs/) when multi-step research/plan/build work starts ([ai-docs-workspace](./rules/ai-docs-workspace.md)).  
- If work is multi-phase: scaffold `docs/WORKBOARD.md` ([4c](#4c-optional-workboard)).  
- If the codebase has high-blast-radius surfaces: copy [TEMPLATE-CONTINUITY.md](./templates/TEMPLATE-CONTINUITY.md) to a recorded project path (e.g. `docs/project_build/continuity.md`). Do not fill product paths into `kit/rules/continuity.md`.  
- Read [How overlays work](../README.md#how-overlays-work) so stack-specific rules stay in the project map, not a forked kit.

**Checklists:** [Author checklist](./MARKDOWN-STANDARD.md#author-checklist) · [Contributor checklist](./rules/verification-and-ops.md#contributor-checklist)

---

## After setup

| Keep (permanent) | Remove or archive |
|------------------|-------------------|
| Root README, root **project** CHANGELOG | **This `kit/SETUP.md`** |
| `kit/RULES.md` (baseline filled) | — |
| `kit/MARKDOWN-STANDARD.md` (or link) | — |
| `kit/rules/` modules (or folded policy) | — |
| `kit/UPGRADE.md` path known (local copy optional) | — |
| `kit/agents/` Instruct + templates (if adopted) | — |
| `kit/agents/generated/` thin packs (if using agents; track recommended) | — |
| Root `PLAN.md` Agent models (if using agents) | — |
| Product packages **outside** `kit/` | Unfilled template copies you do not need |
| Root `docs/` AI workspace (when used) | — |
| Root `docs/WORKBOARD.md` (when multi-phase) | — |
| Filled continuity overlay (when used) | — |
| `.pylintrc` / style configs you adopted | — |

Root hygiene / packaging: [rules/hygiene.md](./rules/hygiene.md). Kit upgrades: [UPGRADE.md](./UPGRADE.md) · [README — Upgrade repo-kit](../README.md#upgrade-repo-kit) via https://github.com/shainemeister/repo-kit. Agent Instruct: [agents/README.md](./agents/README.md).
