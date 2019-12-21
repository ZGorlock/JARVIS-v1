FUNCTION SodukoSolve (row, col)
solve = -1
finflag = row
IF finflag > 9 THEN EXIT FUNCTION
IF puzzle(row, col) > 0 THEN
    IF col < 9 THEN
        puzzle = SodukoSolve(row, (col + 1))
    ELSE
        puzzle = SodukoSolve((row + 1), 1)
    END IF
    IF finflag > 9 THEN EXIT FUNCTION
ELSE
    FOR num = 1 TO 9
        IF SodukoCheckRow(row, num) AND SodukoCheckCol(col, num) AND SodukoCheckBox(row, col, num) THEN
            puzzle(row, col) = num
            IF col < 9 THEN
                puzzle = SodukoSolve(row, (col + 1))
            ELSE
                puzzle = SodukoSolve((row + 1), 1)
            END IF
            IF finflag > 9 THEN EXIT FUNCTION
        END IF
    NEXT num
    puzzle(row, col) = 0
    solve = 0
END IF
END FUNCTION