IF usercommand$(runcommands) = "template" OR usercommand$(runcommands) = "templates" THEN
    speechoutput$ = "opening templates folder"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start shell:Templates"
    usercommands = -1
END IF
