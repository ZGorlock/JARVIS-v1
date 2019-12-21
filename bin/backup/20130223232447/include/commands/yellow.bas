IF usercommand$(runcommands) = "yellow" THEN
    textcolor = 14
    speechprint$ = speechoutput$
    GOSUB textprint
    usercommands = -1
END IF
