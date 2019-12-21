IF usercommand$(runcommands) = "copy" THEN
    DO
        IF useroutputuse$ = "copy that" THEN
            speechoutput$ = "yes " + username$
            speechprint$ = speechoutput$
            GOSUB textprint
            GOSUB speechoutput
            _CLIPBOARD$ = outputrecord$((outputrecord - 1))
            usercommands = -1
            EXIT DO
        END IF
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = "copying"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT CHR$(3)
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF
