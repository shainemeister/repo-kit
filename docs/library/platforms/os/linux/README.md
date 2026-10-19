---
title: "Linux development policy packs"
description: Modular OS and application policy maps for Debian and GNOME. Compose packs; do not merge them into one rulebook.
version: "1.1.2"
status: current
audience:
  - developers
  - maintainers
doc_type: other
related:
  - debian-os-policy.md
  - debian-application-policy.md
  - gnome-os-policy.md
  - gnome-application-policy.md
last_updated: "2026-10-19"
---

# Linux development policy packs

Modular OS and application policy maps for Debian and GNOME. Curated
maps of what each layer actually checks. Not tutorials. Not product law
for any one repository.

Two axes, four packs. Compose packs; do not merge them. Add more distros
later on the same axes (Fedora OS, KDE Application, and so on) without
rewriting these files.

```text
                 APPLICATION                         OS
                 (what the program is)               (how it lives on a system)
                 ---------------------               --------------------------
Debian           debian-application-policy.md        debian-os-policy.md
GNOME            gnome-application-policy.md         gnome-os-policy.md
```

**Role:** working memory for humans and agents. Cite official manuals;
do not treat this folder as a substitute for Debian Policy or the HIG.

Last verified against official Debian, GNOME, Freedesktop, Flatpak, and
Flathub documents as of 2026-08-25. Pins are in **Pins**.

Read the root files. [archive/](archive/) is the frozen 1.0.0 snapshot,
kept for comparison only.

------------------------------------------------------------------------
How to compose
------------------------------------------------------------------------

Pick **one payload OS** per ship format. Add an **application** pack for
each ecosystem the program belongs to. Optionally add a **session OS**
when the desktop is not the same as the payload OS.

| Deliverable | Payload OS | Session OS (if any) | Application pack(s) |
|-------------|------------|---------------------|---------------------|
| Native `.deb` on Debian, any toolkit | Debian OS | — | Debian Application |
| Native `.deb` on Debian, GNOME-shaped GUI | Debian OS | GNOME OS (session + portals only) | Debian Application + GNOME Application |
| Flatpak on Flathub / GNOME OS image | GNOME OS | GNOME OS | GNOME Application |
| GNOME Circle listing of a Flatpak | GNOME OS | GNOME OS | GNOME Application (quality) + GNOME OS (store gates) |
| Official Debian package of a GNOME app | Debian OS | GNOME OS (session) | both Application packs |

Default for a GNOME-platform app that ships first as a Debian `.deb`:

  GNOME Application + Debian Application + Debian OS
  (+ GNOME OS *session* services: portals, settings, Shell)

Do **not** apply GNOME OS *payload* rules (Flatpak `/app`, Flathub AI
store ban, GNOME runtime EOL) to that `.deb`.

------------------------------------------------------------------------
Conflict resolution
------------------------------------------------------------------------

When two packs mention the same object, split **contents** from
**placement** and **queue**.

| Object | Who owns contents | Who owns placement | Who owns the queue |
|--------|-------------------|--------------------|--------------------|
| Binary, data, icons | Application pack of the UI toolkit | Payload OS pack | Payload OS pack |
| `.desktop` / metainfo | GNOME Application (HIG, summary, OARS) if GNOME-shaped; else Debian Application minima | Payload OS (`/usr/share` vs `/app/share`) | Payload OS |
| License | Both application packs (DFSG vs OSI) plus OS archive rules | Debian Application (`debian/copyright`) or Flathub SPDX | Debian NEW vs Flathub PR |
| App ID string | GNOME Application | — | Stores (GNOME OS) may add verification |
| HIG, a11y, widgets | GNOME Application | — | Circle review (app quality) |
| FHS, usr-merge, apt | — | Debian OS | Debian NEW |
| Sandbox finish-args, GNOME runtime | — | GNOME OS | Flathub / Circle store |
| Portals as GTK APIs | GNOME Application | — | — |
| Portals as session services | — | GNOME OS (session) | — |
| `%f`/`%u` Exec codes | Application (GNOME if GNOME-shaped) | Payload OS desktop path | Payload store |
| Conffiles / `/etc` | Debian Application (declare / migrate conffiles) | Debian OS (`/etc`, purge vs remove, Policy 10.7) | NEW |
| tag2upload / Git-Tag-* | Debian Application | — | dak |
| Portal implementation | — | GNOME OS session | — |
| Portal GTK/libportal calls | GNOME Application | — | — |
| Flathub English / license-files / extra-data | — | GNOME OS payload | Flathub PR |
| Circle no-crypto / CoC content | GNOME Application | — | Circle |
| Debian AI GR (if it passes) | Debian Application (+ OS if Social Contract) | — | Debian vote / NEW |

