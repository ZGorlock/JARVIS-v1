IF usercommand$(runcommands) = "cosine" OR usercommand$(runcommands) = "cosign" THEN
    DO
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
            answer## = COS((num##(1) * ((4 * (ATN(1))) / 180)))
            speechoutput$ = STR$(answer##) + " degrees"
        END IF
        IF anglepref = 0 THEN
            answer## = COS(num##(1))
            speechoutput$ = STR$(answer##) + " radians"
        END IF
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF
