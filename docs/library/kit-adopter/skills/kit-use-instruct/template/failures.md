---
title: "Agent Instruct anti-patterns"
description: "Anti-patterns for Agent Instruct, and the practice to use instead."
version: "1.3.0"
status: current
doc_type: other
last_updated: "2026-10-17"
---

# Anti-patterns (Agent Instruct)

Anti-patterns for Agent Instruct, and the practice to use instead.

| Bad | Why | Prefer |
|-----|-----|--------|
| Pack body = full copy of `contracts.md` | Dual authority, drift | Link + short procedure + expertise map |
| All seed agents `always_on` | Context bloat | catalog_match + PLAN active set |
| Load a second skill, or delegate to another agent | A second procedure in the same session | One skill. Name the next task and stop |
| Kit CATALOG includes product/game art agents | Platform leak | Adopter overlays only |
| PLAN has no Agent models while using agents | Non-durable | [plan dual path](../../kit-author-plan/SKILL.md#plan-dual-path) |
| Bare adopt forced to invent full PLAN | Over-require | Bare path: skip BUILD if no Agent models |
| Empty Active models list re-enables full catalog | Ignores user intent | Empty list (zero bullets / `*(none)*`) = emit nothing ([BUILD resolution](../../kit-emit-packs/SKILL.md#resolution-rules)) |
| Unset `active_models` always loads catalog after first BUILD | Silent re-enable | Require explicit list (or `use_catalog_defaults`) |
| UPGRADE resets active_models | User intent loss | Preserve Agent models + selective BUILD regen |
| UPGRADE clobbers adopter `generated/` packs | Loss of project personas | Preserve `portability: adopter\|platform` ([load order](../../kit-emit-packs/SKILL.md#source-load-order)) |
| Skeleton invent for unknown id on regen | Clobber / junk packs | Fail that id; skeleton only for **explicit** new agents |
| Remote `http(s)` overlay URL | Fetch / injection surface | Repo-relative overlays only |
| External URL in `authority_paths` | Fake law / trust break | Citations only under `references` / Expertise map |
| Empty expertise / no references on generated packs | Non-expert packs | Curated authority_paths + references with purpose ([PARAMS](../../kit-define-pack/SKILL.md)) |
| External citation treated as overriding L4 | Dual law | L4 wins; citations are guidance |
| Instruct in use but skip primary-pack match | No utilization | [OPS O3](../SKILL.md) |
| Feature/surface ships; packs unchanged | Stale experts | PLAN lifecycle + BUILD ([OPS lifecycle](../SKILL.md#lifecycle-features-and-core-tasks)) |
| Raw `{{PLACEHOLDER}}` left in generated packs | Unfinished emit | Omit empty optionals; fill or fail validation |
| Full persona essay in RULES.md / fold agents into hub | Hub bloat; dual law | Description + link to OPS only |
| Implementer invents verify tools | Undeclared checks | Checks the authority map already names |
| Claim complete when declared gate failed | Violates completion rule | STOP; remediate ([verification-and-ops](../../../../../../kit/RULES.md#completion)) |
| Generated packs gitignored and never rebuilt | Broken clones | Track thin packs under `docs/library/kit-adopter/generated/` |
| Product project names in kit defaults | Non-portable | Generic seeds only |
| Treating Agent Instruct as a style or security scanner | A procedure is not a scanner | [security baseline](../../../../../security.md) and [completion](../../../../../../kit/RULES.md#completion) |
| Open the security baseline on every utilization task | Pulls a gate into the router | Name [kit-apply-security](../../../../../../kit/skills/kit-apply-security/SKILL.md) when the change touches privilege, network, or secrets |
