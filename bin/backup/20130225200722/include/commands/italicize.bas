IF usercommand$(runcommands) = "italicize" OR usercommand$(runcommands) = "italic" OR usercommand$(runcommands) = "italics" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = "printing"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT CHR$(9)
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF
