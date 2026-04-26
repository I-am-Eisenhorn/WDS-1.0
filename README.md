# WDS 1.0

Windows 11 virtual desktop workflow, built with AutoHotkey.

WDS 1.0 is a small Windows automation project focused on direct, predictable virtual desktop control. The current repository contains an AutoHotkey v1.1 implementation. The project target is AutoHotkey v2 on Windows 11.

This project started as a fork of `windows-desktop-switcher`. We keep that origin visible and appreciate the people who created the original work. The fork history is provenance, not a technical constraint: this project may reuse, replace, simplify, or redesign inherited parts when that serves the Windows 11 + AutoHotkey v2 goal.

## Project scope

- Platform: Windows 11 only.
- Current codebase: AutoHotkey v1.1 script structure.
- Target runtime: AutoHotkey v2.
- Documentation style: calm, practical, human-first.
- Compatibility target: current Windows 11 behavior, not Windows 10.

## Current state

The existing runtime files are treated as a reference while the project moves to AutoHotkey v2:

- `desktop_switcher.ahk` — legacy main script.
- `user_config.ahk` — legacy user hotkey configuration.
- `VirtualDesktopAccessor.dll` — native helper used by the current implementation.

The target implementation is not “v1 with small edits”. It is a migration to AutoHotkey v2 syntax and behavior.

## What the project is meant to do

The current behavior to understand and, where useful, carry forward:

- Switch directly to virtual desktops by number.
- Move left or right between virtual desktops.
- Return to the last opened desktop.
- Create and delete virtual desktops.
- Move the current window to another desktop.
- Keep hotkeys configurable.

The final v2 implementation may change internal structure and names if that makes the project clearer and easier to maintain.

## AutoHotkey versions

Current reference runtime:

```text
AutoHotkey v1.1
https://www.autohotkey.com/download/1.1/
```

Target runtime:

```text
AutoHotkey v2
https://www.autohotkey.com/download/ahk-v2.exe
```

Do not run the current v1 script as if it were already an AutoHotkey v2 script. The migration must update syntax, function calls, hotkey definitions where needed, registry access, DLL calls, error handling, and startup behavior.

## Documentation map

Read these files before changing code:

- [STATUS.md](STATUS.md) — current project truth.
- [TASKS.md](TASKS.md) — active work queue.
- [HANDOFF.md](HANDOFF.md) — compact restart notes.
- [DECISIONS.md](DECISIONS.md) — decisions that should stay stable unless explicitly changed.
- [CODEX.md](CODEX.md) — instructions for Codex or other AI-assisted work.
- [PROJECT_RECORDS.md](PROJECT_RECORDS.md) — writing rules for project notes.
- [HUMAN_FIRST.md](HUMAN_FIRST.md) — short note on attribution and project tone.

Useful docs:

- [docs/architecture.md](docs/architecture.md)
- [docs/migration_ahk_v2.md](docs/migration_ahk_v2.md)
- [docs/manual_test_checklist.md](docs/manual_test_checklist.md)

## Working principles

- Keep credit visible.
- Keep the documentation plain and useful.
- Do not add Windows 10 as a support goal.
- Do not preserve AutoHotkey v1 compatibility as a target unless explicitly requested.
- Make small, reviewable changes.
- Separate documentation changes from runtime changes.
- Do not claim runtime success without a Windows 11 manual test.

## Credits

This project descends from the original `windows-desktop-switcher` work. Thank you to the people who created and shared it. Their work gave this project a starting point.
