IF usercommand$(runcommands) = "paste" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = "pasting"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT CHR$(22)
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF
