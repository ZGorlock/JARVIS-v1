IF usercommand$(runcommands) = "name" THEN
    DO
        FOR namealg = 1 TO userinputs
            IF userinput$(namealg) = "my" THEN
                FOR namealg2 = 1 TO userinputs
                    IF userinput$(namealg2) = "is" THEN
                        namefind = 0
                        FOR namealg3 = 1 TO userinputs
                            IF userinput$(namealg3) <> "my" AND userinput$(namealg3) <> "is" AND userinput$(namealg3) <> "name" AND userinput$(namealg3) <> "what" THEN
                                tempusername$ = userinput$(namealg3)
                                namefind = 1
                            END IF
                            IF userinput$(namealg3) = "what" THEN
                                speechoutput$ = "your name is " + username$
                                speechprint$ = speechoutput$
                                GOSUB textprint
                                GOSUB speechoutput
                                usercommands = -1
                                EXIT DO
                            END IF
                        NEXT namealg3
                        IF namefind = 0 THEN EXIT DO
                        ynname = 1
                        speechoutput$ = "your name is " + tempusername$ + ", is that right"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        EXIT DO
                    END IF
                NEXT namealg2
                speechoutput$ = "your name is " + username$
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF userinput$(namealg) = "your" THEN
                speechoutput$ = "my name is JARVIS, but my friends call me Just Another Rather Very Intelligent System"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
        NEXT namealg
        EXIT DO
    LOOP
END IF
