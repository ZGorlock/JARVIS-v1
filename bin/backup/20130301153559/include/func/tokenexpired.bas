FUNCTION TokenExpired& (expiresin&)
STATIC tokendate$
STATIC timemark
IF expiresin& THEN
    IF DATE$ = tokendate$ AND ABS(TIMER - timemark) < expiresin& - 2 THEN
        TokenExpired& = 0
        EXIT FUNCTION
    END IF
END IF
DO
    tokendate$ = DATE$
    t = TIMER
    testdate$ = DATE$
LOOP UNTIL testdate$ = tokendate$
timemark = t
TokenExpired& = 1
END FUNCTION