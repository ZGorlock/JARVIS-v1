IF usercommand$(runcommands) = "factor" OR usercommand$(runcommands) = "factors" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            FOR runcommands3 = 1 TO commandcount
                IF usercommand$(runcommands2) = commands$(runcommands3) AND usercommand$(runcommands2) <> "factor" AND usercommand$(runcommands2) <> "factors" THEN EXIT DO
            NEXT runcommands3
        NEXT runcommands2
        containnum = 0
        DO
            FOR numcheck = 1 TO userinputs
                IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                    num = VAL(userinputcopy$(numcheck))
                    containnum = 1
                    EXIT DO
                END IF
            NEXT numcheck
            EXIT DO
        LOOP
        IF containnum = 0 THEN EXIT DO
        containnum = 0
        IF num <> INT(num) THEN EXIT DO
        factors = 0
        REDIM factors(1024)
        maxval = (num / 2) + 1
        $CHECKING:OFF
        FOR checkdiv = 1 TO maxval
            IF num MOD checkdiv = 0 THEN
                factors = factors + 1
                factors(factors) = checkdiv
            END IF
        NEXT checkdiv
        $CHECKING:ON
        factors = factors + 1
        factors(factors) = num
        speechoutput$ = "the factors of " + TRIM$(STR$(num)) + " are "
        FOR addfactor = 1 TO factors
            SELECT CASE addfactor
                CASE factors
                    speechoutput$ = speechoutput$ + TRIM$(STR$(factors(addfactor)))
                CASE (factors - 1)
                    speechoutput$ = speechoutput$ + TRIM$(STR$(factors(addfactor))) + ", and "
                CASE ELSE
                    speechoutput$ = speechoutput$ + TRIM$(STR$(factors(addfactor))) + ", "
            END SELECT
        NEXT addfactor
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF