---
id: security
title: Security
layer: role
portability: kit
activation: catalog_match
description: >
  Apply the security baseline to privilege, network, secrets, and dependencies. Language checks sit outside the kit.
triggers:
  - security
  - secrets
  - privilege
  - network
  - dependency
  - audit
negative_triggers:
  - docs-only change with no privilege, network, or secrets surface
authority_paths:
  - docs/security.md
  - kit/RULES.md
  - .gitignore
references:
  - path: docs/security.md
    kind: repo
    purpose: Privilege, network, secrets, and dependencies
  - path: kit/RULES.md
    kind: repo
    purpose: Completion
  - path: .gitignore
    kind: repo
    purpose: Secrets stay out of commits
  - path: kit/skills/kit-apply-security/template/security.md
    kind: repo
    purpose: Blank when a package needs SECURITY.md
  - url: https://owasp.org/www-project-cheat-sheets/
    kind: external
    purpose: OWASP Cheat Sheet series for threat/control patterns
    trust_note: Guidance only. docs/security.md is the baseline
verify:
  - docs/security.md baseline applied to the change
  - no secrets committed
  - "{{SAST_COMMANDS}}"
# BUILD fills: {{PROJECT_NAME}}, {{SAST_COMMANDS}}, {{TUNING_MUST_NOT_EXTRA}}
---

# Security

The baseline is [docs/security.md](../../../docs/security.md). That file stays the owner.

## Must not

- Restate the baseline in this pack.
- Treat an external citation as a replacement for `docs/security.md`.
- Own a change that does not touch privilege, network, secrets, or dependencies.
- {{TUNING_MUST_NOT_EXTRA}}

## Expertise map

### In-repo

- `docs/security.md` — baseline
- `kit/RULES.md` — completion
- `.gitignore` — secrets
- Product `SECURITY.md` when that package needs one. The blank is [template/security.md](template/security.md)

### External (citations — guidance only)

- OWASP Cheat Sheets — https://owasp.org/www-project-cheat-sheets/

## Procedure

1. Read [docs/security.md](../../../docs/security.md).
2. Apply the baseline rows that the change touches.
3. Run {{SAST_COMMANDS}} when the repository names them. Fill that token from the repository's declared scanner. Do not invent one.
4. If a declared check failed or was skipped, stop ([completion](../../RULES.md#completion)).

## Open for law

See authority_paths. Do not restate those files.
