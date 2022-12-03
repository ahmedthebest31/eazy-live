
#NoTrayIcon     ; Hide the tray icon

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
Send, !{F4}
Return

; Win + T: Run the PowerShell (Windows Terminal)
#T::
Run PowerShell
Return

#Z::
    Run Chrome
Return


#NoEnv          ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

^+v::Send {Raw}%Clipboard%
