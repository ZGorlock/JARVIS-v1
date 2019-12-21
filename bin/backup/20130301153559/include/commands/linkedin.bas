IF usercommand$(runcommands) = "linkedin" THEN
    speechoutput$ = "opening linkedin"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\linkedin.URL"
    usercommands = -1
END IF
