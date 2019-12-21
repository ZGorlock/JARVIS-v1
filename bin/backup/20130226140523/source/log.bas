_TITLE "Log"
SCREEN 13
icon = _LOADIMAGE("..\resources\jarvis.png")
_ICON icon
SCREEN 0
WIDTH 128, 32
logpos = 1048576
DO
    _LIMIT 64
    OPEN "..\data\log.jdf" FOR INPUT AS #1
    IF LOF(1) <> oldlof THEN
        REDIM log$(1048576)
        logcount = 1
        DO
            LINE INPUT #1, log$(logcount)
            logcount = logcount + 1
        LOOP UNTIL EOF(1) = -1
    END IF
    oldlof = LOF(1)
    CLOSE #1
    IF logpos < 1 THEN logpos = 1
    IF logpos > (logcount - 30) THEN logpos = (logcount - 30)
    CLS
    IF logcount > 30 THEN
        FOR printlog = logpos TO (logpos + 30)
            PRINT log$(printlog)
        NEXT printlog
    ELSE
        FOR printlog = 1 TO logcount
            PRINT log$(printlog)
        NEXT printlog
    END IF
    _DISPLAY
    k$ = INKEY$
    IF k$ = (CHR$(0) + CHR$(72)) THEN
        logpos = 1
        k$ = ""
    END IF
    IF k$ = (CHR$(0) + CHR$(80)) THEN
        logpos = (logcount - 30)
        k$ = ""
    END IF
    IF k$ = (CHR$(0) + CHR$(77)) THEN
        logpos = logpos + 30
        k$ = ""
    END IF
    IF k$ = (CHR$(0) + CHR$(75)) THEN
        logpos = logpos - 30
        k$ = ""
    END IF
    DO WHILE _MOUSEINPUT
        logpos = logpos + (_MOUSEWHEEL * 3)
    LOOP
LOOP UNTIL k$ <> ""
SYSTEM