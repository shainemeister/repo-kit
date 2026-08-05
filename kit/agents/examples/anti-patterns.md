# Anti-patterns (Agent Instruct)

| Bad | Why | Prefer |
|-----|-----|--------|
| Pack body = full copy of `contracts.md` | Dual authority, drift | Link + short procedure |
| All seed agents `always_on` | Context bloat | catalog_match + PLAN active set |
| Auto-load full compose_with matrix | Context bloat | One primary; compose only when needed |
| Kit CATALOG includes product/game art agents | Platform leak | Adopter overlays only |
| PLAN has no Agent models while using agents | Non-durable | PLAN-HOOK section |
| Bare adopt forced to invent full PLAN | Over-require | Bare path: skip BUILD if no Agent models |
| Empty Active models list re-enables full catalog | Ignores user intent | Empty list (zero bullets / `*(none)*`) = emit nothing ([BUILD resolution](../BUILD.md#resolution-rules)) |
| Unset `active_models` always loads catalog after first BUILD | Silent re-enable | Require explicit list (or `use_catalog_defaults`) |
| UPGRADE resets active_models | User intent loss | Preserve Agent models + selective BUILD regen |
| UPGRADE clobbers adopter `generated/` packs | Loss of project personas | Preserve `portability: adopter\|platform` ([load order](../BUILD.md#source-load-order)) |
| Skeleton invent for unknown id on regen | Clobber / junk packs | Fail that id; skeleton only for **explicit** new agents |
| Remote `http(s)` overlay URL | Fetch / injection surface | Repo-relative overlays only |
| Raw `{{PLACEHOLDER}}` left in generated packs | Unfinished emit | Omit empty optionals; fill or fail validation |
| Full persona essay in RULES.md / fold agents into hub | Hub bloat; dual law | Description + link only |
| Implementer invents verify tools not in RULES | Undeclared gates | RULES verification table only |
| Claim complete when declared gate failed | Violates completion rule | STOP; remediate ([verification-and-ops](../../rules/verification-and-ops.md#completion-rule)) |
| Generated packs gitignored and never rebuilt | Broken clones | Track thin packs under `kit/agents/generated/` |
| Product project names in kit defaults | Non-portable | Generic seeds only |
| Treating Agent Instruct as Domain A/B gate | Fake enforcement | Convention only in v1 |
