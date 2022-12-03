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

; Win + S: Open up default browser
#S::
browser := DefaultBrowser()
Run %browser%
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

; Select some text then press Control + Shift + F1 to speak
^+F1::
ComObjCreate("SAPI.SpVoice").Speak(gst())
Return

; Win + Shift + C search for clipboard text on Google search
#+C::
Send, ^C
Sleep 50
Run, https://www.google.com/search?q=%clipboard%
Return

; Win + Shift + X search for selected text on Google search
#+X::
st := gst()
Run, https://www.google.com/search?q=%st%
Return




DefaultBrowser() {
	; Find the Registry key name for the default browser
	RegRead, BrowserKeyName, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.html\UserChoice, Progid

	; Find the executable command associated with the above Registry key
	RegRead, BrowserFullCommand, HKEY_CLASSES_ROOT, %BrowserKeyName%\shell\open\command

	; The above RegRead will return the path and executable name of the brower contained within quotes and optional parameters
	; We only want the text contained inside the first set of quotes which is the path and executable
	; Find the ending quote position (we know the beginning quote is in position 0 so start searching at position 1)
	StringGetPos, pos, BrowserFullCommand, ",,1

	; Decrement the found position by one to work correctly with the StringMid function
	pos := --pos

	; Extract and return the path and executable of the browser
	StringMid, BrowserPathandEXE, BrowserFullCommand, 2, %pos%
	Return BrowserPathandEXE
}