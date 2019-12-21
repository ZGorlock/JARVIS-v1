IF usercommand$(runcommands) = "jarvis" OR usercommand$(runcommands) = "computer" THEN
    active = 1
    speechoutput$ = "yes " + username$
    status$ = "ACTIVE"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    startactive = TIMER
END IF
