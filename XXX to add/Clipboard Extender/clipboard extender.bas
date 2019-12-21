SCREEN 0
SCREEN 12
_TITLE "Clipboard Extender"
CLIPBOARDS:
DO
    _LIMIT 20
    CLS
    PRINT "What would you like to do?"
    PRINT "     0-Instructions"
    PRINT "     1-Set Clipboards"
    PRINT "     2-Use Clipboards"
    PRINT "     3-Empty Clipboard Data"
    DO
        k$ = INKEY$
    LOOP UNTIL LEN(k$)
    IF k$ = CHR$(48) THEN
        DO
            _LIMIT 20
            CLS
            PRINT "This utility was made to allow you to alternate between clipboard data at the press of a button. First you must copy the thing you want to set to a clipboard. Then go to 'Set Clipboards' and select a number 1-9. Once you select this number, the thing previously copied to your clipboard will be saved. You can do this with as many of the handles as you need, up to 9. After you have set what you need, press Esc to return to the main menu. Now go to 'Use Clipboards'. You will see what you set before, or, if it is large, the first 50 characters, and the handles you set them with. Simply press a handle to copy the previously set string to your clipboard. The program will then return you to the 'Use Clipboards' page, allowing you to switch between handles very easily. Sinmple press a new number handle to copy a different set string. You can press Esc at any time in order to retun to the main menu."
            DO
                k$ = INKEY$
            LOOP UNTIL LEN(k$)
            IF k$ = CHR$(27) THEN
                GOTO CLIPBOARDS
            END IF
        LOOP
    END IF
    IF k$ = CHR$(49) THEN
        OPEN "clipboard extender\clipboard1.txt" FOR INPUT AS #1
        INPUT #1, clipboard1$
        CLOSE #1
        OPEN "clipboard extender\clipboard2.txt" FOR INPUT AS #1
        INPUT #1, clipboard2$
        CLOSE #1
        OPEN "clipboard extender\clipboard3.txt" FOR INPUT AS #1
        INPUT #1, clipboard3$
        CLOSE #1
        OPEN "clipboard extender\clipboard4.txt" FOR INPUT AS #1
        INPUT #1, clipboard4$
        CLOSE #1
        OPEN "clipboard extender\clipboard5.txt" FOR INPUT AS #1
        INPUT #1, clipboard5$
        CLOSE #1
        OPEN "clipboard extender\clipboard6.txt" FOR INPUT AS #1
        INPUT #1, clipboard6$
        CLOSE #1
        OPEN "clipboard extender\clipboard7.txt" FOR INPUT AS #1
        INPUT #1, clipboard7$
        CLOSE #1
        OPEN "clipboard extender\clipboard8.txt" FOR INPUT AS #1
        INPUT #1, clipboard8$
        CLOSE #1
        OPEN "clipboard extender\clipboard9.txt" FOR INPUT AS #1
        INPUT #1, clipboard9$
        CLOSE #1
        DO
            _LIMIT 20
            CLS
            PRINT "Press any key to set that handle"
            PRINT " 1 - '"; LEFT$(clipboard1$, 50); "'"
            PRINT " 2 - '"; LEFT$(clipboard2$, 50); "'"
            PRINT " 3 - '"; LEFT$(clipboard3$, 50); "'"
            PRINT " 4 - '"; LEFT$(clipboard4$, 50); "'"
            PRINT " 5 - '"; LEFT$(clipboard5$, 50); "'"
            PRINT " 6 - '"; LEFT$(clipboard6$, 50); "'"
            PRINT " 7 - '"; LEFT$(clipboard7$, 50); "'"
            PRINT " 8 - '"; LEFT$(clipboard8$, 50); "'"
            PRINT " 9 - '"; LEFT$(clipboard9$, 50); "'"
            DO
                k$ = INKEY$
            LOOP UNTIL LEN(k$)
            IF k$ = CHR$(27) THEN
                GOTO CLIPBOARDS
            END IF
            IF k$ = CHR$(49) THEN
                clipboard1$ = _CLIPBOARD$
                OPEN "clipboard extender\clipboard1.txt" FOR OUTPUT AS #1
                WRITE #1, clipboard1$
                CLOSE #1
            END IF
            IF k$ = CHR$(50) THEN
                clipboard2$ = _CLIPBOARD$
                OPEN "clipboard extender\clipboard2.txt" FOR OUTPUT AS #1
                WRITE #1, clipboard2$
                CLOSE #1
            END IF
            IF k$ = CHR$(51) THEN
                clipboard3$ = _CLIPBOARD$
                OPEN "clipboard extender\clipboard3.txt" FOR OUTPUT AS #1
                WRITE #1, clipboard3$
                CLOSE #1
            END IF
            IF k$ = CHR$(52) THEN
                clipboard4$ = _CLIPBOARD$
                OPEN "clipboard extender\clipboard4.txt" FOR OUTPUT AS #1
                WRITE #1, clipboard4$
                CLOSE #1
            END IF
            IF k$ = CHR$(53) THEN
                clipboard5$ = _CLIPBOARD$
                OPEN "clipboard extender\clipboard5.txt" FOR OUTPUT AS #1
                WRITE #1, clipboard5$
                CLOSE #1
            END IF
            IF k$ = CHR$(54) THEN
                clipboard6$ = _CLIPBOARD$
                OPEN "clipboard extender\clipboard6.txt" FOR OUTPUT AS #1
                WRITE #1, clipboard6$
                CLOSE #1
            END IF
            IF k$ = CHR$(55) THEN
                clipboard7$ = _CLIPBOARD$
                OPEN "clipboard extender\clipboard7.txt" FOR OUTPUT AS #1
                WRITE #1, clipboard7$
                CLOSE #1
            END IF
            IF k$ = CHR$(56) THEN
                clipboard8$ = _CLIPBOARD$
                OPEN "clipboard extender\clipboard8.txt" FOR OUTPUT AS #1
                WRITE #1, clipboard8$
                CLOSE #1
            END IF
            IF k$ = CHR$(57) THEN
                clipboard9$ = _CLIPBOARD$
                OPEN "clipboard extender\clipboard9.txt" FOR OUTPUT AS #1
                WRITE #1, clipboard9$
                CLOSE #1
            END IF
        LOOP
    END IF
    IF k$ = CHR$(50) THEN
        OPEN "clipboard extender\clipboard1.txt" FOR INPUT AS #1
        INPUT #1, clipboard1$
        CLOSE #1
        OPEN "clipboard extender\clipboard2.txt" FOR INPUT AS #1
        INPUT #1, clipboard2$
        CLOSE #1
        OPEN "clipboard extender\clipboard3.txt" FOR INPUT AS #1
        INPUT #1, clipboard3$
        CLOSE #1
        OPEN "clipboard extender\clipboard4.txt" FOR INPUT AS #1
        INPUT #1, clipboard4$
        CLOSE #1
        OPEN "clipboard extender\clipboard5.txt" FOR INPUT AS #1
        INPUT #1, clipboard5$
        CLOSE #1
        OPEN "clipboard extender\clipboard6.txt" FOR INPUT AS #1
        INPUT #1, clipboard6$
        CLOSE #1
        OPEN "clipboard extender\clipboard7.txt" FOR INPUT AS #1
        INPUT #1, clipboard7$
        CLOSE #1
        OPEN "clipboard extender\clipboard8.txt" FOR INPUT AS #1
        INPUT #1, clipboard8$
        CLOSE #1
        OPEN "clipboard extender\clipboard9.txt" FOR INPUT AS #1
        INPUT #1, clipboard9$
        CLOSE #1
        DO
            _LIMIT 20
            CLS
            PRINT "Press any key to set that handle"
            PRINT " 1 - '"; LEFT$(clipboard1$, 50); "'"
            PRINT " 2 - '"; LEFT$(clipboard2$, 50); "'"
            PRINT " 3 - '"; LEFT$(clipboard3$, 50); "'"
            PRINT " 4 - '"; LEFT$(clipboard4$, 50); "'"
            PRINT " 5 - '"; LEFT$(clipboard5$, 50); "'"
            PRINT " 6 - '"; LEFT$(clipboard6$, 50); "'"
            PRINT " 7 - '"; LEFT$(clipboard7$, 50); "'"
            PRINT " 8 - '"; LEFT$(clipboard8$, 50); "'"
            PRINT " 9 - '"; LEFT$(clipboard9$, 50); "'"
            DO
                k$ = INKEY$
            LOOP UNTIL LEN(k$)
            IF k$ = CHR$(27) THEN
                GOTO CLIPBOARDS
            END IF
            IF k$ = CHR$(49) THEN
                _CLIPBOARD$ = clipboard1$
            END IF
            IF k$ = CHR$(50) THEN
                _CLIPBOARD$ = clipboard2$
            END IF
            IF k$ = CHR$(51) THEN
                _CLIPBOARD$ = clipboard3$
            END IF
            IF k$ = CHR$(52) THEN
                _CLIPBOARD$ = clipboard4$
            END IF
            IF k$ = CHR$(53) THEN
                _CLIPBOARD$ = clipboard5$
            END IF
            IF k$ = CHR$(54) THEN
                _CLIPBOARD$ = clipboard6$
            END IF
            IF k$ = CHR$(55) THEN
                _CLIPBOARD$ = clipboard7$
            END IF
            IF k$ = CHR$(56) THEN
                _CLIPBOARD$ = clipboard8$
            END IF
            IF k$ = CHR$(57) THEN
                _CLIPBOARD$ = clipboard9$
            END IF
        LOOP
    END IF
    IF k$ = CHR$(51) THEN
        clipboard1$ = ""
        clipboard2$ = ""
        clipboard3$ = ""
        clipboard4$ = ""
        clipboard5$ = ""
        clipboard6$ = ""
        clipboard7$ = ""
        clipboard8$ = ""
        clipboard9$ = ""
        OPEN "clipboard extender\clipboard1.txt" FOR OUTPUT AS #1
        WRITE #1, clipboard1$
        CLOSE #1
        OPEN "clipboard extender\clipboard2.txt" FOR OUTPUT AS #1
        WRITE #1, clipboard2$
        CLOSE #1
        OPEN "clipboard extender\clipboard3.txt" FOR OUTPUT AS #1
        WRITE #1, clipboard3$
        CLOSE #1
        OPEN "clipboard extender\clipboard4.txt" FOR OUTPUT AS #1
        WRITE #1, clipboard4$
        CLOSE #1
        OPEN "clipboard extender\clipboard5.txt" FOR OUTPUT AS #1
        WRITE #1, clipboard5$
        CLOSE #1
        OPEN "clipboard extender\clipboard6.txt" FOR OUTPUT AS #1
        WRITE #1, clipboard6$
        CLOSE #1
        OPEN "clipboard extender\clipboard7.txt" FOR OUTPUT AS #1
        WRITE #1, clipboard7$
        CLOSE #1
        OPEN "clipboard extender\clipboard8.txt" FOR OUTPUT AS #1
        WRITE #1, clipboard8$
        CLOSE #1
        OPEN "clipboard extender\clipboard9.txt" FOR OUTPUT AS #1
        WRITE #1, clipboard9$
        CLOSE #1
        GOTO CLIPBOARDS
    END IF
LOOP