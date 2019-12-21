IF usercommand$(runcommands) = "quote" OR usercommand$(runcommands) = "quotes" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "last" THEN quote = lastquote
        NEXT runcommands2
        EXIT DO
    LOOP
    IF quote = 0 THEN 
        RANDOMIZE TIMER
        quote = INT(RND * NumOfQuote + 1)
    END IF
    DIM quotestart AS _UNSIGNED _INTEGER64
    DIM quoteend AS _UNSIGNED _INTEGER64
    OPEN "resources\db\quote.jdb" FOR BINARY AS #1
    GET #1, ((quote - 1) * 8) + 1, quotestart
    GET #1, (quote * 8) + 1, quoteend
    quote$ = SPACE$(quoteend - quotestart)
    GET #1, (quotestart + 1), quote$
    CLOSE #1        
    lastquote = quote
    quote = 0
    speechoutput$ = quote$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF