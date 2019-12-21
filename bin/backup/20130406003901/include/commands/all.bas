IF usercommand$(runcommands) = "all" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = "select all"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT CHR$(1)
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF
