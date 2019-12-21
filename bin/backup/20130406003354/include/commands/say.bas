IF usercommand$(runcommands) = "say" OR usercommand$(runcommands) = "read" THEN
    saveclip$ = _CLIPBOARD$
    _SCREENPRINT CHR$(3)
    speechoutput$ = _CLIPBOARD$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    _CLIPBOARD$ = saveclip$
    usercommands = -1
END IF
