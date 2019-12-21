IF usercommand$(runcommands) = "angle" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "toggle" THEN
                SELECT CASE anglepref
                    CASE 0
                        anglepref = 1
                        speechoutput$ = "setting angle to degree"
                    CASE 1
                        anglepref = 0
                        speechoutput$ = "setting angle to radian"
                END SELECT
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
