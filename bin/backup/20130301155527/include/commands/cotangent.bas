IF usercommand$(runcommands) = "cotangent" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            FOR runcommands3 = 1 TO commandcount
                IF usercommand$(runcommands2) = commands$(runcommands3) AND usercommand$(runcommands2) <> "cotangent" THEN EXIT DO
            NEXT runcommands3
        NEXT runcommands2
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
        containnum = 0
        IF anglepref = 1 THEN
            answer## = 1 / (TAN((num##(1) * ((4 * (ATN(1))) / 180))))
            speechoutput$ = STR$(answer##) + " degrees"
        END IF
        IF anglepref = 0 THEN
            answer## = 1 / (TAN(num##(1)))
            speechoutput$ = STR$(answer##) + " radians"
        END IF
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF
