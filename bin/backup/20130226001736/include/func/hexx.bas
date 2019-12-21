FUNCTION hexq$ (n~&&)
t$ = LCASE$(HEX$(n~&&))
hexq$ = STRING$(16 - LEN(t$), &H30) + t$
END FUNCTION

FUNCTION hexp$ (n~%&)
t$ = LCASE$(HEX$(n~%&))
hexp$ = STRING$((2 * LEN(n~%&)) - LEN(t$), &H30) + t$
END FUNCTION

FUNCTION hexd$ (n~&)
t$ = LCASE$(HEX$(n~&))
hexd$ = STRING$(8 - LEN(t$), &H30) + t$
END FUNCTION

FUNCTION hexw$ (n~&&)
t$ = LCASE$(HEX$(n~&&))
hexw$ = STRING$(4 - LEN(t$), &H30) + t$
END FUNCTION

FUNCTION hexb$ (n~%%)
t$ = LCASE$(HEX$(n~%%))
IF n~%% < &H10 THEN hexb$ = "0" + t$ ELSE hexb$ = t$
END FUNCTION