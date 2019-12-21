IF usercommand$(runcommands) = "echo" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "off" THEN EXIT DO
        NEXT runcommands2
        echo = 1
        speechoutput$ = "echo turned on"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF
