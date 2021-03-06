; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one ahk file simultaneously and each will get its own tray icon.

; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.



;IfWinExist ahk_class rctrl_renwnd32
;{
    ;WinActivate ahk_class rctrl_renwnd32
;}
;else
;{
    ;Run Outlook
    ;WinWait ahk_class rctrl_renwnd32
    ;WinActivate
;}
;return

^!u::RunOrActivate("firefox", "MozillaWindowClass") ; activate Firefox
^!i::RunOrActivate("gVim", "Vim") ; activate editor
;;;; ^!o::RunOrActivate("ConEmu /Dir c:/Users/Hugh", "VirtualConsoleClass") ; activate terminal console

^!o::RunOrActivate("C:\Users\Hugh\cygwin64\bin\mintty.exe -i /Cygwin-Terminal.ico -", "mintty") ; activate terminal console

^!p::RunOrActivate("explorer", "CabinetWClass") ; activate finder/windows explorer
^!m::RunOrActivate("Outlook", "rctrl_renwnd32")

RunOrActivate(progname, windowclass){
    IfWinExist ahk_class %windowclass%
    {
        WinActivate ahk_class %windowclass%
    }
    else
    {
        Run %progname%
        WinWait ahk_class %windowclass%
        WinActivate
    }
    return
}


;IfWinExist Untitled - Notepad
	;WinActivate
;else
	;Run Notepad
;return


^q::Send !{F4}
return


#q::Send !{F4}
return


; Emacs and Vim editor
#ifWinActive ahk_class Emacs
Capslock::Ctrl
return

#IfWinActive ahk_class Vim
Capslock::Ctrl
return


; Adobe Acrobat
#IfWinActive ahk_class AcrobatSDIWindow
j::Send {Down}
Return

#IfWinActive ahk_class AcrobatSDIWindow
k::Send {Up}
Return

#IfWinActive ahk_class AcrobatSDIWindow
d::WinClose
return

; Windows explorer
#IfWinActive ahk_class CabinetWClass
j::Send {Down}
Return

#IfWinActive ahk_class CabinetWClass
k::Send {Up}
Return

#IfWinActive ahk_class CabinetWClass
l::Send {F6}
Return

#IfWinActive ahk_class CabinetWClass
h::Send +{F6}
Return



;#Include C:/Users/Hugh/bin/bug.n-master/src
;#Include C:/Users/Hugh/bugn/
;#Include Main.ahk




; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.
; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.


