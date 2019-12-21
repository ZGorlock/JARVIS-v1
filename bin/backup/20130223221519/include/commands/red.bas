IF usercommand$(runcommands) = "red" THEN
    textcolor = 12
    speechprint$ = speechoutput$
    GOSUB textprint
    usercommands = -1
END IF
