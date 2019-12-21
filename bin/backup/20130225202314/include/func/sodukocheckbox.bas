FUNCTION SodukoCheckBox (row, col, num)
checkBox = -1
rowx = INT(((row - 1) / 3)) * 3
colx = INT(((col - 1) / 3)) * 3
FOR r = 1 TO 3
    FOR c = 1 TO 3
        IF puzzle((rowx + r), (colx + c)) = num THEN checkBox = 0
NEXT c, r
END FUNCTION