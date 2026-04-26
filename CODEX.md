# CODEX.md

Instructions for AI-assisted work on WDS 1.0.

## Current project frame

WDS 1.0 is a Windows 11 only AutoHotkey v2 project.

Current source state:

- `desktop_switcher.ahk` is the main AutoHotkey v2 runtime candidate.
- `user_config.ahk` is the AutoHotkey v2 hotkey configuration.
- `legacy/v1/` preserves the old AutoHotkey v1.1 implementation for behavior reference.

Target state:

- Windows 11 only.
- AutoHotkey v2.
- Small, clear, maintainable desktop workflow script.
- Runtime claims backed by manual Windows 11 test evidence.

Documentation style:

- calm;
- direct;
- human-first;
- no marketing tone;
- credit preserved without making fork history a technical limitation.

## Read first

Before editing runtime code, read:

1. `README.md`
2. `STATUS.md`
3. `TASKS.md`
4. `HANDOFF.md`
5. `DECISIONS.md`
6. `docs/v1_behavior_inventory.md`
7. `desktop_switcher.ahk`
8. `user_config.ahk`
9. `legacy/v1/desktop_switcher.ahk`
10. `legacy/v1/user_config.ahk`
11. `LICENSE.txt`

If a file listed here is missing, document that fact before making assumptions.

## Main rule

Do not optimize for preserving the old AutoHotkey v1 architecture. Optimize for
a clean AutoHotkey v2 implementation for Windows 11.

The old implementation is useful because it shows expected behavior and existing
shortcuts. It is not binding.

## Allowed direction

Codex may propose or implement:

- AutoHotkey v2 syntax fixes;
- new file organization;
- clearer function names;
- stricter startup checks;
- Windows 11 focused manual tests;
- simpler configuration;
- safer DLL loading if the project still needs `VirtualDesktopAccessor.dll`;
- replacing inherited implementation details when the replacement is clearer.

## Not a goal

Do not add these as project goals unless the maintainer explicitly changes
direction:

- Windows 10 support;
- AutoHotkey v1 compatibility;
- preserving every old function name;
- preserving old structure for its own sake;
- broad marketing language;
- unsupported claims about compatibility.

## Human-first rule

Keep attribution. Do not erase the fork origin. Do not imply that inherited work
was created here.

At the same time, do not treat the fork as a cage. The project is free to move
in its own direction.

## Runtime migration rules

When changing AutoHotkey code:

- Keep `#Requires AutoHotkey v2.0` in v2 scripts.
- Replace v1 command syntax with v2 function calls.
- Replace legacy assignment and percent-style variable references.
- Handle startup and DLL errors explicitly.
- Check each `DllCall` signature carefully.
- Check registry reads and writes carefully.
- Keep hotkey behavior readable.
- Do not mix v1 and v2 syntax in the main runtime candidate.
- Preserve v1 reference files under `legacy/v1/` unless explicitly told to remove them.

## Testing rule

Manual tests are Windows 11 only.

Do not write "tested" unless the test was actually run. If the environment
cannot run Windows 11 and AutoHotkey v2, say so plainly.

## Preferred branch names

Use clear branch names such as:

```text
docs/windows11-ahk-v2-scope
refactor/ahk-v2-entrypoint
migration/ahk-v2-hotkeys
migration/ahk-v2-desktop-access
```

## Preferred commit style

Examples:

```text
docs: align project scope with Windows 11 and AHK v2
migration: add AutoHotkey v2 entrypoint
migration: port desktop switching helpers to AHK v2
```

## Output expectation

For every task, summarize:

- what changed;
- why it changed;
- files changed;
- whether runtime behavior changed;
- what was not tested.
