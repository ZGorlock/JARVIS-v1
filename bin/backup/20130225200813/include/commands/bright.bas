IF usercommand$(runcommands) = "bright" THEN
    newtextcolor = textcolor + 8
    IF newtextcolor > 15 THEN newtextcolor = textcolor
    textcolor = newtextcolor
    usercommands = -1
END IF
