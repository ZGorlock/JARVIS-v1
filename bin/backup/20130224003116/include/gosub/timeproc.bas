timeproc:
IF oldtime$ <> TIME$ THEN
    jarvistimer&& = jarvistimer&& + 1
    DO
    LOOP WHILE TIMER < 1
    nowmonth = VAL(LEFT$(DATE$, 2))
    nowday = VAL(MID$(DATE$, 4, 2))
    nowyear = VAL(RIGHT$(DATE$, 4))
    nowhour = VAL(LEFT$(TIME$, 2))
    nowminute = VAL(MID$(TIME$, 4, 2))
    nowsecond = VAL(RIGHT$(TIME$, 2))
    timestamp$ = RIGHT$(DATE$, 4) + LEFT$(DATE$, 2) + MID$(DATE$, 4, 2) + LEFT$(TIME$, 2) + MID$(TIME$, 4, 2) + RIGHT$(TIME$, 2)
    elapse## = 0
    FOR years = (bootyear + 1) TO (nowyear - 1)
        isleap = (years MOD 4 = 0 AND years MOD 100 <> 0) OR years MOD 400 = 0
        elapse## = elapse## + (86400 * (365 - isleap))
    NEXT
    IF bootyear <> nowyear THEN
        FOR bootmonths = (bootmonth + 1) TO 12
            SELECT CASE bootmonths
                CASE 2
                    isleap = (bootyear MOD 4 = 0 AND bootyear MOD 100 <> 0) OR bootyear MOD 400 = 0
                    daysinmonth = 29 - isleap
                CASE 4, 6, 9, 11
                    daysinmonth = 30
                CASE ELSE
                    daysinmonth = 31
            END SELECT
            elapse## = elapse## + (86400 * daysinmonth)
        NEXT bootmonths
        FOR nowmonths = 1 TO (nowmonth - 1)
            SELECT CASE nowmonths
                CASE 2
                    isleap = (nowyear MOD 4 = 0 AND nowyear MOD 100 <> 0) OR nowyear MOD 400 = 0
                    daysinmonth = 29 - isleap
                CASE 4, 6, 9, 11
                    daysinmonth = 30
                CASE ELSE
                    daysinmonth = 31
            END SELECT
            elapse## = elapse## + (86400 * daysinmonth)
        NEXT nowmonths
        SELECT CASE bootmonth
            CASE 2
                isleap = (bootyear MOD 4 = 0 AND bootyear MOD 100 <> 0) OR bootyear MOD 400 = 0
                daysinmonth = 29 - isleap
            CASE 4, 6, 9, 11
                daysinmonth = 30
            CASE ELSE
                daysinmonth = 31
        END SELECT
        elapse## = elapse## + ((daysinmonth - bootday) * 86400)
        elapse## = elapse## + ((nowday - 1) * 86400)
    END IF
    IF bootyear = nowyear AND bootmonth <> nowmonth THEN
        FOR months = (bootmonth + 1) TO (nowmonth - 1)
            SELECT CASE month
                CASE 2
                    isleap = (bootyear MOD 4 = 0 AND bootyear MOD 100 <> 0) OR bootyear MOD 400 = 0
                    daysinmonth = 29 - isleap
                CASE 4, 6, 9, 11
                    daysinmonth = 30
                CASE ELSE
                    daysinmonth = 31
            END SELECT
            elapse## = elapse## + (86400 * daysinmonth)
        NEXT months
        SELECT CASE bootmonth
            CASE 2
                isleap = (bootyear MOD 4 = 0 AND bootyear MOD 100 <> 0) OR bootyear MOD 400 = 0
                daysinmonth = 29 - isleap
            CASE 4, 6, 9, 11
                daysinmonth = 30
            CASE ELSE
                daysinmonth = 31
        END SELECT
        elapse## = elapse## + ((daysinmonth - bootday) * 86400)
        elapse## = elapse## + ((nowday - 1) * 86400)
        elapse## = elapse## + (24 - 1 - boothour) * 3600
        elapse## = elapse## + (nowhour * 3600)
        elapse## = elapse## + (60 - 1 - bootminute) * 60
        elapse## = elapse## + (nowminute * 60)
        elapse## = elapse## + 60 - bootsecond
        elapse## = elapse## + nowsecond
    END IF
    IF bootyear = nowyear AND bootmonth = nowmonth AND bootday <> nowday THEN
        elapse## = elapse## + ((nowday - (bootday + 1)) * 86400)
        elapse## = elapse## + (24 - 1 - boothour) * 3600
        elapse## = elapse## + (nowhour * 3600)
        elapse## = elapse## + (60 - 1 - bootminute) * 60
        elapse## = elapse## + (nowminute * 60)
        elapse## = elapse## + 60 - bootsecond
        elapse## = elapse## + nowsecond
    END IF
    IF bootyear = nowyear AND bootmonth = nowmonth AND bootday = nowday AND boothour <> nowhour THEN
        elapse## = elapse## + (nowhour - 1 - boothour) * 3600
        elapse## = elapse## + (60 - 1 - bootminute) * 60
        elapse## = elapse## + (nowminute * 60)
        elapse## = elapse## + 60 - bootsecond
        elapse## = elapse## + nowsecond
    END IF
    IF bootyear = nowyear AND bootmonth = nowmonth AND bootday = nowday AND boothour = nowhour AND bootminute <> nowminute THEN
        elapse## = elapse## + (nowminute - 1 - bootminute) * 60
        elapse## = elapse## + 60 - bootsecond
        elapse## = elapse## + nowsecond
    END IF
    IF bootyear = nowyear AND bootmonth = nowmonth AND bootday = nowday AND boothour = nowhour AND bootminute = nowminute THEN elapse## = elapse## + nowsecond - bootsecond
    IF elapse## MOD 3600 = 0 THEN
        elapsehours = elapse## / 3600
        _SNDPLAY tone1
        _DELAY .3
        IF alertpref = 1 THEN
            speechoutput$ = "your computer has been on for" + STR$(elapsehours) + " hours, " + username$
        ELSE
            speechoutput$ = ""
        END IF
        speechprint$ = "your computer has been on for" + STR$(elapsehours) + " hours, " + username$
        GOSUB textprint
        GOSUB speechoutput
    END IF
    IF VAL(alarms$(2)) <= VAL(timestamp$) AND alertpref = 1 THEN
        IF VAL(timestamp$) - VAL(alarms$(2)) <= 100 THEN
            IF alarm <> 0 THEN
                _SNDLOOP alarm
            ELSE
                _SNDLOOP defaultalarm
            END IF
            DO
                _LIMIT 64
                k$ = INKEY$
            LOOP UNTIL k$ = CHR$(32)
            IF alarm <> 0 THEN
                _SNDSTOP alarm
            ELSE
                _SNDSTOP defaultalarm
            END IF
        END IF
        alarms$(2) = ""
        IF alarms >= 3 THEN
            FOR alarmmove = 3 TO alarms
                alarms$(alarmmove - 1) = alarms$(alarmmove)
            NEXT alarmmove
            alarms$(alarms) = ""
            alarms = alarms - 1
        END IF
    END IF
    FOR timercheck = 1 TO timers
        IF VAL(timers$(timercheck)) <= jarvistimer&& AND VAL(timers$(timercheck)) <> 0 THEN
            _SNDPLAY tone2
            _DELAY .3
            IF alertpref = 1 THEN
                speechoutput$ = "it has been " + timersay$(timercheck) + " " + username$
            ELSE
                speechoutput$ = ""
            END IF
            speechprint$ = "it has been " + timersay$(timercheck) + " " + username$
            GOSUB textprint
            GOSUB speechoutput
            timers$(timercheck) = ""
            timersay$(timercheck) = ""
            FOR timermove = timercheck TO (timers + 1)
                timers$(timermove) = timers$(timermove + 1)
                timersay$(timermove) = timersay$(timermove + 1)
            NEXT timermove
            timers = timers - 1
        END IF
    NEXT timercheck
    IF INT(TIMER) >= avgclosetime AND starttime < avgclosetime AND closeprompt = 0 THEN
        closeprompt = 1
        IF alertpref = 1 THEN
            speechoutput$ = "this is about the time you usually close me"
        ELSE
            speechoutput$ = ""
        END IF
        speechprint$ = "this is about the time you usually close me"
        GOSUB textprint
        GOSUB speechoutput
    END IF
