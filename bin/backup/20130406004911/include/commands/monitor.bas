IF usercommand$(runcommands) = "monitor" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "on" THEN
                speechoutput$ = "monitor on"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " monitor on"
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "off" THEN
                speechoutput$ = "monitor off"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " monitor off"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
