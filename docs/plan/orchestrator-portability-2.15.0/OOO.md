---
title: "orchestrator-portability-2.15.0 — order of operations"
description: Phased order for a host-agnostic slash_only orchestrator crew registered as an optional kit seed (2.15.0). Open while that program is active on the workboard.
version: "1.0.0"
status: active
audience:
  - ai-agents
  - developers
doc_type: plan
related:
  - ./README.md
  - ../../WORKBOARD.md
  - ../../../kit/rules/workboard.md
  - ../../../kit/agents/orchestrator/README.md
  - ../../../kit/CHANGELOG.md
last_updated: "2026-09-22"
---

# Orchestrator portability — order of operations

**Board:** [docs/WORKBOARD.md](../../WORKBOARD.md)  
**Annex index:** [README.md](./README.md)  
No root `PLAN.md` (Instruct off).

Kit version this program ships: **2.15.0**. Docs-only tree. Empty inventory. Do not turn Instruct on.

---

## 1. Goals and non-goals

### Goals (must)

| ID | Goal |
|----|------|
| G1 | Four duty packs stay portable law and adopt the target `kit/RULES.md` at runtime. |
| G2 | No host runtime in `kit/agents/orchestrator/`. No `grok` flags, `invoke.sh`, bot ids, machine paths, or embedded second copies. |
| G3 | `activation: slash_only`. One primary worker. Reviewer only after a mutation or a validation request. Scout beside Builder only when they do not share an authority-map owner. |
| G4 | Same-change-set stands. A board note does not waive CHANGELOG, SECURITY, or CLI-GUIDE. |
| G5 | Optional kit seed: catalog rows, one authority-map line, one agents-index link, `### [2.15.0]`, a forward-only UPGRADE note. Default active set unchanged. |

### Non-goals (must not in this program)

| Item | Why |
|------|-----|
| Root `PLAN.md`, BUILD, or `kit/agents/generated/` | Instruct stays off. |
| A replacement launcher, `src/`, or a host tree | This tree is docs-only. |
| Moving packs into `kit/agents/templates/` | The copy unit is the crew directory. |
| Relocating `bots/` under `docs/` | That would keep a host adapter in the repo. |
| Rewriting `2130d14` / `bb1f484` | Changelog records the resulting contract. |
| New hub Must rows or edits to the seven default seeds | Those seeds keep catalog match. |

### Invariants (hard)

```text
L4 wins. One body per role. Reporting tables stay.
Router does not compose_with the full crew.
Hub Must count stays the same.
Gates: author checklist, relative links, last citations.
```

---

## 2. Constraint map

| Fact | Implication for the OOO |
|------|-------------------------|
| Packs are AgentPack YAML | Do not add `doc_type` or a document-history table to the four packs. |
| INSTALL has no YAML | Fence it in P2. |
| `bots/` embeds full pack copies | Delete the directory in P2. Do not sync embeds. |
| Default active set is seven seeds | New rows sit in their own subsection, `enabled-by-default: false`. |
| agents README `related:` is already seven | Body index row only. |
| Workboard was `none` | P0 registers before any `kit/` edit. |

**Surfaces this program may touch**

| Surface | Paths |
|---------|--------|
| Board | `docs/WORKBOARD.md` |
| Annex | `docs/plan/orchestrator-portability-2.15.0/` |
| Plan index | `docs/plan/README.md` |
| Crew | `kit/agents/orchestrator/{router,scout,builder,reviewer,README,INSTALL}.md` |
| Delete | `kit/agents/orchestrator/bots/**` |
| Registration | `kit/agents/CATALOG.md`, `kit/agents/README.md`, `kit/RULES.md`, `kit/UPGRADE.md`, `kit/CHANGELOG.md` |
| Close | `docs/project_build/kit-context.md` and archive `git mv` |

### Allow / deny

| Phase | Allow | Deny |
|-------|--------|------|
| **P0** | `docs/WORKBOARD.md`, `docs/plan/README.md`, this annex | `kit/**`, deletes |
| **P1** | four packs, crew README, board SHA | `bots/**`, CATALOG, RULES, CHANGELOG, INSTALL |
| **P2** | delete `bots/**`, INSTALL, board | new scripts, personas, `.agent.md` anywhere in the repo |
| **P3** | CATALOG, agents README, RULES, UPGRADE, CHANGELOG, board | FRAMEWORK, PARAMS, OPS, BUILD, `generated/`, `PLAN.md` |
| **P4** | board, `docs/plan/**`, kit-context | pack procedure, except a link broken by the archive move |

### Target schema

| Field | Target |
|-------|--------|
| `portability` | `kit` |
| `activation` | `slash_only` |
| `compose_with` | Router omit. Scout omit. Builder `orchestrator-reviewer` only. Reviewer omit. |
| Tooling | Remove, including every `grok` fence. |
| L4 waiver | Remove. Missing in-scope owner: Builder `blocked`, Reviewer `fail`. |

| Pack | triggers | negative_triggers |
|------|----------|-------------------|
| router | orchestrate, decompose, dispatch crew, master orchestrator | single-file typo, pure read of one known path, unsolicited product edit |
| scout | orchestrator scout, read-only map | apply patch, commit, write files, implement |
| builder | orchestrator builder, execute authorized unit | read-only exploration, review-only, unsolicited feature |
| reviewer | orchestrator review, validate crew report | greenfield with no artifacts |

Router procedure: open target `kit/RULES.md` or return `blocked`; smallest set; one primary; Reviewer after mutation or on request; parallel only when path bounds do not share an authority-map owner; skip unused roles with a reason; point commit work at target `kit/rules/versioning-and-git.md`; return one synthesized report. “Master Orchestrator” means the parent session, not a bot id.

---

## 3. Master order of operations

```text
P0 Register board + annex
   → primary set, P1 active, no kit diff
        │
        ▼
P1 Strip host law from packs + crew README
   → no grok / waiver / catalog_match in those five files
        │
        ▼
P2 Copy bots/ outside the repo, then delete it and fence INSTALL
   → bots/ gone, INSTALL fenced
        │
        ▼
P3 Register the seed (2.15.0)
   → ids resolve, default active set unchanged
        │
        ▼
P4 Archive annex, close board, refresh kit-context
   → primary none, kit-context names 2.15.0
```

| Phase | Theme | Why this order | Exit criterion |
|-------|--------|----------------|----------------|
| **P0** | Register | Board before kit edits | Annex linked; P1 active; no `kit/` diff |
| **P1** | Duties | Packs must stop citing `bots/` before delete | Five files clean of `grok`, `streaming-json`, `invoke.sh`, `catalog_match`, `defer` |
| **P2** | Remove adapter | Delete only after packs no longer link it | `bots/` absent; INSTALL YAML; operator copy or waiver recorded |
| **P3** | Register | Ids exist as slash_only packs before the catalog names them | CATALOG, map, UPGRADE, `### [2.15.0]` |
| **P4** | Close | Archive after the law SHA exists | primary `none`; annex under `docs/plan/archive/` |

One commit per phase. Subject and body name the staged diff. Footer: `Assisted-by` / `Compliance: RULES.md` / `Instructed-by` from `git config user.name`. The next phase writes the previous phase SHA on the board.

### P0

| Field | Value |
|-------|--------|
| **Current state** | Board primary was `none`. |
| **Issue** | Multi-phase work had no board row. |
| **Fix** | This annex, plan-index row, board primary `orchestrator-portability-2.15.0`. |
| **Allow** | `docs/WORKBOARD.md`, `docs/plan/README.md`, this folder |
| **Deny** | `kit/**` |
| **Exit** | P1 is the only `active` phase. |

### P1

| Field | Value |
|-------|--------|
| **Current state** | Packs are `catalog_match`, name `grok`, and allow an L4 waiver. Router `compose_with` lists three workers. |
| **Issue** | Role law names a host CLI and a mandatory full chain. |
| **Fix** | Apply the target schema and router procedure. Remove `## Tooling`. Remove the waiver. Rewrite the crew README (version `1.2.0`): smallest-set chain, `slash_only` catalog table, no JSON-invocation section. |
| **Allow** | `router.md`, `scout.md`, `builder.md`, `reviewer.md`, `README.md`, board |
| **Deny** | `bots/**`, CATALOG, RULES, CHANGELOG, INSTALL |
| **Exit** | Search of those five files is clean. Reporting tables remain. |

