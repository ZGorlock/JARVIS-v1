IF usercommand$(runcommands) = "mute" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "on" THEN
                speechoutput$ = "volume muted"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                _DELAY 1
                SHELL _HIDE _DONTWAIT CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " mutesysvolume 1"
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "off" THEN
                SHELL _HIDE _DONTWAIT CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " mutesysvolume 0"
                _DELAY .5
                speechoutput$ = "volume unmuted"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "toggle" THEN
                SHELL _HIDE _DONTWAIT CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " mutesysvolume 2"
                speechoutput$ = "volume muted"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        speechoutput$ = "volume muted"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _DELAY 1
        SHELL _HIDE _DONTWAIT CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " mutesysvolume 1"
        usercommands = -1
        EXIT DO
    LOOP
END IF
