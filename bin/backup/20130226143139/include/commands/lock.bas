IF usercommand$(runcommands) = "lock" THEN
    speechoutput$ = "locking computer"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    commander = LockWorkStation
    usercommands = -1
END IF
