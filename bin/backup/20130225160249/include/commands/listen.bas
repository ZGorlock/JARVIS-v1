IF usercommand$(runcommands) = "listen" OR usercommand$(runcommands) = "listening" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "toggle" THEN
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
            IF usercommand$(runcommands2) = "start" AND recognition = 0 THEN
                speechoutput$ = "voice recognition turned on"
                speechprint$ = speechoutput$
                recognition = 0
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "stop" AND recognition = 1 THEN
                speechoutput$ = "voice recognition turned off"
                speechprint$ = speechoutput$
                recognition = 0
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