END IF
IF nowyear <> saveyear THEN
    IF saveyear THEN
        speechoutput$ = "happy new year! it is now the year " + TRIM$(STR$(nowyear))
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
    END IF
    _DELAY 2
    speechoutput$ = "updating event database, this may take a while"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    REDIM eventindex(1024)
    REDIM events$(1024, 3)
    eventindex = 0
    getevent = 1
    year = VAL(RIGHT$(DATE$, 4))
    FOR eventyear = year TO (year + 1)
        SHELL _HIDE LocWget + " http://www.timeanddate.com/calendar/custom.html?year=" + RTRIM$(LTRIM$(STR$(eventyear))) + "&country=1&holm=1&df=1&hol=8519551 -O temp\events.htm"
        OPEN "temp\events.htm" FOR INPUT AS #1
        REDIM readevent$(128)
        readevent = 0
        DO
            readevent = readevent + 1
            LINE INPUT #1, readevent$(readevent)
        LOOP UNTIL EOF(1) = -1
        CLOSE #1
        FOR findevent = 1 TO readevent
            IF LEFT$(readevent$(findevent), 16) = "<div id=calarea>" THEN
                readevent$(findevent) = RemContainer$(readevent$(findevent), "(", ")")
                FOR foundevent = 1 TO LEN(readevent$(findevent))
                    IF MonthToNum(LEFT$(MID$(readevent$(findevent), foundevent, 5), 3)) > 0 AND VAL(RIGHT$(MID$(readevent$(findevent), foundevent, 5), 1)) > 0 AND MID$(readevent$(findevent), (foundevent - 1), 1) = ">" THEN
                        eventindex(eventindex) = foundevent
                        eventindex = eventindex + 1
                    END IF
                NEXT foundevent
                eventindex(eventindex) = LEN(readevent$(findevent))
                EXIT FOR
            END IF
        NEXT findevent
        FOR getevent = getevent TO eventindex
            events$(getevent, 1) = MID$(readevent$(findevent), eventindex(getevent - 1), (eventindex(getevent) - eventindex(getevent - 1)))
            storedate$ = LEFT$(events$(getevent, 1), (INSTR(events$(getevent, 1), "<") - 1))
            eventmonth$ = LTRIM$(STR$(MonthToNum(LEFT$(storedate$, 3))))
            IF LEN(eventmonth$) = 1 THEN eventmonth$ = "0" + eventmonth$
            eventday$ = LTRIM$(RIGHT$(storedate$, 2))
            IF LEN(eventday$) = 1 THEN eventday$ = "0" + eventday$
            eventdate$ = eventmonth$ + "-" + eventday$ + "-" + LTRIM$(STR$(eventyear))
            IF INSTR(events$(getevent, 1), "<a ") THEN
                event$ = HTMLConvResChar$(MID$(events$(getevent, 1), (INSTR(INSTR(events$(getevent, 1), "<a "), events$(getevent, 1), ">") + 1), (INSTR((INSTR(INSTR(events$(getevent, 1), "<a "), events$(getevent, 1), ">") + 1), events$(getevent, 1), "<") - (INSTR(INSTR(events$(getevent, 1), "<a "), events$(getevent, 1), ">") + 1))))
                IF INSTR(INSTR(events$(getevent, 1), "<a "), events$(getevent, 1), " title=") THEN
                    description$ = HTMLConvResChar$(MID$(events$(getevent, 1), (INSTR(INSTR(events$(getevent, 1), "<a "), events$(getevent, 1), " title=") + 8), (INSTR((INSTR(INSTR(events$(getevent, 1), "<a "), events$(getevent, 1), " title=") + 8), events$(getevent, 1), CHR$(34)) - (INSTR(INSTR(events$(getevent, 1), "<a "), events$(getevent, 1), " title=") + 8))))
                ELSE
                    description$ = ""
                END IF
            ELSE
                event$ = HTMLConvResChar$(MID$(events$(getevent, 1), (INSTR(events$(getevent, 1), "<td>") + 4), (INSTR((INSTR(events$(getevent, 1), "<td>") + 4), events$(getevent, 1), "</td>") - (INSTR(events$(getevent, 1), "<td>") + 4))))
                description$ = ""
            END IF
            events$(getevent, 1) = event$
            events$(getevent, 2) = eventdate$
            events$(getevent, 3) = description$
        NEXT getevent
    NEXT eventyear
    SHELL _DONTWAIT _HIDE "del /q temp\event.htm"
    eventnum = getevent
    eventdb$ = ""
    OPEN "resources\db\event.jdb" FOR OUTPUT AS #1
    FOR row = 1 TO getevent
        FOR column = 1 TO 3
            eventdb$ = eventdb$ + events$(row, column) + CHR$(10)
    NEXT column, row
    eventdb$ = LEFT$(eventdb$, (LEN(eventdb$) - 1))
    PRINT #1, eventdb$
    CLOSE #1
    speechoutput$ = "done"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    saveyear = nowyear
