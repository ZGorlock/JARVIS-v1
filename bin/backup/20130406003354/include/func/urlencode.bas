FUNCTION UrlEncode$ (text$)
FOR a = 1 TO LEN(text$)
    a$ = MID$(text$, a, 1)
    IF a$ = " " THEN
        a$ = "+"
    ELSE
        l = ASC(a$)
        IF l < 48 OR (l > 57 AND l < 65) OR (l > 90 AND l < 97) OR l > 122 THEN a$ = "%" + HEX$(l)
    END IF
    UrlEncode$ = UrlEncode$ + a$
NEXT a
END FUNCTION