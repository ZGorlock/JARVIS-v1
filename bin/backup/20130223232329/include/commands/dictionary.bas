IF usercommand$(runcommands) = "dictionary" THEN
    speechoutput$ = "opening dictionary"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\dictionary.URL"
    usercommands = -1
END IF
