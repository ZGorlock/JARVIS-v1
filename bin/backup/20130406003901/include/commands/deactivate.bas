IF usercommand$(runcommands) = "deactivate" THEN
    active = 0
    speechoutput$ = "standing by"
    status$ = "INACTIVE"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF
