# P5a unique-rule ledger

Parent snapshot **2026-08-21**. Restyle chrome/reprints only. Keep UNIQUE in-file or one-sentence cite. Keep listed ANCHORS (or retarget inbound).

## kit/rules/continuity.md (1.0.0)

**ANCHORS:** `#summary` `#when-to-maintain-an-overlay` `#what-this-kit-file-is-not` `#portable-edit-policy` `#protected-surfaces-adopter-filled` `#git-continuity` `#relationship-to-the-workboard` `#document-history`

**UNIQUE:**
- Surgical edits; no full-file rewrite of a named protected surface unless user asks restore
- Product paths live in a **filled overlay**, not this kit module
- Commit after each verified step; one logical surface
- Declared verification before done
- L4 + CHANGELOG when contracts change
- Update workboard on multi-phase ship
- Overlay optional for docs-only/trivial/low-coupling; not a Domain A/B gate
- Copy TEMPLATE-CONTINUITY to adopter path; do not fill this module’s empty table
- UPGRADE preserves filled overlay
- Portable edit policy six points (read before write, surgical, no opportunistic scope, one protected surface, stop on regression, declared gates win)
- Git continuity practices (branch, conventional, verify, board SHA, AI disclosure, rollback)

**CITES:** workboard, contracts, verification completion, versioning AI trailers, UPGRADE preserve, TEMPLATE-CONTINUITY

## kit/rules/versioning-and-git.md (1.0.4)

**ANCHORS:** `#summary` `#three-version-surfaces` `#mandatory-project-changelog` `#kit-baseline-and-upgrades` `#consistency-rules` `#git-rules` `#commit-message-format` `#documentation-consistency-in-commits` `#suggested-commit-workflow` `#remotes` `#document-history` `#ai-assisted-commits-required-disclosure` `#instructed-by-resolution-cascade`

**UNIQUE (do not slim these catalogs):**
- Three version surfaces (kit / project / document) and when to bump
- Mandatory root CHANGELOG: Keep a Changelog; H2→H3→H4; no Unreleased; when required vs optional
- This kit repo uses `kit/CHANGELOG.md` `## repo-kit`
- Kit baseline + UPGRADE (not SETUP after initiation)
- Consistency rules (frontmatter match, product version alignment, compat additions, design status honesty)
- Conventional `type(scope):`; AI trailers Assisted-by / Compliance / Instructed-by; no Directed-by; Instructed-by cascade (git user.name → ask+record → User)
- Git rules, remotes, documentation-in-commits as currently stated

**CITES:** hygiene kit/ vs product; contracts same-change-set; UPGRADE procedure; RULES kit baseline

## kit/rules/workboard.md (1.0.2)

**ANCHORS:** keep all current H2s including `#status-vocabulary` `#status-channel-mapping` `#phase-ship-checklist` `#archive-annex-checklist` `#path-aliases` `#agent-protocol` `#three-surfaces`

**UNIQUE (do not slim status vocab / checklists):**
- One board at docs/WORKBOARD.md; register before phase code; same-change-set status+SHA
- Exactly one active phase preferred
- Status tokens: open active blocked done cancelled deferred
- Do not merge workboard / Progress Tracker / plan-frontmatter enums
- Three surfaces: PLAN / board / annex→archive
- Dual path: skip if trivial; required if multi-phase
- Annex only while linked; archive via git mv; cap recently completed
- Parent owns board when Instruct isolates; children do not mark program done
- Path aliases: one board; preserve adopter aliases on upgrade

**CITES:** PLAN-HOOK, ai-docs-workspace, contracts, continuity

## kit/rules/ai-docs-workspace.md (1.1.1)

**ANCHORS:** `#summary` `#purpose` `#separation-from-other-surfaces` `#default-modular-layout` `#lifecycle-dynamic` `#promotion-to-l4` `#planmd-triple-surface` `#enforcement-triggers` `#authoring-and-trust` `#anti-patterns` `#document-history`

**UNIQUE:**
- Live workspace at root docs/ outside kit/
- Scaffold when needed; maintain when used; do not force empty four-module trees
- docs/README.md index honest
- Promote promises to L4; docs/ is not dual home for API/CLI/SECURITY/CHANGELOG
- PLAN + WORKBOARD + plan/ triple; Agent models stay in PLAN
- Modules: research, WORKBOARD, plan, project_build, resources
- Not a Domain A/B gate

**CITES:** contracts promotion, workboard, hygiene, PLAN-HOOK
