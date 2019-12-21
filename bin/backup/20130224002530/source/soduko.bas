_TITLE "Soduko Solver"
SCREEN 13
icon = _LOADIMAGE("..\resources\jarvis.png")
_ICON icon
SCREEN 12
crlf$ = CHR$(13) + CHR$(10)
GOSUB makesodukobg
DO
    REDIM SHARED puzzle(9, 9)
    DIM SHARED finflag
    DO
        _LIMIT 64
        GOSUB sodukoboard
        COLOR 15, 0
        LOCATE 1, 1
        PRINT "Enter what you know then press Enter"
        k$ = INKEY$
        IF k$ >= CHR$(49) AND k$ <= CHR$(57) THEN puzzle(xsector, ysector) = VAL(k$)
        IF k$ = CHR$(8) THEN puzzle(xsector, ysector) = 0
        IF k$ = (CHR$(0) + CHR$(80)) THEN ysector = ysector + 1
        IF k$ = (CHR$(0) + CHR$(72)) THEN ysector = ysector - 1
        IF k$ = (CHR$(0) + CHR$(77)) THEN xsector = xsector + 1
        IF k$ = (CHR$(0) + CHR$(75)) THEN xsector = xsector - 1
        IF k$ = CHR$(3) THEN
            copypuzzle$ = "-------------------------------" + crlf$
            FOR colcopy = 1 TO 9
                copypuzzle$ = copypuzzle$ + "|"
                FOR rowcopy = 1 TO 9
                    IF puzzle(rowcopy, colcopy) = 0 THEN
                        copypuzzle$ = copypuzzle$ + "   "
                    ELSE
                        copypuzzle$ = copypuzzle$ + " " + LTRIM$(RTRIM$(STR$(puzzle(rowcopy, colcopy)))) + " "
                    END IF
                    IF (rowcopy / 3) = INT((rowcopy / 3)) THEN copypuzzle$ = copypuzzle$ + "|"
                NEXT rowcopy
                IF (colcopy / 3) = INT((colcopy / 3)) THEN copypuzzle$ = copypuzzle$ + crlf$ + "-------------------------------"
                copypuzzle$ = copypuzzle$ + crlf$
            NEXT colcopy
            _CLIPBOARD$ = copypuzzle$
        END IF
        IF NOT (xsector = 0 AND ysector = 0) THEN
            IF xsector < 1 THEN xsector = 1
            IF xsector > 9 THEN xsector = 9
            IF ysector < 1 THEN ysector = 1
            IF ysector > 9 THEN ysector = 9
        END IF
        DO WHILE _MOUSEINPUT
            IF _MOUSEBUTTON(1) THEN
                x = _MOUSEX
                y = _MOUSEY
                DO
                    xsector = INT((x - 144) / 32)
                    IF xsector < 1 OR xsector > 9 THEN
                        xsector = 0
                        ysector = 0
                        EXIT DO
                    END IF
                    ysector = INT((y - 64) / 32)
                    IF ysector < 1 OR ysector > 9 THEN
                        xsector = 0
                        ysector = 0
                        EXIT DO
                    END IF
                    EXIT DO
                LOOP
            END IF
        LOOP
        _DISPLAY
    LOOP UNTIL k$ = CHR$(13) OR k$ = CHR$(27)
    IF k$ = CHR$(27) THEN SYSTEM
    xsector = 0
    ysector = 0
    puzzle = SodukoSolve(1, 1)
    finflag = 0
    GOSUB sodukoboard
    COLOR 15, 0
    LOCATE 1, 1
    IF puzzle THEN
        PRINT "The puzzle has been completed!"
    ELSE
        PRINT "This puzzle was unsolvable or an exception has occured!"
    END IF
    PRINT
    PRINT "Press Escape to exit, Enter to do another puzzle"
    _DISPLAY
    DO
        _LIMIT 64
        k$ = INKEY$
        IF k$ = CHR$(3) THEN
            copypuzzle$ = "-------------------------------" + crlf$
            FOR colcopy = 1 TO 9
                copypuzzle$ = copypuzzle$ + "|"
                FOR rowcopy = 1 TO 9
                    IF puzzle(rowcopy, colcopy) = 0 THEN
                        copypuzzle$ = copypuzzle$ + "   "
                    ELSE
                        copypuzzle$ = copypuzzle$ + " " + LTRIM$(RTRIM$(STR$(puzzle(rowcopy, colcopy)))) + " "
                    END IF
                    IF (rowcopy / 3) = INT((rowcopy / 3)) THEN copypuzzle$ = copypuzzle$ + "|"
                NEXT rowcopy
                IF (colcopy / 3) = INT((colcopy / 3)) THEN copypuzzle$ = copypuzzle$ + crlf$ + "-------------------------------"
                copypuzzle$ = copypuzzle$ + crlf$
            NEXT colcopy
            _CLIPBOARD$ = copypuzzle$
        END IF
    LOOP UNTIL k$ = CHR$(13) OR k$ = CHR$(27)
LOOP UNTIL k$ = CHR$(27)
SYSTEM

'$include:'..\include\gosub\makesodukobg.bas'
'$include:'..\include\gosub\sodukoboard.bas'

'$include:'..\include\func\sodukocheckbox.bas'
'$include:'..\include\func\sodukocheckcol.bas'
'$include:'..\include\func\sodukocheckrow.bas'
'$include:'..\include\func\sodukosolve.bas'