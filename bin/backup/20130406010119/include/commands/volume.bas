IF usercommand$(runcommands) = "volume" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "increment" THEN
                DO
                    FOR numcheck = 1 TO userinputs
                        IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                            num##(1) = VAL(userinputcopy$(numcheck))
                            containnum = 1
                            EXIT DO
                        END IF
                    NEXT numcheck
                    EXIT DO
                LOOP
                IF containnum = 0 THEN EXIT DO
                volincr = num##(1)
                speechoutput$ = "volume increment set to" + STR$(volincr)
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "up" OR usercommand$(runcommands2) = "increase" THEN
                SHELL _HIDE _DONTWAIT CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " changesysvolume " + LTRIM$(STR$(volincr))
                speechoutput$ = "volume increased"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "down" OR usercommand$(runcommands2) = "decrease" THEN
                SHELL _HIDE _DONTWAIT CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " changesysvolume -" + LTRIM$(STR$(volincr))
                speechoutput$ = "volume decreased"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "max" OR usercommand$(runcommands2) = "maximum" THEN
                SHELL _HIDE _DONTWAIT CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " setsysvolume 65535"
                speechoutput$ = "volume maximized"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "min" OR usercommand$(runcommands2) = "minimum" THEN
                SHELL _HIDE _DONTWAIT CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " setsysvolume 0"
                speechoutput$ = "volume minimized"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        speechoutput$ = "launching volume panel"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        SHELL _DONTWAIT _HIDE "start %SystemRoot%\system32\sndvol32.exe"
        usercommands = -1
        EXIT DO
    LOOP
END IF
