IF usercommand$(runcommands) = "redo" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = "redoing"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT CHR$(25)
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF
