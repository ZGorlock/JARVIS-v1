sodukoboard:
PCOPY 1, 0
xprint = 0
yprint = 0
DO
    FOR printx = 182 TO 470 STEP 32
        xprint = xprint + 1
        IF xprint = 10 THEN EXIT DO
        yprint = 0
        DO
            FOR printy = 105 TO 393 STEP 32
                yprint = yprint + 1
                IF yprint = 10 THEN EXIT DO
                IF (((printx - 182) / 32) + 1) = xsector AND (((printy - 105) / 32) + 1) = ysector THEN
                    COLOR 0, 15
                    PAINT (printx, printy), 15, 7
                ELSE
                    COLOR 15, 0
                END IF
                _PRINTMODE _KEEPBACKGROUND
                IF puzzle(xprint, yprint) <> 0 THEN _PRINTSTRING (printx, printy), STR$(puzzle(xprint, yprint))
            NEXT printy
            EXIT DO
        LOOP
    NEXT printx
    EXIT DO
LOOP
RETURN