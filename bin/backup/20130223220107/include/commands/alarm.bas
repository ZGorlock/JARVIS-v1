IF usercommand$(runcommands) = "alarm" OR usercommand$(runcommands) = "alarms" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "change" OR usercommand$(runcommands2) = "sound" THEN
                DO
                    request$ = "Enter the full location of the new alarm sound" + CHR$(13) + "ex/ 'C:\Documents and Settings\Owner\My Documents\alarm.mp3'"
                    PRINT #jarvisboard, request$
                    speechoutput$ = "Enter the the full location of the new alarm sound into the box, the file can be any of the following formats: mp3, ogg, wav, mod, voc, aif, or rif, if you enter '0' then the default alarm will be used, when you are done press Enter, if the box is empty the query will be discarded."
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    usercommands = -1
                    DO
                        _LIMIT 1
                        INPUT #jarvisboard, response$
                    LOOP UNTIL response$ <> ""
                    IF response$ <> CHR$(255) AND response$ <> CHR$(48) THEN
                        SHELL _HIDE "copy /y " + response$ + " resources\alarm." + RIGHT$(response$, 3)
                        alarm = _SNDOPEN("resources\alarm." + RIGHT$(response$, 3))
                    ELSE
                        IF response$ = CHR$(48) THEN
                            SHELL _HIDE "del /f /q resources\alarm.*"
                            alarm = 0
                        ELSE
                            EXIT DO
                        END IF
                    END IF
                    speechoutput$ = "new alarm sound has been added"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    usercommands = -1
                    EXIT DO
                LOOP
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "add" OR usercommand$(runcommands2) = "new" THEN
                speechoutput$ = "these are your set alarms, move using the arrow keys, press insert to add a new alarm, press escape to exit, I will be suspended until you close the alarm program"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                iniloc$ = "data\jarvis.ini"
                GOSUB updateini
                SHELL _DONTWAIT _HIDE "start tools\alarms.exe"
                DO
                    _LIMIT 1
                    alarms = _OPENCONNECTION(jarvishost)
                LOOP UNTIL alarms < 0
                DO
                    _LIMIT 1
                    INPUT #alarms, response$
                LOOP UNTIL response$ = "complete"
                CLOSE #alarms
                GOSUB getalarms
                speechoutput$ = "your alarms have been updated"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "delete" OR usercommand$(runcommands2) = "remove" THEN
                speechoutput$ = "these are your set alarms, move using the arrow keys, press delete to remove an alarm, press escape to exit, I will be suspended until you close the alarm program"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                iniloc$ = "data\jarvis.ini"
                GOSUB updateini
                SHELL _DONTWAIT _HIDE "start tools\alarms.exe"
                DO
                    _LIMIT 1
                    alarms = _OPENCONNECTION(jarvishost)
                LOOP UNTIL alarms < 0
                DO
                    _LIMIT 1
                    INPUT #alarms, response$
                LOOP UNTIL response$ = "complete"
                CLOSE #alarms
                GOSUB getalarms
                speechoutput$ = "your alarms have been updated"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        speechoutput$ = "these are your set alarms, move using the arrow keys, press delete to remove an alarm and insert to add a new one, press escape to exit, I will be suspended until you close the alarm program"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        iniloc$ = "data\jarvis.ini"
        GOSUB updateini
        SHELL _DONTWAIT _HIDE "start tools\alarms.exe"
        DO
            _LIMIT 1
            alarms = _OPENCONNECTION(jarvishost)
        LOOP UNTIL alarms < 0
        DO
            _LIMIT 1
            INPUT #alarms, response$
        LOOP UNTIL response$ = "complete"
        CLOSE #alarms
        GOSUB getalarms
        speechoutput$ = "your alarms have been updated"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF
