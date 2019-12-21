IF usercommand$(runcommands) = "again" THEN
    userinput$ = inputrecord$(inputrecord - (1 + justagain))
    justagain = justagain + 1
    usercommands = -1
    GOTO againsend
END IF
