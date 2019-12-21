IF usercommand$(runcommands) = "reset" THEN
    speechoutput$ = "are you sure you would like to reset me? it will revert everything back to original settings"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
    ynreset = 1
END IF
