IF usercommand$(runcommands) = "clip" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "board" THEN
                FOR runcommands3 = 1 TO usercommands
                    IF usercommand$(runcommands3) = "clear" OR usercommand$(runcommands3) = "empty" THEN
                        SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " clipboard clear"
                        speechoutput$ = "cliboard cleared"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        EXIT DO
                    END IF
                NEXT runcommands3
                speechoutput$ = "speech output copied to cliboard"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                IF LEN(speechcopy$) THEN
                    _CLIPBOARD$ = speechcopy$
                    speechcopy = 0
                    speechcopy$ = ""
                ELSE
                    _CLIPBOARD$ = outputrecord$((outputrecord - (1 + justcopied)))
                END IF
                usercommands = -1
                justcopied =  justcopied + 1
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
IF usercommand$(runcommands) = "clipboard" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "clear" OR usercommand$(runcommands2) = "empty" THEN
                SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " clipboard clear"
                speechoutput$ = "cliboard cleared"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        speechoutput$ = "speech output copied to cliboard"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        IF LEN(speechcopy$) THEN
            _CLIPBOARD$ = speechcopy$
            speechcopy = 0
            speechcopy$ = ""
        ELSE
            _CLIPBOARD$ = outputrecord$((outputrecord - (1 + justcopied)))
        END IF
        usercommands = -1
        justcopied =  justcopied + 1
        usercommands = -1
        EXIT DO
    LOOP
END IF
