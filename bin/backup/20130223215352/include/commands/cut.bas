IF usercommand$(runcommands) = "cut" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = "cutting"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT CHR$(24)
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF
