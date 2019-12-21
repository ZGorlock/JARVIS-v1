FUNCTION TagBin$ (value, byt)
n = value
c = 0
DO
    IF n MOD 2 = 1 THEN
        b$ = "1" + b$
    ELSE
        b$ = "0" + b$
    END IF
    n = n \ 2
    c = (c + 1)
    IF c MOD 4 = 0 THEN b$ = " " + b$
LOOP UNTIL n < 2
IF n = 1 THEN
    b$ = "1" + b$
ELSE
    b$ = "0" + b$
END IF
c = c + 1
IF c MOD 4 = 0 THEN b$ = " " + b$
FOR x = c + 1 TO byt * 8
    b$ = "0" + b$
    IF x MOD 4 = 0 THEN b$ = " " + b$
NEXT x
Bin$ = b$
END FUNCTION