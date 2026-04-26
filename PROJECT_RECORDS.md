# PROJECT_RECORDS.md

## Purpose

Project records keep the work understandable between sessions.

Use them to preserve decisions, current state, open work, and restart context.

## Writing style

Use plain language.

Prefer:

```text
Windows 11 only.
Target runtime: AutoHotkey v2.
Current runtime: v2 candidate.
Legacy reference: legacy/v1/.
Manual test: pending.
```

Avoid:

```text
Revolutionary productivity platform.
Production-ready across Windows versions.
Seamless next-generation experience.
```

## Human-first documentation

Human-first means:

- people can understand the project quickly;
- original authors receive credit;
- uncertainty is marked clearly;
- documents help maintenance rather than impress readers.

## Required project records

- `README.md` - entry point.
- `STATUS.md` - current truth.
- `TASKS.md` - active work.
- `HANDOFF.md` - restart notes.
- `DECISIONS.md` - stable decisions.
- `CODEX.md` - AI-assisted development rules.
- `CHANGELOG.md` - dated changes.

## How to update records

When a project direction changes:

1. Update `STATUS.md`.
2. Update `DECISIONS.md` if the direction should remain stable.
3. Update `TASKS.md` so the next action is clear.
4. Update `HANDOFF.md` so the next session does not restart from old assumptions.
5. Update `README.md` only after the scope is stable enough for readers.

When runtime behavior changes:

1. Update `docs/v1_behavior_inventory.md` only if legacy-reference facts change.
2. Update `docs/migration_ahk_v2.md` with the migration status.
3. Do not mark behavior as tested unless the manual checklist was actually run.

## Rule for stale notes

If a note conflicts with the current frame, update it or mark it obsolete.

Current frame:

```text
WDS 1.0 - Windows 11 only.
Runtime target - AutoHotkey v2.
Main entrypoint - desktop_switcher.ahk.
Current runtime - AutoHotkey v2 candidate.
Legacy reference - legacy/v1/.
Manual Windows 11 test - pending.
```
