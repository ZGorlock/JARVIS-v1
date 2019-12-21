IF usercommand$(runcommands) = "grey" THEN
    textcolor = 8
    speechprint$ = speechoutput$
    GOSUB textprint
    usercommands = -1
END IF