END IF
IF (jarvistimer&& - activetimer&&) = 600 AND ooia = 1 THEN
    ooia = 0
    _SNDPLAY tone1
    _DELAY .3
    IF alertpref = 1 THEN
        speechoutput$ = "your computer has been inactive for 10 minutes, " + username$
    ELSE
        speechoutput$ = ""
    END IF
    speechprint$ = "your computer has been inactive for 10 minutes, " + username$
    GOSUB textprint
    GOSUB speechoutput
END IF
IF (jarvistimer&& - activetimer&&) = 601 THEN ooia = 1
IF (jarvistimer&& - activetimer&&) = 1800 AND ooia = 1 THEN
    ooia = 0
    _SNDPLAY tone1
    _DELAY .3
    IF alertpref = 1 THEN
        speechoutput$ = "your computer has been inactive for 30 minutes, " + username$
    ELSE
        speechoutput$ = ""
    END IF
    speechprint$ = "your computer has been inactive for 30 minutes, " + username$
    GOSUB textprint
    GOSUB speechoutput
END IF
IF (jarvistimer&& - activetimer&&) = 1801 THEN ooia = 1
IF (jarvistimer&& - activetimer&&) MOD 3600 = 0 AND activetimer&& <> jarvistimer&& AND ooia = 1 THEN
    ooia = 0
    inactivehour = (jarvistimer&& - activetimer&&) / 3600
    _SNDPLAY tone1
    _DELAY .3
    IF alertpref = 1 THEN
        speechoutput$ = "your computer has been inactive for" + STR$(inactivehour) + " hours, " + username$
    ELSE
        speechoutput$ = ""
    END IF
    speechprint$ = "your computer has been inactive for" + STR$(inactivehour) + " hours, " + username$
    GOSUB textprint
    GOSUB speechoutput
