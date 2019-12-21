_TITLE "Polar Clock"
SCREEN 13
icon = _LOADIMAGE("..\resources\jarvis.png")
_ICON icon
SCREEN _NEWIMAGE(640, 480, 32)
CONST PI = 3.1415926535
DIM SHARED cummonth
circle_color& = _RGB32(1, 1, 1)
DO
    _LIMIT 16
    CLS
    k$ = INKEY$
    month$ = LEFT$(DATE$, 2)
    day$ = MID$(DATE$, 4, 2)
    year$ = RIGHT$(DATE$, 4)
    hour$ = LEFT$(TIME$, 2)
    minute$ = MID$(TIME$, 4, 2)
    second$ = RIGHT$(TIME$, 2)
    month = VAL(month$)
    day = VAL(day$)
    year = VAL(year$)
    hour = VAL(hour$)
    minute = VAL(minute$)
    second = VAL(second$)
    shutter! = (TIMER - ((hour * 3600) + (minute * 60) + second))
    second! = second + shutter!
    secsinyear = 86400 * (365 + ((year MOD 4 = 0 AND year MOD 100 <> 0) OR year MOD 400 = 0))
    SELECT CASE month
        CASE 2
            isleap = (year MOD 4 = 0 AND year MOD 100 <> 0) OR year MOD 400 = 0
            dayinmonth = 29 - isleap
        CASE 4, 6, 9, 11
            dayinmonth = 30
        CASE ELSE
            dayinmonth = 31
    END SELECT
    SELECT CASE month
        CASE 1
            monthname$ = "January"
        CASE 2
            monthname$ = "February"
        CASE 3
            monthname$ = "March"
        CASE 4
            monthname$ = "April"
        CASE 5
            monthname$ = "May"
        CASE 6
            monthname$ = "June"
        CASE 7
            monthname$ = "July"
        CASE 8
            monthname$ = "August"
        CASE 9
            monthname$ = "September"
        CASE 10
            monthname$ = "October"
        CASE 11
            monthname$ = "November"
        CASE 12
            monthname$ = "December"
    END SELECT
    dyear = year
    dmonth = month
    dday = day
    IF dmonth < 3 THEN
        dmonth = dmonth + 12
        dyear = dyear - 1
    END IF
    dcentury = year \ 100
    dyear = dyear MOD 100
    S1 = (dcentury \ 4) - (2 * dcentury) - 1
    S2 = (5 * dyear) \ 4
    S3 = 26 * (dmonth + 1) \ 10
    weekday = (S1 + S2 + S3 + dday) MOD 7
    IF weekday < 0 THEN weekday = weekday + 7
    SELECT CASE weekday
        CASE 0
            weekday$ = "Sunday"
        CASE 1
            weekday$ = "Monday"
        CASE 2
            weekday$ = "Tuesday"
        CASE 3
            weekday$ = "Wednesday"
        CASE 4
            weekday$ = "Thursday"
        CASE 5
            weekday$ = "Friday"
        CASE 6
            weekday$ = "Saturday"
    END SELECT
    cummonth = 0
    FOR monthadd = (month - 1) TO 1 STEP -1
        monthcount = Daysinmonth(monthadd)
    NEXT
    angle1 = (((cummonth * 86400) + (day * 86400) + (hour * 3600) + (minute * 60) + second!) / (secsinyear)) * 360
    angle2 = (((day * 86400) + (hour * 3600) + (minute * 60) + second!) / (dayinmonth * 86400)) * 360
    angle3 = (((hour * 3600) + (minute * 60) + second!) / 86400) * 360
    angle4 = ((minute * 60 + second!) / 3600) * 360
    angle5 = second! / 60 * 360
    rad1 = ((angle1 * PI / 180) + (PI / 2))
    IF rad1 >= (2 * PI) THEN rad1 = rad1 - (2 * PI)
    rad2 = ((angle2 * PI / 180) + (PI / 2))
    IF rad2 >= (2 * PI) THEN rad2 = rad2 - (2 * PI)
    rad3 = ((angle3 * PI / 180) + (PI / 2))
    IF rad3 >= (2 * PI) THEN rad3 = rad3 - (2 * PI)
    rad4 = ((angle4 * PI / 180) + (PI / 2))
    IF rad4 >= (2 * PI) THEN rad4 = rad4 - (2 * PI)
    rad5 = ((angle5 * PI / 180) + (PI / 2))
    IF rad5 >= (2 * PI) THEN rad5 = rad5 - (2 * PI)
    HSVtoRGB angle1, 1, 1, r, g, b
    color1& = _RGB32(r, g, b)
    HSVtoRGB angle2, 1, 1, r, g, b
    color2& = _RGB32(r, g, b)
    HSVtoRGB angle3, 1, 1, r, g, b
    color3& = _RGB32(r, g, b)
    HSVtoRGB angle4, 1, 1, r, g, b
    color4& = _RGB32(r, g, b)
    HSVtoRGB angle5, 1, 1, r, g, b
    color5& = _RGB32(r, g, b)
    PSET (320, 240), circle_color&
    DRAW "BU36 U179"
    CIRCLE (320, 240), 36, circle_color&
    CIRCLE (320, 240), 36, circle_color&, (PI / 2), rad1
    CIRCLE (320, 240), 72, circle_color&, (PI / 2), rad1
    CIRCLE (320, 240), 72, circle_color&, (PI / 2), rad2
    CIRCLE (320, 240), 108, circle_color&, (PI / 2), rad2
    CIRCLE (320, 240), 108, circle_color&, (PI / 2), rad3
    CIRCLE (320, 240), 144, circle_color&, (PI / 2), rad3
    CIRCLE (320, 240), 144, circle_color&, (PI / 2), rad4
    CIRCLE (320, 240), 180, circle_color&, (PI / 2), rad4
    CIRCLE (320, 240), 180, circle_color&, (PI / 2), rad5
    CIRCLE (320, 240), 215, circle_color&, (PI / 2), rad5
    PSET (320, 240), circle_color&
    DRAW "TA" + STR$((angle1 - .5)) + "BU36 U36"
    PSET (320, 240), circle_color&
    DRAW "TA" + STR$((angle2 - .5)) + "BU72 U36"
    PSET (320, 240), circle_color&
    DRAW "TA" + STR$((angle3 - .5)) + "BU108 U36"
    PSET (320, 240), circle_color&
    DRAW "TA" + STR$((angle4 - .5)) + "BU144 U36"
    PSET (320, 240), circle_color&
    DRAW "TA" + STR$((angle5 - .5)) + "BU180 U36"
    PAINT (318, 240), _RGB32(255, 255, 255), circle_color&
    PAINT (318, 189), color1&, circle_color&
    PAINT (318, 153), color2&, circle_color&
    PAINT (318, 118), color3&, circle_color&
    PAINT (318, 82), color4&, circle_color&
    PAINT (318, 49), color5&, circle_color&
    PAINT (1, 1), _RGB32(0, 0, 0), circle_color&
    _PRINTMODE _KEEPBACKGROUND
    COLOR _RGB32(0, 0, 0)
    _PRINTSTRING (305, 232), year$
    COLOR _RGB32(255, 255, 255)
    _PRINTSTRING (322, 178), monthname$
    _PRINTSTRING (322, 142), weekday$
    _PRINTSTRING (322, 106), hour$
    _PRINTSTRING (322, 70), minute$
    _PRINTSTRING (322, 34), second$
    _DISPLAY
LOOP UNTIL k$ <> ""
SYSTEM

FUNCTION Daysinmonth (monther)
SELECT CASE monther
    CASE 2
        isleap = (year MOD 4 = 0 AND year MOD 100 <> 0) OR year MOD 400 = 0
        daysinmonther = 29 - isleap
    CASE 4, 6, 9, 11
        daysinmonther = 30
    CASE ELSE
        daysinmonther = 31
END SELECT
cummonth = cummonth + daysinmonther
END FUNCTION

SUB HSVtoRGB (h, s, v, r, g, b)
r = 0
g = 0
b = 0
hi = (h / 60)
c = v * s
x = c * (1 - ABS(hi - (2 * INT(hi / 2)) - 1))
SELECT CASE INT(hi)
    CASE 0
        r = c
        g = x
    CASE 1
        r = x
        g = c
    CASE 2
        g = c
        b = x
    CASE 3
        g = x
        b = c
    CASE 4
        r = x
        b = c
    CASE 5
        r = c
        b = x
END SELECT
M = v - c
r = r + M
r = r * 255
g = g + M
g = g * 255
b = b + M
b = b * 255
END SUB