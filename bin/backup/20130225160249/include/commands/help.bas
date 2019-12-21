IF usercommand$(runcommands) = "help" OR usercommand$(runcommands) = "documentation" OR usercommand$(runcommands) = "website" OR usercommand$(runcommands) = "webpage" THEN
    speechoutput$ = "opening documentation"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF
