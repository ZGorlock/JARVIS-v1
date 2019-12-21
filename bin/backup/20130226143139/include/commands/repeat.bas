IF usercommand$(runcommands) = "repeat" THEN
    speechoutput$ = outputrecord$(outputrecord)
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF
