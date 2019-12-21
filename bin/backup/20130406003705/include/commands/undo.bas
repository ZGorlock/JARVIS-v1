IF usercommand$(runcommands) = "undo" OR usercommand$(runcommands) = "undue" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = "undoing"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT CHR$(26)
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF
