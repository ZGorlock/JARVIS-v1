passiveproc:
IF active = 1 THEN
    nowactive = TIMER
    timeactive = nowactive - startactive
    IF timeactive >= standbytime## AND standbytoggle = 0 THEN
        active = 0
        IF alertpref = 1 THEN
            speechoutput$ = "standing by"
        ELSE
            speechoutput$ = ""
        END IF
        status$ = "INACTIVE"
        speechprint$ = "standing by"
        GOSUB textprint
        GOSUB speechoutput
        echo = 0
        usercommands = -1
    END IF
    IF usercommands = 0 AND LEN(useroutput$) <> 0 AND afirmpref = 1 THEN
        IF alertpref = 1 THEN
            speechoutput$ = "i am sorry, i didnt understand that, try again"
        ELSE
            speechoutput$ = ""
        END IF
        speechprint$ = "i am sorry, i didnt understand that, try again"
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
    END IF
END IF
GOSUB activity
RETURN