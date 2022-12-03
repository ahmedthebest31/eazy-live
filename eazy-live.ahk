; © Copyright(C) All rights reserved.
; This script is written by Mohamed Noordin.

#Include  *i GST.ahk ; For getting selected text

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

; Win + Control + V to increase volume
#^V::
Send {Volume_Up}
return

; Win + Shift + V to decrease volume
#+V::
Send {Volume_Down}
return

break::
Send {Volume_Mute}
return
