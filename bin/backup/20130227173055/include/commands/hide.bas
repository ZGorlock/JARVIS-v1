IF usercommand$(runcommands) = "hide" AND usercommands = 1 THEN
    _SCREENHIDE
    screenstate = 0
    speechoutput$ = ""
    speechprint$ = ""
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF
