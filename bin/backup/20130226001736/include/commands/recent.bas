IF usercommand$(runcommands2) = "recent" THEN
    speechoutput$ = "opening recent files folder"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start shell:Recent"
    usercommands = -1
END IF
