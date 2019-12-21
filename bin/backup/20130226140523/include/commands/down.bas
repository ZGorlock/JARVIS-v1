IF usercommand$(runcommands) = "down" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = ""
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT (CHR$(0) + CHR$(80))
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF
