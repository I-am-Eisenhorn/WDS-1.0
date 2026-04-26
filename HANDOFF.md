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
Manual Windows 11 testing is still required.
```

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
