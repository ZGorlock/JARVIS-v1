IF usercommand$(runcommands) = "yahoo" THEN
    speechoutput$ = "opening yahoo"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\yahoo.URL"
    usercommands = -1
END IF
