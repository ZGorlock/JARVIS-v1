IF usercommand$(runcommands) = "word" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "press" THEN
                speechoutput$ = "opening wordpress"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "start resources\urls\wordpress.URL"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
IF usercommand$(runcommands) = "wordpress" THEN
    speechoutput$ = "opening wordpress"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\wordpress.URL"
    usercommands = -1
END IF
