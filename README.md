# WDS 1.0

Windows 11 virtual desktop workflow, built with AutoHotkey v2.

WDS 1.0 is a small Windows automation project focused on direct, predictable
virtual desktop control. It started as a fork of `windows-desktop-switcher`; the
fork origin remains visible, but the current technical target is an independent
Windows 11 + AutoHotkey v2 implementation.

## Project scope

- Platform: Windows 11 only.
- Runtime target: AutoHotkey v2.
- Current entrypoint: `desktop_switcher.ahk`.
- Configuration: `user_config.ahk`.
- Native helper: `VirtualDesktopAccessor.dll`.
- Documentation style: calm, practical, human-first.

AutoHotkey v1 compatibility is not a project goal.
Windows 10 compatibility is not a project goal.

## Current state

The repository now contains a first AutoHotkey v2 runtime candidate:

- `desktop_switcher.ahk` - AutoHotkey v2 entrypoint.
- `user_config.ahk` - AutoHotkey v2 hotkey configuration.
- `VirtualDesktopAccessor.dll` - native helper used for desktop/window access.
- `legacy/v1/desktop_switcher.ahk` - old AutoHotkey v1.1 reference script.
- `legacy/v1/user_config.ahk` - old AutoHotkey v1.1 reference hotkeys.

The v2 candidate has not yet been manually tested on Windows 11 with
AutoHotkey v2. Do not describe it as proven until the manual checklist is run
and recorded.

## What WDS does

The v2 candidate is intended to support:

- Switch directly to virtual desktops by number.
- Move left or right between virtual desktops.
- Return to the last opened desktop.
- Create and delete virtual desktops.
- Move the current window to another desktop and follow it.
- Keep hotkeys configurable in `user_config.ahk`.

## Requirements

```text
Windows 11
AutoHotkey v2
VirtualDesktopAccessor.dll beside desktop_switcher.ahk
```

Target AutoHotkey runtime:

```text
https://www.autohotkey.com/download/ahk-v2.exe
```

## Run locally

1. Install AutoHotkey v2.
2. Keep `VirtualDesktopAccessor.dll` in the same folder as `desktop_switcher.ahk`.
3. Run `desktop_switcher.ahk`.
4. Edit `user_config.ahk` if you want different hotkeys.
5. Reload `desktop_switcher.ahk` after changing hotkeys.

This is a migration candidate, not a final release note. Record the Windows 11
manual test result before treating the runtime as confirmed.

## Documentation map

Read these files before changing code:

- [STATUS.md](STATUS.md) - current project truth.
- [TASKS.md](TASKS.md) - active work queue.
- [HANDOFF.md](HANDOFF.md) - compact restart notes.
- [DECISIONS.md](DECISIONS.md) - decisions that should stay stable unless explicitly changed.
- [CODEX.md](CODEX.md) - instructions for Codex or other AI-assisted work.
- [PROJECT_RECORDS.md](PROJECT_RECORDS.md) - writing rules for project notes.
- [HUMAN_FIRST.md](HUMAN_FIRST.md) - short note on attribution and project tone.
- [docs/architecture.md](docs/architecture.md) - runtime shape.
- [docs/migration_ahk_v2.md](docs/migration_ahk_v2.md) - migration notes.
- [docs/v1_behavior_inventory.md](docs/v1_behavior_inventory.md) - behavior carried from the old script.
- [docs/manual_test_checklist.md](docs/manual_test_checklist.md) - Windows 11 test checklist.

## Working principles

- Keep credit visible.
- Keep documentation plain and useful.
- Do not add Windows 10 as a support goal.
- Do not preserve AutoHotkey v1 compatibility as a target.
- Make small, reviewable runtime changes.
- Do not claim runtime success without a Windows 11 manual test.

## Credits

This project descends from the original `windows-desktop-switcher` work. Thank
you to the people who created and shared it. Their work gave this project a
starting point.
