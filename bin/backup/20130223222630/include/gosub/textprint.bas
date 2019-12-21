textprint:
CLS
VIEW PRINT 1 TO 13
COLOR textcolor, 0
PRINT "JARVIS -- Just Another Rather Very Intelligent System"
PRINT "> "; status$
PRINT "> "; LEFT$(typing$, 60); LEFT$(useroutput$, 60)
IF LEN(typing$) > 60 OR LEN(useroutput$) > 60 THEN PRINT "  "; MID$(typing$, 61, 60); MID$(useroutput$, 61, 60)
IF LEN(typing$) > 120 OR LEN(useroutput$) > 120 THEN PRINT "  "; MID$(typing$, 121, 60); MID$(useroutput$, 121, 60)
IF LEN(typing$) > 180 OR LEN(useroutput$) > 180 THEN PRINT "  "; MID$(typing$, 181, 60); MID$(useroutput$, 181, 60)
IF (LEN(typing$) > 240 AND LEN(typing$) < 256) OR (LEN(useroutput$) > 240 AND LEN(useroutput$) < 256) THEN PRINT "  "; MID$(typing$, 241, 15); MID$(useroutput$, 241, 15)
IF LEN(typing$) > 256 OR LEN(useroutput$) > 256 THEN PRINT "  "; MID$(typing$, 241, 12); MID$(useroutput$, 241, 12); "..."
PRINT "> "; LEFT$(speechprint$, 60)
IF LEN(speechprint$) > 60 THEN PRINT "  "; MID$(speechprint$, 61, 60)
IF LEN(speechprint$) > 120 THEN PRINT "  "; MID$(speechprint$, 121, 60)
IF LEN(speechprint$) > 180 THEN PRINT "  "; MID$(speechprint$, 181, 60)
IF LEN(speechprint$) > 240 AND LEN(speechprint$) < 256 THEN PRINT "  "; MID$(speechprint$, 241, 15)
IF LEN(speechprint$) > 256 THEN PRINT "  "; MID$(speechprint$, 241, 12); "..."
IF LEN(module$) THEN
    LOCATE 2, (64 - (LEN(module$) + 1))
    PRINT module$; "<";
END IF
_DISPLAY
ON ERROR GOTO errorhandler
IF _EXIT THEN GOTO xcleanup
GOSUB logger
RETURN