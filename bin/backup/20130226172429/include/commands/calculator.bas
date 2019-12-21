IF usercommand$(runcommands) = "calculator" THEN
    DO
        speechoutputb$ = "launching calculator"
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "close" OR usercommand$(runcommands2) = "terminate" OR usercommand$(runcommands2) = "exit" OR usercommand$(runcommands2) = "end" THEN
                launchno = 2
                SHELL _DONTWAIT _HIDE "taskkill /IM calc.exe /F"
                speechoutput$ = "closing calculator"
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "set" THEN launchno = 1
            IF usercommand$(runcommands2) = "simple" THEN
                speechoutputa$ = "setting calculator to simple"
                speechoutputb$ = "launching simple calculator"
                REDIM winini$(1024)
                wininicount = 0
                OPEN "C:\WINDOWS\win.ini" FOR INPUT AS #1
                DO
                    wininicount = wininicount + 1
                    LINE INPUT #1, winini$(wininicount)
                LOOP UNTIL EOF(1) = -1
                CLOSE #1
                FOR wininicheck = 1 TO wininicount
                    IF winini$(wininicheck) = "[SciCalc]" THEN winini$(wininicheck + 1) = "layout=1"
                NEXT wininicheck
                OPEN "C:\WINDOWS\win.ini" FOR OUTPUT AS #1
                FOR wininiwrite = 1 TO wininicount
                    PRINT #1, winini$(wininiwrite)
                NEXT wininiwrite
                CLOSE #1
            END IF
            IF usercommand$(runcommands2) = "scientific" THEN
                speechoutputa$ = "setting calculator to scientific"
                speechoutputb$ = "launching scientific calculator"
                REDIM winini$(1024)
                wininicount = 0
                OPEN "C:\WINDOWS\win.ini" FOR INPUT AS #1
                DO
                    wininicount = wininicount + 1
                    LINE INPUT #1, winini$(wininicount)
                LOOP UNTIL EOF(1) = -1
                CLOSE #1
                FOR wininicheck = 1 TO wininicount
                    IF winini$(wininicheck) = "[SciCalc]" THEN winini$(wininicheck + 1) = "layout=0"
                NEXT wininicheck
                OPEN "C:\WINDOWS\win.ini" FOR OUTPUT AS #1
                FOR wininiwrite = 1 TO wininicount
                    PRINT #1, winini$(wininiwrite)
                NEXT wininiwrite
                CLOSE #1
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
    IF launchno = 0 THEN
        SHELL _DONTWAIT _HIDE "start calc.exe"
        speechoutput$ = speechoutputb$
    END IF
    IF launchno = 1 THEN speechoutput$ = speechoutputa$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
    launchno = 0
    speechoutputa$ = ""
    speechoutputb$ = ""
END IF
