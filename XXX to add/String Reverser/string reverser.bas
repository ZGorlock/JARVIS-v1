_TITLE "String Reverser"
SCREEN 12
CLS
PRINT "Copy the string you want reversed to your clipboard"
PRINT "Press Space to copy the reversed string to your clipboard"
PRINT "Press Esc to exit"
DO
    DO
        _LIMIT 64
        k$ = INKEY$
    LOOP UNTIL k$ <> ""
    a$ = _CLIPBOARD$
    c$ = ""
    FOR b = LEN(a$) TO 1 STEP -1
        c$ = c$ + MID$(a$, b, 1)
    NEXT b
    _CLIPBOARD$ = c$
LOOP UNTIL k$ = CHR$(27)
SYSTEM