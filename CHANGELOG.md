# CHANGELOG.md

## 2026-04-26

Runtime migration candidate added:

- Added AutoHotkey v2 `desktop_switcher.ahk` as the main entrypoint.
- Added AutoHotkey v2 `user_config.ahk` as the default hotkey configuration.
- Preserved the old AutoHotkey v1.1 files under `legacy/v1/`.
- Added a v1 behavior inventory for migration review.
- Updated project records to mark the v2 runtime as a candidate, not a tested release.

Still not done:

- Windows 11 + AutoHotkey v2 manual test.
- Final compatibility claims.
- Final release packaging guidance.

Earlier documentation alignment:

- Windows 11 only.
- Target runtime: AutoHotkey v2.
- Human-first documentation as clear attribution and practical writing.
- Fork origin preserved without treating inherited architecture as binding.
