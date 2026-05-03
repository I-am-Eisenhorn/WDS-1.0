# Handoff — wds-2.0-cc branch

Repository: `I-am-Eisenhorn/WDS-1.0`
Branch: `wds-2.0-cc` (cloned from `origin/docs/windows11-ahk-v2-migration`,
no upstream tracking to that branch — pushes go to `origin/wds-2.0-cc`)
Tip: `044c32c` (pushed to `origin/wds-2.0-cc`)
Handoff date: 2026-05-03
Status: off-host CI sandbox in place; **first run results pending**;
Windows 11 manual test still required separately.

## Branch position

- 28 commits ahead of `master`, 0 behind. The 27 inherited commits are the
  `docs/windows11-ahk-v2-migration` work (v1 → v2 rewrite of
  `desktop_switcher.ahk`, legacy quarantine, doc rewrites). The 28th
  (`044c32c`) is the only new commit on this branch.
- Local `wds-2.0-cc` was created with `--no-track` to avoid accidentally
  pushing back into the migration branch.

## What's new on this branch

`.github/workflows/sandbox-test.yml` — a GitHub Actions workflow that runs
on every push to `wds-2.0-cc` (and on `workflow_dispatch`). Triggers paths:
the .ahk files, the DLL, or the workflow itself.

The workflow runs on a fresh `windows-latest` runner (Microsoft-hosted,
ephemeral Windows Server 2022 VM — never touches the maintainer's machine):

1. **Procurement.** Downloads portable AutoHotkey v2 (pinned to **2.0.18**)
   and Ahk2Exe from `autohotkey.com`. Unzips into `C:\AHK`.
2. **Syntax gate.** `AutoHotkey64.exe /validate desktop_switcher.ahk`. Fails
   the workflow on AHK v2 syntax errors.
3. **Startup gate.** Runs `desktop_switcher.ahk` for ~4s, checks the process
   stays resident, **and** that no `WDS 1.0` error MsgBox is showing
   (catches the `Initialize()` failure path where
   `LoadLibrary("VirtualDesktopAccessor.dll")` fails).
4. **Build product.** Compiles a standalone `desktop_switcher.exe` via
   `Ahk2Exe.exe`, bundles `exe + DLL + user_config.ahk + README.md +
   LICENSE.txt` into `wds-2.0-cc.zip`, uploads as workflow artifact.
5. **Keypress probe (non-gating).** A small isolated AHK script registers
   `Ctrl+Alt+F12`, sends it to itself via `SendInput`, writes
   `HOTKEY_FIRED` or `TIMEOUT_NO_FIRE` to a file. This validates AHK's
   hotkey-fire path *independently of the product code and DLL*. Treated as
   a probe (warning on failure), not a gate, because headless GHA runners
   may not have an interactive desktop session.

Artifacts uploaded on every run:
- `wds-2.0-cc-build` — the bundled product zip.
- `sandbox-logs` — `validate.log`, `startup.*.log`, `hotkey_result.txt`.

## What this CI does NOT validate

The sandbox cannot replace the Windows 11 manual checklist
(`docs/manual_test_checklist.md`). Specifically:

- Real virtual-desktop creation, switching, and deletion. The
  `IVirtualDesktopManager` COM state on a CI runner is empty / single-desktop.
- CapsLock-prefix hotkeys behaving correctly with the user's typing flow.
- DPI / multi-monitor / RDP edge cases.
- Behavior under elevation versus normal user.

`STATUS.md` "Needs confirmation on Windows 11" remains the authoritative
list of items only a real Win 11 desktop can confirm.

## Open questions for next session

1. **First CI run result** — green, red, or partial? If `LoadLibrary` for
   `VirtualDesktopAccessor.dll` fails on Windows Server 2022, the startup
   gate catches it; iterate on the script or the DLL packaging.
2. **AHK pin** — `AHK_VERSION: 2.0.18` is hardcoded in the workflow.
   Maintainer's prior sandbox used 2.0.25; bump if 2.0.18 misbehaves.
3. **Keypress probe behavior on GHA** — if `TIMEOUT_NO_FIRE`, decide
   whether to remove the probe or replace it with a different mechanism
   (e.g., `PostMessage` of `WM_HOTKEY` directly, instead of `SendInput`).
4. **Artifact promotion** — when CI is green and Win 11 manual passes,
   should `wds-2.0-cc.zip` become an attached file on a GitHub Release?
5. **PR `wds-2.0-cc` → `master`** — open after at least one green CI run
   plus one manual Win 11 pass, or earlier as a draft to discuss?

## Resuming next time — opening prompt

```text
We continue WDS-1.0 on branch wds-2.0-cc.
Default branch is master. Read in order:
  README.md
  STATUS.md
  HANDOFF.md
  docs/handoff_wds-2.0-cc.md   ← this file (branch-scoped continuation)
  docs/manual_test_checklist.md

Current task:
[insert one — e.g., "review the latest sandbox-test.yml workflow run on
GitHub Actions and fix the failing step" or "bump AHK_VERSION to 2.0.25
and re-run" or "open a PR wds-2.0-cc → master"]
```

## Known carryover state

- Local clone path: `Z:\claude\ELBRUS\WDS-1.0`.
- Default branch is `master`, NOT `main`.
- `origin/docs/windows11-ahk-v2-migration` still exists on the remote and
  shares all commits up to `44d4188` with `wds-2.0-cc`. Decide whether to
  delete it after `wds-2.0-cc` lands in `master`.
- GitHub Actions UI: <https://github.com/I-am-Eisenhorn/WDS-1.0/actions>.
- Workflow file path: `.github/workflows/sandbox-test.yml`.

## Session log (most recent first)

- 2026-05-03 — added GHA sandbox workflow (commit `044c32c`); pushed,
  triggering the first run automatically.
- 2026-05-03 — created local `wds-2.0-cc` from
  `origin/docs/windows11-ahk-v2-migration` with `--no-track`; pushed to
  `origin/wds-2.0-cc`.
- 2026-05-03 — cloned repo to `Z:\claude\ELBRUS\WDS-1.0` (default branch
  `master`).
