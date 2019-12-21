IF usercommand$(runcommands) = "live" THEN
    speechoutput$ = "opening windows live"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\live.URL"
    usercommands = -1
END IF
