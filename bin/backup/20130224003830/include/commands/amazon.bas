IF usercommand$(runcommands) = "amazon" THEN
    speechoutput$ = "opening amazon"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\amazon.URL"
    usercommands = -1
END IF
