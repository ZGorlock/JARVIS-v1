IF usercommand$(runcommands) = "cache" THEN
    speechoutput$ = "opening cache"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start shell:Cache"
    usercommands = -1
END IF
