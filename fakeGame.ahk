#Requires AutoHotkey v2.0
#SingleInstance Force


;==================
global appVersion := "0.0.1"
global appCodeName := "[Code : Re-Born]"
global appName := "fakeGame"
global appAuthor := " @xMaxrayx (before @unbreakable-ray)"
global appLicense := "AGPLv3"

;================





fakeGui()


fakeGui(){
    
    mainGui := Gui()
    mainGui.Add("Text","w150 h150 " ,"Fake Game").SetFont("s20" ,"Arial" )
    closeBTN := mainGui.Add('Button',"w250 h100" ,"Close"),closeBTN.SetFont("s20" ,"Arial" ),closeBTN.OnEvent("Click", (*)=>    CloseButton_Event())
    aboutBTN := mainGui.Add('Button',"w125 h50" ,"About"),aboutBTN.SetFont("s10" ,"Arial" ),aboutBTN.OnEvent("Click", (*)=>    AboutButton_Event())
   
    mainGui.Show()

 
    
    CloseButton_Event(){
        local msgResult := MsgBox("Are you sure", "Warning" ,"YesNo 0x30 0x1000")
        if msgResult == "Yes" {
            ;msgResult := "No" ;No need to this line becouse the guy willl be destroyed
            mainGui.Destroy()
        }
    }

    AboutButton_Event(){
        MsgBox("Fake Game" ,"About" ,"Ok 0x30 0x1000")
    }


    


}

