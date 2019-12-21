IF usercommand$(runcommands) = "shut" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "down" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands3) = "stop" OR usercommand$(runcommands3) = "abort" THEN
                            SHELL _DONTWAIT _HIDE "cmd c\ shutdown -a"
                            speechoutput$ = "aborting shutdown"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            usercommands = -1
                            EXIT DO
                        END IF
                    NEXT runcommands3
                    ynshutdown = 1
                    speechoutput$ = "are you sure you want to shut down your computer"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    usercommands = -1
                    EXIT DO
                LOOP
            END IF
            IF usercommand$(runcommands2) = "up" THEN
                speechoutput$ = "i am sorry " + username$
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
IF usercommand$(runcommands) = "shutdown" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "stop" OR usercommand$(runcommands2) = "abort" THEN
                SHELL _DONTWAIT _HIDE "cmd c\ shutdown -a"
                speechoutput$ = "aborting shutdown"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        ynshutdown = 1
        speechoutput$ = "are you sure you want to shut down your computer"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF
