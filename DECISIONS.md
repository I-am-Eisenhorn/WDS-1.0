# DECISIONS.md

## D001 - Windows 11 only

Decision: WDS 1.0 supports Windows 11 only.

Reason: The project is being shaped around the current maintainer goal, not a
broad compatibility matrix.

Impact:

- Do not add Windows 10 as a support target.
- Do not build a Windows 10 manual test checklist unless explicitly requested.
- Documentation should mention Windows 11 only.

## D002 - AutoHotkey v2 target

Decision: WDS 1.0 targets AutoHotkey v2.

Reason: The existing codebase began as AutoHotkey v1.1, but the product goal is
AutoHotkey v2.

Impact:

- AutoHotkey v1 compatibility is not a target.
- AutoHotkey v1 code is a reference for behavior.
- New runtime code should use AutoHotkey v2 syntax.

## D003 - Fork origin is attribution, not constraint

Decision: The fork origin remains visible, but inherited architecture is not
binding.

Reason: The project is grateful for the original work while moving
independently.

Impact:

- Preserve credit.
- Do not erase provenance.
- Do not keep old structure only because it was inherited.

## D004 - Documentation tone

Decision: Documentation should be calm, direct, and human-first.

Reason: The project should be easy to understand without promotional language.

Impact:

- Avoid inflated claims.
- Avoid special ceremonial wording.
- Keep notes useful for people and for Codex.

## D005 - Runtime claims require Windows 11 testing

Decision: Runtime success claims require real Windows 11 manual testing.

Reason: AutoHotkey desktop automation depends on OS behavior, hotkeys,
elevation, and native helper compatibility.

Impact:

- If not tested, say not tested.
- Keep unverified items in `STATUS.md` or `TASKS.md`.

## D006 - Main entrypoint is the AutoHotkey v2 candidate

Decision: `desktop_switcher.ahk` is now the main AutoHotkey v2 runtime
candidate.

Reason: The project is moving from migration planning into a working v2 product
candidate while keeping the old implementation available for reference.

Impact:

- Keep the old AutoHotkey v1.1 files under `legacy/v1/`.
- Keep `user_config.ahk` aligned with AutoHotkey v2 syntax.
- Do not restore v1 syntax into the main entrypoint.
