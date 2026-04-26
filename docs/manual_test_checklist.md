# Manual test checklist

Target environment: Windows 11 + AutoHotkey v2.

Do not use this checklist for Windows 10 validation. Windows 10 is outside the project scope.

## Environment

- [ ] Windows 11 version/build recorded:
- [ ] AutoHotkey v2 version recorded:
- [ ] Script entrypoint recorded:
- [ ] Test date recorded:
- [ ] Tester recorded:
- [ ] Number of monitors recorded:
- [ ] Elevation mode recorded: normal / administrator

## Startup

- [ ] Script starts with AutoHotkey v2.
  - Expected:
  - Actual:
  - Pass/fail:
- [ ] Script does not require AutoHotkey v1.
  - Expected:
  - Actual:
  - Pass/fail:
- [ ] Tray/startup behavior is understandable.
  - Expected:
  - Actual:
  - Pass/fail:

## Desktop switching

- [ ] Switch directly to desktop 1.
  - Expected:
  - Actual:
  - Pass/fail:
- [ ] Switch directly to desktop 2.
  - Expected:
  - Actual:
  - Pass/fail:
- [ ] Switch directly to desktops 3-9 where available.
  - Expected:
  - Actual:
  - Pass/fail:
- [ ] Switch left.
  - Expected:
  - Actual:
  - Pass/fail:
- [ ] Switch right.
  - Expected:
  - Actual:
  - Pass/fail:
- [ ] Switch to last opened desktop.
  - Expected:
  - Actual:
  - Pass/fail:

## Desktop management

- [ ] Create a desktop.
  - Expected:
  - Actual:
  - Pass/fail:
- [ ] Delete the current desktop.
  - Expected:
  - Actual:
  - Pass/fail:

## Window movement

- [ ] Move the active window to a target desktop.
  - Expected:
  - Actual:
  - Pass/fail:
- [ ] Move the active window left.
  - Expected:
  - Actual:
  - Pass/fail:
- [ ] Move the active window right.
  - Expected:
  - Actual:
  - Pass/fail:
- [ ] Confirm whether the script follows the moved window.
  - Expected:
  - Actual:
  - Pass/fail:

## Keyboard behavior

- [ ] CapsLock shortcut behavior works as intended.
  - Expected:
  - Actual:
  - Pass/fail:
- [ ] CapsLock still behaves normally when not used as a shortcut modifier.
  - Expected:
  - Actual:
  - Pass/fail:
- [ ] Numpad shortcuts work if included in the v2 implementation.
  - Expected:
  - Actual:
  - Pass/fail:

## Elevation

- [ ] Hotkeys work in normal windows.
  - Expected:
  - Actual:
  - Pass/fail:
- [ ] Hotkeys behavior in elevated windows is recorded.
  - Expected:
  - Actual:
  - Pass/fail:

## Failure cases

- [ ] Behavior when required DLL is missing is understandable.
  - Expected:
  - Actual:
  - Pass/fail:
- [ ] Behavior when the desktop state cannot be read is understandable.
  - Expected:
  - Actual:
  - Pass/fail:

## Notes

Record problems here:

```text

```
