IF usercommand$(runcommands) = "minimize" THEN
    speechoutput$ = "minimizing foreground window"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    fgwin%& = GetForegroundWindow
    miniwin = CloseWindow(fgwin%&)
    usercommands = -1
END IF
