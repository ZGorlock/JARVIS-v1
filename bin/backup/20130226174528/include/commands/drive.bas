IF usercommand$(runcommands) = "drive" THEN
    DO
        FOR drivevol = 97 TO 122
            IF INSTR(useroutput$, (" " + CHR$(drivevol) + " ")) <> 0 OR INSTR(useroutput$, (CHR$(drivevol) + ".")) <> 0 OR INSTR(useroutput$, (" " + CHR$(drivevol))) = (LEN(useroutput$) - 1) THEN
                drivevol$ = CHR$(drivevol) + ":"
                FOR runcommands2 = 1 TO usercommands
                    IF usercommand$(runcommands2) = "open" OR usercommand$(runcommands2) = "explore" THEN
                        DO
                            FOR runcommands3 = 1 TO usercommands
                                IF usercommand$(runcommands3) = "door" THEN
                                    DO
                                        FOR runcommands4 = 1 TO usercommands
                                            IF usercommand$(runcommands4) = "close" OR usercommand$(runcommands4) = "shut" THEN
                                                speechoutput$ = "shutting door to " + drivevol$
                                                speechprint$ = speechoutput$
                                                GOSUB textprint
                                                GOSUB speechoutput
                                                SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " cdrom close " + drivevol$
                                                usercommands = -1
                                                EXIT DO
                                            END IF
                                        NEXT runcommands4
                                        speechoutput$ = "opening door to " + drivevol$
                                        speechprint$ = speechoutput$
                                        GOSUB textprint
                                        GOSUB speechoutput
                                        SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " cdrom open " + drivevol$
                                        usercommands = -1
                                        EXIT DO
                                    LOOP
                                    EXIT DO
                                END IF
                            NEXT runcommands3
                            speechoutput$ = "opening " + drivevol$
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            SHELL _DONTWAIT "explorer " + drivevol$
                            usercommands = -1
                            EXIT DO
                        LOOP
                        EXIT DO
                    END IF
                    IF usercommand$(runcommands2) = "door" THEN
                        DO
                            FOR runcommands3 = 1 TO usercommands
                                IF usercommand$(runcommands3) = "close" OR usercommand$(runcommands3) = "shut" THEN
                                    speechoutput$ = "shutting door to " + drivevol$
                                    speechprint$ = speechoutput$
                                    GOSUB textprint
                                    GOSUB speechoutput
                                    SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " cdrom close " + drivevol$
                                    usercommands = -1
                                    EXIT DO
                                END IF
                            NEXT runcommands3
                            speechoutput$ = "opening door to " + drivevol$
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " cdrom open " + drivevol$
                            usercommands = -1
                            EXIT DO
                        LOOP
                        EXIT DO
                    END IF
                NEXT runcommands2
                EXIT DO
            END IF
        NEXT drivevol
        EXIT DO
    LOOP
END IF
