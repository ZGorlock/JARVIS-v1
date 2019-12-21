FUNCTION todecimal (binary1$)
FOR x = 1 TO LEN(binary1$)
    dec = dec + VAL(MID$(binary1$, x, 1)) * (2 ^ (LEN(binary1$) - x))
NEXT x
todecimal = dec
END FUNCTION