IF echo = 1 THEN
    startactive = TIMER
    DO
        FOR runcommands = 1 TO usercommands
            IF usercommand$(runcommands) = "echo" THEN
                FOR runcommands2 = 1 TO usercommands
                    IF usercommand$(runcommands2) = "off" THEN
                        echo = 0
                        speechoutput$ = "echo turned off"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        EXIT DO
                    END IF
                NEXT runcommands2
            END IF
        NEXT runcommands
        speechoutput$ = useroutputuse$
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        useroutputuse$ = ""
        EXIT DO
    LOOP
END IF
