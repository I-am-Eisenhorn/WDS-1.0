# Codex Task - Windows 11 AutoHotkey v2 Runtime Review

## Task

Review and improve the WDS 1.0 AutoHotkey v2 runtime candidate.

## Current frame

- Platform: Windows 11 only.
- Main runtime: `desktop_switcher.ahk`.
- Hotkey config: `user_config.ahk`.
- Runtime target: AutoHotkey v2.
- Legacy reference: `legacy/v1/`.
- Fork origin: preserve credit, but do not preserve inherited architecture as a requirement.
- Documentation style: calm, direct, human-first.

## Important rules

1. Do not add Windows 10 as a support target.
2. Do not preserve AutoHotkey v1 compatibility as a target.
3. Treat `legacy/v1/` as behavior reference only.
4. Do not claim v2 runtime success until tested on Windows 11.
5. Preserve upstream credit and license files.
6. Keep changes small and reviewable.
7. Prefer clear runtime fixes over broad rewrites.
8. Mark uncertain behavior as `NEEDS_CONFIRMATION`.

## Read first

- `README.md`
- `STATUS.md`
- `TASKS.md`
- `HANDOFF.md`
- `DECISIONS.md`
- `CODEX.md`
- `docs/v1_behavior_inventory.md`
- `desktop_switcher.ahk`
- `user_config.ahk`
- `legacy/v1/desktop_switcher.ahk`
- `legacy/v1/user_config.ahk`
- `LICENSE.txt`

## Required next pass

Run or prepare the Windows 11 + AutoHotkey v2 manual test and record:

- Windows 11 build;
- AutoHotkey v2 version;
- script entrypoint;
- normal versus administrator mode;
- direct desktop switching result;
- left/right switching result;
- last-desktop switching result;
- create/delete desktop result;
- active-window movement result;
- DLL load result;
- CapsLock behavior result.

## Non-goals

Do not add Windows 10 validation.

Do not restore AutoHotkey v1 syntax into the main runtime.

Do not claim manual tests passed unless they were actually run on Windows 11
with AutoHotkey v2.

## Suggested commit message

```text
migration: review AutoHotkey v2 runtime candidate
```
