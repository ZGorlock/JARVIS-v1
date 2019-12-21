FUNCTION Deserialize$ (text$, chunk$)
DO
    b& = INSTR(e& + 1, text$, CHR$(34))
    IF 0 = b& THEN EXIT FUNCTION
    e& = INSTR(b& + 1, text$, CHR$(34))
    IF 0 = e& THEN EXIT FUNCTION
    SELECT CASE p&
        CASE 0
            IF chunk$ = MID$(text$, b& + 1, e& - b& - 1) THEN
                p& = 2
            ELSE
                p& = 1
            END IF
        CASE 1
            p& = 0
        CASE 2
            Deserialize$ = MID$(text$, b& + 1, e& - b& - 1)
            EXIT FUNCTION
    END SELECT
LOOP
END FUNCTION