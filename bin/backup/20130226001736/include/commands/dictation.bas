IF usercommand$(runcommands) = "dictation" OR usercommand$(runcommands) = "dictate" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "start" OR usercommand$(runcommands2) = "begin" OR usercommand$(runcommands2) = "on" THEN
                dictate = 1
                speechoutput$ = "dictation started"
                speechprint$ = speechoutput$
                useroutputuse$ = ""
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
