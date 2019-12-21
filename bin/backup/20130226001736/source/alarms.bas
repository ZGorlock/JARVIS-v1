_SCREENHIDE
_TITLE "Alarms"
SCREEN 13
icon = _LOADIMAGE("..\resources\jarvis.png")
_ICON icon
SCREEN 0
REDIM alarms$(32)
REDIM closetime(16384)
REDIM emotionsneg$(64)
REDIM emotionspos$(64)
REDIM inidata$(256)
REDIM loadcommand$(1024)
REDIM loadcustom$(256)
REDIM jarvisini$(65536)
OPEN "..\data\jarvis.ini" FOR INPUT AS #1
iniblock = 1
DO
    jarvisini = jarvisini + 1
    LINE INPUT #1, jarvisini$(jarvisini)
    IF LEFT$(jarvisini$(jarvisini), 1) <> "[" THEN
        IF jarvisini$(jarvisini) <> "" THEN
            SELECT CASE iniblock
                CASE 1
                    inidata = inidata + 1
                    inidata$(inidata) = jarvisini$(jarvisini)
                CASE 2
                    loadcommands = loadcommands + 1
                    loadcommand$(loadcommands) = jarvisini$(jarvisini)
                CASE 3
                    loadcustom = loadcustom + 1
                    loadcustom$(loadcustom) = jarvisini$(jarvisini)
                CASE 4
                    emotionsposcount = emotionsposcount + 1
                    emotionspos$(emotionsposcount) = jarvisini$(jarvisini)
                CASE 5
                    emotionsnegcount = emotionsnegcount + 1
                    emotionsneg$(emotionsnegcount) = jarvisini$(jarvisini)
                CASE 6
                    alarms = alarms + 1
                    alarms$(alarms) = jarvisini$(jarvisini)
                CASE 7
                    closetimes = closetimes + 1
                    closetime(closetimes) = VAL(jarvisini$(jarvisini))
            END SELECT
        ELSE
            iniblock = iniblock + 1
        END IF
    END IF
LOOP UNTIL EOF(1) = -1
CLOSE #1
FOR alarmmove = 2 TO alarms
    alarms$(alarmmove - 1) = alarms$(alarmmove)
NEXT alarmmove
alarms$(alarms) = ""
alarms = alarms - 1
heighter = alarms + 1
IF heighter = 1 THEN heighter = 2
WIDTH 14, heighter
row = 1
selected = 1
DO
    _LIMIT 1
    jarvisclient = _OPENCLIENT("TCP/IP:7319:localhost")
