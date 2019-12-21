FUNCTION RemContainer$ (text$, s$, e$)
FOR index = 1 TO LEN(text$)
    chunk$ = MID$(text$, index, 1)
    IF chunk$ = s$ THEN
        DO
            index = index + 1
            IF index > LEN(text$) THEN
                RemContainer$ = text$
                EXIT DO
            END IF
            chunk$ = MID$(text$, index, 1)
        LOOP UNTIL chunk$ = e$
    ELSE
        RemContainer$ = RemContainer$ + chunk$
    END IF
NEXT index
END FUNCTION