SUB txt2guid (c%&, t$)
poked c%&, VAL("&h" + LEFT$(t$, 8))
pokew c%& + 4, VAL("&h" + MID$(t$, 10, 4))
pokew c%& + 6, VAL("&h" + MID$(t$, 15, 4))
pokeb c%& + 8, VAL("&h" + MID$(t$, 20, 2))
pokeb c%& + 9, VAL("&h" + MID$(t$, 22, 2))
FOR i& = 0 TO 5
    pokeb c%& + 10 + i&, VAL("&h" + MID$(t$, 25 + i& * 2, 2))
NEXT
END SUB