# Support

Last updated: 2026-04-26

WDS 1.0 is a small open-source Windows desktop workflow project. Support is
best-effort until the AutoHotkey v2 candidate is manually tested on Windows 11
and the result is recorded.

## Before Asking For Help

Check these first:

1. `README.md` for setup and shortcuts.
2. `STATUS.md` for known unknowns and compatibility state.
3. `TASKS.md` for work that is already planned.
4. `docs/manual_test_checklist.md` for the current validation checklist.

## Useful Support Details

When reporting an issue, include:

- Windows 11 version and build.
- AutoHotkey v2 version.
- Whether the script was run normally or as administrator.
- Whether `desktop_switcher.ahk`, `user_config.ahk`, and `VirtualDesktopAccessor.dll` are in the same folder.
- Which shortcut failed.
- Whether switching desktops works but moving windows does not.
- Whether standalone CapsLock behavior works as expected.
- Any DebugView output, if available.

## Common Checks

- The main script requires AutoHotkey v2.
- The DLL must be next to `desktop_switcher.ahk`.
- Restart the script after editing `user_config.ahk`.
- Run the script as administrator if shortcuts need to work in elevated windows.
- Windows updates can affect virtual desktop helper DLL behavior.

## Compatibility Claims

If a Windows build is not recorded in `STATUS.md`, treat compatibility as
unverified.

A support report that includes a successful manual test can help move a target
from unverified to confirmed.
