IF usercommand$(runcommands) = "history" THEN
    speechoutput$ = "opening history"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start shell:History"
    usercommands = -1
END IF
