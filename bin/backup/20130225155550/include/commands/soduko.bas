IF usercommand$(runcommands) = "soduko" THEN
    speechoutput$ = "launching soduko solver"
    SHELL _DONTWAIT _HIDE "start tools\soduko.exe"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF