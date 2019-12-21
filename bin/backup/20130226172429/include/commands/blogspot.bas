IF usercommand$(runcommands) = "blog" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "spot" THEN
                speechoutput$ = "opening blogspot"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "start resources\urls\blogspot.URL"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
IF usercommand$(runcommands) = "blogspot" THEN
    speechoutput$ = "opening blogspot"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\blogspot.URL"
    usercommands = -1
END IF
