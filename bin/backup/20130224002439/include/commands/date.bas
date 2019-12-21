IF usercommand$(runcommands) = "date" THEN
    speechoutput$ = "it is currently " + DATE$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF
