# Codex task — Windows 11 AutoHotkey v2 migration preparation

## Task

Prepare WDS 1.0 for a Windows 11 only AutoHotkey v2 migration.

## Current frame

- Platform: Windows 11 only.
- Current source base: AutoHotkey v1.1.
- Target runtime: AutoHotkey v2.
- Fork origin: preserve credit, but do not preserve inherited architecture as a requirement.
- Documentation style: calm, direct, human-first.

## Important rules

1. Do not add Windows 10 as a support target.
2. Do not preserve AutoHotkey v1 compatibility as a target.
3. Treat current v1 code as behavior reference.
4. Do not claim v2 runtime success until tested on Windows 11.
5. Preserve upstream credit and license files.
6. Keep changes small and reviewable.
7. Prefer clear migration notes over broad rewrites.
8. Mark uncertain behavior as `NEEDS_CONFIRMATION`.

## Read first

- `README.md`
- `STATUS.md`
- `TASKS.md`
- `HANDOFF.md`
- `DECISIONS.md`
- `CODEX.md`
- `desktop_switcher.ahk`
- `user_config.ahk`
- `LICENSE.txt`

## Required first pass

Update or create project documentation so that it reflects:

- Windows 11 only;
- current AutoHotkey v1.1 base;
- target AutoHotkey v2 migration;
- human-first attribution without promotional language;
- no Windows 10 compatibility target;
- no AutoHotkey v1 compatibility target.

## Suggested files

- `README.md`
- `CODEX.md`
- `STATUS.md`
- `TASKS.md`
- `HANDOFF.md`
- `DECISIONS.md`
- `PROJECT_RECORDS.md`
- `HUMAN_FIRST.md`
- `docs/migration_ahk_v2.md`
- `docs/manual_test_checklist.md`

## Non-goals for this first pass

Do not rewrite runtime code in the documentation pass.

Do not rename runtime files unless a separate migration task is explicitly started.

Do not claim manual tests passed unless they were actually run on Windows 11 with AutoHotkey v2.

## Suggested commit message

```text
docs: align project with Windows 11 and AutoHotkey v2 migration
```
