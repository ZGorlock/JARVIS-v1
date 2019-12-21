IF usercommand$(runcommands) = "brightness" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "up" OR usercommand$(runcommands2) = "increase" THEN
                _SCREENPRINT (CHR$(0) + CHR$(131))
                dimcount = dimcount - 10
                IF dimcount = 0 THEN
                    SHELL _DONTWAIT _HIDE "taskkill /IM dimscreen.exe /F"
                    speechoutput$ = "closing ScreenDim"
                    EXIT DO
                END IF
                speechoutput$ = "increasing brightness"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "down" OR usercommand$(runcommands2) = "decrease" THEN
                _SCREENPRINT (CHR$(0) + CHR$(130))
                dimcount = dimcount + 10
                speechoutput$ = "decreasing brightness"
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
