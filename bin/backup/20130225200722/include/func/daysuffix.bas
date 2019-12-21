FUNCTION DaySuffix$ (day)
day$ = STR$(day)
suffix$ = "th"
IF day < 11 OR day > 19 THEN
    SELECT CASE VAL(RIGHT$(day$, 1))
        CASE 1
            suffix$ = "st"
        CASE 2
            suffix$ = "nd"
        CASE 3
            suffix$ = "rd"
    END SELECT
END IF
DaySuffix$ = day$ + suffix$
END FUNCTION