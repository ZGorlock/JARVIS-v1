IF usercommand$(runcommands) = "buffer" THEN
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
        buffer& = num##(1)
        EXIT DO
    LOOP
END IF
