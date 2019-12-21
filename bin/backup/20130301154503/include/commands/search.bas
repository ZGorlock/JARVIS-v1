IF (usercommand$(runcommands) = "google" OR usercommand$(runcommands) = "search") AND usercommands <> 1 AND usercommands <> -1 THEN
    doublecheck$ = MID$(useroutput$, (INSTR(useroutput$, (usercommand$(runcommands))) + 7), 6)
    IF doublecheck$ = "google" OR doublecheck$ = "search" THEN
        qloc = INSTR(useroutput$, usercommand$(runcommands)) + 13
    ELSE
        qloc = INSTR(useroutput$, usercommand$(runcommands)) + 6
    END IF
    q$ = MID$(useroutput$, qloc, (LEN(useroutput$) - qloc + 1))
    speechoutput$ = "searching" + q$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    DO
        randname$ = ""
        FOR randname = 1 TO 64
            charsetselect = INT(RND * 3)
            SELECT CASE charsetselect
                CASE 0
                    characterselect = INT(RND * 10)
                    randname$ = randname$ + CHR$(characterselect + 48)
                CASE 1
                    characterselect = INT(RND * 26)
                    randname$ = randname$ + CHR$(characterselect + 65)
                CASE 2
                    characterselect = INT(RND * 26)
                    randname$ = randname$ + CHR$(characterselect + 97)
            END SELECT
        NEXT randname
    LOOP UNTIL _FILEEXISTS("temp\url\" + randname$ + ".URL") = 0
    ERASE query$
    REDIM query$(256)
    querybound = 0
    FOR queryparse = 1 TO LEN(q$)
        querycrosssection$ = MID$(q$, queryparse, 1)
        IF querycrosssection$ <> CHR$(32) THEN
            querybound = querybound + 1
            DO
                querycrosssection$ = MID$(q$, queryparse, 1)
                IF querycrosssection$ = CHR$(32) OR queryparse = (LEN(q$) + 1) THEN EXIT DO
                query$(querybound) = query$(querybound) + querycrosssection$
                queryparse = queryparse + 1
            LOOP
        END IF
    NEXT queryparse
    qparse$ = ""
    FOR qparse = 1 TO querybound
        qparse$ = qparse$ + query$(qparse) + "+"
    NEXT qparse
    qparse$ = MID$(qparse$, 1, (LEN(qparse$) - 1))
    OPEN "temp\url\" + randname$ + ".URL" FOR OUTPUT AS #1
    PRINT #1, "[InternetShortcut]"
    PRINT #1, "URL=http://www.google.com/#q=" + qparse$
    CLOSE #1
    SHELL _DONTWAIT _HIDE "start temp\url\" + randname$ + ".URL"
    randname$ = ""
    usercommands = -1
END IF
