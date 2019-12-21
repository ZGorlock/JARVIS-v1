SCREEN 0
SCREEN 12
_TITLE "Fibonacci Finder"
gr## = 1.61803398874989484820
DO
    DO
        DO
            term$ = ""
            exitloop = 0
            DO
                CLS
                PRINT "What term number would you like to find?"
                PRINT "Fibonacci Term #"; term$
                SLEEP
                k$ = INKEY$
                IF k$ >= CHR$(47) AND k$ <= CHR$(58) THEN
                    term$ = term$ + k$
                    inputlength = LEN(term$)
                END IF
                IF k$ = CHR$(8) AND inputlength > 0 THEN
                    term$ = MID$(term$, 1, (inputlength - 1))
                    inputlength = (inputlength - 1)
                END IF
            LOOP UNTIL k$ = CHR$(13)
            term = VAL(term$)
            IF term > 2147483648 OR term < -1 THEN
                EXIT DO
            END IF
            exitloop = 1
            EXIT DO
        LOOP
        IF exitloop = 1 THEN EXIT DO
    LOOP
    answer## = INT((((gr## ^ term) - ((1 - gr##) ^ term)) / (SQR(5))))
    DO
        k$ = INKEY$
    LOOP UNTIL k$ = ""
    CLS
    PRINT "Fibonacci Term #"; term$; " ~"; answer##
    DO
        k$ = INKEY$
    LOOP UNTIL LEN(k$)
LOOP