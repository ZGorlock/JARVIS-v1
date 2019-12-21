IF usercommand$(runcommands) = "registry" THEN
    speechoutput$ = "opening registry"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start regedit.exe"
    usercommands = -1
END IF
