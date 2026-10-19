---
title: "macOS development policy packs"
description: Modular OS and application policy maps for direct distribution and the Mac App Store. Compose packs; do not merge them into one rulebook.
version: "1.0.2"
status: current
audience:
  - developers
  - maintainers
doc_type: other
related:
  - direct-os-policy.md
  - direct-application-policy.md
  - app-store-os-policy.md
  - app-store-application-policy.md
last_updated: "2026-10-19"
---

# macOS development policy packs

Modular OS and application policy maps for direct distribution and the
Mac App Store. Curated maps of what each layer actually checks. Not
tutorials. Not product law for any one repository.

Two axes, four packs. Compose packs; do not merge them. Direct
distribution is the primary map. The Mac App Store packs record the
store's own payload and review rules.

```text
                 APPLICATION                         OS
                 (what the program is)               (how it is sealed and placed)
                 ---------------------               --------------------------
Direct           direct-application-policy.md        direct-os-policy.md
Mac App Store    app-store-application-policy.md     app-store-os-policy.md
```

**Role:** working memory for humans and agents. Cite Apple's manuals;
do not treat this folder as a substitute for the Human Interface
Guidelines, the notarization documents, or the App Review Guidelines.

Last verified against Apple's distribution, notarization, Human
Interface Guidelines, App Review Guidelines, and developer news as of
2026-10-02. Pins are in **Pins**.

There is no `archive/` yet. This 1.0.0 tree is the first cut.

------------------------------------------------------------------------
How to compose
------------------------------------------------------------------------

Pick **one payload** per artifact. Add the matching OS pack. Add
Direct Application for every Mac app. Add the App Store packs only
when the artifact is submitted to the Mac App Store.

| Deliverable | Payload OS | Application pack(s) |
|-------------|------------|---------------------|
| Direct `.app`, `.dmg`, `.pkg`, or `.zip` (Developer ID) | Direct OS | Direct Application |
| Signed command-line tool that Gatekeeper must open | Direct OS (signing, hardened runtime, notarization) | — |
| Mac App Store app | App Store OS | App Store Application + Direct Application (HIG and bundle contents) |
| Language toolchain, Homebrew formula, or library with no bundle | — (language `*-os-policy.md`) | — |

Default for a Mac app that ships first outside the store:

  Direct Application + Direct OS

Do **not** open the App Store packs for that artifact.

A Mac App Store app still reads Direct Application for the Human
Interface Guidelines, bundle identifier, `Info.plist` contents, icons,
purpose strings, and the privacy manifest. It does **not** read Direct
OS for certificates, notarization, or optional sandbox.

------------------------------------------------------------------------
Conflict resolution
------------------------------------------------------------------------

When two packs mention the same object, split **contents** from
**placement** and **queue**.

| Object | Who owns contents | Who owns placement | Who owns the queue |
|--------|-------------------|--------------------|--------------------|
| Bundle ID, menus, icons, HIG | Direct Application | — | App Review, and only for a store app |
| `Info.plist`, purpose strings, privacy manifest | Direct Application | Inside the bundle | Notary checks entitlement XML; Review checks store metadata |
| Entitlement keys | Direct Application declares them. App Store Application requires the sandbox | The payload OS enforces them | Notary (direct) or App Review (store) |
| `.app` path, container, App Group | — | Payload OS | — |
| Developer ID, timestamp, hardened runtime | — | Direct OS | Direct Application submits to the notary |
| Gatekeeper, quarantine, stapled ticket | — | Direct OS | — |
| Sandbox container | — | Direct OS if the app opts in. App Store OS requires it | App Review |
| `.zip`, `.dmg`, `.pkg` | — | Direct OS | Notarize the outermost container |
| Store installer, receipt, store updates | — | App Store OS | App Store Connect |
| Listing, screenshots, privacy details, age rating | App Store Application | — | App Review |
| Xcode Command Line Tools, rustup, Homebrew prefix | — | Language `*-os-policy.md` | — |
| Full Disk Access | — | Direct OS | — |

Hard rules:

1. One payload per artifact. Developer ID direct distribution, or the
   Mac App Store. One ship uses one certificate family.
2. App Store sandbox, guideline 2.4.5, and store updates apply to a
   Mac App Store app. They do not apply to a Developer ID app.
3. A Developer ID certificate, the notary queue, and an optional
   sandbox apply to direct distribution. They do not apply to a Mac
   App Store app.
4. Notarization is a malware and signature scan. It is not App Review.
5. Human Interface Guidelines and bundle contents live in Direct
   Application for both payloads. A store app composes both
   application packs. A direct app does not open the App Store packs.
6. Shared platform facts (Apple silicon host, System Integrity
   Protection, standard directories, TCC prompts) live in Direct OS.
   App Store OS cites them and states the store's overrides.
7. Language toolchains stay in `program-language/*-os-policy.md`.
   A Homebrew cask may install a direct-distribution app. The cask
   is not a pack in this family.
8. iOS, iPadOS, visionOS, watchOS, tvOS, Mac Catalyst, Swift itself,
   and iOS alternative distribution are outside this family.

------------------------------------------------------------------------
What each pack is
------------------------------------------------------------------------

[direct-os-policy.md](direct-os-policy.md)

macOS as the system a directly distributed product lands on:
filesystem, System Integrity Protection, Developer ID enforcement,
hardened runtime, Gatekeeper, quarantine, notarization tickets,
optional sandbox, TCC, `launchd`, and zip / disk image / installer
containers. This is the primary OS map.

[direct-application-policy.md](direct-application-policy.md)

What a Mac program is: Human Interface Guidelines, bundle identity,
icons, `Info.plist`, declared entitlements, purpose strings, privacy
manifest, accessibility, documents, and the notarization submit
steps. Store listing copy is not here.

[app-store-os-policy.md](app-store-os-policy.md)

The Mac App Store payload: store certificates, the Xcode installer
package, mandatory sandbox, store-managed install, and the behaviors
guideline 2.4.5 forbids on the system. Shorter on purpose. Overrides
Direct OS where the store disagrees.

[app-store-application-policy.md](app-store-application-policy.md)

App Review and App Store Connect for a Mac app: the review queue,
Mac-specific review rules, metadata, privacy details, and age rating.
Human Interface Guidelines stay in Direct Application.

------------------------------------------------------------------------
Adding another payload
------------------------------------------------------------------------

Copy the axes, not the files.

1. A new ship format that has its own certificate, install location,
   and review queue gets its own OS pack and, when the program rules
   differ, its own application pack.
2. Desktop rules that both payloads share stay in Direct Application.
   Do not copy the Human Interface Guidelines into the store pack.
3. Homebrew formulae and casks stay out. Formulae are language
   toolchain carve-outs. A cask is a third-party install of an
   already built app.
4. Update this README composition table when a payload is added.
5. This family is `os/macos/`, not a new git repository. Languages
   stay under [program-language/](../../program-language/).

------------------------------------------------------------------------
Pins
------------------------------------------------------------------------

Official manuals remain the authority. This table records the pin that was read. It does not fetch.

