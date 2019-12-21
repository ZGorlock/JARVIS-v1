IF usercommand$(runcommands) = "word" OR usercommand$(runcommands) = "words" THEN
    IF INSTR(useroutputuse$, "in") THEN start = (INSTR(useroutputuse$, "in") + 3)
    IF INSTR(useroutputuse$, "out of") THEN start = (INSTR(useroutputuse$, "out of") + 7)
    IF INSTR(useroutputuse$, "make from") THEN start = (INSTR(useroutputuse$, "make from") + 10)
    IF start > 0 THEN
        wordin$ = ""
        FOR gettext = start TO LEN(useroutputuse$)
            wordincs$ = MID$(useroutputuse$, gettext, 1)
            IF (ASC(wordincs$) >= 65 AND ASC(wordincs$) <= 90) OR (ASC(wordincs$) >= 97 AND ASC(wordincs$) <= 122) THEN
                wordin$ = wordin$ + wordincs$
            ELSE
                EXIT FOR
            END IF
        NEXT gettext
        IF LEN(wordin$) THEN
            wordin$ = LCASE$(wordin$)
            REDIM letters$(LEN(wordin$))
            FOR letters = 1 TO LEN(wordin$)
                letters$(letters) = MID$(wordin$, letters, 1)
            NEXT letters
            letters = letters - 1
            answer = 0
            REDIM answer$(NumOfLexicon)
            FOR check = 1 TO NumOfLexicon
                IF LEN(lex$(check)) <= letters AND LEN(lex$(check)) > 1 THEN
                    REDIM templetters$(letters)
                    FOR tempmove = 1 TO letters
                        templetters$(tempmove) = letters$(tempmove)
                    NEXT tempmove
                    DO
                        FOR checkletters = 1 TO LEN(lex$(check))
                            foundletter = 0
                            currentletter$ = MID$(lex$(check), checkletters, 1)
                            FOR isletter = 1 TO letters
                                IF templetters$(isletter) = currentletter$ THEN
                                    foundletter = 1
                                    templetters$(isletter) = ""
                                END IF
                            NEXT isletter
                            IF foundletter = 0 THEN EXIT DO
                        NEXT checkletters
                        answer = answer + 1
                        answer$(answer) = lex$(check)
                        EXIT DO
                    LOOP
                END IF
            NEXT check
            REDIM templetters$(0)
            REDIM _PRESERVE answer$(answer)
            order = Alphabetize(answer$())
            speechoutput$ = "from the letters in the word " + wordin$ + " you can make the words "
            speechcopy = 1
            speechcopy$ = ""
            FOR parseresults = 1 TO answer
                speechcopy$ = speechcopy$ + answer$(parseresults)
                IF parseresults = answer THEN
                    speechoutput$ = speechoutput$ + "and " + answer$(parseresults)
                ELSE
                    speechoutput$ = speechoutput$ + answer$(parseresults) + ", "
                    speechcopy$ = speechcopy$ + crlf$
                END IF
            NEXT parseresults
            speechprint$ = speechoutput$
            GOSUB textprint
            GOSUB speechoutput
            usercommands = -1
        END IF
    END IF
END IF