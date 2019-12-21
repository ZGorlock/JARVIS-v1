SCREEN 0
SCREEN 12
_TITLE "Alphabetizer"
DO
    CLEAR
    DO
        CLS
        PRINT "Enter the txt file of which's contents you want alphabetized"
        PRINT ": "; filename$
        DO
            k$ = INKEY$
        LOOP UNTIL LEN(k$)
        IF k$ >= CHR$(32) AND k$ <= CHR$(126) THEN
            filename$ = filename$ + k$
            inputlength = LEN(filename$)
        END IF
        IF k$ = CHR$(8) AND inputlength > 0 THEN
            filename$ = MID$(filename$, 1, (inputlength - 1))
            inputlength = (inputlength - 1)
        END IF
    LOOP UNTIL k$ = CHR$(13)
    filename$ = filename$ + ".txt"
    inputcount = 0
    OPEN filename$ FOR INPUT AS #1
    DIM Array$(1048576)
    DO UNTIL EOF(1)
        inputcount = inputcount + 1
        LINE INPUT #1, Array$(inputcount)
        ON ERROR GOTO fileinputdone
    LOOP
    fileinputdone:
    CLOSE #1
    FOR count = 1 TO inputcount
        FOR counter = 1 TO inputcount
            IF Array$(counter) > Array$(count) THEN SWAP Array$(count), Array$(counter)
        NEXT counter
    NEXT count
    OPEN filename$ FOR OUTPUT AS #1
    FOR count = 1 TO inputcount
        PRINT #1, Array$(count)
    NEXT count
    CLOSE #1
    CLS
    PRINT "Complete"
    _DELAY 1
    DO
        CLS
        PRINT "What would you like to do?"
        PRINT "     1-Alphabetize another txt file"
        PRINT "     2-Exit"
        DO
            k$ = INKEY$
        LOOP UNTIL LEN(k$)
        IF k$ = CHR$(49) THEN
            EXIT DO
        END IF
        IF k$ = CHR$(50) THEN
            SYSTEM
        END IF
    LOOP
LOOP