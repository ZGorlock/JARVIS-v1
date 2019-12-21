IF usercommand$(runcommands) = "fractal" THEN
    DO
        DO
            fractaltype = 5
            speechoutput$ = "launching random fractal"
            FOR runcommands2 = 1 TO usercommands
                IF usercommand$(runcommands2) = "close" OR usercommand$(runcommands2) = "terminate" OR usercommand$(runcommands2) = "exit" OR usercommand$(runcommands2) = "end" THEN
                    SHELL _DONTWAIT _HIDE "taskkill /IM fractal.exe /F"
                    speechoutput$ = "closing fractal"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    usercommands = -1
                    EXIT DO
                END IF
                IF usercommand$(runcommands2) = "warp" THEN
                    fractaltype = 0
                    speechoutput$ = "launching warp fractal"
                    EXIT DO
                END IF
                IF usercommand$(runcommands2) = "leaf" THEN
                    fractaltype = 1
                    speechoutput$ = "launching leaf fractal"
                    EXIT DO
                END IF
                IF usercommand$(runcommands2) = "geometric" THEN
                    fractaltype = 2
                    speechoutput$ = "launching geometric fractal"
                    EXIT DO
                END IF
                IF usercommand$(runcommands2) = "burst" THEN
                    fractaltype = 3
                    speechoutput$ = "launching burst fractal"
                    EXIT DO
                END IF
                IF usercommand$(runcommands2) = "mandlebrot" THEN
                    fractaltype = 4
                    speechoutput$ = "launching mandlebrot fractal"
                    EXIT DO
                END IF
            NEXT runcommands2
            EXIT DO
        LOOP
        IF usercommands = -1 THEN EXIT DO
        OPEN "temp\fractaltype.tmp" FOR OUTPUT AS #1
        PRINT #1, LTRIM$(STR$(fractaltype))
        CLOSE #1
        SHELL _DONTWAIT _HIDE "start tools\fractal.exe"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF
