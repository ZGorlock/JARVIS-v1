IF usercommand$(runcommands) = "note" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "pad" THEN
                speechoutput$ = "opening a notepad"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "start notepad.exe"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
