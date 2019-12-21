IF usercommand$(runcommands) = "password" THEN
    speechoutput$ = "entering password"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    _SCREENPRINT mspassword$
    usercommands = -1
END IF
IF usercommand$(runcommands) = "pass" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "word" THEN
                speechoutput$ = "entering password"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                _SCREENPRINT mspassword$
                usercommands = -1
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF