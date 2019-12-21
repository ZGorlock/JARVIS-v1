FUNCTION remspace$ (a$)
DO
    trimming = 0
    IF LEFT$(a$, 1) = CHR$(32) OR LEFT$(a$, 1) = CHR$(0) THEN
        a$ = MID$(a$, 2)
        trimming = 1
    END IF
    IF RIGHT$(a$, 1) = CHR$(32) OR RIGHT$(a$, 1) = CHR$(0) THEN
        a$ = MID$(a$, 1, (LEN(a$) - 1))
        trimming = 1
    END IF
LOOP UNTIL trimming = 0
remspace$ = a$
END FUNCTION