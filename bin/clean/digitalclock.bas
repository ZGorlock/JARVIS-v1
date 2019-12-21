_TITLE "Digital Clock"
SCREEN 13
icon = _LOADIMAGE("..\resources\jarvis.png")
_ICON icon
SCREEN 12
DO
    _LIMIT 1
    CLS
    k$ = INKEY$
    colour = 12
    y = 192
    FOR dateline = 1 TO 10
        x = 158 + (27 * dateline)
        dateblock$ = MID$(DATE$, dateline, 1)
        SELECT CASE ASC(dateblock$)
            CASE 45
                drawblock = sector4(x, y, colour)
            CASE 48
                drawblock = sector1(x, y, colour)
                drawblock = sector2(x, y, colour)
                drawblock = sector3(x, y, colour)
                drawblock = sector5(x, y, colour)
                drawblock = sector6(x, y, colour)
                drawblock = sector7(x, y, colour)
            CASE 49
                drawblock = sector3(x, y, colour)
                drawblock = sector6(x, y, colour)
            CASE 50
                drawblock = sector1(x, y, colour)
                drawblock = sector3(x, y, colour)
                drawblock = sector4(x, y, colour)
                drawblock = sector5(x, y, colour)
                drawblock = sector7(x, y, colour)
            CASE 51
                drawblock = sector1(x, y, colour)
                drawblock = sector3(x, y, colour)
                drawblock = sector4(x, y, colour)
                drawblock = sector6(x, y, colour)
                drawblock = sector7(x, y, colour)
            CASE 52
                drawblock = sector2(x, y, colour)
                drawblock = sector3(x, y, colour)
                drawblock = sector4(x, y, colour)
                drawblock = sector6(x, y, colour)
            CASE 53
                drawblock = sector1(x, y, colour)
                drawblock = sector2(x, y, colour)
                drawblock = sector4(x, y, colour)
                drawblock = sector6(x, y, colour)
                drawblock = sector7(x, y, colour)
            CASE 54
                drawblock = sector1(x, y, colour)
                drawblock = sector2(x, y, colour)
                drawblock = sector4(x, y, colour)
                drawblock = sector5(x, y, colour)
                drawblock = sector6(x, y, colour)
                drawblock = sector7(x, y, colour)
            CASE 55
                drawblock = sector1(x, y, colour)
                drawblock = sector3(x, y, colour)
                drawblock = sector6(x, y, colour)
            CASE 56
                drawblock = sector1(x, y, colour)
                drawblock = sector2(x, y, colour)
                drawblock = sector3(x, y, colour)
                drawblock = sector4(x, y, colour)
                drawblock = sector5(x, y, colour)
                drawblock = sector6(x, y, colour)
                drawblock = sector7(x, y, colour)
            CASE 57
                drawblock = sector1(x, y, colour)
                drawblock = sector2(x, y, colour)
                drawblock = sector3(x, y, colour)
                drawblock = sector4(x, y, colour)
                drawblock = sector6(x, y, colour)
            CASE 58
                drawblock = sector8(x, y, colour)
                drawblock = sector9(x, y, colour)
        END SELECT
    NEXT dateline
    y = 251
    FOR timeline = 1 TO 8
        x = 185 + (27 * timeline)
        timeblock$ = MID$(TIME$, timeline, 1)
        SELECT CASE ASC(timeblock$)
            CASE 45
                drawblock = sector4(x, y, colour)
            CASE 48
                drawblock = sector1(x, y, colour)
                drawblock = sector2(x, y, colour)
                drawblock = sector3(x, y, colour)
                drawblock = sector5(x, y, colour)
                drawblock = sector6(x, y, colour)
                drawblock = sector7(x, y, colour)
            CASE 49
                drawblock = sector3(x, y, colour)
                drawblock = sector6(x, y, colour)
            CASE 50
                drawblock = sector1(x, y, colour)
                drawblock = sector3(x, y, colour)
                drawblock = sector4(x, y, colour)
                drawblock = sector5(x, y, colour)
                drawblock = sector7(x, y, colour)
            CASE 51
                drawblock = sector1(x, y, colour)
                drawblock = sector3(x, y, colour)
                drawblock = sector4(x, y, colour)
                drawblock = sector6(x, y, colour)
                drawblock = sector7(x, y, colour)
            CASE 52
                drawblock = sector2(x, y, colour)
                drawblock = sector3(x, y, colour)
                drawblock = sector4(x, y, colour)
                drawblock = sector6(x, y, colour)
            CASE 53
                drawblock = sector1(x, y, colour)
                drawblock = sector2(x, y, colour)
                drawblock = sector4(x, y, colour)
                drawblock = sector6(x, y, colour)
                drawblock = sector7(x, y, colour)
            CASE 54
                drawblock = sector1(x, y, colour)
                drawblock = sector2(x, y, colour)
                drawblock = sector4(x, y, colour)
                drawblock = sector5(x, y, colour)
                drawblock = sector6(x, y, colour)
                drawblock = sector7(x, y, colour)
            CASE 55
                drawblock = sector1(x, y, colour)
                drawblock = sector3(x, y, colour)
                drawblock = sector6(x, y, colour)
            CASE 56
                drawblock = sector1(x, y, colour)
                drawblock = sector2(x, y, colour)
                drawblock = sector3(x, y, colour)
                drawblock = sector4(x, y, colour)
                drawblock = sector5(x, y, colour)
                drawblock = sector6(x, y, colour)
                drawblock = sector7(x, y, colour)
            CASE 57
                drawblock = sector1(x, y, colour)
                drawblock = sector2(x, y, colour)
                drawblock = sector3(x, y, colour)
                drawblock = sector4(x, y, colour)
                drawblock = sector6(x, y, colour)
            CASE 58
                drawblock = sector8(x, y, colour)
                drawblock = sector9(x, y, colour)
        END SELECT
    NEXT timeline
    _DISPLAY
