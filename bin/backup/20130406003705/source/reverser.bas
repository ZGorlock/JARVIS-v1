_TITLE "Reverser"
SCREEN 13
icon = _LOADIMAGE("..\resources\jarvis.png")
_ICON icon
SCREEN 12
REDIM a$(1048576)
CR$ = CHR$(13) + CHR$(10)
OPEN "..\source\JARVIS.bas" FOR INPUT AS #1
DO
    a = a + 1
    LINE INPUT #1, a$(a)
LOOP UNTIL EOF(1) = -1
CLOSE #1
OPEN "..\source\JARVIS'.bas" FOR OUTPUT AS #1
FOR ba = 1 TO a
    PRINT #1, a$(ba)
NEXT ba
CLOSE #1
DO
    REDIM a$(1048576)
    a = 0
    OPEN "..\source\JARVIS'.bas" FOR INPUT AS #1
    DO
        a = a + 1
        LINE INPUT #1, a$(a)
    LOOP UNTIL EOF(1) = -1
    CLOSE #1
    FOR b = 1 TO a
        IF INSTR(a$(b), "'$include:'") AND INSTR(a$(b), "=") = 0 THEN
            file$ = MID$(a$(b), (INSTR(a$(b), "'$include:'") + 11), (LEN(a$(b)) - ((INSTR(a$(b), "'$include:'") + 11))))
            PRINT ">"; file$
            REDIM b$(32768)
            b$ = ""
            OPEN file$ FOR INPUT AS #1
            IF LOF(1) > 0 THEN
                DO
                    c = c + 1
                    ON ERROR GOTO nextber
                    LINE INPUT #1, b$(c)
                    b$ = b$ + CR$ + b$(c)
                LOOP UNTIL EOF(1) = -1
            END IF
            CLOSE #1
            a$(b) = b$
        END IF
        nextb:
    NEXT b
    OPEN "..\source\JARVIS'.bas" FOR OUTPUT AS #1
    FOR d = 1 TO a
        PRINT #1, a$(d)
    NEXT d
    CLOSE #1
    REDIM a$(1048576)
    t = 0
    OPEN "..\source\JARVIS'.bas" FOR INPUT AS #1
    DO
        a = a + 1
        LINE INPUT #1, a$(a)
        IF INSTR(a$(a), "'$include:'") AND INSTR(a$(a), "=") = 0 THEN t = 1
    LOOP UNTIL EOF(1) = -1
    CLOSE #1
LOOP UNTIL t = 0
REDIM a$(1048576)
OPEN "..\source\JARVIS'.bas" FOR INPUT AS #1
DO
    r = r + 1
    LINE INPUT #1, a$(r)
LOOP UNTIL EOF(1) = -1
CLOSE #1
OPEN "..\source\JARVIS'.bas" FOR OUTPUT AS #1
FOR s = 1 TO r
    IF y = 0 AND a$(s) <> "" THEN y = 1
    IF y = 1 THEN PRINT #1, a$(s)
NEXT s
CLOSE #1
SYSTEM

'$include:'..\include\gosub\nextber.bas'