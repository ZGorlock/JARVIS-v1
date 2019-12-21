IF usercommand$(runcommands) = "speed" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "set" THEN
                containnum = 0
                DO
                    FOR numcheck = 1 TO userinputs
                        IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                            num##(1) = VAL(userinputcopy$(numcheck))
                            containnum = 1
                            EXIT DO
                        END IF
                    NEXT numcheck
                    EXIT DO
                LOOP
                IF containnum = 0 THEN EXIT DO
                speed& = num##(1)
                speechoutput$ = "speed set to " + LTRIM$(STR$(speed&)) + " loops per second"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                useroutputuse$ = ""
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        speechoutput$ = "current speed is " + LTRIM$(STR$(speed&)) + "loops per second"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF
