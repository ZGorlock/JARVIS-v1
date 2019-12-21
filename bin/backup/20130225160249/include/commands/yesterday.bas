IF usercommand$(runcommands) = "yesterday" THEN
    day = VAL(STR$(VAL(MID$(DATE$, 4, 2))))
    month = VAL(LEFT$(DATE$, 2))
    year = VAL(RIGHT$(DATE$, 4))
    IF month < 3 THEN
        month = month + 12
        year = year - 1
    END IF
    century = year \ 100
    year = year MOD 100
    S1 = (century \ 4) - (2 * century) - 1
    S2 = (5 * year) \ 4
    S3 = 26 * (month + 1) \ 10
    weekday = (S1 + S2 + S3 + day - 1) MOD 7
    IF weekday < 0 THEN weekday = weekday + 7
    SELECT CASE weekday
        CASE 0
            day$ = "Sunday"
        CASE 1
            day$ = "Monday"
        CASE 2
            day$ = "Tuesday"
        CASE 3
            day$ = "Wednesday"
        CASE 4
            day$ = "Thursday"
        CASE 5
            day$ = "Friday"
        CASE 6
            day$ = "Saturday"
    END SELECT
    speechoutput$ = "yesterday was " + day$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF
