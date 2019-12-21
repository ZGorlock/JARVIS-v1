IF usercommand$(runcommands) = "enter" OR usercommand$(runcommands) = "send" OR usercommand$(runcommands) = "go" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = ""
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT CHR$(13)
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF
