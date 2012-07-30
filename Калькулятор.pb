Enumeration
  #MAIN_WINDOW
EndEnumeration

Enumeration
  #MENU_BAR
EndEnumeration

Enumeration
  #ACTION_EXIT
  #ACTION_ABOUT
EndEnumeration

Enumeration
  #FIRST_OPERAND_STRING
  #PLUS_BUTTON
  #MINUS_BUTTON
  #MULTIPLICATION_BUTTON
  #DIVISION_BUTTON
  #SECOND_OPERAND_STRING
  #RESULT_TEXT
  #RESULT_STRING
EndEnumeration

Procedure OpenMainWindow()
  If OpenWindow(#MAIN_WINDOW, #PB_Ignore, #PB_Ignore, 220, 255, "Калькулятор", #PB_Window_MinimizeGadget | #PB_Window_ScreenCentered )
    If CreateMenu(#MENU_BAR, WindowID(#MAIN_WINDOW))
      MenuTitle("Файл")
      MenuItem(#ACTION_EXIT, "Выход")
      MenuTitle("Справка")
      MenuItem(#ACTION_ABOUT, "О программе")
    EndIf
    StringGadget(#FIRST_OPERAND_STRING, 20, 20, 180, 20, "", #PB_String_Numeric)
    
    ButtonGadget(#PLUS_BUTTON, 20, 65, 45, 25, "+")
    ButtonGadget(#MINUS_BUTTON, 65, 65, 45, 25, "-")
    ButtonGadget(#MULTIPLICATION_BUTTON, 110, 65, 45, 25, "*")
    ButtonGadget(#DIVISION_BUTTON, 155, 65, 45, 25, "/")
    
    StringGadget(#SECOND_OPERAND_STRING, 20, 115, 180, 20, "", #PB_String_Numeric)
    
    TextGadget(#RESULT_TEXT, 20, 155, 180, 20, "=", #PB_Text_Center)
    TextGadget(#RESULT_STRING, 20, 195, 180, 20, "", #PB_Text_Border)
    
    SetWindowColor(#MAIN_WINDOW, $FFFFFF)
    SetGadgetColor(#RESULT_TEXT, #PB_Gadget_BackColor, $FFFFFF)
    SetGadgetColor(#RESULT_STRING, #PB_Gadget_BackColor, $FFFFFF)
  EndIf
EndProcedure

OpenMainWindow()

Repeat
  event       = WaitWindowEvent()
  eventMenu   = EventMenu()
  eventGadget = EventGadget()
  eventWindow = EventWindow()
  eventType   = EventType()
  If eventWindow = #MAIN_WINDOW
    If event = #PB_Event_Menu
      If eventMenu = #ACTION_EXIT
        Break
      ElseIf eventMenu = #ACTION_ABOUT
        MessageRequester("О программе", "Калькулятор. Версия 1.0" + #CR$ + #CR$ + "Автор: Салават Даутов" + #CR$ + #CR$ + "Дата создания: июль 2012 года", #MB_ICONINFORMATION)
      EndIf
    EndIf
    If event = #PB_Event_Gadget
      firstOperand=ValD(GetGadgetText(#FIRST_OPERAND_STRING))
      secondOperand=ValD(GetGadgetText(#SECOND_OPERAND_STRING))
      If eventGadget = #PLUS_BUTTON
        result.d = firstOperand + secondOperand
        SetGadgetText(#RESULT_STRING, StrD(result))
      ElseIf eventGadget = #MINUS_BUTTON
        result.d = firstOperand - secondOperand
        SetGadgetText(#RESULT_STRING, StrD(result))
      ElseIf eventGadget = #MULTIPLICATION_BUTTON
        result.d = firstOperand * secondOperand
        SetGadgetText(#RESULT_STRING, StrD(result))
      ElseIf eventGadget = #DIVISION_BUTTON
        result.d = firstOperand / secondOperand
        SetGadgetText(#RESULT_STRING, StrD(result))
      EndIf
    EndIf
  EndIf
Until event = #PB_Event_CloseWindow And eventWindow = #MAIN_WINDOW

; IDE Options = PureBasic 4.51 (Windows - x86)
; CursorPosition = 84
; FirstLine = 43
; Folding = -
; EnableXP
; UseIcon = Icon.ico
; Executable = Калькулятор.exe
; DisableDebugger
; IncludeVersionInfo
; VersionField0 = 1.0.0.0
; VersionField1 = 1.0.0.0
; VersionField2 = Салават Даутов
; VersionField3 = Калькулятор
; VersionField4 = 1.0
; VersionField5 = 1.0
; VersionField6 = Калькулятор
; VersionField7 = Калькулятор
; VersionField8 = Калькулятор.exe
; VersionField17 = 0419 Russian
