IF usercommand$(runcommands) = "again" THEN
    typing$ = inputrecord$(inputrecord - 1)
    usercommands = -1
    GOTO submitquery
END IF
