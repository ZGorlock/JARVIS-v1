IF usercommand$(runcommands) = "blue" THEN
    textcolor = 9
    speechprint$ = speechoutput$
    GOSUB textprint
    usercommands = -1
END IF