END IF
IF (jarvistimer&& - activetimer&&) MOD 3600 = 1 AND activetimer&& <> jarvistimer&& THEN ooia = 1
IF nowminute = 0 AND nowsecond = 0 AND oncetime = 0 THEN
    _SNDPLAY tone1
    _DELAY .3
    oncetime = 1
    RANDOMIZE TIMER
    survey = INT(RND * 240)
    IF survey = 0 THEN
        IF alertpref = 1 THEN
            speechoutput$ = "please take a minute to fill out a satisfaction report"
        ELSE
            speechoutput$ = ""
        END IF
        speechprint$ = "please take a minute to fill out a satisfaction report"
        GOSUB textprint
        GOSUB speechoutput
        SHELL _DONTWAIT _HIDE "start tools\report.exe"
    ELSE
        hours$ = LEFT$(TIME$, 2)
        hours = VAL(hours$)
        IF timepref = 1 THEN
            daytime$ = "AM"
            IF hours > 12 THEN
                hours = hours - 12
                daytime$ = "PM"
            END IF
            IF hours = 12 THEN daytime$ = "PM"
            IF hours = 0 THEN
                hours = 12
            END IF
        END IF
        IF timepref = 1 THEN
            hourmark$ = LTRIM$(STR$(hours)) + " o'clock " + daytime$ + " " + username$
            speechprint$ = "it is " + hourmark$
        ELSE
            hourmark$ = hours$ + " hundred hours, " + username$
            speechprint$ = "it is " + hours$ + "00 hours, " + username$
        END IF
        IF alertpref = 1 THEN
            speechoutput$ = "it is " + hourmark$
        ELSE
            speechoutput$ = ""
        END IF
        speechprint$ = "it is " + hourmark$
        GOSUB textprint
        GOSUB speechoutput
    END IF
END IF
IF nowhour = 0 AND nowminute = 0 AND nowsecond = 0 AND oncetime = 0 AND updatecheck = 1 THEN GOSUB updatecheck
IF nowminute > 0 AND nowsecond > 0 THEN oncetime = 0
oldtime$ = TIME$
RETURN