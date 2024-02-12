    #Requires AutoHotkey v2.0

    ;;MsgBox processChecker("lol `nsteam.exe" ,,1 )



    processChecker(nameCheckList, appList? , returnName := 0 ,enableMsgScan := 0 ){

        nameCheckList := StrSplit(nameCheckList,"`n")
        appList := ""



        if !IsSet(appList) || (appList == "") {
            
            processes_obj := ComObjGet("winmgmts:").ExecQuery("Select * from Win32_Process")


            for process in processes_obj
                appList .= (process.Name "`n")
            

        }



        


    ;==
    local foundWhitelist := 0

        loop (nameCheckList.Length)
        {
            if (0 =! RegExMatch(appList , nameCheckList[A_Index]  )) {
                foundWhitelist := 1
                
                if (enableMsgScan == 1){  ;for debug
                MsgBox nameCheckList[A_Index] " at [" A_Index  "]"
                }
                
                if (returnName == 1){
                    return nameCheckList[A_Index] " at [" A_Index  "]"
                }
                else{
                    return 1
                }
                
                break
            }  
            
            
        } 

    ;===
        if  (enableMsgScan == 1) && (foundWhitelist == 0){
            MsgBox "No whitelist app found"   ;MsgBox "A_Index"
            
        }


    return 0
        

    ;==

    }