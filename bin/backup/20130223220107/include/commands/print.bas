IF usercommand$(runcommands) = "print" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = "printing"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT CHR$(16)
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF
