; WDS 1.0 default hotkeys for AutoHotkey v2.
; Edit this file, then reload desktop_switcher.ahk.

; Symbol guide:
; ! = Alt
; + = Shift
; ^ = Ctrl
; # = Win

; Keep CapsLock usable when it is pressed by itself.
CapsLock::SetCapsLockState(GetKeyState("CapsLock", "T") ? "Off" : "On")

; Switch directly to desktops 1-9.
CapsLock & 1::SwitchDesktopByNumber(1)
CapsLock & 2::SwitchDesktopByNumber(2)
CapsLock & 3::SwitchDesktopByNumber(3)
CapsLock & 4::SwitchDesktopByNumber(4)
CapsLock & 5::SwitchDesktopByNumber(5)
CapsLock & 6::SwitchDesktopByNumber(6)
CapsLock & 7::SwitchDesktopByNumber(7)
CapsLock & 8::SwitchDesktopByNumber(8)
CapsLock & 9::SwitchDesktopByNumber(9)

CapsLock & Numpad1::SwitchDesktopByNumber(1)
CapsLock & Numpad2::SwitchDesktopByNumber(2)
CapsLock & Numpad3::SwitchDesktopByNumber(3)
CapsLock & Numpad4::SwitchDesktopByNumber(4)
CapsLock & Numpad5::SwitchDesktopByNumber(5)
CapsLock & Numpad6::SwitchDesktopByNumber(6)
CapsLock & Numpad7::SwitchDesktopByNumber(7)
CapsLock & Numpad8::SwitchDesktopByNumber(8)
CapsLock & Numpad9::SwitchDesktopByNumber(9)

; Move between desktops.
CapsLock & n::SwitchDesktopToRight()
CapsLock & p::SwitchDesktopToLeft()
CapsLock & s::SwitchDesktopToRight()
CapsLock & a::SwitchDesktopToLeft()
CapsLock & Tab::SwitchDesktopToLastOpened()

; Create and delete desktops.
CapsLock & c::CreateVirtualDesktop()
CapsLock & d::DeleteVirtualDesktop()

; Move the active window to desktops 1-9 and follow it.
CapsLock & q::MoveCurrentWindowToDesktop(1)
CapsLock & w::MoveCurrentWindowToDesktop(2)
CapsLock & e::MoveCurrentWindowToDesktop(3)
CapsLock & r::MoveCurrentWindowToDesktop(4)
CapsLock & t::MoveCurrentWindowToDesktop(5)
CapsLock & y::MoveCurrentWindowToDesktop(6)
CapsLock & u::MoveCurrentWindowToDesktop(7)
CapsLock & i::MoveCurrentWindowToDesktop(8)
CapsLock & o::MoveCurrentWindowToDesktop(9)

CapsLock & Right::MoveCurrentWindowToRightDesktop()
CapsLock & Left::MoveCurrentWindowToLeftDesktop()

; Alternate examples. Uncomment only the lines you want to use.
; ^!1::SwitchDesktopByNumber(1)
; ^!2::SwitchDesktopByNumber(2)
; ^!3::SwitchDesktopByNumber(3)
; ^!4::SwitchDesktopByNumber(4)
; ^!5::SwitchDesktopByNumber(5)
; ^!6::SwitchDesktopByNumber(6)
; ^!7::SwitchDesktopByNumber(7)
; ^!8::SwitchDesktopByNumber(8)
; ^!9::SwitchDesktopByNumber(9)

; ^!n::SwitchDesktopToRight()
; ^!p::SwitchDesktopToLeft()
; ^!s::SwitchDesktopToRight()
; ^!a::SwitchDesktopToLeft()
; ^!Tab::SwitchDesktopToLastOpened()

; ^!c::CreateVirtualDesktop()
; ^!d::DeleteVirtualDesktop()

; ^#1::MoveCurrentWindowToDesktop(1)
; ^#2::MoveCurrentWindowToDesktop(2)
; ^#3::MoveCurrentWindowToDesktop(3)
; ^#4::MoveCurrentWindowToDesktop(4)
; ^#5::MoveCurrentWindowToDesktop(5)
; ^#6::MoveCurrentWindowToDesktop(6)
; ^#7::MoveCurrentWindowToDesktop(7)
; ^#8::MoveCurrentWindowToDesktop(8)
; ^#9::MoveCurrentWindowToDesktop(9)

; ^#Right::MoveCurrentWindowToRightDesktop()
; ^#Left::MoveCurrentWindowToLeftDesktop()
; ^#+Right::MoveCurrentWindowToRightDesktop()
; ^#+Left::MoveCurrentWindowToLeftDesktop()
