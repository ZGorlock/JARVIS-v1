IF usercommand$(runcommands) = "space" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = ""
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT CHR$(32)
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF
