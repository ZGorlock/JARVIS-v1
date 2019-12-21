IF usercommand$(runcommands) = "show" AND usercommands = 1 THEN
    _SCREENSHOW
    screenstate = 1
    speechoutput$ = ""
    speechprint$ = ""
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF
