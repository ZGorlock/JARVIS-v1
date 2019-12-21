IF usercommand$(runcommands) = "msn" THEN
    speechoutput$ = "opening msn"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\msn.URL"
    usercommands = -1
END IF
