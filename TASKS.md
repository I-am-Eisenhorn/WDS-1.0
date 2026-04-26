# TASKS.md

## Now

- Run the manual checklist on Windows 11 with AutoHotkey v2.
- Record the Windows 11 build and AutoHotkey v2 version.
- Confirm that `VirtualDesktopAccessor.dll` loads correctly.
- Confirm that the v2 hotkeys register correctly.
- Confirm direct desktop switching, left/right switching, and last-desktop switching.
- Confirm create/delete desktop behavior.
- Confirm moving the active window between desktops.
- Record normal versus administrator behavior.

## Next

- Fix any syntax or runtime issue found during the Windows 11 manual test.
- Decide whether any default hotkeys should change after testing.
- Add troubleshooting notes based on real failures, not guesses.
- Decide whether release packaging should remain script-only or include a small bundle.
- Update README quick start only after manual test evidence exists.

## Later

- Consider separating desktop state, switching, and window movement into `lib/`.
- Add release packaging notes.
- Add startup guidance for Windows 11.
- Consider a small debug mode if manual testing shows it would help.

## Blocked until Windows 11 testing

- Compatibility claims.
- Final user quick start.
- Final DLL guidance.
- Final default hotkey claims.
- Packaged release instructions.

## Done

- Project frame clarified:
  - Windows 11 only.
  - Target: AutoHotkey v2.
  - Human-first documentation means clear attribution and practical writing.
- Current v1 behavior inventoried in `docs/v1_behavior_inventory.md`.
- Old v1 runtime preserved under `legacy/v1/`.
- First AutoHotkey v2 runtime candidate added as `desktop_switcher.ahk`.
- First AutoHotkey v2 hotkey config added as `user_config.ahk`.
