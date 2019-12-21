IF usercommand$(runcommands) = "version" THEN
    speechoutput$ = "i am currently version 0" + LTRIM$(STR$(version#))
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF
