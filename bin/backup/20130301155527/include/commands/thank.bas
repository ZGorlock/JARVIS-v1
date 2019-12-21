IF usercommand$(runcommands) = "thank" OR usercommand$(runcommands) = "thanks" THEN
    speechoutput$ = "you are welcome " + username$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF
