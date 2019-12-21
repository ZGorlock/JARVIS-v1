IF usercommand$(runcommands) = "screen" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "shot" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands3) = "open" OR usercommand$(runcommands3) = "explore" THEN
                            speechoutput$ = "opening screen shot folder"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            SHELL _DONTWAIT "explorer /n, /select, " + CHR$(34) + ssloc$ + lastss$ + CHR$(34) + ""
                            usercommands = -1
                            EXIT DO
                        END IF
                        IF usercommand$(runcommands3) = "set" THEN
                            request$ = "Enter the full path location to save your screenshots" + CHR$(13) + "ex/ 'C:\Documents and Settings\Owner\Desktop\Screenshots\'"
                            PRINT #jarvisboard, request$
                            speechoutput$ = "Enter the location into the box, when you are done press Enter, if the box is empty the query will be discarded"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            usercommands = -1
                            DO
                                _LIMIT 1
                                INPUT #jarvisboard, response$
                            LOOP UNTIL response$ <> ""
                            IF response$ <> CHR$(255) THEN ssloc$ = response$
                            EXIT DO
                        END IF
                    NEXT runcommands3
                    stampmonth$ = LEFT$(DATE$, 2)
                    stampday$ = MID$(DATE$, 4, 2)
                    stampyear$ = RIGHT$(DATE$, 4)
                    stamphour$ = LEFT$(TIME$, 2)
                    stampminute$ = MID$(TIME$, 4, 2)
                    stampsecond$ = RIGHT$(TIME$, 2)
                    timestamp$ = stampyear$ + stampmonth$ + stampday$ + stamphour$ + stampminute$ + stampsecond$
                    ssnamer$ = ssloc$ + timestamp$
                    ssname$ = ssloc$ + timestamp$ + ssfile$
                    IF _FILEEXISTS(ssname$) = -1 THEN
                        ssname = 0
                        DO
                            newnamer$ = ssame$ + "_" + LTRIM$(STR$(ssname))
                            ssname = ssname + 1
                        LOOP UNTIL _FILEEXISTS(newname$) = 0
                        ssname$ = newname$ + ssfile$
                        lastss$ = ssname$
                    END IF
                    speechoutput$ = "screen shot"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    SHELL _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " savescreenshot " + CHR$(34) + ssname$ + CHR$(34)
                    usercommands = -1
                    EXIT DO
                LOOP
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "saver" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands3) = "on" OR usercommand$(runcommands3) = "start" THEN
                            speechoutput$ = "starting screensaver"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " screensaver"
                            usercommands = -1
                            EXIT DO
                        END IF
                        IF usercommand$(runcommands3) = "enable" OR usercommand$(runcommands3) = "enabled" THEN
                            speechoutput$ = "screensaver enabled"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " regsetval sz " + CHR$(34) + "HKCU\control panel\desktop" + CHR$(34) + " " + CHR$(34) + "ScreenSaveActive" + CHR$(34) + " 1"
                            usercommands = -1
                            EXIT DO
                        END IF
                        IF usercommand$(runcommands3) = "disable" OR usercommand$(runcommands3) = "disabled" THEN
                            speechoutput$ = "screensaver disabled"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " regsetval sz " + CHR$(34) + "HKCU\control panel\desktop" + CHR$(34) + " " + CHR$(34) + "ScreenSaveActive" + CHR$(34) + " 0"
                            usercommands = -1
                            EXIT DO
                        END IF
                    NEXT runcommands3
                    speechoutput$ = "starting screensaver"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " screensaver"
                    usercommands = -1
                    EXIT DO
                LOOP
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
