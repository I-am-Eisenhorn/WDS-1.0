# AutoHotkey v1 Behavior Inventory

This inventory records behavior from the legacy AutoHotkey v1.1 files preserved
under `legacy/v1/`.

It is a migration reference, not a compatibility promise.

## Legacy files read

- `legacy/v1/desktop_switcher.ahk`
- `legacy/v1/user_config.ahk`

## Runtime behavior

The legacy script provided these actions:

- Map the current virtual desktop through Windows registry values.
- Load `VirtualDesktopAccessor.dll`.
- Resolve `IsWindowOnDesktopNumber`.
- Resolve `MoveWindowToDesktopNumber`.
- Resolve `GoToDesktopNumber`.
- Switch directly to a target desktop number.
- Switch to the previous/last opened desktop.
- Switch to the desktop on the right, wrapping to desktop 1.
- Switch to the desktop on the left, wrapping to the last desktop.
- Focus the foremost non-minimized window after switching.
- Move the active window to a target desktop and follow it.
- Move the active window to the desktop on the right and follow it.
- Move the active window to the desktop on the left and follow it.
- Create a virtual desktop through the Windows shortcut.
- Delete the current virtual desktop through the Windows shortcut.

## Default legacy hotkeys

Direct switching:

```text
CapsLock + 1..9
CapsLock + Numpad1..Numpad9
```

Move between desktops:

```text
CapsLock + n -> right
CapsLock + p -> left
CapsLock + s -> right
CapsLock + a -> left
CapsLock + Tab -> last opened desktop
```

Desktop management:

```text
CapsLock + c -> create desktop
CapsLock + d -> delete desktop
```

Move active window:

```text
CapsLock + q..o -> move active window to desktops 1..9
CapsLock + Right -> move active window right
CapsLock + Left -> move active window left
```

## Items needing Windows 11 confirmation

- Registry values and data shape on the target Windows 11 build.
- DLL compatibility with the target Windows 11 build.
- Whether focus restoration behaves correctly after switching.
- Whether CapsLock custom-combination behavior is acceptable.
- Whether elevated windows require running the script as administrator.
