IF usercommand$(runcommands) = "task" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "manager" THEN
                FOR runcommands3 = 1 TO usercommands
                    IF usercommand$(runcommands3) = "close" OR usercommand$(runcommands3) = "terminate" OR usercommand$(runcommands3) = "exit" OR usercommand$(runcommands3) = "end" THEN
                        SHELL _DONTWAIT _HIDE "taskkill /IM taskmgr.exe /F"
                        speechoutput$ = "closing task manager"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        EXIT DO
                    END IF
                NEXT runcommands3
                SHELL _DONTWAIT _HIDE "start taskmgr.exe"
                speechoutput$ = "launching task manager"
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
