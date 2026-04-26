#Requires AutoHotkey v2.0
#SingleInstance Force
#Warn

SetWorkingDir(A_ScriptDir)
SetKeyDelay(75)

DesktopCount := 1
CurrentDesktop := 1
LastOpenedDesktop := 1
DesktopAccessor := ""

Initialize()

Initialize() {
    global DesktopAccessor, DesktopCount, CurrentDesktop

    try {
        DesktopAccessor := VirtualDesktopAccessor(A_ScriptDir "\VirtualDesktopAccessor.dll")
        MapDesktopsFromRegistry()
        OutputDebug(Format("[loading] desktops: {} current: {}", DesktopCount, CurrentDesktop))
    } catch as error {
        MsgBox("WDS 1.0 could not start.`n`n" error.Message, "WDS 1.0")
        ExitApp(1)
    }
}

class VirtualDesktopAccessor {
    __New(path) {
        if !FileExist(path) {
            throw Error("Missing VirtualDesktopAccessor.dll at " path)
        }

        this.Handle := DllCall("LoadLibrary", "Str", path, "Ptr")
        if !this.Handle {
            throw Error("Unable to load VirtualDesktopAccessor.dll. LastError: " A_LastError)
        }

        this.IsWindowOnDesktopNumber := this.GetProcAddress("IsWindowOnDesktopNumber")
        this.MoveWindowToDesktopNumber := this.GetProcAddress("MoveWindowToDesktopNumber")
        this.GoToDesktopNumber := this.GetProcAddress("GoToDesktopNumber")
    }

    GetProcAddress(name) {
        proc := DllCall("GetProcAddress", "Ptr", this.Handle, "AStr", name, "Ptr")
        if !proc {
            throw Error("VirtualDesktopAccessor.dll does not export " name)
        }
        return proc
    }
}

MapDesktopsFromRegistry() {
    global CurrentDesktop, DesktopCount

    idLength := 32
    sessionId := GetSessionId()
    currentDesktopId := ""

    if sessionId {
        currentDesktopId := RegReadSafe(
            "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VirtualDesktops",
            "CurrentVirtualDesktop",
            ""
        )

        if !currentDesktopId {
            currentDesktopId := RegReadSafe(
                "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\" sessionId "\VirtualDesktops",
                "CurrentVirtualDesktop",
                ""
            )
        }

        if currentDesktopId {
            idLength := StrLen(currentDesktopId)
        }
    }

    desktopList := RegReadSafe(
        "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VirtualDesktops",
        "VirtualDesktopIDs",
        ""
    )

    DesktopCount := desktopList ? Max(1, Floor(StrLen(desktopList) / idLength)) : 1

    i := 0
    while currentDesktopId && desktopList && i < DesktopCount {
        startPos := (i * idLength) + 1
        desktopId := SubStr(desktopList, startPos, idLength)

        if desktopId == currentDesktopId {
            CurrentDesktop := i + 1
            OutputDebug(Format("[desktop-map] current: {} id: {}", CurrentDesktop, desktopId))
            break
        }

        i += 1
    }
}

RegReadSafe(keyName, valueName, defaultValue := "") {
    try {
        return RegRead(keyName, valueName, defaultValue)
    } catch as error {
        OutputDebug("[registry] failed: " keyName " / " valueName " (" error.Message ")")
        return defaultValue
    }
}

GetSessionId() {
    try {
        processId := DllCall("GetCurrentProcessId", "UInt")
        sessionId := 0
        ok := DllCall("ProcessIdToSessionId", "UInt", processId, "UInt*", &sessionId, "Int")

        if !ok {
            OutputDebug("[session] ProcessIdToSessionId failed. LastError: " A_LastError)
            return 0
        }

        OutputDebug(Format("[session] process: {} session: {}", processId, sessionId))
        return sessionId
    } catch as error {
        OutputDebug("[session] failed: " error.Message)
        return 0
    }
}

UpdateGlobalVariables() {
    MapDesktopsFromRegistry()
}

SwitchDesktopByNumber(targetDesktop) {
    UpdateGlobalVariables()
    SwitchDesktopToTarget(targetDesktop)
}

SwitchDesktopToLastOpened() {
    global LastOpenedDesktop

    UpdateGlobalVariables()
    SwitchDesktopToTarget(LastOpenedDesktop)
}

SwitchDesktopToRight() {
    global CurrentDesktop, DesktopCount

    UpdateGlobalVariables()
    SwitchDesktopToTarget(CurrentDesktop == DesktopCount ? 1 : CurrentDesktop + 1)
}

