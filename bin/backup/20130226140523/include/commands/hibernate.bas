IF usercommand$(runcommands) = "hibernate" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "on" THEN
                speechoutput$ = "hibernation turned on"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "powercfg.exe /hibernate on"
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "off" THEN
                speechoutput$ = "hibernation turned off"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "cmd c\ powercfg.exe /hibernate off"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        speechoutput$ = "hibernating computer"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        SHELL _DONTWAIT _HIDE "powercfg.exe /hibernate on"
        commander = SetSuspendState
        usercommands = -1
        EXIT DO
    LOOP
END IF
