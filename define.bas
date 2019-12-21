IF usercommand$(runcommands) = "define" OR usercommand$(runcommands) = "definition" THEN
    IF LEFT$(useroutputuse$, 7) = "define " THEN
        searchstr$ = LCASE$(MID$(useroutputuse$, 8))
        word$ = searchstr$
        IF INSTR(searchstr$, CHR$(32)) THEN
            buildstr$ = ""
            FOR remspace = 1 TO LEN(searchstr$)
                shave$ = MID$(searchstr$, remspace, 1)
                IF shave$ = " " THEN shave$ = "_"
                buildstr$ = buildstr$ + shave$
            NEXT remspace
            searchstr$ = buildstr$
        END IF
        REDIM synsetcount(4)
        REDIM definition$(4, 1024)
        REDIM synonym$(4, 1024)
        flag = 0
        CALL dictionary(searchstr$, definition$(), synonym$(), synsetcount(), flag)
        IF flag THEN
            synsets = 0
            addsyn$ = ""
            FOR checksyns = 1 TO 4
                IF synsetcount(checksyns) > 0 THEN
                    synsets = synsets + 1
                    IF LEN(addsyn$) THEN addsyn$ = addsyn$ + ", "
                    SELECT CASE checksyns
                        CASE 1
                            addsyn$ = addsyn$ + "noun"
                        CASE 2
                            addsyn$ = addsyn$ + "verb"
                        CASE 3
                            addsyn$ = addsyn$ + "adjective"
                        CASE 4
                            addsyn$ = addsyn$ + "adverb"
                    END SELECT
                END IF
            NEXT checksyns
            SELECT CASE synsets
                CASE 0
                    speechoutput$ = "this word does not exist in my dictionary"
                    speechprint$ = speechoutput$
                    module$ = "dictionary"
                    GOSUB textprint
                    module$ = ""
                    GOSUB speechoutput
                    tempclipboard$ = speechoutput$
                    usercommands = -1
                CASE 1
                    onlyone = 0
                    plur$ = ""
                    DO
                        FOR catchsynset = 1 TO 4
                            IF synsetcount(catchsynset) = 1 THEN
                                onlyone = 1
                                SELECT CASE catchsynset
                                    CASE 1, 2
                                        plur$ = ""
                                    CASE 3, 4
                                        plur$ = "n"
                                END SELECT
                                EXIT DO
                            END IF
                        NEXT catchsynset
                        EXIT DO
                    LOOP
                    IF onlyone = 1 THEN
                        speechoutput$ = "this word exists in my dictionary as a" + plur$ + " " + addsyn$ + ": " + definition$(catchsynset, 1)
                        speechprint$ = speechoutput$
                        module$ = "dictionary"
                        GOSUB textprint
                        module$ = ""
                        GOSUB speechoutput
                        tempclipboard$ = speechoutput$
                        usercommands = -1
                    ELSE
                        speechoutput$ = "this word exists in my dictionary as a" + plur$ + " " + addsyn$ + " in" + STR$(synsetcount(catchsynset)) + " synsets, which would you like to hear? to hear all say all, to leave the dictionary say exit, escape or home"
                        speechprint$ = speechoutput$
                        module$ = "dictionary"
                        GOSUB textprint
                        module$ = ""
                        GOSUB speechoutput
                        tempclipboard$ = speechoutput$
                        usercommands = -1
                        DO
                                    _LIMIT speed&
                                    GOSUB getinput
                                    module$ = "dictionary"
                                    GOSUB textprint
                                    module$ = ""
                                    FOR runcommands2 = 1 TO usercommands
                                        IF useroutputuse$ > "" THEN
                                            IF INSTR(useroutputuse$, "synset") THEN
                                                testsynsetin$ = MID$(useroutputuse$, (INSTR(useroutputuse$, "synset") + 7))
                                                IF VAL(testsynsetin$) > 0 THEN synsetsay = VAL(testsynsetin$)
                                            ELSE
                                                IF VAL(useroutputuse$) > 0 THEN synsetsay = VAL(useroutputuse$)
                                            END IF
                                        END IF
                                        IF usercommand$(runcommands2) = "all" THEN synsetsay = -1
                                        IF usercommand$(runcommands2) = "exit" OR usercommand$(runcommands2) = "escape" OR usercommand$(runcommands2) = "home" THEN
                                            outdict = 1
                                            EXIT DO
                                        END IF
                                    NEXT runcommands2
                                    GOSUB speechoutput
                                LOOP UNTIL synsetsay <> 0

                                IF outdict = 1 THEN
                                    outdict = 0
                                    EXIT DO
                                END IF
                                IF synsetsay <= synsetcount(catchsynset) AND synsetsay >= 1 THEN
                                    speechoutput$ = "as an adjective, " + word$ + "can mean: " + definition$(catchsynset, synsetsay)
                                    speechprint$ = speechoutput$
                                    module$ = "dictionary"
                                    GOSUB textprint
                                    module$ = ""
                                    GOSUB speechoutput
                                    tempclipboard$ = speechoutput$
                                    usercommands = -1
                                    synsetsay = 0
                                END IF
                                IF synsetsay = -1 THEN
                                    synsetspeech$ = "as an adjective, " + word$ + "has" + STR$(synsetcount(catchsynset)) + " synsets:"
                                    FOR addsynsets = 1 TO synsetcount(catchsynset)
                                        synsetspeech$ = synsetspeech$ + STR$(addsynsets) + ": " + definition$(catchsynset, addsynsets) + " "
                                    NEXT addsynsets
                                    speechoutput$ = synsetspeech$
                                    speechprint$ = speechoutput$
                                    module$ = "dictionary"
                                    GOSUB textprint
                                    module$ = ""
                                    GOSUB speechoutput
                                    tempclipboard$ = speechoutput$
                                    usercommands = -1
                                END IF
                    END IF
                CASE ELSE
                    speechoutput$ = "this word exists in my dictionary in" + STR$(synsets) + " senses: " + addsyn$ + "; which would you like to hear? to hear all say all, to leave the dictionary say exit, escape or home"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    tempclipboard$ = speechoutput$
                    usercommands = -1
                    DO
                        _LIMIT speed&
                        GOSUB getinput
                        module$ = "dictionary"
                        GOSUB textprint
                        module$ = ""
                        FOR runcommands = 1 TO usercommands
                            IF usercommand$(runcommand) = "adjective" AND INSTR(addsyn$, "adjective") THEN
                                speechoutput$ = "this word exists in my dictionary as an adjective in" + STR$(synsetcount(3)) + " synsets, which would you like to hear? to hear all say all, to leave the dictionary say exit, escape or home"
                                speechprint$ = speechoutput$
                                module$ = "dictionary"
                                GOSUB textprint
                                module$ = ""
                                GOSUB speechoutput
                                tempclipboard$ = speechoutput$
                                usercommands = -1
                                synsetsay = 0
                                DO
                                    _LIMIT speed&
                                    GOSUB getinput
                                    module$ = "dictionary"
                                    GOSUB textprint
                                    module$ = ""
                                    FOR runcommands2 = 1 TO usercommands
                                        IF useroutputuse$ > "" THEN
                                            IF INSTR(useroutputuse$, "synset") THEN
                                                testsynsetin$ = MID$(useroutputuse$, (INSTR(useroutputuse$, "synset") + 7))
                                                IF VAL(testsynsetin$) > 0 THEN synsetsay = VAL(testsynsetin$)
                                            ELSE
                                                IF VAL(useroutputuse$) > 0 THEN synsetsay = VAL(useroutputuse$)
                                            END IF
                                        END IF
                                        IF usercommand$(runcommands2) = "all" THEN synsetsay = -1
                                        IF usercommand$(runcommands2) = "exit" OR usercommand$(runcommands2) = "escape" OR usercommand$(runcommands2) = "home" THEN
                                            outdict = 1
                                            EXIT DO
                                        END IF
                                    NEXT runcommands2
                                    GOSUB speechoutput
                                LOOP UNTIL synsetsay <> 0
                                IF outdict = 1 THEN
                                    outdict = 0
                                    EXIT DO
                                END IF
                                IF synsetsay <= synsetcount(3) AND synsetsay >= 1 THEN
                                    speechoutput$ = "as an adjective, " + word$ + "can mean: " + definition$(3, synsetsay)
                                    speechprint$ = speechoutput$
                                    module$ = "dictionary"
                                    GOSUB textprint
                                    module$ = ""
                                    GOSUB speechoutput
                                    tempclipboard$ = speechoutput$
                                    usercommands = -1
                                    synsetsay = 0
                                END IF
                                IF synsetsay = -1 THEN
                                    synsetspeech$ = "as an adjective, " + word$ + "has" + STR$(synsetcount(3)) + " synsets:"
                                    FOR addsynsets = 1 TO synsetcount(3)
                                        synsetspeech$ = synsetspeech$ + STR$(addsynsets) + definition$(3, addsynsets) + " "
                                    NEXT addsynsets
                                    speechoutput$ = synsetspeech$
                                    speechprint$ = speechoutput$
                                    module$ = "dictionary"
                                    GOSUB textprint
                                    module$ = ""
                                    GOSUB speechoutput
                                    tempclipboard$ = speechoutput$
                                    usercommands = -1
                                END IF
                            END IF
                            IF usercommand$(runcommands) = "adverb" AND INSTR(addsyn$, "adverb") THEN
                                speechoutput$ = "this word exists in my dictionary as an adverb in" + STR$(synsetcount(4)) + " synsets, which would you like to hear? to hear all say all, to leave the dictionary say exit, escape or home"
                                speechprint$ = speechoutput$
                                module$ = "dictionary"
                                GOSUB textprint
                                module$ = ""
                                GOSUB speechoutput
                                tempclipboard$ = speechoutput$
                                usercommands = -1
                                synsetsay = 0
                                DO
                                    _LIMIT speed&
                                    GOSUB getinput
                                    module$ = "dictionary"
                                    GOSUB textprint
                                    module$ = ""
                                    FOR runcommands2 = 1 TO usercommands
                                        IF useroutputuse$ > "" THEN
                                            IF INSTR(useroutputuse$, "synset") THEN
                                                testsynsetin$ = MID$(useroutputuse$, (INSTR(useroutputuse$, "synset") + 7))
                                                IF VAL(testsynsetin$) > 0 THEN synsetsay = VAL(testsynsetin$)
                                            ELSE
                                                IF VAL(useroutputuse$) > 0 THEN synsetsay = VAL(useroutputuse$)
                                            END IF
                                        END IF
                                        IF usercommand$(runcommands2) = "all" THEN synsetsay = -1
                                        IF usercommand$(runcommands2) = "exit" OR usercommand$(runcommands2) = "escape" OR usercommand$(runcommands2) = "home" THEN
                                            outdict = 1
                                            EXIT DO
                                        END IF
                                    NEXT runcommands2
                                    GOSUB speechoutput
                                LOOP UNTIL synsetsay <> 0
                                IF outdict = 1 THEN
                                    outdict = 0
                                    EXIT DO
                                END IF
                                IF synsetsay <= synsetcount(4) AND synsetsay >= 1 THEN
                                    speechoutput$ = "as an adverb, " + word$ + "can mean: " + definition$(4, synsetsay)
                                    speechprint$ = speechoutput$
                                    module$ = "dictionary"
                                    GOSUB textprint
                                    module$ = ""
                                    GOSUB speechoutput
                                    tempclipboard$ = speechoutput$
                                    usercommands = -1
                                    synsetsay = 0
                                END IF
                                IF synsetsay = -1 THEN
                                    synsetspeech$ = "as an adverb, " + word$ + "has" + STR$(synsetcount(4)) + " synsets:"
                                    FOR addsynsets = 1 TO synsetcount(4)
                                        synsetspeech$ = synsetspeech$ + STR$(addsynsets) + definition$(4, addsynsets) + " "
                                    NEXT addsynsets
                                    speechoutput$ = synsetspeech$
                                    speechprint$ = speechoutput$
                                    module$ = "dictionary"
                                    GOSUB textprint
                                    module$ = ""
                                    GOSUB speechoutput
                                    tempclipboard$ = speechoutput$
                                    usercommands = -1
                                END IF
                            END IF
                            IF usercommand$(runcommands) = "exit" OR usercommand$(runcommands) = "escape" OR usercommand$(runcommands) = "home" THEN EXIT DO
                            IF usercommand$(runcommands) = "noun" AND INSTR(addsyn$, "noun") THEN
                                speechoutput$ = "this word exists in my dictionary as a noun in" + STR$(synsetcount(1)) + " synsets, which would you like to hear? to hear all say all, to leave the dictionary say exit, escape or home"
                                speechprint$ = speechoutput$
                                module$ = "dictionary"
                                GOSUB textprint
                                module$ = ""
                                GOSUB speechoutput
                                tempclipboard$ = speechoutput$
                                usercommands = -1
                                synsetsay = 0
                                DO
                                    _LIMIT speed&
                                    GOSUB getinput
                                    module$ = "dictionary"
                                    GOSUB textprint
                                    module$ = ""
                                    FOR runcommands2 = 1 TO usercommands
                                        IF useroutputuse$ > "" THEN
                                            IF INSTR(useroutputuse$, "synset") THEN
                                                testsynsetin$ = MID$(useroutputuse$, (INSTR(useroutputuse$, "synset") + 7))
                                                IF VAL(testsynsetin$) > 0 THEN synsetsay = VAL(testsynsetin$)
                                            ELSE
                                                IF VAL(useroutputuse$) > 0 THEN synsetsay = VAL(useroutputuse$)
                                            END IF
                                        END IF
                                        IF usercommand$(runcommands2) = "all" THEN synsetsay = -1
                                        IF usercommand$(runcommands2) = "exit" OR usercommand$(runcommands2) = "escape" OR usercommand$(runcommands2) = "home" THEN
                                            outdict = 1
                                            EXIT DO
                                        END IF
                                    NEXT runcommands2
                                    GOSUB speechoutput
                                LOOP UNTIL synsetsay <> 0
                                IF outdict = 1 THEN
                                    outdict = 0
                                    EXIT DO
                                END IF
                                IF synsetsay <= synsetcount(1) AND synsetsay >= 1 THEN
                                    speechoutput$ = "as an noun, " + word$ + "can mean: " + definition$(1, synsetsay)
                                    speechprint$ = speechoutput$
                                    module$ = "dictionary"
                                    GOSUB textprint
                                    module$ = ""
                                    GOSUB speechoutput
                                    tempclipboard$ = speechoutput$
                                    usercommands = -1
                                    synsetsay = 0
                                END IF
                                IF synsetsay = -1 THEN
                                    synsetspeech$ = "as an noun, " + word$ + "has" + STR$(synsetcount(1)) + " synsets:"
                                    FOR addsynsets = 1 TO synsetcount(1)
                                        synsetspeech$ = synsetspeech$ + STR$(addsynsets) + definition$(1, addsynsets) + " "
                                    NEXT addsynsets
                                    speechoutput$ = synsetspeech$
                                    speechprint$ = speechoutput$
                                    module$ = "dictionary"
                                    GOSUB textprint
                                    module$ = ""
                                    GOSUB speechoutput
                                    tempclipboard$ = speechoutput$
                                    usercommands = -1
                                END IF
                            END IF
                            IF usercommand$(runcommands) = "verb" AND INSTR(addsyn$, "verb") THEN
                                speechoutput$ = "this word exists in my dictionary as a verb in" + STR$(synsetcount(2)) + " synsets, which would you like to hear? to hear all say all, to leave the dictionary say exit, escape or home"
                                speechprint$ = speechoutput$
                                module$ = "dictionary"
                                GOSUB textprint
                                module$ = ""
                                GOSUB speechoutput
                                tempclipboard$ = speechoutput$
                                usercommands = -1
                                synsetsay = 0
                                DO
                                    _LIMIT speed&
                                    GOSUB getinput
                                    module$ = "dictionary"
                                    GOSUB textprint
                                    module$ = ""
                                    FOR runcommands2 = 1 TO usercommands
                                        IF useroutputuse$ > "" THEN
                                            IF INSTR(useroutputuse$, "synset") THEN
                                                testsynsetin$ = MID$(useroutputuse$, (INSTR(useroutputuse$, "synset") + 7))
                                                IF VAL(testsynsetin$) > 0 THEN synsetsay = VAL(testsynsetin$)
                                            ELSE
                                                IF VAL(useroutputuse$) > 0 THEN synsetsay = VAL(useroutputuse$)
                                            END IF
                                        END IF
                                        IF usercommand$(runcommands2) = "all" THEN synsetsay = -1
                                        IF usercommand$(runcommands2) = "exit" OR usercommand$(runcommands2) = "escape" OR usercommand$(runcommands2) = "home" THEN
                                            outdict = 1
                                            EXIT DO
                                        END IF
                                    NEXT runcommands2
                                    GOSUB speechoutput
                                LOOP UNTIL synsetsay <> 0
                                IF outdict = 1 THEN
                                    outdict = 0
                                    EXIT DO
                                END IF
                                IF synsetsay <= synsetcount(2) AND synsetsay >= 1 THEN
                                    speechoutput$ = "as an verb, " + word$ + "can mean: " + definition$(2, synsetsay)
                                    speechprint$ = speechoutput$
                                    module$ = "dictionary"
                                    GOSUB textprint
                                    module$ = ""
                                    GOSUB speechoutput
                                    tempclipboard$ = speechoutput$
                                    usercommands = -1
                                    synsetsay = 0
                                END IF
                                IF synsetsay = -1 THEN
                                    synsetspeech$ = "as an verb, " + word$ + "has" + STR$(synsetcount(2)) + " synsets:"
                                    FOR addsynsets = 1 TO synsetcount(2)
                                        synsetspeech$ = synsetspeech$ + STR$(addsynsets) + definition$(2, addsynsets) + " "
                                    NEXT addsynsets
                                    speechoutput$ = synsetspeech$
                                    speechprint$ = speechoutput$
                                    module$ = "dictionary"
                                    GOSUB textprint
                                    module$ = ""
                                    GOSUB speechoutput
                                    tempclipboard$ = speechoutput$
                                    usercommands = -1
                                END IF
                            END IF
                        NEXT runcommands
                        GOSUB speechoutput
                    LOOP
            END SELECT
        ELSE
            speechoutput$ = "this word does not exist in my dictionary"
            speechprint$ = speechoutput$
            GOSUB textprint
            GOSUB speechoutput
            tempclipboard$ = speechoutput$
            usercommands = -1
        END IF
    END IF
END IF