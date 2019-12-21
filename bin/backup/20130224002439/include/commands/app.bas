IF usercommand$(runcommands) = "app" OR usercommand$(runcommands) = "application" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "data" THEN
                speechoutput$ = "opening application data"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "start shell:AppData"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
