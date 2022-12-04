#NoTrayIcon     ; Hide the tray icon
#NoEnv          ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

; Required for getting the default browser.
#Include *i DefaultBrowser.ahk

; Win + F1: Switch to previous desktop
#F1::
Send, #^{Left}
Return

; Win + F2: Switch to next desktop
#F2::
Send, #^{Right}
Return

; Win + Q: Kill current running window, or process
#Q::
WinGetActiveTitle target
WinKill %target%
Return

; Win + T: Run the PowerShell (Windows Terminal)
#T::
Run PowerShell
Return

; Win + Shift + B: Open up the default browser
#+B::
browser := DefaultBrowser()
Run %browser%
Return

; Control + Shift + V: Paste clipboard content to non-enterable fields
^+V::
Send {Raw}%Clipboard%
Return