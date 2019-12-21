FUNCTION Compare (check$, reference$)
REDIM Comparex(32)
REDIM Comparey(32)
FOR j = 1 TO LEN(check$)
    x = ASC(UCASE$(MID$(check$, j, 1)))
    IF x > 64 AND x < 91 THEN
        Comparex(x - 64) = Comparex(x - 64) + 1
    END IF
NEXT
FOR j = 1 TO LEN(reference$)
    x = ASC(UCASE$(MID$(reference$, j, 1)))
    IF x > 64 AND x < 91 THEN Comparey(x - 64) = Comparey(x - 64) + 1
NEXT
wordright = 0
wordwrong = 0
FOR j = 1 TO 26
    IF Comparex(j) <= Comparey(j) THEN
        wordright = wordright + Comparex(j)
        wordwrong = wordwrong + Comparey(j) - Comparex(j)
    ELSE
        wordright = wordright + Comparey(j)
    END IF
NEXT
Compare = ((wordright - wordwrong) / LEN(check$) * 100)
END FUNCTION