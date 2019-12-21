IF usercommand$(runcommands) = "green" THEN
    textcolor = 10
    speechprint$ = speechoutput$
    GOSUB textprint
    usercommands = -1
END IF
