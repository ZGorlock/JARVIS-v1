_SCREENHIDE
_TITLE "Clock"
SCREEN 13
icon = _LOADIMAGE("..\resources\jarvis.png")
_ICON icon
SCREEN 12
_SCREENSHOW
FOR angle = 0 TO 360 STEP 30
    PSET (320, 240), 6
    DRAW "TA=" + VARPTR$(angle) + "BU180"
    CIRCLE STEP(0, 0), 15, 12
    DRAW "P9, 12"
NEXT
DO
    sec$ = RIGHT$(TIME$, 2)
    sdegree$ = STR$(VAL(sec$) * -6)
    PSET (320, 240), 2
    DRAW "TA" + sdegree$ + "U150"
    min$ = MID$(TIME$, 4, 2)
    PSET (320, 240), 3
    mdegree$ = STR$(VAL(min$) * -6)
    DRAW "TA" + mdegree$ + "U110"
    hour$ = LEFT$(TIME$, 2)
    PSET (320, 240), 5
    hdegree$ = STR$(VAL(hour$) * -30)
    DRAW "TA" + hdegree$ + "U70"
    DO
        _LIMIT 64
        k$ = INKEY$
        newsec$ = RIGHT$(TIME$, 2)
    LOOP UNTIL newsec$ <> sec$ OR k$ <> ""
    PSET (320, 240), 0
    DRAW "TA" + sdegree$ + "U150"
    PSET (320, 240), 0
    DRAW "TA" + mdegree$ + "U110"
    PSET (320, 240), 0
    DRAW "TA" + hdegree$ + "U70"
LOOP UNTIL k$ <> ""
SYSTEM