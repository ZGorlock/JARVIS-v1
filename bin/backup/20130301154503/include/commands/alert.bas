IF usercommand$(runcommands) = "alert" OR usercommand$(runcommands) = "alerts" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "toggle" THEN
                SELECT CASE alertpref
                    CASE 0
                        alertpref = 1
                        speechoutput$ = "turning on alerts"
                    CASE 1
                        alertpref = 0
                        speechoutput$ = "turning off alerts"
                END SELECT
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "on" THEN
                alertpref = 1
                speechoutput$ = "turning on alerts"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
            END IF
            IF usercommand$(runcommands2) = "off" THEN
                alertpref = 0
                speechoutput$ = "turning off alerts"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
