IF usercommand$(runcommands) = "clock" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "system" OR usercommand$(runcommands2) = "tray" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands3) = "show" THEN
                            speechoutput$ = "showing system clock"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " win child class " + CHR$(34) + "Shell_TrayWnd" + CHR$(34) + " show class " + CHR$(34) + "TrayClockWClass" + CHR$(34)
                            usercommands = -1
                            EXIT DO
                        END IF
                        IF usercommand$(runcommands3) = "hide" THEN
                            speechoutput$ = "hiding system clock"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " win child class " + CHR$(34) + "Shell_TrayWnd" + CHR$(34) + " hide class " + CHR$(34) + "TrayClockWClass" + CHR$(34)
                            usercommands = -1
                            EXIT DO
                        END IF
                    NEXT runcommands3
                    EXIT DO
                LOOP
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "polar" THEN
                speechoutput$ = "launching polar clock"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "start tools\polarclock.exe"
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "digital" THEN
                speechoutput$ = "launching digital clock"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "start tools\digitalclock.exe"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        speechoutput$ = "launching analog clock"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        SHELL _DONTWAIT _HIDE "start tools\clock.exe"
        usercommands = -1
        EXIT DO
    LOOP
END IF
