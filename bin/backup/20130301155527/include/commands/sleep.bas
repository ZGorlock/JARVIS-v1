IF usercommand$(runcommands) = "sleep" THEN
    speechoutput$ = "putting computer to sleep"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "powercfg.exe /hibernate off"
    commander = SetSuspendState
    usercommands = -1
END IF
