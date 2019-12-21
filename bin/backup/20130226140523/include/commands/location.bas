IF usercommand$(runcommands) = "location" THEN
    speechoutput$ = jarvisloc$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF
