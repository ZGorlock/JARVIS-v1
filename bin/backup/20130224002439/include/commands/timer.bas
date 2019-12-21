IF usercommand$(runcommands) = "timer" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "second" OR usercommand$(runcommands2) = "seconds" THEN
                DO
                    num = 0
                    DO
                        FOR numcheck = 1 TO userinputs
                            IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                                num = VAL(userinputcopy$(numcheck))
                                EXIT DO
                            END IF
                        NEXT numcheck
                        EXIT DO
                    LOOP
                    timers = timers + 1
                    timers$(timers) = STR$((jarvistimer&& + num))
                    timersay$(timers) = LTRIM$(STR$(num)) + " " + usercommand$(runcommands2)
                    speechoutput$ = "timer set"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    usercommands = -1
                    EXIT DO
                LOOP
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "minute" OR usercommand$(runcommands2) = "minutes" THEN
                DO
                    num = 0
                    DO
                        FOR numcheck = 1 TO userinputs
                            IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                                num = VAL(userinputcopy$(numcheck))
                                EXIT DO
                            END IF
                        NEXT numcheck
                        EXIT DO
                    LOOP
                    timers = timers + 1
                    timers$(timers) = STR$((jarvistimer&& + (num * 60)))
                    timersay$(timers) = LTRIM$(STR$(num)) + " " + usercommand$(runcommands2)
                    speechoutput$ = "timer set"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    usercommands = -1
                    EXIT DO
                LOOP
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "hour" OR usercommand$(runcommands2) = "hours" THEN
                DO
                    num = 0
                    DO
                        FOR numcheck = 1 TO userinputs
                            IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                                num = VAL(userinputcopy$(numcheck))
                                EXIT DO
                            END IF
                        NEXT numcheck
                        EXIT DO
                    LOOP
                    timers = timers + 1
                    timers$(timers) = STR$((jarvistimer&& + (num * 3600)))
                    timersay$(timers) = LTRIM$(STR$(num)) + " " + usercommand$(runcommands2)
                    speechoutput$ = "timer set"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    usercommands = -1
                    EXIT DO
                LOOP
                EXIT DO
            END IF
        NEXT runcommands2
        speechoutput$ = "the system timer is" + STR$(TIMER)
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF
