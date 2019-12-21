IF usercommand$(runcommands) = "random" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "number" THEN
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
                IF num##(1) > num##(2) THEN
                    rngstart## = num##(2)
                    rngend## = num##(1)
                ELSE
                    IF num##(2) > num##(1) THEN
                        rngstart## = num##(1)
                        rngend## = num##(2)
                    ELSE
                        IF num##(1) = num##(2) THEN
                            rngstart## = num##(1)
                            rngend## = num##(1)
                        END IF
                    END IF
                END IF
                rngdif## = rngend## - rngstart##
                RANDOMIZE TIMER
                rng## = INT(RND * rngdif## + (rngstart## + 1))
                speechoutput$ = STR$(rng##)
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
