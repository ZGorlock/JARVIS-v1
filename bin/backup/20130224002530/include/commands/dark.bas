IF usercommand$(runcommands) = "dark" THEN
    newtextcolor = textcolor - 8
    IF newtextcolor < 0 THEN newtextcolor = textcolor
    textcolor = newtextcolor
    speechprint$ = speechoutput$
    GOSUB textprint
    usercommands = -1
END IF
