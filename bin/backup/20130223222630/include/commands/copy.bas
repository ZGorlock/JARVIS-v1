IF usercommand$(runcommands) = "copy" THEN
    DO
        IF useroutputuse$ = "copy that" AND (TIMER(.001) - copythatlimit > .5 OR TIMER < copythatlimit) THEN
            copythatlimit = TIMER(.001)
            speechoutput$ = "yes " + username$
            speechprint$ = speechoutput$
            GOSUB textprint
            GOSUB speechoutput
            IF LEN(speechcopy$) THEN
                _CLIPBOARD$ = speechcopy$
                speechcopy = 0
                speechcopy$ = ""
            ELSE
                _CLIPBOARD$ = outputrecord$((outputrecord - (1 + justcopied)))
            END IF
            speechoutput$ = ""
            usercommands = -1
            justcopied = justcopied + 1
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
        justcopied = justcopied + 1
        EXIT DO
    LOOP
    usercommands = -1
    speechoutput$ = ""
END IF
