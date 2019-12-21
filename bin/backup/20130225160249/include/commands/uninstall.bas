IF usercommand$(runcommands) = "uninstall" THEN
    speechoutput$ = "are you sure you want to uninstall me?"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
    ynuninstall = 1
END IF
