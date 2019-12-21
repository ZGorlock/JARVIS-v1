IF usercommand$(runcommands) = "translate" OR usercommand$(runcommands) = "translator" THEN
    text$ = useroutputuse$
    DO
        IF LEFT$(text$, 9) = "translate" THEN text$ = MID$(text$, 11)
        IF LEFT$(text$, 11) = "translation" THEN text$ = MID$(text$, 13)
        findlangto$ = ""
        findto = 0
        FOR findlang = LEN(text$) TO 1 STEP -1
            findlangto$ = MID$(text$, findlang)
            IF LEFT$(findlangto$, 4) = " to " THEN
                findto = 1
                langto$ = MID$(text$, findlang + 4)
                text$ = LEFT$(text$, findlang - 1)
                EXIT FOR
            END IF
        NEXT findlang
        IF findto = 0 THEN EXIT DO
        highest = 0
        FOR spotlang = 1 TO NumOfLanguageCode
            langcheckval = Compare(langto$, languagecodes$(spotlang, 1))
            IF langcheckval > highest THEN
                highest = langcheckval
                langchecknum = spotlang
            END IF
        NEXT spotlang
        IF highest < 75 THEN EXIT DO
        langto$ = languagecodes$(langchecknum, 2)
        OPEN "resources\mtc.txt" FOR INPUT AS #1
        LINE INPUT #1, clientid$
        LINE INPUT #1, clientsecret$
        CLOSE #1
        request$ = "grant_type=client_credentials&client_id=" + UrlEncode$(clientid$) + "&client_secret=" + UrlEncode$(clientsecret$) + "&scope=http://api.microsofttranslator.com"
        datamarketaccessuri$ = "https://datamarket.accesscontrol.windows.net/v2/OAuth2-13"
        IF TokenExpired&(expiresin&) THEN
            SHELL _HIDE "resources\wget -O temp\mttoken.txt --post-data=" + CHR$(34) + request$ + CHR$(34) + " --no-check-certificate " + datamarketaccessuri$
            OPEN "temp\mttoken.txt" FOR INPUT AS #1
            LINE INPUT #1, response$
            CLOSE #1
            KILL "temp\mttoken.txt"
            access_token$ = Deserialize$(response$, "access_token")
            expires_in$ = Deserialize$(response$, "expires_in")
            authtoken$ = "Bearer " + access_token$
            expiresin& = VAL(expires_in$)
        END IF
        SHELL _HIDE "resources\wget -O temp\translation.txt --header=" + CHR$(34) + "Authorization: " + authtoken$ + CHR$(34) + " " + CHR$(34) + "http://api.microsofttranslator.com/v2/Http.svc/Translate?text=" + UrlEncode$(text$) + "&from=" + lang$ + "&to=" + langto$ + CHR$(34)
        OPEN "temp\translation.txt" FOR INPUT AS #1
        IF EOF(1) = -1 THEN
            translation$ = "no translation"
        ELSE
            LINE INPUT #1, translation$
            translation$ = MID$(translation$, INSTR(translation$, ">") + 1, INSTR(INSTR(translation$, ">") + 1, translation$, "<") - INSTR(translation$, ">") - 1)
        END IF
        CLOSE #1
        KILL "temp\translation.txt"
        speechoutput$ = "'" + text$ + "'" + " in " + languagecodes$(langchecknum, 1) + " is '" + translation$ + "'"
        speechcopy$ = dq$ + text$ + dq$ + crlf$ + lang$ + " - " + languagecodes$(langchecknum, 1) + crlf$ + dq$ + translation$ + dq$
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF