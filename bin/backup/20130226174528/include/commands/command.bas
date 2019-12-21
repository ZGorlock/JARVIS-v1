IF usercommand$(runcommands) = "command" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "new" THEN
                request$ = "Enter the name of the new command (no spaces)" + CHR$(13) + "ex/ 'New_Command'"
                PRINT #jarvisboard, request$
                speechoutput$ = "Enter the the name of the new command into the box, make sure there are no spaces, when you are done press Enter, if the box is empty the query will be discarded."
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                DO
                    _LIMIT 1
                    INPUT #jarvisboard, response$
                LOOP UNTIL response$ <> ""
                IF response$ <> CHR$(255) THEN
                    newcmdfile$ = "customcmd\" + response$ + ".txt"
                    IF _FILEEXISTS(newcmdfile$) = -1 THEN
                        DO
                            request$ = "Would you like to overwrite this command? (y/n)"
                            PRINT #jarvisboard, request$
                            speechoutput$ = "It looks like there is already a command file with this name, are you sure you want to overwrite the old file, yes or no, if you submit a blank query you will be asked again."
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            usercommands = -1
                            response$ = ""
                            DO
                                _LIMIT 1
                                INPUT #jarvisboard, response$
                            LOOP UNTIL response$ <> ""
                            IF response$ <> CHR$(255) THEN
                                IF response$ = CHR$(89) OR response$ = CHR$(121) OR response$ = CHR$(78) OR response$ = CHR$(110) THEN
                                    IF response$ = CHR$(89) OR response$ = CHR$(121) THEN
                                        dooverwrite = 1
                                    END IF
                                    IF response$ = CHR$(78) OR response$ = CHR$(110) THEN
                                        dooverwrite = 0
                                    END IF
                                    EXIT DO
                                END IF
                            END IF
                        LOOP
                    END IF
                    IF _FILEEXISTS(newcmdfile$) = 0 OR dooverwrite = 1 THEN
                        OPEN newcmdfile$ FOR OUTPUT AS #1
                        CLOSE #1
                        SHELL _DONTWAIT _HIDE "start /MAX " + newcmdfile$
                        DO
                            FOR d = 1 TO 50
                                s = _SCREENIMAGE
                                _SOURCE s
                                z = 0
                                FOR y = 0 TO _HEIGHT(s) - 1
                                    FOR x = 0 TO _WIDTH(s) - 1
                                        c = POINT(x, y)
                                        IF c = _RGB32(255, 255, 255) THEN z = z + 1
                                    NEXT
                                NEXT
                                IF z / (_HEIGHT(s) * _WIDTH(s)) > 0.8 THEN EXIT DO
                                _FREEIMAGE s
                                _DELAY .1
                            NEXT d
                            EXIT DO
                        LOOP
                        IF d < 50 THEN _SCREENPRINT cmdbase$
                    END IF
                    EXIT DO
                END IF
            END IF
            IF usercommand$(runcommands2) = "add" OR usercommand$(runcommands2) = "load" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands3) = "new" THEN EXIT DO
                    NEXT runcommands3
                    DO
                        request$ = "Enter the name of the command file to add" + CHR$(13) + "ex/ 'New_Command.txt'"
                        PRINT #jarvisboard, request$
                        speechoutput$ = "Enter the the name of the command file to add into the box, when you are done press Enter, if the box is empty the query will be discarded."
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        response$ = ""
                        DO
                            _LIMIT 1
                            INPUT #jarvisboard, response$
                        LOOP UNTIL response$ <> ""
                        IF response$ <> CHR$(255) THEN
                            cmdname$ = response$
                            cmdname$ = "customcmd\" + cmdname$
                            OPEN cmdname$ FOR INPUT AS #1
                            LINE INPUT #1, commandwords$
                            CLOSE #1
                            commandwords$ = MID$(commandwords$, 2, (LEN(commandwords$) - 1))
                            REDIM commandwords$(32)
                            commandwords = 1
                            FOR commandseperate = 1 TO LEN(commandwords$)
                                DO
                                    commandseperate$ = MID$(commandwords$, commandseperate, 1)
                                    IF commandseperate$ = CHR$(44) THEN
                                        commandwords = commandwords + 1
                                        EXIT DO
                                    END IF
                                    commandwords$(commandwords) = commandwords$(commandwords) + commandseperate$
                                    EXIT DO
                                LOOP
                            NEXT commandseperate
                            conflict = 0
                            FOR commandlowercase = 1 TO commandwords
                                buildword$ = ""
                                FOR wordlowercase = 1 TO LEN(commandwords$(commandlowercase))
                                    letterlowercase$ = MID$(commandwords$(commandlowercase), wordlowercase, 1)
                                    IF letterlowercase$ >= CHR$(65) AND letterlowercase$ <= CHR$(90) THEN letterlowercase$ = CHR$((ASC(letterlowercase$) + 32))
                                    buildword$ = buildword$ + letterlowercase$
                                NEXT wordlowercase
                                commandwords$(commandlowercase) = buildword$
                                FOR commanddouble = 1 TO commandcount
                                    IF commandwords$(commandlowercase) = commands$(commanddouble) THEN conflict = 1
                                NEXT commanddouble
                            NEXT commandlowercase
                        ELSE
                            EXIT DO
                        END IF
                        IF conflict = 1 THEN
                            DO
                                request$ = "Would you like to add this command? (y/n)"
                                PRINT #jarvisboard, request$
                                speechoutput$ = "It looks like this command could conflict with existing commands, are you sure you want to add it, yes or no, if you submit a blank query you will be asked again."
                                speechprint$ = speechoutput$
                                GOSUB textprint
                                GOSUB speechoutput
                                usercommands = -1
                                response$ = ""
                                DO
                                    _LIMIT 1
                                    INPUT #jarvisboard, response$
                                LOOP UNTIL response$ <> ""
                                IF response$ <> CHR$(255) THEN
                                    IF response$ = CHR$(89) OR response$ = CHR$(121) OR response$ = CHR$(78) OR response$ = CHR$(110) THEN
                                        IF response$ = CHR$(89) OR response$ = CHR$(121) THEN
                                            doadd = 1
                                        END IF
                                        IF response$ = CHR$(78) OR response$ = CHR$(110) THEN
                                            doadd = 0
                                        END IF
                                        EXIT DO
                                    END IF
                                END IF
                            LOOP
                        END IF
                        IF doadd = 1 OR conflict = 0 THEN
                            includefile$ = "'$include:'..\" + cmdname$ + "'"
                            OPEN "include\customcmd.bas" FOR APPEND AS #1
                            PRINT #1, includefile$
                            CLOSE #1
                            FOR commandadd = 1 TO commandwords
                                loadcustom = loadcustom + 1
                                loadcustom$(loadcustom) = commandwords$(commandadd)
                                commandcount = commandcount + 1
                                commands$(commandcount) = commandwords$(commandadd)
                            NEXT commandadd
                        END IF
                        IF doadd = 0 AND conflict = 1 THEN EXIT DO
                        DO
                            request$ = "Would you like to add another command? (y/n)"
                            PRINT #jarvisboard, request$
                            speechoutput$ = "Would you like to add another command, yes or no, if you submit a blank query you will be asked again."
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            usercommands = -1
                            response$ = ""
                            DO
                                _LIMIT 1
                                INPUT #jarvisboard, response$
                            LOOP UNTIL response$ <> ""
                            IF response$ <> CHR$(255) THEN
                                IF response$ = CHR$(89) OR response$ = CHR$(121) OR response$ = CHR$(78) OR response$ = CHR$(110) THEN
                                    IF response$ = CHR$(89) OR response$ = CHR$(121) THEN
                                        doneadd = 0
                                    END IF
                                    IF response$ = CHR$(78) OR response$ = CHR$(110) THEN
                                        doneadd = 1
                                    END IF
                                    EXIT DO
                                END IF
                            END IF
                        LOOP
                    LOOP UNTIL doneadd = 1
                    IF response$ = CHR$(255) THEN EXIT DO
                    iniloc$ = "data\jarvis.ini"
                    GOSUB updateini
                    request$ = "terminate"
                    PRINT #jarvisboard, request$
                    _DELAY 2
                    CLOSE #jarvisboard
                    CLOSE #jarvishost
                    SHELL _HIDE "start batch\compile.bat"
                    CLEAR
                    SYSTEM
                LOOP
            END IF
            IF usercommand$(runcommands2) = "delete" OR usercommand$(runcommands2) = "remove" THEN
                DO
                    request$ = "Enter the relative name of the command file to delete" + CHR$(13) + "ex/ 'New_Command.txt'"
                    PRINT #jarvisboard, request$
                    speechoutput$ = "Enter the the name of the command file to delete into the box, when you are done press Enter, if the box is empty the query will be discarded."
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    usercommands = -1
                    response$ = ""
                    DO
                        _LIMIT 1
                        INPUT #jarvisboard, response$
                    LOOP UNTIL response$ <> ""
                    IF response$ <> CHR$(255) THEN
                        cmdname$ = response$
                        cmdname$ = "customcmd\" + cmdname$
                        OPEN cmdname$ FOR INPUT AS #1
                        LINE INPUT #1, commandwords$
                        CLOSE #1
                        commandwords$ = MID$(commandwords$, 2, (LEN(commandwords$) - 1))
                        REDIM commandwords$(32)
                        commandwords = 1
                        FOR commandseperate = 1 TO LEN(commandwords$)
                            DO
                                commandseperate$ = MID$(commandwords$, commandseperate, 1)
                                IF commandseperate$ = CHR$(44) THEN
                                    commandwords = commandwords + 1
                                    EXIT DO
                                END IF
                                commandwords$(commandwords) = commandwords$(commandwords) + commandseperate$
                                EXIT DO
                            LOOP
                        NEXT commandseperate
                        FOR commandlowercase = 1 TO commandwords
                            buildword$ = ""
                            FOR wordlowercase = 1 TO LEN(commandwords$(commandlowercase))
                                letterlowercase$ = MID$(commandwords$(commandlowercase), wordlowercase, 1)
                                IF letterlowercase$ >= CHR$(65) AND letterlowercase$ <= CHR$(90) THEN letterlowercase$ = CHR$((ASC(letterlowercase$) + 32))
                                buildword$ = buildword$ + letterlowercase$
                            NEXT wordlowercase
                            commandwords$(commandlowercase) = buildword$
                        NEXT commandlowercase
                    ELSE
                        EXIT DO
                    END IF
                    REDIM commandfiles$(256)
                    OPEN "include\customcmd.bas" FOR INPUT AS #1
                    DO
                        commandfile = commandfile + 1
                        LINE INPUT #1, commandfilespre$
                        IF MID$(commandfilespre$, 15, (LEN(commandfilespre$) - 15)) <> cmdname$ THEN commandfiles$(commandfile) = commandfilespre$
                    LOOP UNTIL EOF(1) = -1
                    CLOSE #1
                    OPEN "include\customcmd.bas" FOR OUTPUT AS #1
                    FOR customfileprint = 1 TO commandfile
                        IF commandfiles$(customfileprint) <> "" THEN PRINT #1, commandfiles$(customfileprint)
                    NEXT customfileprint
                    CLOSE #1
                    REDIM movecustom$(256)
                    keepers = 0
                    FOR remcmd = 1 TO loadcustom
                        keeper = 0
                        FOR cmdrem = 1 TO commandwords
                            IF loadcustom$(remcmd) = commandwords$(cmdrem) THEN keeper = 1
                        NEXT cmdrem
                        IF keeper = 0 THEN
                            keepers = keepers + 1
                            movecustom$(keepers) = loadcustom$(remcmd)
                        END IF
                    NEXT remcmd
                    REDIM loadcustom$(256)
                    FOR keepermove = 1 TO keepers
                        loadcustom$(keepermove) = movecustom$(keepermove)
                    NEXT keepermove
                    loadcustom = keepers
                    DO
                        request$ = "Would you like to remove another command? (y/n)"
                        PRINT #jarvisboard, request$
                        speechoutput$ = "Would you like to remove another command, yes or no, if you submit a blank query you will be asked again."
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        response$ = ""
                        DO
                            _LIMIT 1
                            INPUT #jarvisboard, response$
                        LOOP UNTIL response$ <> ""
                        IF response$ <> CHR$(255) THEN
                            IF response$ = CHR$(89) OR response$ = CHR$(121) OR response$ = CHR$(78) OR response$ = CHR$(110) THEN
                                IF response$ = CHR$(89) OR response$ = CHR$(121) THEN
                                    donerem = 0
                                END IF
                                IF response$ = CHR$(78) OR response$ = CHR$(110) THEN
                                    donerem = 1
                                END IF
                                EXIT DO
                            END IF
                        END IF
                    LOOP
                LOOP UNTIL donerem = 1
                IF response$ = CHR$(255) THEN EXIT DO
                iniloc$ = "data\jarvis.ini"
                GOSUB updateini
                request$ = "terminate"
                PRINT #jarvisboard, request$
                _DELAY 2
                CLOSE #jarvisboard
                CLOSE #jarvishost
                SHELL _HIDE "start batch\compile.bat"
                CLEAR
                SYSTEM
            END IF
            IF usercommand$(runcommands2) = "prompt" THEN
                FOR runcommands3 = 1 TO usercommands
                    IF usercommand$(runcommands3) = "close" OR usercommand$(runcommands3) = "terminate" OR usercommand$(runcommands3) = "exit" OR usercommand$(runcommands3) = "end" THEN
                        SHELL _HIDE _DONTWAIT "taskkill /IM cmd.exe /F"
                        speechoutput$ = "closing command prompt"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        EXIT DO
                    END IF
                NEXT runcommands3
                speechoutput$ = "opening command prompt"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "start cmd.exe"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
