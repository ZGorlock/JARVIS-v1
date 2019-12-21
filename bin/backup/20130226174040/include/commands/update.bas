IF usercommand$(runcommands) = "update" OR usercommand$(runcommands) = "updates" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "check" OR usercommand$(runcommands2) = "checking" THEN
                updatecall = 1
                GOSUB updatecheck
                updatecall = 0
                SELECT CASE updateresponse
                    CASE 0
                        speechoutput$ = "There is currently no available updates"
                    CASE 1
                        speechoutput$ = "There is an update available, would you like to download it?"
                        yndlud = 1
                END SELECT
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
            END IF
            IF usercommand$(runcommands2) = "off" OR usercommand$(runcommands2) = "disable" OR usercommand$(runcommands2) = "disabled" THEN
                speechoutput$ = "Update checking has been disabled"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                updatecheck = 0
                usercommands = -1
            END IF
            IF usercommand$(runcommands2) = "on" OR usercommand$(runcommands2) = "enable" OR usercommand$(runcommands2) = "enabled" THEN
                speechoutput$ = "Update checking has been enabled"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                updatecheck = 1
                usercommands = -1
            END IF
            IF usercommand$(runcommands2) = "toggle" THEN
                SELECT CASE updatecheck
                    CASE 0
                        updatecheck = 1
                        speechoutput$ = "Update checking has been enabled"
                    CASE 1
                        updatecheck = 0
                        speechoutput$ = "Update checking has been disabled"
                END SELECT
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
            END IF
            IF usercommand$(runcommands2) = "version" OR usercommand$(runcommands2) = "versions" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands3) = "erase" OR usercommand$(runcommands3) = "erased" OR usercommand$(runcommands3) = "clear" OR usercommand$(runcommands3) = "cleared" THEN
                            speechoutput$ = "Version update restrictions for" + STR$(skipversion#) + "have been cleared"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            skipversion# = 0
                            usercommands = -1
                        END IF
                    NEXT runcommands3
                    speechoutput$ = "Version update restrictions in place for version" + STR$(skipversion#)
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    usercommands = -1
                    EXIT DO
                LOOP
            END IF
            IF usercommand$(runcommands2) = "program" OR usercommand$(runcommands2) = "programs" THEN
                speechoutput$ = "updating program list, this may take a while"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                SHELL _HIDE "dir " + CHR$(34) + programdir$ + CHR$(34) + " /b /s > " + CHR$(34) + "C:\dirload.txt" + CHR$(34)
                REDIM dirload$(4194304)
                dirload = 0
                OPEN "C:\dirload.txt" FOR INPUT AS #1
                DO
                    dirload = dirload + 1
                    LINE INPUT #1, dirload$(dirload)
                LOOP UNTIL EOF(1) = -1
                CLOSE #1
                KILL "C:\dirload.txt"
                REDIM _PRESERVE dirload$(dirload)
                REDIM proglnk$(32768)
                REDIM progname$(32768)
                proglnk$(1) = "{}"
                progname$(1) = "{}"
                proglnk = 0
                FOR proglnks = 1 TO dirload
                    IF UCASE$(RIGHT$(dirload$(proglnks), 3)) = "LNK" THEN
                        programlnkload = programlnkload + 1
                        programnameload = programnameload + 1
                        proglnk$(programlnkload) = dirload$(proglnks)
                        DO
                            FOR getprogname = (LEN(dirload$(proglnks)) - 4) TO 1 STEP -1
                                getprogname$ = MID$(dirload$(proglnks), getprogname)
                                IF LEFT$(getprogname$, 1) = "\" THEN
                                    progname$(programnameload) = MID$(getprogname$, 2, (LEN(getprogname$) - 5))
                                    EXIT DO
                                END IF
                            NEXT getprogname
                            EXIT DO
                        LOOP
                    END IF
                NEXT proglnks
                FOR programdel = 2 TO (programlnkload - 1)
                    IF proglnk$(programdel) = proglnk$(programdel - 1) OR proglnk$(programdel) = proglnk$(programdel + 1) THEN proglnk$(programdel) = ""
                NEXT programdel
                FOR programrep = 1 TO programlnkload
                    IF proglnk$(programrep) = "" THEN
                        FOR programreps = programrep TO programlnkload
                            proglnk$(programreps) = proglnk$(programreps + 1)
                        NEXT programreps
                    END IF
                    IF progname$(programrep) = "" THEN
                        FOR programreps = programrep TO programlnkload
                            progname$(programreps) = progname$(programreps + 1)
                        NEXT programreps
                    END IF
                NEXT programrep
                speechoutput$ = "done"
                GOSUB speechoutput
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "music" THEN
                speechoutput$ = "updating music list, this may take a while"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                IF musicdir$ = CHR$(48) THEN
                    OPEN "C:\allmusic.bat" FOR OUTPUT AS #2
                    FOR drive = 1 TO 26
                        PRINT #2, "cmd /c dir " + CHR$(64 + drive) + ":\ /b /s >> C:\dirload.txt"
                    NEXT drive
                    PRINT #2, "del /q C:\allmusic.bat"
                    CLOSE #2
                    SHELL _HIDE "C:\allmusic.bat"
                ELSE
                    SHELL _HIDE "dir " + CHR$(34) + musicdir$ + CHR$(34) + " /b /s > " + CHR$(34) + "C:\dirload.txt" + CHR$(34)
                END IF
                REDIM dirload$(4194304)
                dirload = 0
                OPEN "C:\dirload.txt" FOR INPUT AS #1
                DO
                    dirload = dirload + 1
                    LINE INPUT #1, dirload$(dirload)
                LOOP UNTIL EOF(1) = -1
                CLOSE #1
                REDIM _PRESERVE dirload$(dirload)
                KILL "C:\dirload.txt"
                REDIM musiclnk$(32768)
                musiclnk$(1) = "{}"
                musiclnk = 0
                FOR musiclnks = 1 TO dirload
                    IF UCASE$(RIGHT$(dirload$(musiclnks), 3)) = "MP3" THEN
                        musiclnkload = musiclnkload + 1
                        musicnameload = musicnameload + 1
                        musiclnk$(musiclnkload) = dirload$(musiclnks)
                    END IF
                NEXT musiclnks
                FOR musicrep = 1 TO musiclnkload
                    IF musiclnk$(musicrep) = "" THEN
                        FOR musicreps = musicrep TO musiclnkload
                            musiclnk$(musicreps) = musiclnk$(musicreps + 1)
                        NEXT musicreps
                    END IF
                NEXT musicrep
                speechoutput$ = "done"
                GOSUB speechoutput
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "location" THEN
                speechoutput$ = "updating location"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _HIDE "cd > temp\jarvisloc.tmp"
                OPEN "temp\jarvisloc.tmp" FOR INPUT AS #1
                INPUT #1, jarvisloc$
                CLOSE #1
                KILL "temp\jarvisloc.tmp"
                OPEN "C:\WINDOWS\jarvisloc.jdf" FOR OUTPUT AS #1
                PRINT #1, jarvisloc$
                CLOSE #1
                usercommands = -1
            END IF
        NEXT runcommands2
        updatecall = 1
        GOSUB updatecheck
        updatecall = 0
        SELECT CASE updateresponse
            CASE 0
                speechoutput$ = "There is currently no available updates"
            CASE 1
                speechoutput$ = "There is an update available, would you like to download it?"
                yndlud = 1
        END SELECT
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF
