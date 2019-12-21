IF usercommand$(runcommands) = "radian" OR usercommand$(runcommands) = "radians" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "set" THEN
                anglepref = 0
                speechoutput$ = "setting angles to radian"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
