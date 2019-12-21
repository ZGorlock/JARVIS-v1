IF usercommand$(runcommands) = "transparent" OR usercommand$(runcommands) = "transparency" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "reset" THEN
                transparency = 255
                speechoutput$ = "resetting transparency"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " win trans ititle " + CHR$(34) + "jarvis" + CHR$(34) + " " + LTRIM$(STR$(255))
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        numfind = 0
        DO
            FOR numcheck = 1 TO userinputs
                IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                    num##(1) = VAL(userinputcopy$(numcheck))
                    numfind = 1
                    EXIT DO
                END IF
            NEXT numcheck
            EXIT DO
        LOOP
        IF numfind = 0 THEN EXIT DO
        numfind = 0
        percent = num##(1)
        IF percent > 100 THEN percent = 100
        IF percent < 0 THEN percent = 0
        perc = INT(((((50 - percent) + 50) / 100) * 256))
        IF perc = 256 THEN perc = 255
        IF perc = 0 THEN perc = 1
        transparency = perc
        speechoutput$ = "setting transparency to" + STR$(percent) + " percent"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " win trans ititle " + CHR$(34) + "jarvis" + CHR$(34) + " " + LTRIM$(STR$(transparency))
        usercommands = -1
        EXIT DO
    LOOP
END IF
