IF usercommand$(runcommands) = "cyan" THEN
    textcolor = 11
    speechprint$ = speechoutput$
    GOSUB textprint
    usercommands = -1
END IF
