IF usercommand$(runcommands) = "hello" OR usercommand$(runcommands) = "hey" OR usercommand$(runcommands) = "yo" OR usercommand$(runcommands) = "hi" THEN
    speechoutput$ = "yes " + username$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF
