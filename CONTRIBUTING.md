# Contributing

Last updated: 2026-04-26

Thanks for helping improve WDS 1.0.

This project is small on purpose. Good contributions keep it easy to run, easy
to inspect, and easy to recover if a Windows update changes virtual desktop
behavior.

## Before Changing Code

Read these first:

1. `README.md`
2. `STATUS.md`
3. `TASKS.md`
4. `DECISIONS.md`
5. `CODEX.md`

Check whether the work is already listed, blocked, or out of scope.

## Good First Contributions

- Run the current AutoHotkey v2 candidate on a specific Windows 11 build.
- Record a clear manual test result in `docs/manual_test_checklist.md`.
- Fix a focused AutoHotkey v2 syntax or runtime issue.
- Clarify `VirtualDesktopAccessor.dll` source and compatibility.
- Improve setup instructions without overclaiming behavior.

## Code Guidelines

- Keep the main runtime in AutoHotkey v2 syntax.
- Keep shortcut mappings in `user_config.ahk`.
- Keep runtime behavior in `desktop_switcher.ahk` unless a split to `lib/` is intentional.
- Keep legacy AutoHotkey v1 files under `legacy/v1/` for reference.
- Avoid broad rewrites until the current v2 candidate is manually tested.
- Do not add installer, UI, or packaging work in the same change as shortcut logic.

## Documentation Guidelines

Use `PROJECT_RECORDS.md` as the style contract.

In short:

- Start with active truth.
- Date status-changing notes.
- Mark unknowns clearly.
- Do not overclaim compatibility.
- Keep historical context separate from current state.

## Test Notes

A useful test report includes:

- Windows version and build.
- AutoHotkey version.
- Whether the script was run normally or as administrator.
- Which shortcuts were tested.
- Whether `VirtualDesktopAccessor.dll` worked for switching and moving windows.
- Any error messages or debug output.

## Pull Request Shape

Keep pull requests focused:

- One behavior change per PR.
- Documentation-only changes should not touch `.ahk` or `.dll` files.
- Compatibility claims should include test evidence.
