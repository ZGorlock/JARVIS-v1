IF usercommand$(runcommands) = "username" THEN
    speechoutput$ = "entering username"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    _SCREENPRINT msusername$
    usercommands = -1
END IF
IF usercommand$(runcommands) = "user" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "name" THEN
                speechoutput$ = "entering username"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                _SCREENPRINT msusername$
                usercommands = -1
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF