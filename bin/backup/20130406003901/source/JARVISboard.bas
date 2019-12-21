_SCREENHIDE
_TITLE "JARVISboard"
SCREEN 13
icon = _LOADIMAGE("..\resources\jarvis.png")
_ICON icon
SCREEN 0
WIDTH 64, 6
_SCREENMOVE _MIDDLE
DO
    _LIMIT 1
    jarvisclient = _OPENCLIENT("TCP/IP:7319:localhost")
LOOP UNTIL jarvisclient < 0
DO
    DO
        _LIMIT 8
        INPUT #jarvisclient, request$
    LOOP WHILE request$ = ""
    IF request$ = "terminate" THEN
        CLOSE #jarvisclient
        SYSTEM
    END IF
    _SCREENSHOW
    unescape:
    DO
        _LIMIT 32
        CLS
        VIEW PRINT 1 TO 6
        PRINT request$
        PRINT ": " + MID$(response$, 1, 60)
        PRINT "  "; MID$(response$, 61, 60)
        PRINT "  "; MID$(response$, 121, 60)
        k$ = INKEY$
        IF k$ >= CHR$(32) AND k$ <= CHR$(126) THEN response$ = response$ + k$
        IF k$ = CHR$(8) AND LEN(response$) <> 1 THEN response$ = MID$(response$, 1, (LEN(response$) - 1))
        IF k$ = (CHR$(0) + CHR$(83)) THEN response$ = ""
        IF k$ = CHR$(22) THEN response$ = _CLIPBOARD$
        IF LEN(response$) > 180 THEN response$ = MID$(response$, 1, 180)
        _DISPLAY
        IF _EXIT GOTO unescape
    LOOP UNTIL k$ = CHR$(13)
    _SCREENHIDE
    IF response$ = "" THEN response$ = CHR$(255)
    PRINT #jarvisclient, response$
    response$ = ""
LOOP