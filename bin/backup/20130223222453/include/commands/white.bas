IF usercommand$(runcommands) = "white" THEN
    textcolor = 15
    speechprint$ = speechoutput$
    GOSUB textprint
    usercommands = -1
END IF
