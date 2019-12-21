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
                drawblock = DigitalClockSector4(x, y, colour)
            CASE 48
                drawblock = DigitalClockSector1(x, y, colour)
                drawblock = DigitalClockSector2(x, y, colour)
                drawblock = DigitalClockSector3(x, y, colour)
                drawblock = DigitalClockSector5(x, y, colour)
                drawblock = DigitalClockSector6(x, y, colour)
                drawblock = DigitalClockSector7(x, y, colour)
            CASE 49
                drawblock = DigitalClockSector3(x, y, colour)
                drawblock = DigitalClockSector6(x, y, colour)
            CASE 50
                drawblock = DigitalClockSector1(x, y, colour)
                drawblock = DigitalClockSector3(x, y, colour)
                drawblock = DigitalClockSector4(x, y, colour)
                drawblock = DigitalClockSector5(x, y, colour)
                drawblock = DigitalClockSector7(x, y, colour)
            CASE 51
                drawblock = DigitalClockSector1(x, y, colour)
                drawblock = DigitalClockSector3(x, y, colour)
                drawblock = DigitalClockSector4(x, y, colour)
                drawblock = DigitalClockSector6(x, y, colour)
                drawblock = DigitalClockSector7(x, y, colour)
            CASE 52
                drawblock = DigitalClockSector2(x, y, colour)
                drawblock = DigitalClockSector3(x, y, colour)
                drawblock = DigitalClockSector4(x, y, colour)
                drawblock = DigitalClockSector6(x, y, colour)
            CASE 53
                drawblock = DigitalClockSector1(x, y, colour)
                drawblock = DigitalClockSector2(x, y, colour)
                drawblock = DigitalClockSector4(x, y, colour)
                drawblock = DigitalClockSector6(x, y, colour)
                drawblock = DigitalClockSector7(x, y, colour)
            CASE 54
                drawblock = DigitalClockSector1(x, y, colour)
                drawblock = DigitalClockSector2(x, y, colour)
                drawblock = DigitalClockSector4(x, y, colour)
                drawblock = DigitalClockSector5(x, y, colour)
                drawblock = DigitalClockSector6(x, y, colour)
                drawblock = DigitalClockSector7(x, y, colour)
            CASE 55
                drawblock = DigitalClockSector1(x, y, colour)
                drawblock = DigitalClockSector3(x, y, colour)
                drawblock = DigitalClockSector6(x, y, colour)
            CASE 56
                drawblock = DigitalClockSector1(x, y, colour)
                drawblock = DigitalClockSector2(x, y, colour)
                drawblock = DigitalClockSector3(x, y, colour)
                drawblock = DigitalClockSector4(x, y, colour)
                drawblock = DigitalClockSector5(x, y, colour)
                drawblock = DigitalClockSector6(x, y, colour)
                drawblock = DigitalClockSector7(x, y, colour)
            CASE 57
                drawblock = DigitalClockSector1(x, y, colour)
                drawblock = DigitalClockSector2(x, y, colour)
                drawblock = DigitalClockSector3(x, y, colour)
                drawblock = DigitalClockSector4(x, y, colour)
                drawblock = DigitalClockSector6(x, y, colour)
            CASE 58
                drawblock = DigitalClockSector8(x, y, colour)
                drawblock = DigitalClockSector9(x, y, colour)
        END SELECT
    NEXT dateline
    y = 251
    FOR timeline = 1 TO 8
        x = 185 + (27 * timeline)
        timeblock$ = MID$(TIME$, timeline, 1)
        SELECT CASE ASC(timeblock$)
            CASE 45
                drawblock = DigitalClockSector4(x, y, colour)
            CASE 48
                drawblock = DigitalClockSector1(x, y, colour)
                drawblock = DigitalClockSector2(x, y, colour)
                drawblock = DigitalClockSector3(x, y, colour)
                drawblock = DigitalClockSector5(x, y, colour)
                drawblock = DigitalClockSector6(x, y, colour)
                drawblock = DigitalClockSector7(x, y, colour)
            CASE 49
                drawblock = DigitalClockSector3(x, y, colour)
                drawblock = DigitalClockSector6(x, y, colour)
            CASE 50
                drawblock = DigitalClockSector1(x, y, colour)
                drawblock = DigitalClockSector3(x, y, colour)
                drawblock = DigitalClockSector4(x, y, colour)
                drawblock = DigitalClockSector5(x, y, colour)
                drawblock = DigitalClockSector7(x, y, colour)
            CASE 51
                drawblock = DigitalClockSector1(x, y, colour)
                drawblock = DigitalClockSector3(x, y, colour)
                drawblock = DigitalClockSector4(x, y, colour)
                drawblock = DigitalClockSector6(x, y, colour)
                drawblock = DigitalClockSector7(x, y, colour)
            CASE 52
                drawblock = DigitalClockSector2(x, y, colour)
                drawblock = DigitalClockSector3(x, y, colour)
                drawblock = DigitalClockSector4(x, y, colour)
                drawblock = DigitalClockSector6(x, y, colour)
            CASE 53
                drawblock = DigitalClockSector1(x, y, colour)
                drawblock = DigitalClockSector2(x, y, colour)
                drawblock = DigitalClockSector4(x, y, colour)
                drawblock = DigitalClockSector6(x, y, colour)
                drawblock = DigitalClockSector7(x, y, colour)
            CASE 54
                drawblock = DigitalClockSector1(x, y, colour)
                drawblock = DigitalClockSector2(x, y, colour)
                drawblock = DigitalClockSector4(x, y, colour)
                drawblock = DigitalClockSector5(x, y, colour)
                drawblock = DigitalClockSector6(x, y, colour)
                drawblock = DigitalClockSector7(x, y, colour)
            CASE 55
                drawblock = DigitalClockSector1(x, y, colour)
                drawblock = DigitalClockSector3(x, y, colour)
                drawblock = DigitalClockSector6(x, y, colour)
            CASE 56
                drawblock = DigitalClockSector1(x, y, colour)
                drawblock = DigitalClockSector2(x, y, colour)
                drawblock = DigitalClockSector3(x, y, colour)
                drawblock = DigitalClockSector4(x, y, colour)
                drawblock = DigitalClockSector5(x, y, colour)
                drawblock = DigitalClockSector6(x, y, colour)
                drawblock = DigitalClockSector7(x, y, colour)
            CASE 57
                drawblock = DigitalClockSector1(x, y, colour)
                drawblock = DigitalClockSector2(x, y, colour)
                drawblock = DigitalClockSector3(x, y, colour)
                drawblock = DigitalClockSector4(x, y, colour)
                drawblock = DigitalClockSector6(x, y, colour)
            CASE 58
                drawblock = DigitalClockSector8(x, y, colour)
                drawblock = DigitalClockSector9(x, y, colour)
        END SELECT
    NEXT timeline
    _DISPLAY
LOOP UNTIL k$ <> ""
SYSTEM

'$include:'..\include\func\digitalclocksector1.bas'
'$include:'..\include\func\digitalclocksector2.bas'
'$include:'..\include\func\digitalclocksector3.bas'
'$include:'..\include\func\digitalclocksector4.bas'
'$include:'..\include\func\digitalclocksector5.bas'
'$include:'..\include\func\digitalclocksector6.bas'
'$include:'..\include\func\digitalclocksector7.bas'
'$include:'..\include\func\digitalclocksector8.bas'
'$include:'..\include\func\digitalclocksector9.bas'