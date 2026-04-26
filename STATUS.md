# STATUS.md

Last updated: 2026-04-26

## Project status

WDS 1.0 is now in the first runtime-candidate stage of the Windows 11 +
AutoHotkey v2 migration.

The main entrypoint `desktop_switcher.ahk` has been rewritten as an AutoHotkey
v2 candidate. The old AutoHotkey v1.1 implementation is preserved under
`legacy/v1/` as a behavior reference.

## Fixed project frame

- Platform: Windows 11 only.
- Runtime target: AutoHotkey v2.
- Main entrypoint: `desktop_switcher.ahk`.
- Hotkey configuration: `user_config.ahk`.
- Legacy reference: `legacy/v1/`.
- Documentation tone: calm, practical, human-first.
- Fork origin: acknowledged with gratitude.
- Technical direction: independent.

## Current runtime files

These files are expected in the current project state:

- `desktop_switcher.ahk`
- `user_config.ahk`
- `VirtualDesktopAccessor.dll`
- `legacy/v1/desktop_switcher.ahk`
- `legacy/v1/user_config.ahk`
- `LICENSE.txt`
- `README.md`

## Active truth

- AutoHotkey v1 compatibility is not a target.
- Windows 10 compatibility is not a target.
- Windows 11 behavior is the only platform behavior to validate.
- The v2 runtime candidate exists but is not yet manually validated.
- A sandbox startup smoke test passed with portable AutoHotkey 2.0.25.
- Runtime success claims require a recorded Windows 11 + AutoHotkey v2 test.
- `VirtualDesktopAccessor.dll` is still part of the first v2 candidate.

## Latest verification

Date: 2026-04-26

Sandbox result:

- Source runtime archive: `C:\CD\AutoHotkey_2.0.25.zip`.
- Portable runtime used: `AutoHotkey64.exe`.
- AutoHotkey version confirmed: `2.0.25`.
- `desktop_switcher.ahk` started and stayed resident during a short smoke test.
- The test process was stopped after the startup check.

Limit: the sandbox reports Windows 10, so this is not a Windows 11 manual test
and does not validate virtual desktop behavior.

## Needs confirmation on Windows 11

- AutoHotkey v2 startup and syntax behavior.
- Whether the existing `VirtualDesktopAccessor.dll` remains suitable.
- Direct desktop switching by number.
- Left/right and last-desktop switching.
- Create/delete desktop behavior.
- Moving the active window to another desktop and following it.
- CapsLock prefix behavior and standalone CapsLock behavior.
- Normal versus administrator elevation behavior.
- Whether the release should remain script-only or include a bundle.

## Current non-goals

- Windows 10 testing matrix.
- AutoHotkey v1 release maintenance.
- Linux, macOS, or cross-platform support.
- Marketing language in README.
- Compatibility claims without recorded manual tests.
