IF usercommand$(runcommands) = "package" AND usercommands = 1 THEN
    ynpackage = 1
    speechoutput$ = "are you sure you want to package me for distribution?"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF
