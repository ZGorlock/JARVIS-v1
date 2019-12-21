_SCREENHIDE
SCREEN 13
icon = _LOADIMAGE("icon.png")
_ICON icon
SCREEN 12
_TITLE "Password Buddy"
_SCREENSHOW

RANDOMIZE TIMER

DIM SHARED entrytypes
DIM SHARED entrytypes$(32)
DIM SHARED list$(1024)
DIM SHARED lists
DIM SHARED loc$
DIM SHARED crypt
DIM SHARED origin$
DIM SHARED selected

OPEN "loc.ini" FOR INPUT AS #1
LINE INPUT #1, loc$
CLOSE #1
IF loc$ = "0" THEN
    SHELL _HIDE "cd > loc.tmp"
    OPEN "loc.tmp" FOR INPUT AS #1
    LINE INPUT #1, loc$
    CLOSE #1
    KILL "loc.tmp"
    loc$ = loc$ + "\data"
    OPEN "loc.ini" FOR OUTPUT AS #1
    PRINT #1, loc$
    CLOSE #1
END IF
origin$ = loc$
OPEN "crypt.ini" FOR INPUT AS #1
INPUT #1, crypt
CLOSE #1
IF crypt = 0 THEN
    crypt = INT(RND * 128 + 1)
    OPEN "crypt.ini" FOR OUTPUT AS #1
    WRITE #1, crypt
    CLOSE #1
    SHELL _HIDE "mkdir " + CHR$(34) + origin$ + "\" + crypter$("Games", 1, 128, 0) + CHR$(34)
    SHELL _HIDE "mkdir " + CHR$(34) + origin$ + "\" + crypter$("Other", 1, 128, 0) + CHR$(34)
    SHELL _HIDE "mkdir " + CHR$(34) + origin$ + "\" + crypter$("School", 1, 128, 0) + CHR$(34)
    SHELL _HIDE "mkdir " + CHR$(34) + origin$ + "\" + crypter$("Work", 1, 128, 0) + CHR$(34)
END IF
OPEN "entrytypes.ini" FOR INPUT AS #1
DO
    entrytypes = entrytypes + 1
    LINE INPUT #1, entrytypes$(entrytypes)
LOOP UNTIL EOF(1)
CLOSE #1
CALL collectorigin
CALL mainloop

SUB mainloop
DO
    selected = 1
    row = 1
    DO
        _LIMIT 32
        CLS
        COLOR 15, 0
        originprint$ = MID$(origin$, (INSTR(origin$, "data") + 4))
        IF LEN(originprint$) > 80 THEN originprint$ = "..." + MID$(originprint$, (LEN(originprint$) - 76))
        PRINT originprint$
        PRINT
        IF selected < 1 THEN selected = 1
        IF selected > lists THEN selected = lists
        IF row + 24 < lists AND selected > row + 11 THEN
            row = row + 1
        END IF
        IF row <> 1 AND selected < row + 11 THEN
            row = row - 1
        END IF
        IF row = 1 AND selected < row + 11 THEN
            row = row
        END IF
        IF row + 12 = lists AND selected > row + 11 THEN
            row = row
        END IF
        IF lists <= 25 THEN
            FOR listprint = 1 TO lists
                IF listprint = selected THEN
                    COLOR 0, 15
                    SELECT CASE LEFT$(list$(listprint), 3)
                        CASE "[-]"
                            COLOR 15, 0
                            PRINT "[";
                            COLOR 0, 15
                            PRINT "-";
                            COLOR 15, 0
                            PRINT "] ";
                            COLOR 0, 15
                            PRINT MID$(list$(listprint), 5)
                        CASE "[+]"
                            COLOR 15, 0
                            PRINT "[";
                            COLOR 0, 15
                            PRINT "+";
                            COLOR 15, 0
                            PRINT "] ";
                            COLOR 0, 15
                            PRINT MID$(list$(listprint), 5)
                        CASE "[] "
                            COLOR 15, 0
                            PRINT "[]  ";
                            COLOR 0, 15
                            PRINT MID$(list$(listprint), 5)
                    END SELECT
                    COLOR 15, 0
                ELSE
                    COLOR 15, 0
                    PRINT list$(listprint)
                END IF
            NEXT listprint
        ELSE
            FOR listprint = row TO row + 24
                IF listprint = selected THEN
                    COLOR 0, 15
                    SELECT CASE LEFT$(list$(listprint), 3)
                        CASE "[-]"
                            COLOR 15, 0
                            PRINT "[";
                            COLOR 0, 15
                            PRINT "-";
                            COLOR 15, 0
                            PRINT "] ";
                            COLOR 0, 15
                            PRINT MID$(list$(listprint), 5)
                        CASE "[+]"
                            COLOR 15, 0
                            PRINT "[";
                            COLOR 0, 15
                            PRINT "+";
                            COLOR 15, 0
                            PRINT "] ";
                            COLOR 0, 15
                            PRINT MID$(list$(listprint), 5)
                        CASE "[] "
                            COLOR 15, 0
                            PRINT "[]  ";
                            COLOR 0, 15
                            PRINT MID$(list$(listprint), 5)
                    END SELECT
                    COLOR 15, 0
                ELSE
                    COLOR 15, 0
                    PRINT list$(listprint)
                END IF
            NEXT listprint
        END IF
        DO
            _LIMIT 64
            k$ = INKEY$
            DO WHILE _MOUSEINPUT
                selected = selected + _MOUSEWHEEL
                k$ = CHR$(255)
            LOOP
        LOOP UNTIL LEN(k$)
        IF k$ = CHR$(13) THEN
            SELECT CASE LEFT$(list$(selected), 3)
                CASE "[-]"
                    DO
                        FOR backcheck = LEN(origin$) TO 1 STEP -1
                            backcheck$ = MID$(origin$, backcheck, 1)
                            IF backcheck$ = "\" THEN
                                origin$ = MID$(origin$, 1, (backcheck - 1))
                                EXIT DO
                            END IF
                        NEXT backcheck
                        EXIT DO
                    LOOP
                    CALL collectorigin
                    CALL mainloop
                CASE "[+]"
                    origin$ = origin$ + "\" + MID$(list$(selected), 5)
                    CALL collectorigin
                    CALL mainloop
                CASE "[] "
                    CALL pwbview
                    CALL collectorigin
                    CALL mainloop
            END SELECT
        END IF
        IF k$ = CHR$(8) AND origin$ <> loc$ THEN
            DO
                k$ = INKEY$
            LOOP UNTIL k$ <> CHR$(8)
            DO
                FOR backcheck = LEN(origin$) TO 1 STEP -1
                    backcheck$ = MID$(origin$, backcheck, 1)
                    IF backcheck$ = "\" THEN
                        origin$ = MID$(origin$, 1, (backcheck - 1))
                        EXIT DO
                    END IF
                NEXT backcheck
                EXIT DO
            LOOP
            CALL collectorigin
            CALL mainloop
        END IF
        IF k$ = (CHR$(0) + CHR$(82)) OR k$ = CHR$(43) THEN
            CALL insert
            CALL collectorigin
            CALL mainloop
        END IF
        IF k$ = (CHR$(0) + CHR$(83)) OR k$ = CHR$(45) AND MID$(list$(selected), 3) <> "[-]" THEN
            CALL delete
            CALL collectorigin
            CALL mainloop
        END IF
        IF k$ = (CHR$(0) + CHR$(72)) THEN selected = selected - 1
        IF k$ = (CHR$(0) + CHR$(80)) THEN selected = selected + 1
        IF k$ = (CHR$(0) + CHR$(71)) THEN selected = 1
        IF k$ = (CHR$(0) + CHR$(79)) THEN selected = lists
    LOOP UNTIL k$ = CHR$(27)
LOOP UNTIL k$ = CHR$(27)
CLOSE
SYSTEM
END SUB

SUB collectorigin
originmock$ = MID$(origin$, (LEN(loc$) + 1))
originmock$ = loc$ + crypter$(originmock$, 1, 128, 0)
SHELL _HIDE "dir " + CHR$(34) + originmock$ + CHR$(34) + " /b > origin.tmp"
CALL resetlist
OPEN "origin.tmp" FOR INPUT AS #1
IF LOF(1) > 0 THEN
    DO
        lists = lists + 1
        LINE INPUT #1, list$(lists)
    LOOP UNTIL EOF(1) = -1
END IF
CLOSE #1
KILL "origin.tmp"
CALL listfix
END SUB

SUB delete
DO
    _LIMIT 32
    CLS
    PRINT "Are you sure you want to delete " + MID$(list$(selected), 5) + "? (y/n)"
    SELECT CASE LEFT$(list$(selected), 3)
        CASE "[+]"
            PRINT "This is a directory and all subfolders and subfiles will also be deleted"
        CASE "[] "
            PRINT "This is a file, all data about this entry will be deleted"
    END SELECT
    DO
        _LIMIT 64
        k$ = INKEY$
    LOOP UNTIL LEN(k$)
    SELECT CASE ASC(UCASE$(k$))
        CASE 27
            CLOSE
            SYSTEM
        CASE 78
            EXIT DO
        CASE 89
            deleter$ = MID$(origin$, (LEN(loc$) + 1)) + "\" + MID$(list$(selected), 5)
            deleter$ = loc$ + crypter$(deleter$, 1, 128, 0)
            SELECT CASE LEFT$(list$(selected), 3)
                CASE "[+]"
                    SHELL _HIDE "rmdir /q /s " + CHR$(34) + deleter$ + CHR$(34)
                CASE "[] "
                    deleter$ = deleter$ + ".pwb"
                    KILL deleter$
            END SELECT
            EXIT DO
    END SELECT
LOOP
END SUB

SUB insert
DO
    _LIMIT 32
    CLS
    PRINT "What would you like to insert?"
    PRINT "f-file"
    PRINT "d-directory"
    DO
        _LIMIT 64
        k$ = INKEY$
    LOOP UNTIL LEN(k$)
    SELECT CASE ASC(UCASE$(k$))
        CASE 27
            CLOSE
            SYSTEM
        CASE 68
            inserttype = 2
            EXIT DO
        CASE 70
            inserttype = 1
            EXIT DO
    END SELECT
LOOP
DO
    _LIMIT 32
    CLS
    SELECT CASE inserttype
        CASE 1
            PRINT "What would you like to name the file?"
        CASE 2
            PRINT "What would you like to name the directory?"
    END SELECT
    PRINT ": " + insertname$
    DO
        _LIMIT 32
        k$ = INKEY$
    LOOP UNTIL LEN(k$)
    IF k$ = (CHR$(0) + CHR$(83)) THEN insertname$ = ""
    SELECT CASE ASC(UCASE$(k$))
        CASE 8
            IF LEN(insertname$) > 0 THEN insertname$ = MID$(insertname$, 1, (LEN(insertname$) - 1))
        CASE 13
            IF LEN(insertname$) > 0 THEN
                insertname$ = MID$(origin$, (LEN(loc$) + 1)) + "\" + insertname$
                insertname$ = loc$ + crypter$(insertname$, 1, 128, 0)
                SELECT CASE inserttype
                    CASE 1
                        insertname$ = insertname$ + ".pwb"
                        OPEN insertname$ FOR OUTPUT AS #1
                        CLOSE #1
                        EXIT DO
                    CASE 2
                        SHELL _HIDE "mkdir " + CHR$(34) + insertname$ + CHR$(34)
                        EXIT DO
                END SELECT
            END IF
        CASE 22
            insertname$ = insertname$ + _CLIPBOARD$
        CASE 27
            CLOSE
            SYSTEM
        CASE 32 TO 91, 93 TO 126
            insertname$ = insertname$ + k$
    END SELECT
LOOP
END SUB

SUB listfix
REDIM folders$(1024)
REDIM files$(1024)
newlist = 0
folder = 0
file = 0
FOR listfixer = 1 TO lists
    IF RIGHT$(list$(listfixer), 4) = ".pwb" THEN
        file = file + 1
        files$(file) = list$(listfixer)
    ELSE
        folder = folder + 1
        folders$(folder) = list$(listfixer)
    END IF
NEXT listfixer
FOR folderfixer = 1 TO folder
    newlist = newlist + 1
    t$ = ""
    DO
        FOR r = LEN(folders$(folderfixer)) TO 1 STEP -1
            r$ = MID$(folders$(folderfixer), r, 1)
            IF r$ = "\" THEN EXIT DO
            t$ = t$ + r$
        NEXT r
        EXIT DO
    LOOP
    prefix$ = "[+] "
    list$(newlist) = ""
    FOR t = LEN(t$) TO t STEP -1
        y$ = MID$(t$, t, 1)
        list$(newlist) = list$(newlist) + y$
    NEXT t
    list$(newlist) = prefix$ + crypter$(list$(newlist), 0, 128, 0)
NEXT folderfixer
FOR filefixer = 1 TO file
    newlist = newlist + 1
    t$ = ""
    DO
        FOR r = (LEN(files$(filefixer)) - 4) TO 1 STEP -1
            r$ = MID$(files$(filefixer), r, 1)
            IF r$ = "\" THEN EXIT DO
            t$ = t$ + r$
        NEXT r
        EXIT DO
    LOOP
    prefix$ = "[]  "
    list$(newlist) = ""
    FOR t = LEN(t$) TO t STEP -1
        y$ = MID$(t$, t, 1)
        list$(newlist) = list$(newlist) + y$
    NEXT t
    list$(newlist) = prefix$ + crypter$(list$(newlist), 0, 128, 0)
NEXT filefixer
IF origin$ <> loc$ THEN
    list$(0) = "[-] ...\"
    FOR moveup = lists TO 0 STEP -1
        list$(moveup + 1) = list$(moveup)
    NEXT moveup
    lists = lists + 1
END IF
END SUB

SUB pwbview
pwborigin$ = MID$(origin$, (LEN(loc$) + 1)) + "\" + MID$(list$(selected), 5)
pwborigin$ = loc$ + crypter$(pwborigin$, 1, 128, 0) + ".pwb"
pwbfile$ = list$(selected)
REDIM pwbviews$(1024)
pwbviews = 1
pwbviews$(pwbviews) = "[-] ...\"
OPEN pwborigin$ FOR INPUT AS #1
IF LOF(1) > 0 THEN
    DO
        pwbviews = pwbviews + 1
        LINE INPUT #1, pwbviews$(pwbviews)
        pwbviews$(pwbviews) = crypter$(pwbviews$(pwbviews), 0, crypt, 1)
    LOOP UNTIL EOF(1) = -1
END IF
CLOSE #1
selected = 1
row = 1
DO
    _LIMIT 32
    CLS
    PRINT MID$(pwbfile$, 5)
    PRINT
    IF selected < 1 THEN selected = 1
    IF selected > pwbviews THEN selected = pwbviews
    IF row + 24 < pwbviews AND selected > row + 11 THEN
        row = row + 1
    END IF
    IF row <> 1 AND selected < row + 11 THEN
        row = row - 1
    END IF
    IF row = 1 AND selected < row + 11 THEN
        row = row
    END IF
    IF row + 12 = pwbviews AND selected > row + 11 THEN
        row = row
    END IF
    IF pwbviews <= 25 THEN
        FOR pwbprint = 1 TO pwbviews
            IF pwbprint = selected THEN
                COLOR 0, 15
            ELSE
                COLOR 15, 0
            END IF
            PRINT pwbviews$(pwbprint)
            COLOR 15, 0
        NEXT pwbprint
    ELSE
        FOR pwbprint = row TO row + 24
            IF pwbprint = selected THEN
                COLOR 0, 15
            ELSE
                COLOR 15, 0
            END IF
            PRINT pwbviews$(pwbprint)
            COLOR 15, 0
        NEXT pwbprint
    END IF
    DO
        _LIMIT 64
        k$ = INKEY$
        DO WHILE _MOUSEINPUT
            selected = selected + _MOUSEWHEEL
            k$ = CHR$(255)
        LOOP
    LOOP UNTIL LEN(k$)
    IF k$ = CHR$(27) THEN
        OPEN pwborigin$ FOR OUTPUT AS #1
        FOR printpwb = 2 TO pwbviews
            PRINT #1, crypter$(pwbviews$(printpwb), 1, crypt, 1)
        NEXT printpwb
        CLOSE #1
        CLOSE
        SYSTEM
    END IF
    IF k$ = CHR$(13) THEN
        IF selected = 1 THEN
            OPEN pwborigin$ FOR OUTPUT AS #1
            FOR printpwb = 2 TO pwbviews
                PRINT #1, crypter$(pwbviews$(printpwb), 1, crypt, 1)
            NEXT printpwb
            CLOSE #1
            CALL collectorigin
            CALL mainloop
        END IF
        DO
            SELECT CASE LEFT$(pwbviews$(selected), (INSTR(pwbviews$(selected), ":") - 1))
                CASE ""
                    EXIT DO
                CASE "URL"
                    OPEN "temp.URL" FOR OUTPUT AS #1
                    PRINT #1, "[InternetShortcut]"
                    PRINT #1, "URL=" + MID$(pwbviews$(selected), (INSTR(pwbviews$(selected), ":") + 2))
                    CLOSE #1
                    SHELL _HIDE "start temp.URL"
                    KILL "temp.URL"
                CASE ELSE
                    _CLIPBOARD$ = MID$(pwbviews$(selected), (INSTR(pwbviews$(selected), ":") + 2))
            END SELECT
            EXIT DO
        LOOP
    END IF
    IF k$ = CHR$(8) THEN
        OPEN pwborigin$ FOR OUTPUT AS #1
        FOR printpwb = 2 TO pwbviews
            PRINT #1, crypter$(pwbviews$(printpwb), 1, crypt, 1)
        NEXT printpwb
        CLOSE #1
        CALL collectorigin
        CALL mainloop
    END IF
    IF k$ = (CHR$(0) + CHR$(82)) OR k$ = CHR$(43) THEN
        selected = 1
        DO
            _LIMIT 32
            CLS
            PRINT "What type of entry would you like to add?"
            PRINT
            IF selected < 1 THEN selected = 1
            IF selected > entrytypes THEN selected = entrytypes
            FOR printentrytypes = 1 TO entrytypes
                IF selected = printentrytypes THEN
                    COLOR 0, 15
                ELSE
                    COLOR 15, 0
                END IF
                PRINT entrytypes$(printentrytypes)
                COLOR 15, 0
            NEXT printentrytypes
            DO
                _LIMIT 64
                k$ = INKEY$
                DO WHILE _MOUSEINPUT
                    selected = selected + _MOUSEWHEEL
                    k$ = CHR$(255)
                LOOP
            LOOP UNTIL LEN(k$)
            SELECT CASE ASC(UCASE$(k$))
                CASE 8
                    selected = 1
                    EXIT DO
                CASE 13
                    SELECT CASE selected
                        CASE 1
                            pwbviews = pwbviews + 1
                            selected = 1
                            EXIT DO
                        CASE 24
                            cek$ = ""
                            DO
                                _LIMIT 32
                                CLS
                                PRINT "Enter your custom entry key"
                                PRINT ": " + cek$
                                DO
                                    _LIMIT 64
                                    k$ = INKEY$
                                LOOP UNTIL LEN(k$)
                                IF k$ = (CHR$(0) + CHR$(83)) THEN cek$ = ""
                                SELECT CASE ASC(UCASE$(k$))
                                    CASE 8
                                        IF LEN(cek$) > 0 THEN cek$ = MID$(cek$, 1, (LEN(cek$) - 1))
                                    CASE 13
                                        IF LEN(cek$) > 0 THEN
                                            cek$ = UCASE$(cek$)
                                            DO
                                                _LIMIT 32
                                                CLS
                                                PRINT "What value would you like to give for " + cek$ + "?"
                                                PRINT ": " + cekval$
                                                DO
                                                    _LIMIT 64
                                                    k$ = INKEY$
                                                LOOP UNTIL LEN(k$)
                                                IF k$ = (CHR$(0) + CHR$(83)) THEN cekval$ = ""
                                                SELECT CASE ASC(UCASE$(k$))
                                                    CASE 8
                                                        IF LEN(cekval$) > 0 THEN cekval$ = MID$(cekval$, 1, (LEN(cekval$) - 1))
                                                    CASE 13
                                                        IF LEN(cekval$) > 0 THEN
                                                            pwbviews = pwbviews + 1
                                                            pwbviews$(pwbviews) = cek$ + ": " + cekval$
                                                            EXIT DO
                                                        END IF
                                                    CASE 22
                                                        cekval$ = cekval$ + _CLIPBOARD$
                                                    CASE 27
                                                        OPEN pwborigin$ FOR OUTPUT AS #1
                                                        FOR printpwb = 2 TO pwbviews
                                                            PRINT #1, crypter$(pwbviews$(printpwb), 1, crypt, 1)
                                                        NEXT printpwb
                                                        CLOSE #1
                                                        CLOSE
                                                        SYSTEM
                                                    CASE 32 TO 126
                                                        cekval$ = cekval$ + k$
                                                END SELECT
                                            LOOP
                                            EXIT DO
                                        END IF
                                    CASE 22
                                        cek$ = cek$ + _CLIPBOARD$
                                    CASE 27
                                        OPEN pwborigin$ FOR OUTPUT AS #1
                                        FOR printpwb = 2 TO pwbviews
                                            PRINT #1, crypter$(pwbviews$(printpwb), 1, crypt, 1)
                                        NEXT printpwb
                                        CLOSE #1
                                        CLOSE
                                        SYSTEM
                                    CASE 32 TO 126
                                        cek$ = cek$ + k$
                                END SELECT
                            LOOP
                            selected = 1
                            EXIT DO
                        CASE ELSE
                            entryvalue$ = ""
                            DO
                                _LIMIT 32
                                CLS
                                PRINT "What value would you like to give for " + entrytypes$(selected) + "?"
                                PRINT ": " + entryvalue$
                                DO
                                    _LIMIT 64
                                    k$ = INKEY$
                                LOOP UNTIL LEN(k$)
                                IF k$ = (CHR$(0) + CHR$(83)) THEN entryvalue$ = ""
                                SELECT CASE ASC(UCASE$(k$))
                                    CASE 8
                                        IF LEN(entryvalue$) > 0 THEN entryvalue$ = MID$(entryvalue$, 1, (LEN(entryvalue$) - 1))
                                    CASE 13
                                        IF LEN(entryvalue$) > 0 THEN
                                            pwbviews = pwbviews + 1
                                            pwbviews$(pwbviews) = entrytypes$(selected) + ": " + entryvalue$
                                            EXIT DO
                                        END IF
                                    CASE 22
                                        entryvalue$ = entryvalue$ + _CLIPBOARD$
                                    CASE 27
                                        OPEN pwborigin$ FOR OUTPUT AS #1
                                        FOR printpwb = 2 TO pwbviews
                                            PRINT #1, crypter$(pwbviews$(printpwb), 1, crypt, 1)
                                        NEXT printpwb
                                        CLOSE #1
                                        CLOSE
                                        SYSTEM
                                    CASE 32 TO 126
                                        entryvalue$ = entryvalue$ + k$
                                END SELECT
                            LOOP
                            selected = 1
                            EXIT DO
                    END SELECT
                CASE 27
                    OPEN pwborigin$ FOR OUTPUT AS #1
                    FOR printpwb = 2 TO pwbviews
                        PRINT #1, crypter$(pwbviews$(printpwb), 1, crypt, 1)
                    NEXT printpwb
                    CLOSE #1
                    CLOSE
                    SYSTEM
            END SELECT
            IF k$ = (CHR$(0) + CHR$(72)) THEN selected = selected - 1
            IF k$ = (CHR$(0) + CHR$(80)) THEN selected = selected + 1
            IF k$ = (CHR$(0) + CHR$(71)) THEN selected = 1
            IF k$ = (CHR$(0) + CHR$(79)) THEN selected = entrytypes
        LOOP
    END IF
    IF k$ = (CHR$(0) + CHR$(83)) OR k$ = CHR$(45) AND selected <> 1 THEN
        DO
            _LIMIT 32
            CLS
            PRINT "Are you sure you want to delete this entry? (y/n)"
            DO
                _LIMIT 64
                k$ = INKEY$
            LOOP UNTIL LEN(k$)
            SELECT CASE ASC(UCASE$(k$))
                CASE 27
                    OPEN pwborigin$ FOR OUTPUT AS #1
                    FOR printpwb = 2 TO pwbviews
                        PRINT #1, crypter$(pwbviews$(printpwb), 1, crypt, 1)
                    NEXT printpwb
                    CLOSE #1
                    CLOSE
                    SYSTEM
                CASE 78
                    EXIT DO
                CASE 89
                    pwbviews$(selected) = ""
                    FOR pwbmove = selected TO (pwbviews - 1)
                        pwbviews$(pwbmove) = pwbviews$(pwbmove + 1)
                    NEXT pwbmove
                    pwbviews$(pwbviews) = ""
                    pwbviews = pwbviews - 1
                    EXIT DO
            END SELECT
        LOOP
    END IF
    IF k$ = (CHR$(0) + CHR$(75)) AND selected > 2 THEN
        SWAP pwbviews$(selected - 1), pwbviews$(selected)
        selected = selected - 1
    END IF
    IF k$ = (CHR$(0) + CHR$(77)) AND selected > 1 AND selected < pwbviews THEN
        SWAP pwbviews$(selected + 1), pwbviews$(selected)
        selected = selected + 1
    END IF
    IF k$ = (CHR$(0) + CHR$(72)) THEN selected = selected - 1
    IF k$ = (CHR$(0) + CHR$(80)) THEN selected = selected + 1
    IF k$ = (CHR$(0) + CHR$(71)) THEN selected = 1
    IF k$ = (CHR$(0) + CHR$(79)) THEN selected = pwbviews
LOOP
END SUB

SUB resetlist
FOR x = 1 TO 1024
    list$(x) = ""
NEXT x
lists = 0
END SUB

FUNCTION crypter$ (text$, crypttype, value, rmslash)
FOR a = 1 TO LEN(text$)
    DO
        IF rmslash = 0 AND ASC(MID$(text$, a, 1)) = 92 THEN
            crypter$ = crypter$ + "\"
            EXIT DO
        END IF
        SELECT CASE crypttype
            CASE 0
                crypter$ = crypter$ + CHR$(ASC(MID$(text$, a, 1)) - value)
            CASE 1
                crypter$ = crypter$ + CHR$(ASC(MID$(text$, a, 1)) + value)
        END SELECT
        EXIT DO
    LOOP
NEXT a
END FUNCTION