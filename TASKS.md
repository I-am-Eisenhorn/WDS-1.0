# TASKS.md

## Now

- Replace stale documentation that treats AutoHotkey v1 compatibility as a goal.
- Replace stale documentation that includes Windows 10 as a validation target.
- Document the project as Windows 11 only.
- Document AutoHotkey v2 as the target runtime.
- Keep fork credit visible and simple.

## Next

- Inventory current v1 behavior from `desktop_switcher.ahk` and `user_config.ahk`.
- Create a small AutoHotkey v2 migration map.
- Decide target entrypoint name.
- Decide whether `VirtualDesktopAccessor.dll` remains part of the first v2 implementation.
- Draft a v2 skeleton with no behavior change claims.
- Port hotkey definitions to v2.
- Port desktop switching functions to v2.
- Port window moving functions to v2.
- Port registry access and state detection to v2.
- Create a Windows 11 manual test pass.

## Later

- Simplify configuration.
- Add startup guidance for Windows 11.
- Add release packaging notes.
- Add troubleshooting notes after real Windows 11 testing.
- Consider separating library logic from user hotkey configuration.

## Blocked until Windows 11 testing

- Compatibility claims.
- Final user quick start.
- Final DLL guidance.
- Final default hotkey claims.
- Packaged release instructions.

## Done

- Project frame clarified:
  - Windows 11 only.
  - Current base: AutoHotkey v1.1.
  - Target: AutoHotkey v2.
  - Human-first documentation means clear attribution, not promotional tone.
