IF usercommand$(runcommands) = "windows" THEN
    speechoutput$ = "opening Windows folder"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start shell:Windows"
    usercommands = -1
END IF
