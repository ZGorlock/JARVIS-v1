IF usercommand$(runcommands) = "joke" OR usercommand$(runcommands) = "jokes" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "last" THEN joke = lastjoke
        NEXT runcommands2
        EXIT DO
    LOOP
    IF joke = 0 THEN 
        RANDOMIZE TIMER
        joke = INT(RND * NumOfJoke + 1)
    END IF
    REDIM jokestart AS _UNSIGNED _INTEGER64
    REDIM jokeend AS _UNSIGNED _INTEGER64
    OPEN "resources\db\joke.jdb" FOR BINARY AS #1
    GET #1, ((joke - 1) * 8) + 1, jokestart
    GET #1, (joke * 8) + 1, jokeend
    joke$ = SPACE$(jokeend - jokestart)
    GET #1, (jokestart + 1), joke$
    CLOSE #1        
    lastjoke = joke
    joke = 0
    speechoutput$ = joke$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF
