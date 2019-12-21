errorhandler:
IF errorhandler = 1 THEN
    DO
        PRINT #2, "Error:"; ERR; ":"; _ERRORLINE
        errorcount = errorcount + 1
        active = 0
        speechoutput$ = "an error has occured"
        status$ = "INACTIVE"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        CLOSE #1
        usercommands = 0
        EXIT DO
    LOOP
END IF
RETURN