Hard rules:

1. Payload prefix follows the payload OS. Debian OS ⇒ `/usr`. GNOME OS
   Flatpak ⇒ `/app`. Never both for one artifact.
2. Session APIs follow the running desktop. A `.deb` on GNOME still
   talks to `xdg-desktop-portal-gnome`. That is GNOME OS session, not
   a license to ship a Flatpak.
3. "Preferred distribution" is an OS opinion, not an application
   requirement. Debian OS prefers `.deb`+apt. GNOME OS prefers Flatpak.
   The product chooses a first store; the unused OS pack stays optional.
4. Do not import Circle "must be on Flathub" into Debian Policy.
5. Do not import lintian or `Standards-Version` into a Flatpak manifest.

------------------------------------------------------------------------
What each pack is
------------------------------------------------------------------------

[debian-os-policy.md](debian-os-policy.md)

Debian as an operating system: Social Contract, archive, apt/dpkg, FHS,
usr-merge, systemd, users/groups, multiarch, security updates. Desktop
agnostic. Does not own HIG or `debian/control` field-by-field packaging.

[debian-application-policy.md](debian-application-policy.md)

What Debian requires of a *package* that is an application: source and
binary package rules, control fields, copyright-format, changelog, man
pages, relationships, maintainer scripts, lintian, ITP/NEW. Desktop and
AppStream as **packaging artifacts** (must exist, must validate, must
live under FHS). Not the HIG.

[gnome-os-policy.md](gnome-os-policy.md)

GNOME as a desktop OS and as a ship format: Shell, session, settings
daemon, portals, GNOME Software, Flatpak, GNOME runtime, Flathub, GNOME
OS images (systemd-sysupdate), Circle/Core as release-train membership.
Session parts apply to `.deb` apps running under GNOME. Payload parts
apply only to Flatpak / GNOME OS images.

[gnome-application-policy.md](gnome-application-policy.md)

What GNOME requires of the *program*: HIG, GTK 4 + Libadwaita, application
ID, GSettings, desktop/metainfo/icon **contents**, accessibility, OSI
license, no GNOME trademark on third-party apps. Circle *app quality*
lives here. Circle *Flathub + runtime* lives in GNOME OS.

------------------------------------------------------------------------
Adding another distro
------------------------------------------------------------------------

Copy the axes, not the files.

1. Write `<distro>-os-policy.md` for that distro's filesystem, installer,
   package manager, init, and archive/store.
2. Write `<distro>-application-policy.md` only if the distro has
   application packaging rules distinct from the OS (Fedora Packaging
   Guidelines, Arch PKGBUILD conventions, …).
3. Desktop ecosystems stay separate (GNOME Application, later KDE
   Application). A KDE app on Debian is Debian OS + Debian Application +
   (future) KDE Application. Do not fold KDE HIG into Debian OS.
4. Update this README composition table. Do not silently overload an
   existing pack.
5. A new distro is a new directory under ``os/`` (for example
   ``os/fedora``), not a new git repository. Languages live under
   [program-language/](../../program-language/).

------------------------------------------------------------------------
Pins
------------------------------------------------------------------------

Official manuals remain the authority. This table records the pin that was read. It does not fetch.

