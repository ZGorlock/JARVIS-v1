IF usercommand$(runcommands) = "shark" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "week" THEN
                speechoutput$ = "one moment"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _HIDE "resources\wget http://sharkweekcountdown.com/ -O temp\sharkweekcd.htm"
                REDIM swcd$(1024)
                OPEN "temp\sharkweekcd.htm" FOR INPUT AS #1
                DO
                    swcd = swcd + 1
                    LINE INPUT #1, swcd$(swcd)
                LOOP UNTIL EOF(1) = -1
                CLOSE #1
                KILL "temp\sharkweekcd.htm"
                FOR swfd = 1 TO swcd
                    IF INSTR(swcd$(swfd), "sharkweek=new Date(") THEN
                        swfd$ = MID$(swcd$(swfd), (INSTR(swcd$(swfd), "sharkweek=new Date(") + 19), ((INSTR((INSTR(swcd$(swfd), "sharkweek=new Date(") + 19), swcd$(swfd), ")")) - (INSTR(swcd$(swfd), "sharkweek=new Date(") + 19)))
                    END IF
                NEXT swfd
                REDIM cloc(8)
                DO
                    cloc = cloc + 1
                    cloc(cloc) = INSTR((cloc(cloc - 1) + 1), swfd$, ",")
                LOOP UNTIL cloc(cloc) = 0
                cloc = cloc - 1
                year2 = VAL(LEFT$(swfd$, 4))
                month2 = VAL(MID$(swfd$, (cloc(1) + 1), (cloc(2) - (cloc(1) + 1)))) + 1
                IF cloc(3) THEN
                    day2 = VAL(MID$(swfd$, (cloc(2) + 1), (cloc(3) - (cloc(2) + 1)))) + 1
                    IF cloc(4) THEN
                        hour2 = VAL(MID$(swfd$, (cloc(3) + 1), (cloc(4) - (cloc(3) + 1))))
                        IF cloc(5) THEN
                            minute2 = VAL(MID$(swfd$, (cloc(4) + 1), (cloc(5) - (cloc(4) + 1))))
                            second2 = VAL(MID$(swfd$, (cloc(5) + 1)))
                        ELSE
                            minute2 = VAL(MID$(swfd$, (cloc(4) + 1)))
                            second2 = 0
                        END IF
                    ELSE
                        hour2 = VAL(MID$(swfd$, (cloc(3) + 1)))
                        minute2 = 0
                        second2 = 0
                    END IF
                ELSE
                    day2 = VAL(MID$(swfd$, (cloc(2) + 1))) + 1
                    hour2 = 0
                    minute2 = 0
                    second2 = 0
                END IF
                year1 = VAL(RIGHT$(DATE$, 4))
                month1 = VAL(LEFT$(DATE$, 2))
                day1 = VAL(MID$(DATE$, 4, 2))
                hour1 = VAL(LEFT$(TIME$, 2))
                minute1 = VAL(MID$(TIME$, 4, 2))
                second1 = VAL(RIGHT$(TIME$, 2))
                secdif&& = timebetween&&(year1, month1, day1, hour1, minute1, second1, year2, month2, day2, hour2, minute2, second2)
                IF secdif&& > 0 THEN
                    days$ = STR$(INT((secdif&& / 86400)))
                    hours$ = STR$(INT(((secdif&& - (VAL(days$) * 86400)) / 3600)))
                    minutes$ = STR$(INT(((secdif&& - ((VAL(days$) * 86400) + (VAL(hours$) * 3600))) / 60)))
                    seconds$ = STR$(INT(((secdif&& - ((VAL(days$) * 86400) + (VAL(hours$) * 3600) + (VAL(minutes$) * 60))))))
                    speechoutput$ = "there are"
                    IF VAL(days$) THEN speechoutput$ = speechoutput$ + days$ + " days"
                    IF VAL(hours$) THEN speechoutput$ = speechoutput$ + hours$ + " hours"
                    IF VAL(minutes$) THEN speechoutput$ = speechoutput$ + minutes$ + " minutes"
                    IF VAL(seconds$) THEN speechoutput$ = speechoutput$ + seconds$ + " seconds"
                    speechoutput$ = speechoutput$ + " until Shark Week!"
                ELSE
                    speechoutput$ = "it is Shark Week!"
                END IF
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
