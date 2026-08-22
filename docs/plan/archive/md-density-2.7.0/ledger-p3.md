# P3 unique-rule ledger (pre-restyle)

Parent snapshot **2026-08-19** before hygiene/architecture restyle. After edit: every UNIQUE remains in-file **or** becomes a one-sentence cite of an owner that already stated it. Every ANCHOR exists or inbound hits are retargeted (none found for `hygiene.md#` / `architecture.md#` on 2026-08-19).

## kit/rules/hygiene.md (1.5.1)

**ANCHORS:** `#summary` `#unified-packaging` `#what-belongs-at-project-root` `#what-belongs-under-kit` `#what-does-not-belong-at-root-or-under-kit` `#separation-rules` `#supporting-practices` `#setup-and-upgrade-lifecycles` `#document-history` `#contents`

**UNIQUE:**
- Standards under `kit/`; product code, project CHANGELOG, PLAN, and live `docs/` outside `kit/`
- This kit repo: payload under `kit/`; root README, LICENSE, `.gitignore`; kit history in `kit/CHANGELOG.md` under `## repo-kit`
- Adopting repo: same `kit/` split; project `CHANGELOG.md` at root
- Default greenfield: `kit/RULES.md` + `kit/rules/*`, not root `RULES.md`
- Escape hatch: reference/submodule without a local kit copy; still record Kit baseline
- Root may hold: landing README, LICENSE, `.gitignore`, project CHANGELOG, PLAN (required if Instruct; optional if bare), `docs/`, WORKBOARD, inventory-gated style configs, `AGENTS.md` if a coding agent, thin host alias only if needed
- Under `kit/`: RULES, rules/, MARKDOWN-STANDARD, UPGRADE, SETUP (ephemeral), configs (dormant catalog), templates, examples, agents
- Do not treat kit CHANGELOG as the product’s project history
- Not at root or under `kit/`: product packages, package CLI/SECURITY/methodology, certification outputs, AI research, helpers, regenerable artifacts, CI workflows; host pack mirrors prefer gitignore
- Separation: no product under `kit/`; no kit history in project CHANGELOG; no standards dump on root; no research under `kit/`; authority map lists owners; relative `../` from `kit/` to root/product; 1.x may migrate gradually; greenfield must use this layout
- Same-change-set authority map when listed paths change; prefer purpose directories; mark SETUP ephemeral; respect `.gitignore`; contracts when docs move
- SETUP ephemeral (delete/archive after initiation); UPGRADE durable; Kit baseline durable in `kit/RULES.md`

**CITES (keep as cite if not restated):**
- Landing shape → MARKDOWN-STANDARD `#landing--root-readme-no-frontmatter`
- `docs/` policy → `ai-docs-workspace.md`
- WORKBOARD → `workboard.md`
- L0 `AGENTS.md` → HABITAT
- 1.x migrate → UPGRADE
- Cross-link when docs move → contracts

## kit/rules/architecture.md (1.0.0)

**ANCHORS:** `#summary` `#architecture-rules` `#document-history` `#contents`

**UNIQUE:**
- Prefer documented CLI / `__main__` / public APIs over ad-hoc scripts as the primary surface
- Join packages at the **workflow** layer (files, CLI, messages), not by merging unrelated engines unless explicit design
- Do not call one stack from another in product code without an intentional, documented boundary
- Declare dependency policy in README and security docs; no hidden downloads or telemetry unless documented
- Prefer schema/config/interface-driven behavior over buried hard-coded business field lists
- Project-specific “never do X” rows belong in a thin overlay or an expanded table — not invented in chat
- Public automation surfaces follow contracts for co-updates and versioning

**CITES:**
- Public surfaces / co-updates → `contracts.md`
- Dependency/trust detail → `security.md` when that file exists
