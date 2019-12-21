IF usercommand$(runcommands) = "no" OR usercommand$(runcommands) = "nah" OR usercommand$(runcommands) = "negative" THEN
    IF ynlogclear = 1 THEN
        speechoutput$ = "the log has not been cleared"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        ynlogclear = 0
    END IF
    IF ynname = 1 THEN
        request$ = "Enter your name" + CHR$(13) + "ex/ 'John Smith'"
        PRINT #jarvisboard, request$
        speechoutput$ = "maybe you would like to type it instead, enter your name in the box, when you are done press Enter, if the box is empty the query will be discarded"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        DO
            _LIMIT 1
            INPUT #jarvisboard, response$
        LOOP UNTIL response$ <> ""
        IF response$ <> CHR$(255) THEN username$ = response$
        speechoutput$ = "i have saved your name as " + username$
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        ynname = 0
    END IF
    IF ynpackage = 1 THEN
        speechoutput$ = "packaging has been aborted"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        ynpackage = 0
    END IF
    IF ynreset = 1 THEN
        speechoutput$ = "reset has been aborted"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        ynreset = 0
    END IF
    IF ynrestart = 1 THEN
        speechoutput$ = "restart has been aborted"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        ynrestart = 0
    END IF
    IF ynsaveprofile = 1 THEN
        speechoutput$ = "uninstalling"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        iniloc$ = "data\jarvis.ini"
        GOSUB updateini
        SHELL _HIDE "copy batch\uninstall.bat C:\uninstall.bat"
        SHELL _HIDE "start C:\uninstall.bat"
        ynsaveprofile = 0
        SYSTEM
    END IF
    IF ynshutdown = 1 THEN
        speechoutput$ = "shutdown has been aborted"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        ynshutdown = 0
    END IF
    IF ynuninstall = 1 THEN
        speechoutput$ = "uninstall has been aborted"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        ynuninstall = 0
    END IF
END IF
