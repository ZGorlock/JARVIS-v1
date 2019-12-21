_TITLE "Visualizer"
SCREEN 13
icon = _LOADIMAGE("..\resources\jarvis.png")
_ICON icon
SCREEN _NEWIMAGE(640, 480, 32)
RANDOMIZE TIMER
DIM SHARED num
DIM SHARED spd
DIM SHARED colour
DIM SHARED fs
num = 4
spd = 20
colour = 1
fs = 0
DO
    IF colour = 0 THEN
        SCREEN 12
    ELSE
        SCREEN _NEWIMAGE(640, 480, 32)
    END IF
    REDIM SHARED c(num)
    REDIM SHARED d(num)
    REDIM SHARED l(num)
    REDIM SHARED m(num)
    REDIM SHARED r(num)
    REDIM SHARED s(num)
    FOR setvar = 1 TO num
        c(setvar) = 8 + setvar
        d(setvar) = INT(RND * 2)
        l(setvar) = INT(RND * 3)
        m(setvar) = INT(RND * 80 + 32)
        r(setvar) = 100
        s(setvar) = INT(RND * 40 - 20)
    NEXT setvar
    DO
        _LIMIT spd
        k$ = INKEY$
        IF k$ = CHR$(32) THEN
            DO
                _LIMIT 64
                k$ = INKEY$
            LOOP UNTIL k$ = CHR$(32)
        END IF
        IF k$ = (CHR$(0) + CHR$(59)) THEN
            oldnum = num
            oldspd = spd
            oldcol = colour
            DO
                _LIMIT 32
                CLS
                PRINT "Visualizer"
                PRINT
                PRINT "Press Esc to close the program"
                PRINT "Press F1 from the main program to go to the Menu"
                PRINT "Press Enter to return to the main program"
                PRINT "Press Space to Pause"
                PRINT "Press F11 to toggle fullscreen"
                PRINT
                PRINT "Press 1 to mod the number of objects"
                PRINT "Press 2 to mod the number of screens per second"
                PRINT "Press 3 to mod the colour scheme"
                _DISPLAY
                DO
                    _LIMIT 64
                    k$ = INKEY$
                LOOP UNTIL LEN(k$)
                IF k$ = (CHR$(0) + CHR$(133)) THEN
                    SELECT CASE fs
                        CASE 0
                            fs = 1
                            _FULLSCREEN
                        CASE 1
                            fs = 0
                            _FULLSCREEN _OFF
                    END SELECT
                END IF
                SELECT CASE ASC(k$)
                    CASE 27
                        SYSTEM
                    CASE 49
                        num$ = ""
                        DO
                            _LIMIT 64
                            CLS
                            PRINT "The number of objects. default=4"
                            PRINT "num= "; num$
                            _DISPLAY
                            DO
                                _LIMIT 64
                                k$ = INKEY$
                            LOOP UNTIL LEN(k$)
                            SELECT CASE ASC(k$)
                                CASE 8
                                    IF LEN(num$) > 0 THEN num$ = MID$(num$, 1, (LEN(num$) - 1))
                                CASE 27
                                    SYSTEM
                                CASE 48 TO 57
                                    num$ = num$ + k$
                            END SELECT
                            IF k$ = (CHR$(0) + CHR$(83)) THEN num$ = ""
                        LOOP UNTIL k$ = CHR$(13)
                        num = VAL(num$)
                    CASE 50
                        spd$ = ""
                        DO
                            _LIMIT 64
                            CLS
                            PRINT "The number of loops per second. default=20"
                            PRINT "spd= "; spd$
                            _DISPLAY
                            DO
                                _LIMIT 64
                                k$ = INKEY$
                            LOOP UNTIL LEN(k$)
                            SELECT CASE ASC(k$)
                                CASE 8
                                    IF LEN(spd$) > 0 THEN spd$ = MID$(spd$, 1, (LEN(spd$) - 1))
                                CASE 27
                                    SYSTEM
                                CASE 48 TO 57
                                    spd$ = spd$ + k$
                            END SELECT
                            IF k$ = (CHR$(0) + CHR$(83)) THEN spd$ = ""
                        LOOP UNTIL k$ = CHR$(13)
                        spd = VAL(spd$)
                    CASE 51
                        colour$ = ""
                        DO
                            _LIMIT 64
                            CLS
                            PRINT "The colour scheme. default=1"
                            PRINT "0-Static"
                            PRINT "1-RGB"
                            PRINT "colour= "; colour$
                            _DISPLAY
                            DO
                                _LIMIT 64
                                k$ = INKEY$
                            LOOP UNTIL LEN(k$)
                            SELECT CASE ASC(k$)
                                CASE 8
                                    IF LEN(colour$) > 0 THEN colour$ = MID$(colour$, 1, (LEN(colour$) - 1))
                                CASE 13
                                    IF VAL(colour$) = 0 OR VAL(colour$) = 1 THEN EXIT DO
                                CASE 27
                                    SYSTEM
                                CASE 48 TO 57
                                    colour$ = colour$ + k$
                            END SELECT
                            IF k$ = (CHR$(0) + CHR$(83)) THEN colour$ = ""
                        LOOP
                        colour = VAL(colour$)
                END SELECT
                _DISPLAY
            LOOP UNTIL k$ = CHR$(13)
            DO
                k$ = INKEY$
            LOOP UNTIL k$ = ""
            IF num <> oldnum OR spd <> oldspd OR colour <> oldcol THEN EXIT DO
        END IF
        IF k$ = (CHR$(0) + CHR$(133)) THEN
            SELECT CASE fs
                CASE 0
                    fs = 1
                    _FULLSCREEN
                CASE 1
                    fs = 0
                    _FULLSCREEN _OFF
            END SELECT
        END IF
        FOR cd = 1 TO num
            IF INT(RND * 8) = 0 THEN
                SELECT CASE d(cd)
                    CASE 0
                        d(cd) = 1
                        s(cd) = INT(RND * 40 - 20)
                    CASE 1
                        d(cd) = 0
                        s(cd) = INT(RND * 40 - 20)
                END SELECT
            END IF
        NEXT cd
        FOR cr = 1 TO num
            IF INT(RND * 4) = 0 THEN
                d(cr) = INT(RND * 2)
                s(cr) = INT(RND * 40 - 20)
            END IF
            SELECT CASE d(cr)
                CASE 0
                    r(cr) = r(cr) - s(cr)
                CASE 1
                    r(cr) = r(cr) + s(cr)
            END SELECT
        NEXT cr
        FOR check = 1 TO num
            IF r(check) >= 199 THEN
                r(check) = 189 + INT(RND * 20 - 10)
                d(check) = INT(RND * 2)
                s(check) = INT(RND * 40 - 20)
            END IF
            IF r(check) <= 50 THEN
                r(check) = 60 + INT(RND * 20 - 10)
                d(check) = INT(RND * 2)
                s(check) = INT(RND * 40 - 20)
            END IF
        NEXT check
        dlcf = 0
        FOR dlc = 1 TO num
            IF l(dlc) = 0 THEN dlcf = 1
        NEXT dlc
        IF dlcf = 0 THEN
            l(INT(RND * num + 1)) = 0
        END IF
        CLS
        FOR dl = 1 TO num
            cl = INT(RND * 256)
            IF cl = 0 THEN l(dl) = INT(RND * 3)
            IF l(dl) = 0 THEN
                lsc = INT(RND * 16)
                IF lsc = 0 THEN m(dl) = INT(RND * 80 + 32)
                FOR dls = 1 TO m(dl)
                    px1 = (320 + (r(dl) * COS(((360 / m(dl)) * dls))))
                    py1 = (240 + (r(dl) * SIN(((360 / m(dl)) * dls))))
                    px2 = (320 + (r(dl) * COS((180 + ((360 / m(dl)) * dls)))))
                    py2 = (240 + (r(dl) * SIN((180 + ((360 / m(dl)) * dls)))))
                    LINE (px1, py1)-(px2, py2), GetRadColor&(r(dl), dl, 128)
                NEXT dls
            END IF
        NEXT dl
        FOR dc = 1 TO num
            CIRCLE (320, 240), r(dc), GetRadColor&(r(dc), dc, 255)
        NEXT dc
        _DISPLAY
    LOOP UNTIL k$ = CHR$(27)
    IF k$ = CHR$(27) THEN SYSTEM
LOOP

'$include:'..\include\func\getradcolor.bas'
'$include:'..\include\sub\hsvtorgb.bas'