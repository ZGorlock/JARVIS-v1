IF usercommand$(runcommands) = "start" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "up" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands2) = "launch" OR usercommand$(runcommands2) = "run" THEN
                            DO
                                FOR runcommands4 = 1 TO usercommands
                                    IF usercommand$(runcommands4) = "no" OR usercommand$(runcommands4) = "not" THEN
                                        speechoutput$ = "setting myself to not run at startup"
                                        speechprint$ = speechoutput$
                                        GOSUB textprint
                                        GOSUB speechoutput
                                        startuppath$ = "C:" + ENVIRON$("HOMEPATH") + "\Start Menu\Programs\Startup\jarvis.LNK"
                                        SHELL _DONTWAIT _HIDE "del " + CHR$(34) + startuppath$ + CHR$(34)
                                        usercommands = -1
                                        EXIT DO
                                    END IF
                                NEXT runcommands4
                                speechoutput$ = "setting myself to run at startup"
                                speechprint$ = speechoutput$
                                GOSUB textprint
                                GOSUB speechoutput
                                startuppath$ = "C:" + ENVIRON$("HOMEPATH") + "\Start Menu\Programs\Startup\jarvis.LNK"
                                SHELL _DONTWAIT _HIDE "copy " + CHR$(34) + jarvisloc$ + "\bin\jarvis.LNK" + CHR$(34) + " " + CHR$(34) + startuppath$ + CHR$(34)
                                usercommands = -1
                                EXIT DO
                            LOOP
                            EXIT DO
                        END IF
                    NEXT runcommands3
                    speechoutput$ = "opening startup folder"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    SHELL _DONTWAIT _HIDE "start shell:Startup"
                    usercommands = -1
                    EXIT DO
                LOOP
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
IF usercommand$(runcommands) = "startup" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "launch" OR usercommand$(runcommands2) = "run" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands3) = "no" OR usercommand$(runcommands3) = "not" THEN
                            speechoutput$ = "setting myself to not run at startup"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            startuppath$ = "C:" + ENVIRON$("HOMEPATH") + "\Start Menu\Programs\Startup\jarvis.LNK"
                            SHELL _DONTWAIT _HIDE "del " + CHR$(34) + startuppath$ + CHR$(34)
                            usercommands = -1
                            EXIT DO
                        END IF
                    NEXT runcommands3
                    speechoutput$ = "setting myself to run at startup"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    startuppath$ = "C:" + ENVIRON$("HOMEPATH") + "\Start Menu\Programs\Startup\jarvis.LNK"
                    SHELL _DONTWAIT _HIDE "copy " + CHR$(34) + jarvisloc$ + "\bin\jarvis.LNK" + CHR$(34) + " " + CHR$(34) + startuppath$ + CHR$(34)
                    usercommands = -1
                    EXIT DO
                LOOP
                EXIT DO
            END IF
        NEXT runcommands2
        speechoutput$ = "opening startup folder"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        SHELL _DONTWAIT _HIDE "start shell:Startup"
        usercommands = -1
        EXIT DO
    LOOP
END IF
