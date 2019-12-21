IF usercommand$(runcommands) = "favorite" OR usercommand$(runcommands) = "favorites" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "add" THEN
                request$ = "Enter the website you want to favorite" + CHR$(13) + "ex/ 'http://www.google.com'"
                PRINT #jarvisboard, request$
                speechoutput$ = "Enter the data for the website into the box, when you are done press Enter, if the box is empty the query will be discarded"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                DO
                    _LIMIT 1
                    INPUT #jarvisboard, response$
                LOOP UNTIL response$ <> ""
                IF response$ <> CHR$(255) THEN
                    webaddress$ = response$
                    request$ = "Enter the title of the favorite" + CHR$(13) + "ex/ 'Google'"
                    PRINT #jarvisboard, request$
                    DO
                        _LIMIT 1
                        INPUT #jarvisboard, response$
                    LOOP UNTIL response$ <> ""
                    IF response$ <> CHR$(255) THEN
                        webname$ = response$
                        speechoutput$ = "Adding favorite '" + webname$ + "' target '" + webaddress$ + "'"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " urlshortcut " + CHR$(34) + webaddress$ + CHR$(34) + " " + CHR$(34) + "~$folder.favorites$\Links" + CHR$(34) + " " + CHR$(34) + webname$ + CHR$(34)
                    END IF
                END IF
                EXIT DO
            END IF
        NEXT runcommands2
        speechoutput$ = "opening favorites"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        SHELL _DONTWAIT _HIDE "start shell:Favorites"
        usercommands = -1
        EXIT DO
    LOOP
END IF
