IF usercommand$(runcommands) = "fact" OR usercommand$(runcommands) = "facts" THEN
    fact = 0
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "last" THEN fact = lastfact
        NEXT runcommands2
        EXIT DO
    LOOP
    IF fact = 0 THEN 
        RANDOMIZE TIMER
        fact = INT(RND * NumOfFact + 1)
    END IF
    DIM factstart AS _UNSIGNED _INTEGER64
    DIM factend AS _UNSIGNED _INTEGER64
    OPEN "resources\db\fact.jdb" FOR BINARY AS #1
    GET #1, ((fact - 1) * 8) + 1, factstart
    GET #1, (fact * 8) + 1, factend
    fact$ = SPACE$(factend - factstart)
    GET #1, (factstart + 1), fact$
    CLOSE #1        
    lastfact = fact
    fact = 0
    speechoutput$ = fact$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF
