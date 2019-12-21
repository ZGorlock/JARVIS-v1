IF usercommand$(runcommands) = "degree" OR usercommand$(runcommands) = "degrees" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "set" THEN
                anglepref = 1
                speechoutput$ = "setting angles to degree"
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
