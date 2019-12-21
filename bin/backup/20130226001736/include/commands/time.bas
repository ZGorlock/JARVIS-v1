IF usercommand$(runcommands) = "time" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "standby" OR usercommand$(runcommands2) = "stand" THEN EXIT DO
        NEXT runcommands2
        hours$ = LEFT$(TIME$, 2)
        hours = VAL(hours$)
        IF timepref = 1 THEN
            daytime$ = " AM"
            IF hours > 12 THEN
                hours = hours - 12
                daytime$ = " PM"
            END IF
            IF hours = 12 THEN daytime$ = " PM"
            IF hours = 0 THEN
                hours = 12
            END IF
        END IF
        minutes$ = MID$(TIME$, 4, 2)
        IF timepref = 1 THEN
            timesimple$ = LTRIM$(STR$(hours)) + ":" + minutes$ + daytime$
        ELSE
            timesimple$ = hours$ + minutes$ + " hours"
        END IF
        speechoutput$ = "it is currently " + timesimple$
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF
