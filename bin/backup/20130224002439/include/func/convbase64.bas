FUNCTION convbase64$ (bit8$)
IF bit8$ = "" THEN EXIT FUNCTION
base64$ = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
pad = LEN(bit8$) MOD 3
unenc$ = bit8$ + STRING$(pad + 1, "=")
st = 1
enc$ = ""
DO
    bytes$ = ""
    FOR x = st TO st + 2
        bytes$ = bytes$ + bin$(ASC(MID$(unenc$, x, 1)))
    NEXT x
    FOR x = 1 TO 4
        num = todecimal(MID$(bytes$, x * 6 - 5, 6))
        enc$ = enc$ + MID$(base64$, num + 1, 1)
    NEXT x
    st = st + 3
LOOP UNTIL LEN(unenc$) - st - 1 <= 0
enc$ = LEFT$(enc$, LEN(enc$) - pad + 1)
enc$ = enc$ + STRING$(pad - 1, "=")
convbase64$ = enc$
END FUNCTION