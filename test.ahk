#Requires AutoHotkey v2.0


;from bingGpt

; processes := ComObjGet("winmgmts:").ExecQuery("Select * from Win32_Process")
; for process in processes
;     MsgBox  "Name: " process.Name "`nID: " process.ProcessId

;============

; Get the name and path of the current script
; name := ProcessGetName()
; path := ProcessGetPath()
; MsgBox  "Name: " name "`nPath: " path


;============

; ; Get all running process names as a string
; processes := ComObjGet("winmgmts:").ExecQuery("Select * from Win32_Process")
; names := "" ; Initialize an empty string
; for process in processes
;     names .= process.Name "," ; Append each name with a comma
; names := SubStr(names, 1, -1) ; Remove the last comma
; MsgBox  names ; Show the names

;==============

;dosn't work
; ; Get all running process names as a string
; processes := ComObjGet("winmgmts:").ExecQuery("Select * from Win32_Process")
; names := [] ; Initialize an empty array
; for process in processes
;     names.Push(process.Name) ; Push each name to the array
; names := names.Join(",") ; Join the names with a comma
; MsgBox  names ; Show the names


#requires AutoHotkey v2
proccecChecker("steam", "chrome", "notepad")
proccecChecker(appList*)
{
    checkList := "", foundWhitelist := 0

    for appName in appList
        checkList .= Format("(Name LIKE '{}%') OR ", appName)
        
    qry := "Select * from Win32_Process WHERE " RTrim(checkList, " OR")

    for process in ComObjGet("winmgmts:").ExecQuery(qry) {
        ++foundWhitelist
        MsgBox(process.Name)
    }
    else MsgBox("No whitelist app found")
}