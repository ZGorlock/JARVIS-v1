IF usercommand$(runcommands) = "root" THEN
    DO
        nums = 0
        DO
            FOR runcommands2 = 1 TO usercommands
                IF usercommand$(runcommands2) = "square" THEN
                    num##(1) = 2
                    nums = 1
                    EXIT DO
                END IF
                IF usercommand$(runcommands2) = "cube" THEN
                    num##(1) = 3
                    nums = 1
                    EXIT DO
                END IF
            NEXT runcommands2
            EXIT DO
        LOOP
        FOR runcommands2 = 1 TO usercommands
            FOR runcommands3 = 1 TO commandcount
                IF usercommand$(runcommands2) = commands$(runcommands3) AND usercommand$(runcommands2) <> "root" AND usercommand$(runcommands2) <> "square" AND usercommand$(runcommands2) <> "cube" THEN EXIT DO
            NEXT runcommands3
        NEXT runcommands2
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
        answer## = num##(2) ^ (1 / num##(1))
        speechoutput$ = STR$(answer##)
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
    nums = 0
END IF
