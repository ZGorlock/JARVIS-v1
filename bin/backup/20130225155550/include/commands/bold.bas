IF usercommand$(runcommands) = "bold" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = ""
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT CHR$(2)
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF
