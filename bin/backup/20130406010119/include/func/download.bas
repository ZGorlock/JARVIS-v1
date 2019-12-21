FUNCTION Download (url$, file$, timelimit, row, col, length)
link$ = url$
GOSUB start_connection
t! = TIMER
head$ = ""
cont_type$ = ""
DO
    _LIMIT 20
    GET #client, , a2$
    a$ = a$ + a2$
    IF INSTR(a$, e$ + e$) AND head$ = "" THEN
        head$ = MID$(a$, 1, INSTR(a$, e$ + e$) - 1)
        uhead$ = UCASE$(head$)
        IF LEFT$(head$, 15) <> "HTTP/1.1 200 OK" THEN
            IF LEFT$(head$, 12) = "HTTP/1.1 302" THEN
                IF INSTR(uhead$, "LOCATION:") > 0 THEN
                    CLOSE #client
                    link$ = MID$(head$, INSTR(uhead$, "LOCATION:") + 9)
                    link$ = MID$(link$, 1, INSTR(link$, e$) - 1)
                    head$ = ""
                    uhead$ = ""
                    a$ = ""
                    GOSUB start_connection
                END IF
            ELSE
                EXIT FUNCTION
            END IF
        END IF
        IF INSTR(uhead$, "CONTENT-LENGTH:") > 0 THEN
            l&& = VAL(MID$(head$, INSTR(uhead$, "CONTENT-LENGTH:") + 15))
        END IF
        IF INSTR(uhead$, "TRANSFER-ENCODING") > 0 THEN
            cont_type$ = MID$(head$, INSTR(uhead$, "TRANSFER-ENCODING:") + 18)
            cont_type$ = UCASE$(RTRIM$(LTRIM$(MID$(cont_type$, 1, INSTR(cont_type$, e$) - 1))))
        END IF
        a$ = MID$(a$, INSTR(a$, e$ + e$) + 4)
    END IF
    IF l&& > 0 THEN ltf&& = l&&
    IF ltf&& > 0 THEN
        lod&& = LEN(a$)
        LOCATE row, col
        PRINT " ("; LTRIM$(RTRIM$(STR$((INT((lod&& / ltf&&) * 100))))); "%)"; RTRIM$(STR$(lod&&)); "b/"; LTRIM$(RTRIM$(STR$(ltf&&))); "b"
        _DISPLAY
    END IF
    IF head$ > "" THEN
        IF l&& > 0 THEN
            lod&& = LEN(a$)
            IF (lod&&) = l&& THEN
                download_done = -1
                LOCATE row, col
                PRINT " ("; "100%)"; RTRIM$(STR$(lod&&)); "b/"; LTRIM$(RTRIM$(STR$(ltf&&))); "b"
                _DISPLAY
                d$ = MID$(a$, 1, l&&)
            END IF
        ELSEIF cont_type$ = "CHUNKED" THEN
            h$ = MID$(a$, 1, INSTR(a$, e$))
            bytes = VAL("&H" + h$)
            IF LEN(a$) - LEN(h$) - 1 > bytes THEN
                chunk$ = chunk$ + MID$(a$, INSTR(a$, e$) + 1, bytes)
                a$ = MID$(a$, INSTR(a$, e$) + bytes + 1)
            ELSEIF bytes = 0 THEN
                dat = length
                download_done = -1
                d$ = chunk$
            END IF
        END IF
    END IF
    IF download_done THEN
        CLOSE client
        fh = FREEFILE
        OPEN file$ FOR OUTPUT AS #5
        CLOSE #5
        OPEN file$ FOR BINARY AS #5
        PUT #5, , d$
        CLOSE #5
        Download = -1
        EXIT FUNCTION
    END IF
LOOP UNTIL TIMER > t! + timelimit AND timelimit > 0
IF TIMER > t! + timelimit AND timelimit > 0 THEN Download = 1
CLOSE client
EXIT FUNCTION
start_connection:
url2$ = RTRIM$(LTRIM$(link$))
url4$ = RTRIM$(LTRIM$(link$))
IF LEFT$(UCASE$(url2$), 7) = "HTTP://" THEN url4$ = MID$(url2$, 8)
x = INSTR(url4$, "/")
IF x THEN url2$ = LEFT$(url4$, x - 1)
client = _OPENCLIENT("TCP/IP:80:" + url2$)
IF client = 0 THEN
    Download = 2
    EXIT FUNCTION
END IF
e$ = CHR$(13) + CHR$(10)
url3$ = RIGHT$(url4$, LEN(url4$) - x + 1)
x$ = "GET " + url3$ + " HTTP/1.1" + e$
x$ = x$ + "Host: " + url2$ + e$ + e$
PUT #client, , x$
RETURN
END FUNCTION