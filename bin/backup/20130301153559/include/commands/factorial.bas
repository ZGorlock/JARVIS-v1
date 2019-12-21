IF usercommand$(runcommands) = "factorial" OR usercommand$(runcommands) = "!" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            FOR runcommands3 = 1 TO commandcount
                IF usercommand$(runcommands2) = commands$(runcommands3) AND usercommand$(runcommands2) <> "factorial" AND usercommand$(runcommands2) <> "!" THEN EXIT DO
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
        answer## = num##(1)
        FOR factorial = (num##(1) - 1) TO 1 STEP -1
            answer## = answer## * factorial
        NEXT factorial
        speechoutput$ = STR$(answer##)
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF
