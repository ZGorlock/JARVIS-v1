getalarms:
REDIM alarms$(32)
alarms = 0
OPEN "data\jarvis.ini" FOR INPUT AS #1
DO
    LINE INPUT #1, getline$
    IF getline$ = "[Alarms]" THEN
        DO
            LINE INPUT #1, getline$
            IF getline$ <> "" THEN
                alarms = alarms + 1
                alarms$(alarms) = getline$
            ELSE
                EXIT DO
            END IF
        LOOP
        EXIT DO
    END IF
LOOP
CLOSE #1
RETURN