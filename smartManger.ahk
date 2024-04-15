#Requires AutoHotkey v2.0


global steamPath := 'C:\Program Files (x86)\Steam\Steam.exe'
global ConfigPath := "C:\Program Files (x86)\Steam\config\config.vdf"
global steamPath := 'C:\Program Files (x86)\Steam\Steam.exe'
global ahkMangertitel := "ssss"
vpnDelayWait := 1000
global steamOldPID := ""
global steamURLDefault := "steam://rungameid/9915321440419184640"



steamSmart(1,1)


steamSmart(mode,kb){




; if ProcessExist("smartManger.exe"){
;     ExitApp
; }

;/////////////////////add this in the future for ahk
;ahk
; if ProcessExist("steam.exe"){
;     ExitApp
; }
;/////////////////////////////////;

;////////////////////////////////////////////////////////////////////////////
;this code to stop the script if kb is setted to 1kb
configFile_File := FileRead(ConfigPath)
if 0 =! RegExMatch(configFile_File,'"DownloadThrottleKbps"		"1"') {
    fakegameLauncher()
    ;MsgBox ("kb is setted to 1kb")
    ExitApp
}
;/////////////////////////////////;/////////////////////////////////////////////



;[1]edit the config
;MsgBox("closing steam")
;===========================

;appKill("debug" , "/F")
appKill("steam" , "/F")
;=============================
editconfig(1)
editconfig(kb){
    configFile := FileRead(ConfigPath)
    newEdited := RegExReplace(configFile,'"DownloadThrottleKbps"		"[0-9]*"', '"DownloadThrottleKbps"		"' kb '"')
    FileDelete(ConfigPath)
    FileAppend(newEdited,ConfigPath , "UTF-8")
}




;//////////////////// 
;I added this becouse it wont close steam instantly

if ProcessExist("steam.exe"){   
    ProcessWaitClose("steam.exe")
}

; ;another cheack
; while !ProcessExist("steam.exe"){
;     Sleep(1000)
;     }

;////////////////////


if(throttleMode??0)== 1{
    Run(A_ScriptDir . "\fakeGame.exe")
}





;/////////////////////////////////////////////////////////////
;[2]run steam
Run(steamPath)

;=========================================================
;I added this code becouse sometime steam will not start
if !ProcessExist("Steam.exe"){
    while !ProcessExist("Steam.exe"){
        Sleep(5000)
        Run(steamPath)
    }
    
}
;/////////////////////////////////////////////////////////////

;/////////////////////////////////////////////////////////////

;/////////////////////////////////////////////////////////////



;[3]cheack the internet
;added this becosuse windows dont care about network connection and can trigger multi times even if there wasn't anny connection



;CheckInternet()


; while CheckInternet() == 0{ 
;     sleep(vpnDelayWait)
; }










;#Include "EditConfig.ahk"
;MsgBox("Reduced the date For the Hotspot")






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;========================func===============================

appKill(appName , options?){
    if appName == "debug"{
        RunWait("notepad")
        sleep(1500)
        appName := "notepad.exe"
    }else{
        appName := (appName . ".exe")
    }
    RunWait(A_ComSpec " /c taskkill" . options . "  /IM " . appName)

}





;========





CheckInternet()   
{
	isConnected := DllCall("Wininet\InternetCheckConnection"
		, "Str","https://amazon.com"
		, "UInt",1
		, "Ptr",0)
	if (!isConnected){
		;MsgBox("No Internet connection found!")
        return 0
    }
    else{
        ;MsgBox("Internet connection found!")
        return 1
    }
}

}



fakegameLauncher()



fakegameLauncher(excludeTitle := "fakeGame.exe" , steamURL?){
    steamURL := steamURL?? steamURLDefault
        
    if !WinExist(excludeTitle){
        Run(steamURL)
        ; Run ("'" . A_ScriptDir . '\fakeGame.exe"')
    }
    
}


