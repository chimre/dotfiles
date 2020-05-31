#Left::Return
#Down::Return
#Right::Return
#Up::Return

#ifWinActive ahk_exe EXCEL.EXE
  $F1::Return
  $+F1::SendInput, {F1}
  ^P::Return
#ifWinActive

