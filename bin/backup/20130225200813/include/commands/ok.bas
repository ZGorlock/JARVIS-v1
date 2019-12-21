IF usercommand$(runcommands) = "ok" OR usercommand$(runcommands) = "indeed" OR usercommand$(runcommands) = "correct" OR usercommand$(runcommands) = "right" OR usercommand$(runcommands) = "quite" OR usercommand$(runcommands) = "aight" OR usercommand$(runcommands) = "alright" OR usercommand$(runcommands) = "cool" OR usercommand$(runcommands) = "good" OR usercommand$(runcommands) = "nice" THEN
    RANDOMIZE TIMER
    acknowlegmentpick = INT(RND * 6)
    SELECT CASE acknowlegmentpick
        CASE 0
            speechoutput$ = "ok"
        CASE 1
            speechoutput$ = "right"
        CASE 2
            speechoutput$ = "indeed"
        CASE 3
            speechoutput$ = "correct"
        CASE 4
            speechoutput$ = "yes"
        CASE 5
            speechoutput$ = "quite"
    END SELECT
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF
