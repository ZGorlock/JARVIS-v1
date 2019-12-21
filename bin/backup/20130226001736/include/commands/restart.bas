IF usercommand$(runcommands) = "restart" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "stop" OR usercommand$(runcommands2) = "abort" THEN
                SHELL _DONTWAIT _HIDE "shutdown -a"
                speechoutput$ = "aborting restart"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "apache" THEN
                speechoutput$ = "restarting apache server"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " service restart apache"
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "iis" THEN
                speechoutput$ = "restarting IIS"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " service restart w3svc"
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "sql" THEN
                speechoutput$ = "restarting MySql"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " service restart MySql"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        ynrestart = 1
        speechoutput$ = "are you sure you want to restart your computer?"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF
