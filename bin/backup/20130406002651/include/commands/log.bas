IF usercommand$(runcommands) = "log" THEN
    DO
        nums = 0
        numhas = 0
        FOR numcheck = 1 TO userinputs
            IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                nums = nums + 1
                num##(nums) = VAL(userinputcopy$(numcheck))
                numhas = 1
            END IF
        NEXT numcheck
        IF numhas = 0 THEN
            DO
                FOR runcommands2 = 1 TO usercommands
                    IF usercommand$(runcommands2) = "close" OR usercommand$(runcommands2) = "terminate" OR usercommand$(runcommands2) = "exit" OR usercommand$(runcommands2) = "end" THEN
                        SHELL _DONTWAIT _HIDE "taskkill /IM log.exe /F"
                        speechoutput$ = "closing the log"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        EXIT DO
                    END IF
                    IF usercommand$(runcommands2) = "clear" THEN
                        speechoutput$ = "the log is used to help me learn in future update, are you sure you want to clear it?"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        ynlogclear = 1
                        EXIT DO
                    END IF
                    IF usercommand$(runcommands2) = "off" OR usercommand$(runcommands2) = "out" THEN
                        speechoutput$ = "logging off computer"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " exitwin logoff"
                        usercommands = -1
                        EXIT DO
                    END IF
                NEXT runcommands2
                SHELL _DONTWAIT _HIDE "start tools\log.exe"
                speechoutput$ = "opening log"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            LOOP
        ELSE
            IF nums = 1 THEN
                answer## = LOG(num##(1))
                speechoutput$ = STR$(answer##)
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                nums = 0
                EXIT DO
            END IF
            IF nums = 2 THEN
                logbase = 0
                DO
                    FOR runcommands2 = 1 TO usercommands
                        IF usercommand$(runcommands2) = "base" THEN
                            logbase = 1
                            EXIT DO
                        END IF
                    NEXT runcommands2
                    EXIT DO
                LOOP
                IF logbase = 1 THEN
                    answer## = (LOG(num##(1)) / LOG(num##(2)))
                ELSE
                    answer## = (LOG(num##(2)) / LOG(num##(1)))
                END IF
                speechoutput$ = STR$(answer##)
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                logbase = 0
                nums = 0
            END IF
        END IF
        EXIT DO
    LOOP
END IF
