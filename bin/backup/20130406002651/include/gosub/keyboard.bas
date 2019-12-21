keyboard:
REDIM keys(256)
keys = 0
click = 0
shift = 0
control = 0
alt = 0
FOR thekey = &H01 TO &HFE
    IF GetAsyncKeyState(thekey) THEN
        keys = keys + 1
        keys(thekey) = 1
    END IF
NEXT
IF keys(1) = 1 OR keys(2) = 1 THEN click = 1
IF keys(16) = 1 THEN shift = 1
IF keys(17) = 1 THEN control = 1
IF keys(18) = 1 THEN alt = 1
RETURN