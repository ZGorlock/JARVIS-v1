IF usercommand$(runcommands) = "afirmation" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "toggle" THEN
                SELECT CASE afirmpref
                    CASE 0
                        afirmpref = 1
                        speechoutput$ = "turning on afirmation"
                    CASE 1
                        afirmpref = 0
                        speechoutput$ = "turning off afirmation"
                END SELECT
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "on" THEN
                afirmpref = 1
                speechoutput$ = "turning on afirmation"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
            END IF
            IF usercommand$(runcommands2) = "off" THEN
                afirmpref = 0
                speechoutput$ = "turning off afirmation"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
