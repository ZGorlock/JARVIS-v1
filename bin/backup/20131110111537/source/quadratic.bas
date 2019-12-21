_SCREENHIDE
_TITLE "Quadratic Formula Solver"
SCREEN 13
icon = _LOADIMAGE("..\resources\jarvis.png")
_ICON icon
SCREEN 12
_SCREENSHOW
DO
    a$ = ""
    b$ = ""
    c$ = ""
    d$ = ""
    e$ = ""
    inputs = 0
    DO
        inputs = inputs + 1
        DO
            _LIMIT 64
            CLS
            PRINT "x^2 coeficient: "; a$
            PRINT "x coeficient: "; b$
            PRINT "constant: "; c$
            IF d$ <> "" AND e$ <> "" THEN
                PRINT
                PRINT "roots: ("; d$; ", "; e$; ")"
                PRINT
                PRINT "Press Space to figure another, press Esc to exit."
            END IF
            k$ = INKEY$
            IF k$ = CHR$(27) THEN SYSTEM
            SELECT CASE inputs
                CASE 1
                    IF (k$ >= CHR$(48) AND k$ <= CHR$(57)) OR k$ = CHR$(45) OR k$ = CHR$(46) THEN a$ = a$ + k$
                    IF k$ = CHR$(8) AND LEN(a$) THEN a$ = MID$(a$, 1, (LEN(a$) - 1))
                CASE 2
                    IF (k$ >= CHR$(48) AND k$ <= CHR$(57)) OR k$ = CHR$(45) OR k$ = CHR$(46) THEN b$ = b$ + k$
                    IF k$ = CHR$(8) AND LEN(b$) THEN b$ = MID$(b$, 1, (LEN(b$) - 1))
                CASE 3
                    IF (k$ >= CHR$(48) AND k$ <= CHR$(57)) OR k$ = CHR$(45) OR k$ = CHR$(46) THEN c$ = c$ + k$
                    IF k$ = CHR$(8) AND LEN(c$) THEN c$ = MID$(c$, 1, (LEN(c$) - 1))
            END SELECT
            _DISPLAY
            IF inputs = 4 THEN EXIT DO
        LOOP UNTIL k$ = CHR$(13)
        IF inputs = 3 THEN
            a = VAL(a$)
            b = VAL(b$)
            c = VAL(c$)
            i = 0
            deriv = ((b ^ 2) - (4 * a * c))
            IF deriv < 0 THEN
                i = 1
                f = (SQR((deriv * -1)))
                d$ = LTRIM$(STR$(((-1 * b) / (2 * a)))) + "+" + LTRIM$(STR$((f / (2 * a)))) + "i"
                e$ = LTRIM$(STR$(((-1 * b) / (2 * a)))) + "-" + LTRIM$(STR$((f / (2 * a)))) + "i"
            ELSE
                d$ = STR$((((-1 * b) + SQR(deriv)) / (2 * a)))
                e$ = STR$((((-1 * b) - SQR(deriv)) / (2 * a)))
            END IF
        END IF
    LOOP UNTIL inputs = 4
    DO
        _LIMIT 64
        k$ = INKEY$
    LOOP UNTIL k$ = CHR$(32) OR k$ = CHR$(27)
LOOP UNTIL k$ = CHR$(27)
SYSTEM