LOOP UNTIL k$ <> ""
SYSTEM

FUNCTION sector1 (x, y, colour)
PSET (x, y), colour
DRAW "BR3 R14 BR1 BD1 L16 BD1 BR1 R14"
PSET (x, y), 0
END FUNCTION

FUNCTION sector2 (x, y, colour)
PSET (x, y), colour
DRAW "BD3 D14 BD1 BR1 U16 BR1 BD1 D14"
PSET (x, y), 0
END FUNCTION

FUNCTION sector3 (x, y, colour)
PSET (x, y), colour
DRAW "BD3 BR17 D14 BD1 BR1 U16 BR1 BD1 D14"
PSET (x, y), 0
END FUNCTION

FUNCTION sector4 (x, y, colour)
PSET (x, y), colour
DRAW "BD17 BR3 R14 BR1 BD1 L16 BD1 BR1 R14"
PSET (x, y), 0
END FUNCTION

FUNCTION sector5 (x, y, colour)
PSET (x, y), colour
DRAW "BD20 D14 BD1 BR1 U16 BR1 BD1 D14"
PSET (x, y), 0
END FUNCTION

FUNCTION sector6 (x, y, colour)
PSET (x, y), colour
DRAW "BD20 BR17 D14 BD1 BR1 U16 BR1 BD1 D14"
PSET (x, y), 0
END FUNCTION

FUNCTION sector7 (x, y, colour)
PSET (x, y), colour
DRAW "BD34 BR3 R14 BR1 BD1 L16 BD1 BR1 R14"
PSET (x, y), 0
END FUNCTION

FUNCTION sector8 (x, y, colour)
PSET (x, y), colour
DRAW "BR8 BD10 D2 BD1 BR1 U4 R1 D4 BR1 BU1 U2"
PSET (x, y), 0
END FUNCTION

FUNCTION sector9 (x, y, colour)
PSET (x, y), colour
DRAW "BR8 BD27 D2 BD1 BR1 U4 R1 D4 BR1 BU1 U2"
PSET (x, y), 0
END FUNCTION