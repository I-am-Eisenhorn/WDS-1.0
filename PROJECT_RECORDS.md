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
Current code: AutoHotkey v1.1 reference.
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

- `README.md` — entry point.
- `STATUS.md` — current truth.
- `TASKS.md` — active work.
- `HANDOFF.md` — restart notes.
- `DECISIONS.md` — stable decisions.
- `CODEX.md` — AI-assisted development rules.
- `CHANGELOG.md` — dated changes.

## How to update records

When a project direction changes:

1. Update `STATUS.md`.
2. Update `DECISIONS.md` if the direction should remain stable.
3. Update `TASKS.md` so the next action is clear.
4. Update `HANDOFF.md` so the next session does not restart from old assumptions.
5. Update `README.md` only after the scope is stable enough for readers.

## Rule for stale notes

If a note conflicts with the current frame, update it or mark it obsolete.

Current frame:

```text
WDS-1.0 — Windows 11 only.
Current base — AutoHotkey v1.1.
Target — AutoHotkey v2.
```