### P2

| Field | Value |
|-------|--------|
| **Current state** | `bots/` still holds `invoke.sh`, `registry.json`, `.agent.md`, `.persona.txt`. INSTALL has no YAML. |
| **Issue** | The kit tree still contains one operator’s host adapter. |
| **Fix** | Copy `bots/` outside this repo or record a waiver. Delete `kit/agents/orchestrator/bots/`. Rewrite INSTALL as fenced `1.0.0`: copy README, INSTALL, and the four packs; `slash_only`; `enabled-by-default: false`. |
| **Allow** | delete `bots/**`, INSTALL, board |
| **Deny** | recreating a launcher inside the repo |
| **Exit** | `bots/` is gone. INSTALL has `title`, `description`, `status`, `last_updated`, `doc_type`. |

### P3

| Field | Value |
|-------|--------|
| **Current state** | Packs are host-free and unregistered. |
| **Issue** | A durable surface has no catalog, map, upgrade note, or kit version. |
| **Fix** | CATALOG `1.2.9` subsection before project-generated agents. agents README `1.2.4` index row. RULES `2.7.6` one map row, no new Must. UPGRADE `1.9.1` forward-only note. CHANGELOG `### [2.15.0]`. |
| **Allow** | CATALOG, agents README, RULES, UPGRADE, CHANGELOG, board |
| **Deny** | default active set, FRAMEWORK, PARAMS, OPS, BUILD, `generated/` |
| **Exit** | Four ids match pack files. `### [2.15.0]` sits above `### [2.14.0]`. |

### P4

| Field | Value |
|-------|--------|
| **Current state** | Law is at the P3 SHA. Annex still live. kit-context still says 2.14.0. |
| **Issue** | Open board after ship, and session memory on the wrong version. |
| **Fix** | Phases `done` with SHAs. Primary `none`. `git mv` annex to `docs/plan/archive/orchestrator-portability-2.15.0/`. kit-context names 2.15.0 and the P3 law SHA. |
| **Allow** | board, `docs/plan/**`, kit-context |
| **Deny** | further pack-procedure edits |
| **Exit** | primary `none`. Archive path exists. kit-context agrees with 2.15.0. |

---

## 4. Verification

No language gates. Author checklist, relative links, last citations.

| Phase | Declared gates / checks |
|-------|-------------------------|
| P0 | Annex and board link each other. One `active` phase. No `kit/` diff. |
| P1 | `rg` for `grok`, `streaming-json`, `invoke.sh`, `catalog_match`, `defer` under the five files is empty. Reporting headings remain. |
| P2 | `bots/` absent. No `grok_bot`, `invoke.sh`, or `~/code/repo-kit` under the crew directory. INSTALL frontmatter complete. |
| P3 | Catalog ids match packs. Default active set unchanged. Map row resolves. `### [2.15.0]` present. Hub Must count unchanged. |
| P4 | primary `none`. Archive path exists. kit-context names 2.15.0. |

---

## 5. Docs and CHANGELOG on ship

| Phase | L4 owners to update |
|-------|---------------------|
| P0 | — |
| P1 | crew README `1.2.0` |
| P2 | INSTALL `1.0.0` |
| P3 | CATALOG `1.2.9`, agents README `1.2.4`, RULES `2.7.6`, UPGRADE `1.9.1`, CHANGELOG `2.15.0` |
| P4 | kit-context refresh; promise already on L4 |

---

## 6. Risks and rollback

| Risk | Mitigation |
|------|------------|
| Deleting `bots/` drops the only launcher copy | P2 copies it outside the repo or records a waiver first. Revert that commit to restore. |
| `slash_only` means nothing auto-runs the crew | Intended. Default seeds keep `catalog_match`. |
| Crew directory looks like a new L3 home | P3 states BUILD does not emit these packs into `generated/`. |
| Changelog jumps 2.14.0 to 2.15.0 | `2130d14` never had a version section. 2.15.0 describes the shipped contract. |
