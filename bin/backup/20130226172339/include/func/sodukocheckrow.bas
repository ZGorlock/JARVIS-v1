FUNCTION SodukoCheckRow (row, num)
checkRow = -1
FOR colx = 1 TO 9
    IF puzzle(row, colx) = num THEN checkRow = 0
NEXT colx
END FUNCTION