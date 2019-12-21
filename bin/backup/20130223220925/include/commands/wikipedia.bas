IF usercommand$(runcommands) = "wikipedia" OR usercommand$(runcommands) = "wiki" THEN
    speechoutput$ = "opening wikipedia"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\wikipedia.URL"
    usercommands = -1
END IF