LOOP UNTIL jarvisclient < 0
_SCREENSHOW
unescape:
DO
    _LIMIT 32
    k$ = INKEY$
    CLS
    COLOR 15, 0
    IF selected < 1 THEN selected = 1
    IF selected > alarms THEN selected = listnum
    FOR printalarms = 1 TO alarms
        IF printalarms = selected THEN
            COLOR 0, 15
        ELSE
            COLOR 15, 0
        END IF
        IF alarms - printalarms <= 2 THEN
            PRINT alarms$(printalarms);
        ELSE
            PRINT alarms$(printalarms)
        END IF
        COLOR 15, 0
    NEXT printalarms
    IF k$ = (CHR$(0) + CHR$(72)) THEN selected = selected - 1
    IF k$ = (CHR$(0) + CHR$(80)) THEN selected = selected + 1
    IF k$ = (CHR$(0) + CHR$(82)) THEN
        SCREEN 12
        DO
            newalarm$ = ""
            DO
                _LIMIT 32
                k$ = INKEY$
                CLS
                PRINT "Enter the timestamp of the alarm you wish to add (syntax: YYYYMMDDHHMMSS), if you only enter 4 characters then it will assume that the year, month, day, and hour are the same as the current one. 6 would assume the same year, month, and day. If you enter a stamp earlier than the current time, it will be discarded."
                PRINT
                PRINT newalarm$
                IF k$ >= CHR$(32) AND k$ <= CHR$(126) THEN newalarm$ = newalarm$ + k$
                IF k$ = CHR$(8) AND LEN(newalarm$) <> 0 THEN newalarm$ = MID$(newalarm$, 1, (LEN(newalarm$) - 1))
                IF k$ = (CHR$(0) + CHR$(83)) THEN newalarm$ = ""
                IF k$ = CHR$(27) THEN EXIT DO
                _DISPLAY
            LOOP UNTIL k$ = CHR$(13)
            IF k$ = CHR$(27) THEN EXIT DO
            DO
                SELECT CASE LEN(newalarm$)
                    CASE 14
                        newalarm$ = newalarm$
                    CASE 10
                        newalarm$ = RIGHT$(DATE$, 4) + newalarm$
                    CASE 8
                        newalarm$ = RIGHT$(DATE$, 4) + LEFT$(DATE$, 2) + newalarm$
                    CASE 6
                        newalarm$ = RIGHT$(DATE$, 4) + LEFT$(DATE$, 2) + MID$(DATE$, 4, 2) + newalarm$
                    CASE 4
                        newalarm$ = RIGHT$(DATE$, 4) + LEFT$(DATE$, 2) + MID$(DATE$, 4, 2) + LEFT$(TIME$, 2) + newalarm$
                    CASE 2
                        newalarm$ = RIGHT$(DATE$, 4) + LEFT$(DATE$, 2) + MID$(DATE$, 4, 2) + LEFT$(TIME$, 2) + MID$(TIME$, 4, 2) + newalarm$
                    CASE ELSE
                        EXIT DO
                END SELECT
                timestamp$ = RIGHT$(DATE$, 4) + LEFT$(DATE$, 2) + MID$(DATE$, 4, 2) + LEFT$(TIME$, 2) + MID$(TIME$, 4, 2) + RIGHT$(TIME$, 2)
                IF VAL(newalarm$) < VAL(timestamp$) THEN EXIT DO
                alarms$(alarms + 1) = newalarm$
                alarms = alarms + 1
                FOR count = 1 TO alarms
                    FOR counter = 1 TO alarms
                        IF alarms$(counter) > alarms$(count) THEN SWAP alarms$(count), alarms$(counter)
                    NEXT counter
                NEXT count
                EXIT DO
            LOOP
            EXIT DO
        LOOP
        DO
            _LIMIT 32
            k$ = INKEY$
        LOOP UNTIL k$ = ""
        SCREEN 0
        heighter = alarms + 1
        IF heighter = 1 THEN heighter = 2
        WIDTH 14, heighter
    END IF
    IF k$ = (CHR$(0) + CHR$(83)) THEN
        FOR removealarm = selected TO alarms
            alarms$(removealarm) = alarms$(removealarm + 1)
        NEXT removealarm
        alarms = alarms - 1
        DO
            _LIMIT 32
            k$ = INKEY$
        LOOP UNTIL k$ = ""
        SCREEN 0
        heighter = alarms + 1
        IF heighter = 1 THEN heighter = 2
        WIDTH 14, heighter
    END IF
    _DISPLAY
    IF _EXIT GOTO unescape
LOOP UNTIL k$ = CHR$(27)
alarms = alarms + 1
FOR listalarm = alarms TO 2 STEP -1
    alarms$(listalarm) = alarms$(listalarm - 1)
NEXT listalarm
alarms$(1) = "0"
OPEN "..\data\jarvis.ini" FOR OUTPUT AS #1
iniprint = 0
PRINT #1, "[Settings]"
DO
    iniprint = iniprint + 1
    PRINT #1, inidata$(iniprint)
LOOP UNTIL iniprint = inidata
PRINT #1, ""
commandprint = 0
PRINT #1, "[Command Words]"
DO
    commandprint = commandprint + 1
    PRINT #1, loadcommand$(commandprint)
LOOP UNTIL commandprint = loadcommands
PRINT #1, ""
customprint = 0
PRINT #1, "[Custom Command Words]"
DO
    customprint = customprint + 1
    PRINT #1, loadcustom$(customprint)
LOOP UNTIL customprint = loadcustom
PRINT #1, ""
emotionsposprint = 0
PRINT #1, "[Positive Emotions]"
DO
    emotionsposprint = emotionsposprint + 1
    PRINT #1, emotionspos$(emotionsposprint)
LOOP UNTIL emotionsposprint = emotionsposcount
PRINT #1, ""
emotionsnegprint = 0
PRINT #1, "[Negative Emotions]"
DO
    emotionsnegprint = emotionsnegprint + 1
    PRINT #1, emotionsneg$(emotionsnegprint)
LOOP UNTIL emotionsnegprint = emotionsnegcount
PRINT #1, ""
alarmprint = 0
PRINT #1, "[Alarms]"
DO
    alarmprint = alarmprint + 1
    PRINT #1, alarms$(alarmprint)
LOOP UNTIL alarmprint = alarms
PRINT #1, ""
closetimesprint = 0
PRINT #1, "[Close Times]"
DO
    closetimesprint = closetimesprint + 1
    PRINT #1, LTRIM$(STR$(closetime(closetimesprint)))
LOOP UNTIL closetimesprint = closetimes
IF endprog = 1 THEN PRINT #1, LTRIM$(STR$(TIMER))
PRINT #1, ""
CLOSE #1
PRINT #jarvisclient, "complete"
_DELAY 2
CLOSE #jarvisclient
CLEAR
SYSTEM