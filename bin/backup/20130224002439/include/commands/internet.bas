IF usercommand$(runcommands) = "internet" OR usercommand$(runcommands) = "browser" THEN
    speechoutput$ = "launching browser"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\internet.LNK"
    usercommands = -1
END IF
