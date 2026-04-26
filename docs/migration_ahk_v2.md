# AutoHotkey v2 Migration Notes

## Goal

Move WDS 1.0 from AutoHotkey v1.1 source code to an AutoHotkey v2
implementation for Windows 11.

This is a real migration, not a cosmetic syntax edit.

## Current result

A first AutoHotkey v2 runtime candidate now exists:

- `desktop_switcher.ahk`
- `user_config.ahk`

The old AutoHotkey v1.1 files are preserved under `legacy/v1/`.

## Behavior carried forward

The v2 candidate is intended to carry forward:

- direct desktop switching;
- left and right desktop movement;
- last-desktop switching;
- desktop creation and deletion;
- moving the active window between desktops;
- configurable hotkeys.

See `docs/v1_behavior_inventory.md` for the behavior inventory taken from the
legacy script.

## Migration areas covered in the candidate

### Script header

The main script uses:

```ahk
#Requires AutoHotkey v2.0
#SingleInstance Force
```

### Syntax

The candidate replaces v1 command syntax with v2 function-style calls for:

- registry reads;
- window queries;
- sending Windows desktop shortcuts;
- debug output;
- DLL calls;
- startup errors.

### Hotkeys

`user_config.ahk` has been rewritten as an AutoHotkey v2 hotkey configuration.

The default mappings still use CapsLock combinations, number-row shortcuts,
numpad shortcuts, left/right movement shortcuts, and window movement shortcuts.

Standalone CapsLock behavior is explicitly defined and must be manually tested.

### DLL access

`VirtualDesktopAccessor.dll` is still used in the first v2 candidate.

The script now checks that the DLL exists and that these exports are available:

- `IsWindowOnDesktopNumber`
- `MoveWindowToDesktopNumber`
- `GoToDesktopNumber`

### Registry access

The candidate still maps desktop state through the Windows virtual desktop
registry values. Registry failures are logged through `OutputDebug` and fall
back to conservative defaults.

## Manual testing requirement

Manual tests must be run on Windows 11 with AutoHotkey v2 before the README says
the v2 implementation works.

Use `docs/manual_test_checklist.md`.

## Phase status

- Phase 1 - documentation and inventory: done.
- Phase 2 - v2 skeleton: done as a runtime candidate.
- Phase 3 - hotkeys: candidate added, manual test pending.
- Phase 4 - desktop access: candidate added, manual test pending.
- Phase 5 - window movement: candidate added, manual test pending.
- Phase 6 - cleanup: pending after manual test results.
