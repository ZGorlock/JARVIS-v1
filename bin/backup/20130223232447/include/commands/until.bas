IF usercommand$(runcommands) = "until" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "birthday" THEN
                year1 = VAL(RIGHT$(DATE$, 4))
                month1 = VAL(LEFT$(DATE$, 2))
                day1 = VAL(MID$(DATE$, 4, 2))
                hour1 = VAL(LEFT$(TIME$, 2))
                minute1 = VAL(MID$(TIME$, 4, 2))
                second1 = VAL(RIGHT$(TIME$, 2))
                month2 = VAL(LEFT$(birthday$, 2))
                day2 = VAL(MID$(birthday$, 4, 2))
                IF month2 > month1 THEN
                    year2 = year1
                ELSE
                    IF month2 = month1 THEN
                        IF day2 > day1 THEN
                            year2 = year1
                        ELSE
                            IF day2 = day1 THEN
                                speechoutput$ = "today is your birthday, " + username$
                                speechprint$ = speechoutput$
                                GOSUB textprint
                                GOSUB speechoutput
                                usercommands = -1
                                EXIT DO
                            ELSE
                                year2 = year1 + 1
                            END IF
                        END IF
                    ELSE
                        year2 = year1 + 1
                    END IF
                END IF
                secdif&& = timebetween&&(year1, month1, day1, hour1, minute1, second1, year2, month2, day2, 0, 0, 0)
                IF secdif&& > 0 THEN
                    days$ = STR$(INT((secdif&& / 86400)))
                    hours$ = STR$(INT(((secdif&& - (VAL(days$) * 86400)) / 3600)))
                    minutes$ = STR$(INT(((secdif&& - ((VAL(days$) * 86400) + (VAL(hours$) * 3600))) / 60)))
                    seconds$ = STR$(INT(((secdif&& - ((VAL(days$) * 86400) + (VAL(hours$) * 3600) + (VAL(minutes$) * 60))))))
                    speechoutput$ = "there is"
                    IF VAL(days$) THEN speechoutput$ = speechoutput$ + days$ + " days"
                    IF VAL(hours$) THEN speechoutput$ = speechoutput$ + hours$ + " hours"
                    IF VAL(minutes$) THEN speechoutput$ = speechoutput$ + minutes$ + " minutes"
                    IF VAL(seconds$) THEN speechoutput$ = speechoutput$ + seconds$ + " seconds"
                    speechoutput$ = speechoutput$ + " until your birthday"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                END IF
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        findevent$ = MID$(useroutputuse$, (INSTR(useroutputuse$, "until") + 6))
        eventmonth = MonthToNum(TRIM$(findevent$))
        IF eventmonth THEN
            year1 = VAL(RIGHT$(DATE$, 4))
            month1 = VAL(LEFT$(DATE$, 2))
            day1 = VAL(MID$(DATE$, 4, 2))
            hour1 = VAL(LEFT$(TIME$, 2))
            minute1 = VAL(MID$(TIME$, 4, 2))
            second1 = VAL(RIGHT$(TIME$, 2))
            IF eventmonth > month1 THEN
                year2 = year1
            ELSE
                IF eventmonth = month1 THEN
                    speechoutput$ = "it is the month of " + findevent$
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    usercommands = -1
                    EXIT DO
                ELSE
                    year2 = year1 + 1
                END IF
            END IF
            secdif&& = timebetween&&(year1, month1, day1, hour1, minute1, second1, year2, eventmonth, 0, 0, 0, 0)
            IF secdif&& > 0 THEN
                days$ = STR$(INT((secdif&& / 86400)))
                hours$ = STR$(INT(((secdif&& - (VAL(days$) * 86400)) / 3600)))
                minutes$ = STR$(INT(((secdif&& - ((VAL(days$) * 86400) + (VAL(hours$) * 3600))) / 60)))
                seconds$ = STR$(INT(((secdif&& - ((VAL(days$) * 86400) + (VAL(hours$) * 3600) + (VAL(minutes$) * 60))))))
                speechoutput$ = "there is"
                IF VAL(days$) THEN speechoutput$ = speechoutput$ + days$ + " days"
                IF VAL(hours$) THEN speechoutput$ = speechoutput$ + hours$ + " hours"
                IF VAL(minutes$) THEN speechoutput$ = speechoutput$ + minutes$ + " minutes"
                IF VAL(seconds$) THEN speechoutput$ = speechoutput$ + seconds$ + " seconds"
                speechoutput$ = speechoutput$ + " until the month of " + findevent$
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
            END IF
            usercommands = -1
            EXIT DO
        END IF
        IF VAL(findevent$) OR WordToNum(findevent$) > 0 THEN
            findevent = VAL(findevent$)
            IF findevent = 0 THEN findevent = WordToNum(findevent$)
            year1 = VAL(RIGHT$(DATE$, 4))
            month1 = VAL(LEFT$(DATE$, 2))
            day1 = VAL(MID$(DATE$, 4, 2))
            hour1 = VAL(LEFT$(TIME$, 2)) MOD 12
            IF hour1 = 0 THEN hour1 = 12
            minute1 = VAL(MID$(TIME$, 4, 2))
            second1 = VAL(RIGHT$(TIME$, 2))
            SELECT CASE findevent
                CASE IS <= 12
                    findevent = findevent MOD 12
                    IF findevent = 0 THEN findevent = 12
                    IF findevent < hour1 THEN findevent = findevent + 12
                    secdif&& = timebetween&&(0, 0, 0, hour1, minute1, second1, 0, 0, 0, findevent, 0, 0)
                    IF secdif&& > 0 THEN
                        hours$ = STR$(INT((secdif&& / 3600)))
                        minutes$ = STR$(INT(((secdif&& - (VAL(hours$) * 3600)) / 60)))
                        seconds$ = STR$(INT(((secdif&& - ((VAL(days$) * 86400) + (VAL(hours$) * 3600) + (VAL(minutes$) * 60))))))
                        speechoutput$ = "there is"
                        IF VAL(hours$) THEN speechoutput$ = speechoutput$ + hours$ + " hours"
                        IF VAL(minutes$) THEN speechoutput$ = speechoutput$ + minutes$ + " minutes"
                        IF VAL(seconds$) THEN speechoutput$ = speechoutput$ + seconds$ + " seconds"
                        speechoutput$ = speechoutput$ + " until " + TRIM$(STR$(findevent))
                    END IF
                CASE IS < 1300
                    findeventhour = VAL(LEFT$(STR$(findevent), 2))
                    findeventmin = VAL(RIGHT$(STR$(findevent), 2))
                    findeventhour = findeventhour MOD 12
                    IF findeventhour = 0 THEN findeventhour = 12
                    IF findeventhour < hour1 THEN findeventhour = findeventhour + 12
                    secdif&& = timebetween&&(0, 0, 0, hour1, minute1, second1, 0, 0, 0, findeventhour, findeventmin, 0)
                    IF secdif&& > 0 THEN
                        hours$ = STR$(INT((secdif&& / 3600)))
                        minutes$ = STR$(INT(((secdif&& - (VAL(hours$) * 3600)) / 60)))
                        seconds$ = STR$(INT(((secdif&& - ((VAL(days$) * 86400) + (VAL(hours$) * 3600) + (VAL(minutes$) * 60))))))
                        speechoutput$ = "there is"
                        IF VAL(hours$) THEN speechoutput$ = speechoutput$ + hours$ + " hours"
                        IF VAL(minutes$) THEN speechoutput$ = speechoutput$ + minutes$ + " minutes"
                        IF VAL(seconds$) THEN speechoutput$ = speechoutput$ + seconds$ + " seconds"
                        speechoutput$ = speechoutput$ + " until " + STR$(findeventhour) + ":" + STR$(findeventmin)
                    END IF
                CASE ELSE
                    IF findevent > year1 THEN
                        secdif&& = timebetween&&(year1, month1, day1, hour1, minute1, second1, findevent, 0, 0, 0, 0, 0)
                        IF secdif&& > 0 THEN
                            days$ = STR$(INT((secdif&& / 86400)))
                            hours$ = STR$(INT(((secdif&& - (VAL(days$) * 86400)) / 3600)))
                            minutes$ = STR$(INT(((secdif&& - ((VAL(days$) * 86400) + (VAL(hours$) * 3600))) / 60)))
                            seconds$ = STR$(INT(((secdif&& - ((VAL(days$) * 86400) + (VAL(hours$) * 3600) + (VAL(minutes$) * 60))))))
                            speechoutput$ = "there is"
                            IF VAL(days$) THEN speechoutput$ = speechoutput$ + days$ + " days"
                            IF VAL(hours$) THEN speechoutput$ = speechoutput$ + hours$ + " hours"
                            IF VAL(minutes$) THEN speechoutput$ = speechoutput$ + minutes$ + " minutes"
                            IF VAL(seconds$) THEN speechoutput$ = speechoutput$ + seconds$ + " seconds"
                            speechoutput$ = speechoutput$ + " until the year " + TRIM$(STR$(findevent))
                        END IF
                    ELSE
                        IF findevent = year1 THEN
                            speechoutput$ = "it is the year " + TRIM$(STR$(findevent))
                        ELSE
                            speechoutput$ = "the year " + TRIM$(STR$(findevent)) + " has already passed"
                        END IF
                    END IF
            END SELECT
            IF speechoutput$ > "" THEN
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
            END IF
            usercommands = -1
            EXIT DO
        END IF
        IF LEFT$(findevent$, 3) = "the" THEN
            findevent = VAL(MID$(findevent$, 5))
            SELECT CASE month1
                CASE 2
                    isleap = (y2 MOD 4 = 0 AND y2 MOD 100 <> 0) OR y2 MOD 400 = 0
                    maxsay = 29 - isleap
                CASE 4, 6, 9, 11
                    maxday = 30
                CASE ELSE
                    maxday = 31
            END SELECT
            IF findevent <= maxday THEN
                IF findevent > day1 THEN
                    secdif&& = timebetween&&(0, 0, day1, hour1, minute1, second1, 0, 0, findevent, 0, 0, 0)
                    IF secdif&& > 0 THEN
                        days$ = STR$(INT((secdif&& / 86400)))
                        hours$ = STR$(INT(((secdif&& - (VAL(days$) * 86400)) / 3600)))
                        minutes$ = STR$(INT(((secdif&& - ((VAL(days$) * 86400) + (VAL(hours$) * 3600))) / 60)))
                        seconds$ = STR$(INT(((secdif&& - ((VAL(days$) * 86400) + (VAL(hours$) * 3600) + (VAL(minutes$) * 60))))))
                        speechoutput$ = "there is"
                        IF VAL(days$) THEN speechoutput$ = speechoutput$ + days$ + " days"
                        IF VAL(hours$) THEN speechoutput$ = speechoutput$ + hours$ + " hours"
                        IF VAL(minutes$) THEN speechoutput$ = speechoutput$ + minutes$ + " minutes"
                        IF VAL(seconds$) THEN speechoutput$ = speechoutput$ + seconds$ + " seconds"
                        speechoutput$ = speechoutput$ + " until the" + DaySuffix$(findevent)
                    END IF
                ELSE
                    IF findevent = day1 THEN
                        speechoutput$ = "today is the" + DaySuffix$(findevent)
                    ELSE
                        speechoutput$ = "the" + DaySuffix$(findevent) + " has already passed"
                    END IF
                END IF
            END IF
            IF speechoutput$ > "" THEN
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
            END IF
            usercommands = -1
            EXIT DO
        END IF
        IF findevent$ = "sunday" OR findevent$ = "monday" OR findevent$ = "tuesday" OR findevent$ = "wednesday" OR findevent$ = "thursday" OR findevent$ = "friday" OR findevent$ = "saturday" THEN
            IF findevent$ = "sunday" THEN weekdayto = 1
            IF findevent$ = "monday" THEN weekdayto = 2
            IF findevent$ = "tuesday" THEN weekdayto = 3
            IF findevent$ = "wednesday" THEN weekdayto = 4
            IF findevent$ = "thursday" THEN weekdayto = 5
            IF findevent$ = "friday" THEN weekdayto = 6
            IF findevent$ = "saturday" THEN weekdayto = 7
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
            weekday = (S1 + S2 + S3 + day) MOD 7
            IF weekday < 0 THEN weekday = weekday + 7
            weekday = weekday + 1
            IF weekdayto > weekday THEN 
                daysbetween = weekdayto - weekday
            ELSE
                daysbetween = 7 - weekday + weekdayto
            END IF
            hour = VAL(LEFT$(TIME$, 2))
            minute = VAL(MID$(TIME$, 4, 2))
            second = VAL(RIGHT$(TIME$, 2))
            timein = (hour * 3600) + (minute * 60) + second
            timeuntil = (daysbetween * 86400) - timein
            IF timeuntil > 0 THEN
                days$ = STR$(INT((timeuntil / 86400)))
                hours$ = STR$(INT(((timeuntil - (VAL(days$) * 86400)) / 3600)))
                minutes$ = STR$(INT(((timeuntil - ((VAL(days$) * 86400) + (VAL(hours$) * 3600))) / 60)))
                seconds$ = STR$(INT(((timeuntil - ((VAL(days$) * 86400) + (VAL(hours$) * 3600) + (VAL(minutes$) * 60))))))
                speechoutput$ = "there is"
                IF VAL(days$) THEN speechoutput$ = speechoutput$ + days$ + " days"
                IF VAL(hours$) THEN speechoutput$ = speechoutput$ + hours$ + " hours"
                IF VAL(minutes$) THEN speechoutput$ = speechoutput$ + minutes$ + " minutes"
                IF VAL(seconds$) THEN speechoutput$ = speechoutput$ + seconds$ + " seconds"
                speechoutput$ = speechoutput$ + " until " + findevent$
            END IF
            EXIT DO
        END IF
        highest = 0
        FOR eventcheck = 1 TO eventnum
            gocheckevent = 0
            month2 = VAL(LEFT$(events$(eventcheck, 2), 2))
            day2 = VAL(MID$(events$(eventcheck, 2), 4, 2))
            year2 = VAL(RIGHT$(events$(eventcheck, 2), 4))
            IF year2 > year1 THEN
                gocheckevent = 1
            ELSE
                IF year2 = year1 THEN
                    IF month2 > month1 THEN
                        gocheckevent = 1
                    ELSE
                        IF month2 = month1 THEN
                            IF day2 > day1 THEN
                                gocheckevent = 1
                            ELSE
                                IF day2 = day1 THEN gocheckevent = 1
                            END IF
                        END IF
                    END IF
                END IF
            END IF
            IF gocheckevent = 1 THEN
                eventcheckval = Compare(event$, events$(eventcheck, 1))
                IF eventcheckval > highest THEN
                    highest = eventcheckval
                    eventchecknum = eventcheck
                END IF
            END IF
        NEXT eventcheck
        IF highest < 30 THEN EXIT DO
        year1 = VAL(RIGHT$(DATE$, 4))
        month1 = VAL(LEFT$(DATE$, 2))
        day1 = VAL(MID$(DATE$, 4, 2))
        year2 = VAL(RIGHT$(events$(eventchecknum, 2), 4))
        month2 = VAL(LEFT$(events$(eventchecknum, 2), 2))
        day2 = VAL(MID$(events$(eventchecknum, 2), 4, 2))
        IF year2 = year1 AND month2 = month1 AND day2 = day1 THEN
            speechoutput$ = "today is " + events$(eventchecknum, 1)
            speechprint$ = speechoutput$
            GOSUB textprint
            GOSUB speechoutput
            usercommands = -1
            EXIT DO
        END IF
        hour1 = VAL(LEFT$(TIME$, 2))
        minute1 = VAL(MID$(TIME$, 4, 2))
        second1 = VAL(RIGHT$(TIME$, 2))
        secdif&& = timebetween&&(year1, month1, day1, hour1, minute1, second1, year2, month2, day2, 0, 0, 0)
        IF secdif&& > 0 THEN
            days$ = STR$(INT((secdif&& / 86400)))
            hours$ = STR$(INT(((secdif&& - (VAL(days$) * 86400)) / 3600)))
            minutes$ = STR$(INT(((secdif&& - ((VAL(days$) * 86400) + (VAL(hours$) * 3600))) / 60)))
            seconds$ = STR$(INT(((secdif&& - ((VAL(days$) * 86400) + (VAL(hours$) * 3600) + (VAL(minutes$) * 60))))))
            speechoutput$ = "there is"
            IF VAL(days$) THEN speechoutput$ = speechoutput$ + days$ + " days"
            IF VAL(hours$) THEN speechoutput$ = speechoutput$ + hours$ + " hours"
            IF VAL(minutes$) THEN speechoutput$ = speechoutput$ + minutes$ + " minutes"
            IF VAL(seconds$) THEN speechoutput$ = speechoutput$ + seconds$ + " seconds"
            speechoutput$ = speechoutput$ + " until " + events$(eventchecknum, 1)
            speechprint$ = speechoutput$
            GOSUB textprint
            GOSUB speechoutput
        END IF
        usercommands = -1
        EXIT DO
    LOOP
END IF