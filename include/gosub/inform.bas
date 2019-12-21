inform:
IF usercommands <> -1 AND active = 1 THEN
    DO
        FOR runinput = 1 TO userinputs
            '$include:'..\include\inform\element.bas'
            IF usercommands = -1 THEN EXIT DO
        NEXT runinput
        EXIT DO
    LOOP
END IF
RETURN