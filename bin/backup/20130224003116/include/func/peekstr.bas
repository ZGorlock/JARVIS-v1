FUNCTION peekstr$ (p~%&)
n~%& = peekpoke_strnlen(p~%&, &H7FFFFFFF~&)
t$ = STRING$(n~%&, 0)
peekpoke_memcpy _OFFSET(t$), p~%&, n~%&
peekstr$ = t$
END FUNCTION
