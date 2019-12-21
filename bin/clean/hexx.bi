' public domain, 2012 feb & march, michael calkins
' http://www.qb64.net/forum/index.php?topic=4491.msg58252#msg58252

FUNCTION hexq$ (n AS _UNSIGNED _INTEGER64)
DIM t AS STRING
t = LCASE$(HEX$(n))
hexq = STRING$(16 - LEN(t), &H30) + t
END FUNCTION

FUNCTION hexp$ (n AS _UNSIGNED _OFFSET)
DIM t AS STRING
t = LCASE$(HEX$(n))
hexp = STRING$((2 * LEN(n)) - LEN(t), &H30) + t
END FUNCTION

FUNCTION hexd$ (n AS _UNSIGNED LONG)
DIM t AS STRING
t = LCASE$(HEX$(n))
hexd = STRING$(8 - LEN(t), &H30) + t
END FUNCTION

FUNCTION hexw$ (n AS _UNSIGNED INTEGER)
DIM t AS STRING
t = LCASE$(HEX$(n))
hexw = STRING$(4 - LEN(t), &H30) + t
END FUNCTION

FUNCTION hexb$ (n AS _UNSIGNED _BYTE)
DIM t AS STRING
t = LCASE$(HEX$(n))
IF n < &H10 THEN hexb = "0" + t ELSE hexb = t
END FUNCTION

FUNCTION hexx_bi_rev$ ()
hexx_bi_rev = "2012 03 14 mcalkins"
END FUNCTION