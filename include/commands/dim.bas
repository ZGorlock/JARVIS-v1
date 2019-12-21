IF usercommand$(runcommands) = "dim" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "launch" OR usercommand$(runcommands2) = "start" OR usercommand$(runcommands2) = "run" OR usercommand$(runcommands2) = "screen" THEN
                SHELL _DONTWAIT _HIDE "start tools\dimscreen.exe"
                OPEN "tools\dimscreen.ini" FOR INPUT AS #1
                FOR getdimcount = 1 TO 4
                    LINE INPUT #1, getdimcount$(getdimcount)
                NEXT getdimcount
                CLOSE #1
                getdimcount$ = RIGHT$(getdimcount$(4), 1)
                dimcount = (VAL(getdimcount$) * 10)
                speechoutput$ = "launching ScreenDim"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "up" OR usercommand$(runcommands2) = "increase" THEN
                _SCREENPRINT (CHR$(0) + CHR$(130))
                dimcount = dimcount + 10
                speechoutput$ = "increasing dim"
                speechprint$ = speechoutput$
                GOSUB textprint
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "down" OR usercommand$(runcommands2) = "decrease" THEN
                _SCREENPRINT (CHR$(0) + CHR$(131))
                dimcount = dimcount - 10
                IF dimcount = 0 THEN
                    SHELL _DONTWAIT _HIDE "taskkill /IM dimscreen.exe /F"
                    speechoutput$ = "closing ScreenDim"
                    EXIT DO
                END IF
                speechoutput$ = "decreasing dim"
                speechprint$ = speechoutput$
                GOSUB textprint
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "off" THEN
                SHELL _DONTWAIT _HIDE "taskkill /IM dimscreen.exe /F"
                speechoutput$ = "closing ScreenDim"
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
