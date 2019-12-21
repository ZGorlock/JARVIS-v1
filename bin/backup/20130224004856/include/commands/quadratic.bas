IF usercommand$(runcommands) = "quadratic" THEN
    speechoutput$ = "starting quadratic formula solver"
    SHELL _DONTWAIT _HIDE "start tools\quadratic.exe"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF