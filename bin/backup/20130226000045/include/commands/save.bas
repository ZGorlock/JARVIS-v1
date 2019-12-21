IF usercommand$(runcommands) = "save" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = "saving"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT CHR$(19)
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF
