IF usercommand$(runcommands) = "magenta" THEN
    textcolor = 13
    speechprint$ = speechoutput$
    GOSUB textprint
    usercommands = -1
END IF