SwitchDesktopToLeft() {
    global CurrentDesktop, DesktopCount

    UpdateGlobalVariables()
    SwitchDesktopToTarget(CurrentDesktop == 1 ? DesktopCount : CurrentDesktop - 1)
}

SwitchDesktopToTarget(targetDesktop) {
    global CurrentDesktop, DesktopCount, LastOpenedDesktop, DesktopAccessor

    if targetDesktop > DesktopCount || targetDesktop < 1 || targetDesktop == CurrentDesktop {
        OutputDebug(Format("[invalid-switch] target: {} current: {} count: {}", targetDesktop, CurrentDesktop, DesktopCount))
        return
    }

    previousDesktop := CurrentDesktop
    LastOpenedDesktop := previousDesktop

    taskbarHwnd := DllCall("FindWindow", "Str", "Shell_TrayWnd", "Ptr", 0, "Ptr")
    if taskbarHwnd {
        DllCall("SetForegroundWindow", "Ptr", taskbarHwnd, "Int")
    }

    DllCall(DesktopAccessor.GoToDesktopNumber, "Int", targetDesktop - 1, "Int")
    CurrentDesktop := targetDesktop
    FocusTheForemostWindow(targetDesktop)
}

FocusTheForemostWindow(targetDesktop) {
    foremostWindowId := GetForemostWindowIdOnDesktop(targetDesktop)
    if foremostWindowId && IsWindowNonMinimized(foremostWindowId) {
        DllCall("SetForegroundWindow", "Ptr", foremostWindowId, "Int")
    }
}

IsWindowNonMinimized(windowId) {
    try {
        return WinGetMinMax("ahk_id " windowId) != -1
    } catch {
        return false
    }
}

GetForemostWindowIdOnDesktop(desktopNumber) {
    global DesktopAccessor

    desktopIndex := desktopNumber - 1

    try {
        for windowId in WinGetList() {
            isOnDesktop := DllCall(
                DesktopAccessor.IsWindowOnDesktopNumber,
                "Ptr", windowId,
                "UInt", desktopIndex,
                "Int"
            )

            if isOnDesktop == 1 {
                return windowId
            }
        }
    } catch as error {
        OutputDebug("[window-scan] failed: " error.Message)
    }

    return 0
}

MoveCurrentWindowToDesktop(desktopNumber) {
    UpdateGlobalVariables()

    if MoveActiveWindowToDesktopNumber(desktopNumber) {
        SwitchDesktopToTarget(desktopNumber)
    }
}

MoveCurrentWindowToRightDesktop() {
    global CurrentDesktop, DesktopCount

    UpdateGlobalVariables()
    targetDesktop := CurrentDesktop == DesktopCount ? 1 : CurrentDesktop + 1
    MoveCurrentWindowToDesktop(targetDesktop)
}

MoveCurrentWindowToLeftDesktop() {
    global CurrentDesktop, DesktopCount

    UpdateGlobalVariables()
    targetDesktop := CurrentDesktop == 1 ? DesktopCount : CurrentDesktop - 1
    MoveCurrentWindowToDesktop(targetDesktop)
}

MoveActiveWindowToDesktopNumber(desktopNumber) {
    global DesktopCount, DesktopAccessor

    if desktopNumber < 1 || desktopNumber > DesktopCount {
        OutputDebug(Format("[invalid-move] target: {} count: {}", desktopNumber, DesktopCount))
        return false
    }

    try {
        activeHwnd := WinGetID("A")
        DllCall(
            DesktopAccessor.MoveWindowToDesktopNumber,
            "Ptr", activeHwnd,
            "UInt", desktopNumber - 1,
            "Int"
        )
        return true
    } catch as error {
        OutputDebug("[move-window] failed: " error.Message)
        return false
    }
}

CreateVirtualDesktop() {
    global DesktopCount, CurrentDesktop, LastOpenedDesktop

    UpdateGlobalVariables()
    LastOpenedDesktop := CurrentDesktop
    Send("#^d")
    Sleep(200)
    MapDesktopsFromRegistry()

    OutputDebug(Format("[create] desktops: {} current: {}", DesktopCount, CurrentDesktop))
}

DeleteVirtualDesktop() {
    global CurrentDesktop, DesktopCount, LastOpenedDesktop

    UpdateGlobalVariables()

    if DesktopCount <= 1 {
        OutputDebug("[delete] skipped because only one desktop is known")
        return
    }

    Send("#^{F4}")
    Sleep(200)

    if LastOpenedDesktop >= CurrentDesktop {
        LastOpenedDesktop := Max(1, LastOpenedDesktop - 1)
    }

    MapDesktopsFromRegistry()
    OutputDebug(Format("[delete] desktops: {} current: {}", DesktopCount, CurrentDesktop))
}

#Include user_config.ahk
