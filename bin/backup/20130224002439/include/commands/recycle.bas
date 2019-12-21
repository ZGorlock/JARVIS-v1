IF usercommand$(runcommands) = "recycle" OR usercommand$(runcommands) = "recycling" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "bin" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands3) = "open" OR usercommand$(runcommands3) = "explore" OR usercommand$(runcommands3) = "explorer" THEN
                            speechoutput$ = "opening recycle bin"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            SHELL _DONTWAIT _HIDE "start shell:RecycleBinFolder"
                            usercommands = -1
                            EXIT DO
                        END IF
                        IF usercommand$(runcommands3) = "empty" OR usercommand$(runcommands3) = "clear" THEN
                            speechoutput$ = "emptying recycle bin"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " emptybin"
                            usercommands = -1
                            EXIT DO
                        END IF
                    NEXT runcommands3
                    speechoutput$ = "opening recycle bin"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    SHELL _DONTWAIT _HIDE "start shell:RecycleBinFolder"
                    usercommands = -1
                    EXIT DO
                LOOP
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
