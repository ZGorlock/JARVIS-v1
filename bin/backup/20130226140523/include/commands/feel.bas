IF usercommand$(runcommands) = "feel" OR usercommand$(runcommands) = "feeling" THEN
    DO
        emotiontype = 0
        DO
            FOR emotioncheck = 1 TO userinputs
                FOR poscheck = 1 TO emotionsposcount
                    IF userinputcopy$(emotioncheck) = emotionspos$(poscheck) THEN
                        emotiontype = 1
                        EXIT DO
                    END IF
                NEXT poscheck
                FOR negcheck = 1 TO emotionsnegcount
                    IF userinputcopy$(emotioncheck) = emotionsneg$(negcheck) THEN
                        emotiontype = 2
                        EXIT DO
                    END IF
                NEXT negcheck
                PRINT userinputcopy$(emotioncheck)
            NEXT emotioncheck
            EXIT DO
        LOOP
        SELECT CASE emotiontype
            CASE 0
                EXIT DO
            CASE 1
                speechoutput$ = "that is good to hear " + username$
            CASE 2
                feelresponse = INT(RND * 14 + 1)
                SELECT CASE feelresponse
                    CASE 1
                        advice$ = "do a quick excersise"
                    CASE 2
                        advice$ = "eat a snack"
                    CASE 3
                        advice$ = "tell someone whats on your mind"
                    CASE 4
                        advice$ = "take a break from life"
                    CASE 5
                        advice$ = "do something fun"
                    CASE 6
                        advice$ = "go outside"
                    CASE 7
                        advice$ = "make physical contact with someone"
                    CASE 8
                        advice$ = "talk to a friend"
                    CASE 9
                        advice$ = "unexpectedly be kind to someone"
                    CASE 10
                        advice$ = "take a nap"
                    CASE 11
                        advice$ = "bring back good memories"
                    CASE 12
                        advice$ = "smile a little"
                    CASE 13
                        advice$ = "listen to some music"
                    CASE 14
                        advice$ = "watch some funny videos"
                END SELECT
                speechoutput$ = "i am sorry to hear that " + username$ + ", maybe you should " + advice$
        END SELECT
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF
