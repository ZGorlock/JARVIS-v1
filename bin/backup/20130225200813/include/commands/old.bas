IF usercommand$(runcommands) = "old" THEN
    DO
        year1 = VAL(RIGHT$(DATE$, 4))
        month1 = VAL(LEFT$(DATE$, 2))
        day1 = VAL(MID$(DATE$, 4, 2))
        hour1 = VAL(LEFT$(TIME$, 2))
        minute1 = VAL(MID$(TIME$, 4, 2))
        second1 = VAL(RIGHT$(TIME$, 2))
        IF INSTR(useroutputuse$, " you") THEN
            secdif&& = timebetween&&(year1, month1, day1, hour1, minute1, second1, 2011, 11, 27, 0, 0, 0)
            IF secdif&& > 0 THEN
                years$ = STR$(INT((secdif&& / 31556952)))
                days$ = STR$(INT(((secdif&& - (VAL(years$) * 31556952)) / 86400)))
                hours$ = STR$(INT(((secdif&& - ((VAL(years$) * 31556952) + (VAL(days$) * 86400))) / 3600)))
                minutes$ = STR$(INT(((secdif&& - ((VAL(years$) * 31556952) + (VAL(days$) * 86400) + (VAL(hours$) * 3600))) / 60)))
                seconds$ = STR$(INT(((secdif&& - ((VAL(years$) * 31556952) + (VAL(days$) * 86400) + (VAL(hours$) * 3600) + (VAL(minutes$) * 60))))))
                speechoutput$ = "i am"
                IF VAL(years$) THEN speechoutput$ = speechoutput$ + years$ + " years"
                IF VAL(days$) THEN speechoutput$ = speechoutput$ + days$ + " days"
                IF VAL(hours$) THEN speechoutput$ = speechoutput$ + hours$ + " hours"
                IF VAL(minutes$) THEN speechoutput$ = speechoutput$ + minutes$ + " minutes"
                IF VAL(seconds$) THEN speechoutput$ = speechoutput$ + seconds$ + " seconds"
                speechoutput$ = speechoutput$ + " old"
            END IF
            speechprint$ = speechoutput$
            GOSUB textprint
            GOSUB speechoutput
            usercommands = -1
            EXIT DO
        ELSE
            year2 = VAL(RIGHT$(birthday$, 4))
            month2 = VAL(LEFT$(birthday$, 2))
            day2 = VAL(MID$(birthday$, 4, 2))
            secdif&& = timebetween&&(year1, month1, day1, hour1, minute1, second1, year2, month2, day2, 0, 0, 0)
            IF secdif&& > 0 THEN
                FOR runcommands2 = 1 TO usercommands
                    IF usercommand$(runcommands2) = "day" OR usercommand$(runcommands2) = "days" THEN
                        days$ = STR$(INT((secdif&& / 86400)))
                        speechoutput$ = "you are " + days$ + " days old"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        EXIT DO
                    END IF
                    IF usercommand$(runcommands2) = "hour" OR usercommand$(runcommands2) = "hour" THEN
                        hours$ = STR$(INT((secdif&& / 3600)))
                        speechoutput$ = "you are " + hours$ + " hours old"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        EXIT DO
                    END IF
                    IF usercommand$(runcommands2) = "minute" OR usercommand$(runcommands2) = "minutes" THEN
                        minutes$ = STR$(INT((secdif&& / 60)))
                        speechoutput$ = "you are " + minutes$ + " minutes old"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        EXIT DO
                    END IF
                    IF usercommand$(runcommands2) = "seconds" OR usercommand$(runcommands2) = "seconds" THEN
                        seconds$ = STR$(INT(secdif&&))
                        speechoutput$ = "you are " + seconds$ + " seconds old"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        EXIT DO
                    END IF
                    IF usercommand$(runcommands2) = "week" OR usercommand$(runcommands2) = "weeks" THEN
                        weeks$ = STR$(INT((secdif&& / 604800)))
                        speechoutput$ = "you are " + weeks$ + " weeks old"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        EXIT DO
                    END IF
                    IF usercommand$(runcommands2) = "year" OR usercommand$(runcommands2) = "years" THEN
                        years$ = STR$(INT((secdif&& / 31556952)))
                        speechoutput$ = "you are " + years$ + " years old"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        EXIT DO
                    END IF
                NEXT runcommands2
            END IF
        END IF
    LOOP
END IF