| Source | Pin | Pack | Read |
|--------|-----|------|------|
| [macOS 27 Golden Gate release notes](https://developer.apple.com/documentation/macos-release-notes/macos-27-release-notes.md) | `macOS 27 Golden Gate` | [direct-os-policy.md](direct-os-policy.md), [direct-application-policy.md](direct-application-policy.md), [README.md](README.md) | 2026-10-02 |
| [Developer ID Sub-CA expiry (developer news)](https://developer.apple.com/news/) | `February 1, 2027` | [direct-os-policy.md](direct-os-policy.md), [README.md](README.md) | 2026-10-02 |
| [Rosetta transition (developer news)](https://developer.apple.com/news/) | `Final release to support Rosetta` | [direct-os-policy.md](direct-os-policy.md), [README.md](README.md) | 2026-10-02 |
| [Full Disk Access controls (developer news)](https://developer.apple.com/news/) | `Updates to Full Disk Access in macOS` | [direct-os-policy.md](direct-os-policy.md), [direct-application-policy.md](direct-application-policy.md) | 2026-10-02 |
| [Notarizing macOS software before distribution](https://developer.apple.com/documentation/security/notarizing-macos-software-before-distribution.md) | `Notarization of macOS software is not App Review` | [direct-os-policy.md](direct-os-policy.md), [direct-application-policy.md](direct-application-policy.md) | 2026-10-02 |
| [Customizing the notarization workflow](https://developer.apple.com/documentation/security/customizing-the-notarization-workflow.md) | `notarytool` | [direct-application-policy.md](direct-application-policy.md) | 2026-10-02 |
| [Resolving common notarization issues](https://developer.apple.com/documentation/security/resolving-common-notarization-issues.md) | `The signature of the binary is invalid` | [direct-application-policy.md](direct-application-policy.md) | 2026-10-02 |
| [Packaging Mac software for distribution](https://developer.apple.com/documentation/xcode/packaging-mac-software-for-distribution.md) | `only notarize the outermost container` | [direct-os-policy.md](direct-os-policy.md), [app-store-os-policy.md](app-store-os-policy.md) | 2026-10-02 |
| [Hardened Runtime](https://developer.apple.com/documentation/security/hardened-runtime.md) | `Hardened Runtime` | [direct-os-policy.md](direct-os-policy.md), [direct-application-policy.md](direct-application-policy.md) | 2026-10-02 |
| [Configuring the macOS App Sandbox](https://developer.apple.com/documentation/xcode/configuring-the-macos-app-sandbox.md) | `enforces at the kernel level` | [direct-os-policy.md](direct-os-policy.md), [app-store-os-policy.md](app-store-os-policy.md) | 2026-10-02 |
| [Accessing files from the macOS App Sandbox](https://developer.apple.com/documentation/security/accessing-files-from-the-macos-app-sandbox.md) | `sandbox container` | [direct-os-policy.md](direct-os-policy.md), [direct-application-policy.md](direct-application-policy.md) | 2026-10-02 |
| [Protecting local app data using containers](https://developer.apple.com/documentation/xcode/protecting-local-app-data-using-containers.md) | `System Integrity Protection` | [direct-os-policy.md](direct-os-policy.md) | 2026-10-02 |
| [SMAppService](https://developer.apple.com/documentation/servicemanagement/smappservice.md) | `SMAppService` | [direct-os-policy.md](direct-os-policy.md), [app-store-os-policy.md](app-store-os-policy.md) | 2026-10-02 |
| [Designing for macOS](https://developer.apple.com/design/human-interface-guidelines/designing-for-macos) | `Designing for macOS \| Apple Developer Documentation` | [direct-application-policy.md](direct-application-policy.md) | 2026-10-02 |
| [Human Interface Guidelines — Menus](https://developer.apple.com/design/human-interface-guidelines/menus) | `Menus \| Apple Developer Documentation` | [direct-application-policy.md](direct-application-policy.md) | 2026-10-02 |
| [Human Interface Guidelines — App icons](https://developer.apple.com/design/human-interface-guidelines/app-icons) | `App icons \| Apple Developer Documentation` | [direct-application-policy.md](direct-application-policy.md) | 2026-10-02 |
| [Information Property List](https://developer.apple.com/documentation/bundleresources/information-property-list.md) | `CFBundleIdentifier` | [direct-application-policy.md](direct-application-policy.md) | 2026-10-02 |
| [App Sandbox entitlement](https://developer.apple.com/documentation/bundleresources/entitlements/com.apple.security.app-sandbox.md) | `com.apple.security.app-sandbox` | [direct-application-policy.md](direct-application-policy.md), [app-store-os-policy.md](app-store-os-policy.md) | 2026-10-02 |
| [Privacy manifest files](https://developer.apple.com/documentation/bundleresources/privacy-manifest-files.md) | `PrivacyInfo.xcprivacy` | [direct-application-policy.md](direct-application-policy.md) | 2026-10-02 |
| [App Review Guidelines](https://developer.apple.com/app-store/review/guidelines/) | `June 8, 2026` | [app-store-application-policy.md](app-store-application-policy.md), [app-store-os-policy.md](app-store-os-policy.md), [README.md](README.md) | 2026-10-02 |
| [App Store Connect Help](https://developer.apple.com/help/app-store-connect/) | `App Store Connect` | [app-store-application-policy.md](app-store-application-policy.md), [app-store-os-policy.md](app-store-os-policy.md) | 2026-10-02 |
------------------------------------------------------------------------
Document history
------------------------------------------------------------------------

| Version | Notes |
|---------|--------|
| 1.0.0 | Initial four-pack split: Direct OS, Direct Application, Mac App Store OS, Mac App Store Application. Direct distribution is the primary map. |
| 1.0.1 | Lead matches the description. |
| 1.0.2 | Pin table replaces sources.yaml. |
