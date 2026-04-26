# STATUS.md

Last updated: 2026-04-26

## Project status

WDS 1.0 is in a Windows 11 + AutoHotkey v2 migration phase.

The repository currently contains AutoHotkey v1.1 code. That code is the reference for existing behavior, not the final implementation target.

## Fixed project frame

- Platform: Windows 11 only.
- Current base: AutoHotkey v1.1.
- Target runtime: AutoHotkey v2.
- Documentation tone: calm, practical, human-first.
- Fork origin: acknowledged with gratitude.
- Technical direction: independent.

## Current reference files

These files are expected to exist in the current project state:

- `desktop_switcher.ahk`
- `user_config.ahk`
- `VirtualDesktopAccessor.dll`
- `LICENSE.txt`
- `README.md`

## Active truth

- AutoHotkey v1 compatibility is not a target.
- Windows 10 compatibility is not a target.
- Windows 11 behavior is the only platform behavior to validate.
- The project may redesign inherited structure.
- Human-first means attribution and clarity, not extra ceremony.

## Needs confirmation on Windows 11

- Which Windows 11 builds should be used for manual testing.
- Whether the existing `VirtualDesktopAccessor.dll` remains suitable.
- Whether the final v2 version should keep the same default hotkeys.
- Whether the final entrypoint remains `desktop_switcher.ahk` or changes to a v2-specific file.
- Whether packaging should remain script-only or include a release bundle.

## Current non-goals

- Windows 10 testing matrix.
- AutoHotkey v1 release maintenance.
- Linux, macOS, or cross-platform support.
- Marketing language in README.
- Large rewrites without a clear migration reason.
