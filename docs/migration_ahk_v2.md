# AutoHotkey v2 migration notes

## Goal

Move WDS 1.0 from AutoHotkey v1.1 source code to an AutoHotkey v2 implementation for Windows 11.

This is a real migration, not a cosmetic syntax edit.

## Current reference

The current v1 files show useful behavior:

- direct desktop switching;
- left and right desktop movement;
- last-desktop switching;
- desktop creation and deletion;
- moving the active window between desktops;
- configurable hotkeys.

The v2 version may keep this behavior while changing implementation structure.

## v2 migration areas

### Script header

Use:

```ahk
#Requires AutoHotkey v2.0
#SingleInstance Force
```

Remove v1-only directives that are obsolete in v2.

### Syntax

Convert v1 legacy patterns to v2 expression-first patterns:

- assignment with `:=`;
- function calls instead of command syntax;
- quoted strings where v2 expects expressions;
- no percent wrapping for normal variable references;
- explicit return values where old commands used output variables.

### Hotkeys

Review all hotkeys from `user_config.ahk`.

Check:

- CapsLock modifier behavior;
- number row hotkeys;
- numpad hotkeys;
- left/right movement hotkeys;
- window movement hotkeys;
- whether hotkeys should be data-driven in v2.

### DLL access

Review every `DllCall`.

Check:

- function names;
- argument types;
- return types;
- pointer handling;
- error behavior;
- whether `VirtualDesktopAccessor.dll` is still the right helper for Windows 11.

### Registry access

Review registry reads used for virtual desktop state.

Check:

- Windows 11 registry paths;
- error handling when keys are missing;
- how state is refreshed after desktop changes.

### Errors

Prefer explicit error handling.

AutoHotkey v2 functions may throw exceptions where v1 code used `ErrorLevel` or loose command behavior.

## Suggested migration phases

### Phase 1 — documentation and inventory

- Align MD files with Windows 11 + AHK v2 scope.
- List current functions and hotkeys.
- Mark behavior that needs confirmation.

### Phase 2 — v2 skeleton

- Add a minimal v2 entrypoint.
- Add startup checks.
- Add a visible message or tray note only if useful.
- Do not claim feature parity.

### Phase 3 — hotkeys

- Port hotkey registration.
- Keep config readable.
- Test CapsLock behavior on Windows 11.

### Phase 4 — desktop access

- Port state reading.
- Port switching.
- Port last-desktop tracking.

### Phase 5 — window movement

- Port active-window movement.
- Test with normal and elevated windows.

### Phase 6 — cleanup

- Remove stale v1 instructions.
- Update quick start.
- Update troubleshooting after real test results.

## Manual testing requirement

Manual tests must be run on Windows 11 with AutoHotkey v2 before the README says the v2 implementation works.
