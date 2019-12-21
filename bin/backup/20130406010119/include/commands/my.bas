IF usercommand$(runcommands) = "my" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "computer" THEN
                speechoutput$ = "opening my computer"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT "explorer /n, /select, c:\"
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "documents" OR usercommand$(runcommands2) = "document" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands3) = "set" THEN
                            request$ = "Enter the location of your My Documents folder" + CHR$(13) + "ex/ 'C:\Documents and Settings\Owner\My Documents'"
                            PRINT #jarvisboard, request$
                            speechoutput$ = "Enter the full path of your my documents folder into the box, when you are done press Enter, if the box is empty the query will be discarded"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            usercommands = -1
                            DO
                                _LIMIT 1
                                INPUT #jarvisboard, response$
                            LOOP UNTIL response$ <> ""
                            IF response$ <> CHR$(255) THEN mdpath$ = response$
                            EXIT DO
                        END IF
                    NEXT runcommands3
                    speechoutput$ = "opening my documents"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    SHELL _DONTWAIT _HIDE "start shell:Personal"
                    usercommands = -1
                    EXIT DO
                LOOP
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "music" THEN
                speechoutput$ = "opening my music"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT "explorer /n, /root," + CHR$(34) + mdpath$ + "My Music" + CHR$(34)
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "pictures" OR usercommand$(runcommands2) = "picture" THEN
                speechoutput$ = "opening my pictures"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT "explorer /n, /root," + CHR$(34) + mdpath$ + "My Pictures" + CHR$(34)
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "videos" OR usercommand$(runcommands2) = "video" THEN
                speechoutput$ = "opening my videos"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT "explorer /n, /root," + CHR$(34) + mdpath$ + "My Videos" + CHR$(34)
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
