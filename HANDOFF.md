# HANDOFF.md

## Current frame

WDS 1.0 is a Windows 11 only AutoHotkey v2 project.

Current runtime candidate:

- `desktop_switcher.ahk`
- `user_config.ahk`
- `VirtualDesktopAccessor.dll`

Legacy reference:

- `legacy/v1/desktop_switcher.ahk`
- `legacy/v1/user_config.ahk`

The old code is preserved for behavior reference. It is not the target
architecture.

## Most important correction

Older notes may describe AutoHotkey v1 compatibility, Windows 10 validation, or
AutoHotkey v2 as optional. Treat those notes as stale.

Current truth:

```text
Windows 11 only.
AutoHotkey v2 target.
desktop_switcher.ahk is the v2 runtime candidate.
Sandbox startup smoke test passed with portable AutoHotkey 2.0.25.
Manual Windows 11 testing is still required.
```

## Latest verification

Date: 2026-04-26

Sandbox smoke test:

- Used `C:\CD\AutoHotkey_2.0.25.zip`.
- Ran portable `AutoHotkey64.exe`.
- Confirmed AutoHotkey version: `2.0.25`.
- Started `desktop_switcher.ahk`.
- The script stayed resident for a short startup check and was then stopped.
- No AutoHotkey v2 startup error was observed in this sandbox run.

This confirms only basic AutoHotkey v2 startup in the current sandbox. It does
not confirm Windows 11 virtual desktop behavior.

## Next useful work

1. Run `desktop_switcher.ahk` with AutoHotkey v2 on Windows 11.
2. Fill in `docs/manual_test_checklist.md`.
3. Fix any startup, DLL, registry, hotkey, or window movement issue found.
4. Update `STATUS.md`, `TASKS.md`, and `CHANGELOG.md` with the real test result.
5. Only then update README wording from candidate to confirmed behavior.

## Style

Write calmly and plainly.

Human-first means:

- credit the original project;
- keep notes understandable;
- avoid inflated language;
- mark uncertainty clearly.
