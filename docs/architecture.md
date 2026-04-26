# Architecture Notes

## Current architecture

The repository now has a first AutoHotkey v2 runtime candidate.

Current runtime files:

- `desktop_switcher.ahk` - main AutoHotkey v2 script.
- `user_config.ahk` - AutoHotkey v2 hotkey configuration.
- `VirtualDesktopAccessor.dll` - native helper used for desktop/window access.

Legacy reference files:

- `legacy/v1/desktop_switcher.ahk`
- `legacy/v1/user_config.ahk`

The legacy files are behavior references. They are not the required target
structure.

## Runtime areas

The v2 candidate keeps these areas readable in one file for the first product
step:

- startup and environment checks;
- DLL loading and export lookup;
- registry desktop-state mapping;
- desktop switching;
- foremost-window focus after switching;
- active-window movement;
- desktop creation and deletion;
- hotkey registration through `user_config.ahk`.

## Current flow

```text
desktop_switcher.ahk
  -> checks AutoHotkey v2
  -> loads VirtualDesktopAccessor.dll
  -> maps current desktop state from the Windows registry
  -> includes user_config.ahk
  -> hotkeys call desktop/window functions
```

## Possible later structure

The project may split runtime logic after the v2 candidate is manually tested:

```text
WDS-1.0/
  desktop_switcher.ahk
  user_config.ahk
  lib/
    desktop_state.ahk
    desktop_switching.ahk
    window_moving.ahk
    registry_desktops.ahk
    debug.ahk
```

Do not split files before it helps maintenance or testing.

## Main migration questions

- Does the current `VirtualDesktopAccessor.dll` work correctly on the Windows 11 target?
- Are the default CapsLock hotkeys comfortable after real use?
- Does standalone CapsLock behavior work as intended with custom combinations?
- Should release packaging remain script-only or include a small bundle?
- Which runtime functions should move to `lib/` after the first manual test?

## Runtime boundaries

The project should not claim Windows 10 support.

The project should not claim AutoHotkey v1 compatibility as a target.

The project should not claim the v2 implementation works until it has been
manually tested on Windows 11.
