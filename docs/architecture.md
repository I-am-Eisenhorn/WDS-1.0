# Architecture notes

## Current architecture

The current repository is based on an AutoHotkey v1.1 script workflow.

Expected current files:

- `desktop_switcher.ahk` — main script and desktop actions.
- `user_config.ahk` — user-facing hotkey mappings.
- `VirtualDesktopAccessor.dll` — native helper used by the existing implementation.

This architecture is a reference for behavior. It is not the required target structure.

## Target architecture

Target runtime: AutoHotkey v2.
Target platform: Windows 11.

The final structure should make these areas easy to read and test:

- startup and environment checks;
- hotkey registration;
- desktop state access;
- desktop switching;
- window movement;
- configuration;
- debug or troubleshooting output.

A possible structure:

```text
WDS-1.0/
  README.md
  CODEX.md
  STATUS.md
  TASKS.md
  HANDOFF.md
  DECISIONS.md
  desktop_switcher.ahk
  user_config.ahk
  lib/
    desktop_state.ahk
    desktop_switching.ahk
    window_moving.ahk
    registry_desktops.ahk
    debug.ahk
  docs/
    architecture.md
    migration_ahk_v2.md
    manual_test_checklist.md
```

This is a planning structure, not a requirement to rename files immediately.

## Main migration questions

- Should the final v2 entrypoint remain `desktop_switcher.ahk`?
- Should v1 files be replaced, renamed, or kept temporarily during migration?
- Does the current `VirtualDesktopAccessor.dll` work correctly for the Windows 11 target?
- Which hotkeys should remain default in the v2 implementation?
- Which behavior should be simplified instead of ported directly?

## Runtime boundaries

The project should not claim Windows 10 support.

The project should not claim AutoHotkey v1 compatibility as a target.

The project should not claim the v2 implementation works until it has been manually tested on Windows 11.
