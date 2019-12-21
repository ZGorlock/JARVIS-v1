IF usercommand$(runcommands) = "close" OR usercommand$(runcommands) = "exit" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "door" OR usercommand$(runcommands2) = "drive" OR usercommand$(runcommands2) = "calculator" OR usercommand$(runcommands2) = "command" OR usercommand$(runcommands2) = "fractal" OR usercommand$(runcommands2) = "log" OR usercommand$(runcommands2) = "task" THEN EXIT DO
        NEXT runcommands2
        speechoutput$ = "closing foreground window"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        fgwin%& = GetForegroundWindow
        getpid = GetWindowThreadProcessId(fgwin%&, _OFFSET(PID~&))
        hProcess%& = OpenProcess(1 OR PROCESS_QUERY_INFORMATION OR PROCESS_VM_READ OR SYNCHRONIZE, 0, PID~&)
        closemessage%& = SendMessageTimeoutW(fgwin%&, WM_CLOSE, 0, 0, 0, 3000, _OFFSET(dw~&))
        IF hProcess%& THEN
            waittime = 0
            DO
                IF WaitForSingleObject(hProcess%&, 100) = -1 THEN
                    waittime = waittime + 1
                ELSE
                    EXIT DO
                END IF
                IF waittime = 30 THEN
                    killprocess = TerminateProcess(hProcess%&, 0)
                    EXIT DO
                END IF
            LOOP
            waittime = 0
        END IF
        usercommands = -1
        EXIT DO
    LOOP
END IF
