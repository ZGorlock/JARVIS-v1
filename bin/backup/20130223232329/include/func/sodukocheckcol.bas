FUNCTION SodukoCheckCol (col, num)
checkCol = -1
FOR rowx = 1 TO 9
    IF puzzle(rowx, col) = num THEN checkCol = 0
NEXT rowx
END FUNCTION