| Source | Pin | Pack | Read |
|--------|-----|------|------|
| [Debian Policy Manual](https://www.debian.org/doc/debian-policy/) | `4.7.4.1` | [debian-os-policy.md](debian-os-policy.md), [debian-application-policy.md](debian-application-policy.md) | 2026-08-25 |
| [Debian Policy upgrading checklist](https://www.debian.org/doc/debian-policy/upgrading-checklist.html) | `4.7.4` | [debian-os-policy.md](debian-os-policy.md), [debian-application-policy.md](debian-application-policy.md) | 2026-08-25 |
| [Debian Developer's Reference](https://www.debian.org/doc/manuals/developers-reference/) | `14.14` | [debian-application-policy.md](debian-application-policy.md) | 2026-08-25 |
| [Debian NEW queue](https://ftp-master.debian.org/new.html) | `Summary for: NEW` | [debian-application-policy.md](debian-application-policy.md) | 2026-08-25 |
| [ftp-master rejection mails](https://ftp-master.debian.org/reject.html) | `Deciphering Rejection mails` | [debian-application-policy.md](debian-application-policy.md) | 2026-08-25 |
| [DFSG NEW dashboard](https://dfsg-new-queue.debian.org/) | `DFSG, Licensing & New Packages Team` | [debian-os-policy.md](debian-os-policy.md), [debian-application-policy.md](debian-application-policy.md) | 2026-08-25 |
| [debian-devel-announce](https://lists.debian.org/debian-devel-announce/) | `debian-devel-announce` | [debian-os-policy.md](debian-os-policy.md), [debian-application-policy.md](debian-application-policy.md), [README.md](README.md) | 2026-08-25 |
| [General Resolution LLM usage in Debian](https://www.debian.org/vote/2026/vote_002) | `2026-08-28` | [debian-os-policy.md](debian-os-policy.md), [debian-application-policy.md](debian-application-policy.md), [README.md](README.md) | 2026-08-25 |
| [Debian releases](https://www.debian.org/releases/) | `trixie/Forky` | [debian-os-policy.md](debian-os-policy.md), [README.md](README.md) | 2026-08-25 |
| [DEP-8: automatic as-installed package testing](https://dep-team.pages.debian.net/deps/dep8/) | `DRAFT` | [debian-application-policy.md](debian-application-policy.md) | 2026-08-25 |
| [DEP-12: per-package machine-readable upstream metadata](https://dep-team.pages.debian.net/deps/dep12/) | `ACCEPTED` | [debian-application-policy.md](debian-application-policy.md) | 2026-08-25 |
| [DEP-14: recommended Git packaging layout](https://dep-team.pages.debian.net/deps/dep14/) | `CANDIDATE` | [debian-application-policy.md](debian-application-policy.md) | 2026-08-25 |
| [DEP-17: usr-merge aliasing](https://dep-team.pages.debian.net/deps/dep17/) | `ACCEPTED` | [debian-os-policy.md](debian-os-policy.md) | 2026-08-25 |
| [Machine-readable debian/copyright (DEP-5)](https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/) | `Machine-readable debian/copyright file` | [debian-application-policy.md](debian-application-policy.md) | 2026-08-25 |
| [tag2upload](https://wiki.debian.org/tag2upload) | `git-debpush` | [debian-application-policy.md](debian-application-policy.md) | 2026-08-25 |
| [Filesystem Hierarchy Standard](https://specifications.freedesktop.org/fhs/latest/) | `3.0` | [debian-os-policy.md](debian-os-policy.md) | 2026-08-25 |
| [GNOME Human Interface Guidelines](https://developer.gnome.org/hig/) | `GTK 4` | [gnome-application-policy.md](gnome-application-policy.md) | 2026-08-25 |
| [GNOME App Criteria](https://gitlab.gnome.org/Teams/Releng/AppOrganization/-/raw/main/AppCriteria.md) | `Uses GTK 4 + Libadwaita` | [gnome-application-policy.md](gnome-application-policy.md), [gnome-os-policy.md](gnome-os-policy.md) | 2026-08-25 |
| [Official GNOME App Definition](https://gitlab.gnome.org/Teams/Releng/AppOrganization/-/raw/main/OfficialAppDefinition.md) | `Official GNOME` | [gnome-application-policy.md](gnome-application-policy.md), [gnome-os-policy.md](gnome-os-policy.md) | 2026-08-25 |
| [GNOME official app processes (AppLifecycle)](https://gitlab.gnome.org/Teams/Releng/AppOrganization/-/raw/main/AppLifecycle.md) | `incubation` | [gnome-os-policy.md](gnome-os-policy.md) | 2026-08-25 |
| [GNOME Circle](https://gitlab.gnome.org/Teams/Circle/-/raw/main/README.md) | `Submissions are currently closed` | [gnome-application-policy.md](gnome-application-policy.md), [gnome-os-policy.md](gnome-os-policy.md) | 2026-08-25 |
| [GNOME release calendar](https://release.gnome.org/calendar/) | `51/50/49` | [gnome-os-policy.md](gnome-os-policy.md), [gnome-application-policy.md](gnome-application-policy.md) | 2026-08-25 |
| [GNOME release schedule (ICS)](https://release.gnome.org/calendar/schedule.ics) | `20260912` | [gnome-os-policy.md](gnome-os-policy.md) | 2026-08-25 |
| [gnome-build-meta](https://gitlab.gnome.org/GNOME/gnome-build-meta/-/raw/master/README.md) | `GNOME OS` | [gnome-os-policy.md](gnome-os-policy.md) | 2026-08-25 |
| [GNOME maintainer integrating guidelines](https://developer.gnome.org/documentation/guidelines/maintainer/integrating.html) | `D-Bus activation` | [gnome-os-policy.md](gnome-os-policy.md), [gnome-application-policy.md](gnome-application-policy.md) | 2026-08-25 |
| [GNOME developer guidelines](https://developer.gnome.org/documentation/guidelines.html) | `Human Interface Guidelines` | [gnome-application-policy.md](gnome-application-policy.md) | 2026-08-25 |
| [GNOME Software metadata meanings](https://gnome.pages.gitlab.gnome.org/gnome-software/help/C/software-metadata.html) | `software-metadata` | [gnome-os-policy.md](gnome-os-policy.md) | 2026-08-25 |
| [Flathub app requirements](https://docs.flathub.org/docs/for-app-authors/requirements) | `Generative AI policy` | [gnome-os-policy.md](gnome-os-policy.md) | 2026-08-25 |
| [Flathub quality guidelines](https://docs.flathub.org/docs/for-app-authors/metainfo-guidelines/quality-guidelines) | `not required for submission` | [gnome-os-policy.md](gnome-os-policy.md) | 2026-08-25 |
| [Flathub runtimes](https://docs.flathub.org/docs/for-app-authors/runtimes) | `GNOME runtime` | [gnome-os-policy.md](gnome-os-policy.md) | 2026-08-25 |
| [Flatpak sandbox permissions](https://docs.flatpak.org/en/latest/sandbox-permissions.html) | `finish-args` | [gnome-os-policy.md](gnome-os-policy.md) | 2026-08-25 |
| [xdg-desktop-portal documentation](https://flatpak.github.io/xdg-desktop-portal/docs/) | `xdg-desktop-portal` | [gnome-os-policy.md](gnome-os-policy.md), [gnome-application-policy.md](gnome-application-policy.md) | 2026-08-25 |
| [AppStream specification](https://www.freedesktop.org/software/appstream/docs/) | `1.0` | [debian-application-policy.md](debian-application-policy.md), [gnome-application-policy.md](gnome-application-policy.md), [gnome-os-policy.md](gnome-os-policy.md) | 2026-08-25 |
| [Desktop Entry Specification](https://specifications.freedesktop.org/desktop-entry-spec/latest/) | `1.5` | [debian-os-policy.md](debian-os-policy.md), [debian-application-policy.md](debian-application-policy.md), [gnome-application-policy.md](gnome-application-policy.md) | 2026-08-25 |
| [Icon Theme Specification](https://specifications.freedesktop.org/icon-theme-spec/latest/) | `Icon Theme Specification` | [debian-os-policy.md](debian-os-policy.md), [debian-application-policy.md](debian-application-policy.md), [gnome-application-policy.md](gnome-application-policy.md) | 2026-08-25 |
| [Shared MIME-info Database](https://specifications.freedesktop.org/shared-mime-info-spec/latest/) | `Shared MIME-info` | [debian-os-policy.md](debian-os-policy.md), [debian-application-policy.md](debian-application-policy.md), [gnome-application-policy.md](gnome-application-policy.md) | 2026-08-25 |
| [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/latest/) | `0.8` | [debian-os-policy.md](debian-os-policy.md), [gnome-os-policy.md](gnome-os-policy.md) | 2026-08-25 |
------------------------------------------------------------------------
Document history
------------------------------------------------------------------------

| Version | Notes |
|---------|--------|
| 1.1.2 | Pin table replaces sources.yaml. |
| 1.1.1 | Lead matches the description. |
| 1.1.0 | Reliability pins, gap fill from official docs, source watch (`sources.yaml` + `scripts/check_sources.py`). |
| 1.0.0 | Initial four-pack split: Debian OS, Debian Application, GNOME OS, GNOME Application |

The 1.0.0 snapshot is frozen in [archive/](archive/). Root files were
sourced from that snapshot and then hardened. Read the root files, not
`archive/`, unless you are comparing versions.
