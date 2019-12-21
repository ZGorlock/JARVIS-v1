IF usercommand$(runcommands) = "mod" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            FOR runcommands3 = 1 TO commandcount
                IF usercommand$(runcommands2) = commands$(runcommands3) AND usercommand$(runcommands2) <> "mod" THEN EXIT DO
            NEXT runcommands3
        NEXT runcommands2
        nums = 0
        DO
            FOR numcheck = 1 TO userinputs
                IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                    nums = nums + 1
                    num##(nums) = VAL(userinputcopy$(numcheck))
                    IF nums = 2 THEN EXIT DO
                END IF
            NEXT numcheck
            EXIT DO
        LOOP
        IF nums <> 2 THEN EXIT DO
        answer## = num##(1) MOD num##(2)
        speechoutput$ = STR$(answer##)
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
    nums = 0
END IF
