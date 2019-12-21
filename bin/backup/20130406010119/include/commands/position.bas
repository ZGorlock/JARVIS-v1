IF usercommand$(runcommands) = "position" OR usercommand$(runcommands) = "reposition" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "middle" THEN
                screenpos = 1
                speechoutput$ = "repositioning"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                _SCREENMOVE _MIDDLE
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "top" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands3) = "left" THEN
                            screenpos = 6
                            speechoutput$ = "repositioning"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            _SCREENMOVE 0, 0
                            usercommands = -1
                            EXIT DO
                        END IF
                        IF usercommand$(runcommands3) = "right" THEN
                            screenpos = 7
                            speechoutput$ = "repositioning"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            _SCREENMOVE (workareax - 517), 0
                            usercommands = -1
                            EXIT DO
                        END IF
                    NEXT runcommands3
                    screenpos = 2
                    speechoutput$ = "repositioning"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    _SCREENMOVE ((workareax / 2) - 258), 0
                    usercommands = -1
                    EXIT DO
                LOOP
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "bottom" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands3) = "left" THEN
                            screenpos = 8
                            speechoutput$ = "repositioning"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            _SCREENMOVE 0, (workareay - 240)
                            usercommands = -1
                            EXIT DO
                        END IF
                        IF usercommand$(runcommands3) = "right" THEN
                            screenpos = 9
                            speechoutput$ = "repositioning"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            _SCREENMOVE (workareax - 517), (workareay - 240)
                            usercommands = -1
                            EXIT DO
                        END IF
                    NEXT runcommands3
                    screenpos = 3
                    speechoutput$ = "repositioning"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    _SCREENMOVE ((workareax / 2) - 258), (workareay - 240)
                    usercommands = -1
                    EXIT DO
                LOOP
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "left" THEN
                screenpos = 4
                speechoutput$ = "repositioning"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                _SCREENMOVE 0, ((workareay / 2) - 120)
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "right" THEN
                screenpos = 5
                speechoutput$ = "repositioning"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                _SCREENMOVE (workareax - 517), ((workareay / 2) - 120)
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        screenpos = 7
        speechoutput$ = "repositioning"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENMOVE (workareax - 517), 0
        usercommands = -1
        EXIT DO
    LOOP
END IF
