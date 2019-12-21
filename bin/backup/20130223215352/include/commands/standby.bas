IF usercommand$(runcommands) = "standby" OR usercommand$(runcommands) = "stand" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "on" AND standbytoggle = 1 THEN
                standbytoggle = 0
                speechoutput$ = "standby turned on"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "off" AND standbytoggle = 0 THEN
                standbytoggle = 1
                speechoutput$ = "standby turned off"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "toggle" THEN
                SELECT CASE standbytoggle
                    CASE 0
                        standbytoggle = 1
                        speechoutput$ = "standby turned off"
                    CASE 1
                        standbytoggle = 0
                        speechoutput$ = "standby turned on"
                END SELECT
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "time" THEN
                containnum = 0
                DO
                    FOR numcheck = 1 TO userinputs
                        IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                            num##(1) = VAL(userinputcopy$(numcheck))
                            containnum = 1
                            EXIT DO
                        END IF
                    NEXT numcheck
                    EXIT DO
                LOOP
                IF containnum = 0 THEN EXIT DO
                containnum = 0
                standbytime## = num##(1)
                speechoutput$ = "time before standby set to" + STR$(standbytime##)
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        active = 0
        speechoutput$ = "standing by"
        speechprint$ = speechoutput$
        GOSUB textprint
        status$ = "INACTIVE"
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF
