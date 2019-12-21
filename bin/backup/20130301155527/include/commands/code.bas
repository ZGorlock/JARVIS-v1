IF usercommand$(runcommands) = "code" OR usercommand$(runcommands) = "codes" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "country" THEN
                country$ = MID$(useroutput$, 1, (INSTR(useroutput$, "code") - 1)) + MID$(useroutput$, (INSTR(useroutput$, "code") + 5))
                country$ = MID$(country$, 1, (INSTR(country$, "country") - 1)) + MID$(country$, (INSTR(country$, "country") + 8))
                country$ = RemArbitraryWords$(country$)
                highest = 0
                FOR countrycheck = 1 TO NumOfCountryCode
                    countrycheckval = Compare(country$, countrycodes$(countrycheck, 1))
                    IF countrycheckval > highest THEN
                        highest = countrycheckval
                        countrychecknum = countrycheck
                    END IF
                NEXT countrycheck
                IF highest < 30 THEN EXIT DO
                speechoutput$ = "the country codes for " + countrycodes$(countrychecknum, 1) + " are " + countrycodes$(countrychecknum, 2) + ", " + countrycodes$(countrychecknum, 3) + ", and " + countrycodes$(countrychecknum, 4)
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "language" THEN
                language$ = MID$(useroutput$, 1, (INSTR(useroutput$, "code") - 1)) + MID$(useroutput$, (INSTR(useroutput$, "code") + 5))
                language$ = MID$(language$, 1, (INSTR(language$, "language") - 1)) + MID$(language$, (INSTR(language$, "language") + 8))
                language$ = RemArbitraryWords$(language$)
                highest = 0
                FOR languagecheck = 1 TO NumOfLanguageCode
                    languagecheckval = Compare(language$, languagecodes$(languagecheck, 1))
                    IF languagecheckval > highest THEN
                        highest = languagecheckval
                        languagechecknum = languagecheck
                    END IF
                NEXT languagecheck
                IF highest < 30 THEN EXIT DO
                speechoutput$ = "the language codes for " + languagecodes$(languagechecknum, 1) + " are " + languagecodes$(languagechecknum, 2) + " and " + languagecodes$(languagechecknum, 3)
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "zip" OR usercommand$(runcommands2) = "postal" THEN
            END IF
        NEXT runcommands2
        speechoutput$ = "you can find my code located in my program folder: " + jarvisloc$
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF