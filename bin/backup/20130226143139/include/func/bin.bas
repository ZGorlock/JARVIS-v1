FUNCTION bin$ (num%)
IF num% = 0 THEN EXIT FUNCTION
DO
    remain% = ABS(num% MOD 2)
    num% = num% \ 2
    bin$ = LTRIM$(STR$(remain%))
    bintotal$ = bin$ + bintotal$
LOOP UNTIL num% = 0
bin$ = STRING$(8 - LEN(bintotal$), "0") + bintotal$
END FUNCTION