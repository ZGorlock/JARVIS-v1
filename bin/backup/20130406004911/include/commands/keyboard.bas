IF usercommand$(runcommands) = "keyboard" THEN
    speechoutput$ = "launching virtual keyboard"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start %SystemRoot%\system32\osk.exe"
    usercommands = -1
END IF
