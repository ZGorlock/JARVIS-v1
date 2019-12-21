IF usercommand$(runcommands) = "recognition" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "voice" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands3) = "on" AND recognition = 0 THEN
                            recognition = 1
                            speechoutput$ = "voice recognition turned on"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            usercommands = -1
                            EXIT DO
                        END IF
                        IF usercommand$(runcommands3) = "off" AND recognition = 1 THEN
                            recognition = 0
                            speechoutput$ = "voice recognition turned off"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            usercommands = -1
                            EXIT DO
                        END IF
                        IF usercommand$(runcommands3) = "toggle" THEN
                            SELECT CASE recognition
                            CASE 0
                                recognition = 1
                                speechoutput$ = "voice recognition turned on"
                            CASE 1
                                recognition = 0
                                speechoutput$ = "voice recognition turned off"
                            END SELECT
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            usercommands = -1
                            EXIT DO
                        END IF
                    NEXT runcommands3
                    EXIT DO
                LOOP
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
    usercommands = -1
END IF
