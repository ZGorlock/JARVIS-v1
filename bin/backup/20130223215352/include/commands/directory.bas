IF usercommand$(runcommands) = "directory" OR usercommand$(runcommands) = "directories" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "screenshot" THEN
                request$ = "Enter the full directory of your JARVIS Screenshot folder" + CHR$(13) + "ex/ 'D:\My Pictures\Screenshots\'"
                PRINT #jarvisboard, request$
                speechoutput$ = "Enter the full directory of your JARVIS Screenshot folder into the box, when you are done press Enter, if the box is empty the query will be discarded."
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                DO
                    _LIMIT 1
                    INPUT #jarvisboard, response$
                LOOP UNTIL response$ <> ""
                IF response$ <> CHR$(255) THEN ssloc$ = response$
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "document" OR usercommand$(runcommands2) = "documents" THEN
                request$ = "Enter the full directory of your My Documents folder" + CHR$(13) + "ex/ 'C:\Documents and Settings\Owner\My Documents\'"
                PRINT #jarvisboard, request$
                speechoutput$ = "Enter the full directory of your My Documents folder into the box, when you are done press Enter, if the box is empty the query will be discarded."
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
            IF usercommand$(runcommands2) = "download" OR usercommand$(runcommands2) = "downloads" THEN
                request$ = "Enter the full directory of your Downloads folder" + CHR$(13) + "ex/ 'C:\Documents and Settings\Owner\My Documents\Downloads\'"
                PRINT #jarvisboard, request$
                speechoutput$ = "Enter the full directory of your Downloads folder into the box, when you are done press Enter, if the box is empty the query will be discarded."
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                DO
                    _LIMIT 1
                    INPUT #jarvisboard, response$
                LOOP UNTIL response$ <> ""
                IF response$ <> CHR$(255) THEN downloadpath$ = response$
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "program" OR usercommand$(runcommands2) = "programs" THEN
                request$ = "Enter the full directory of your Start Menu folder" + CHR$(13) + "ex/ 'C:\Documents and Settings\All Users\Start Menu\Programs'"
                PRINT #jarvisboard, request$
                speechoutput$ = "Enter the full directory of your Start Menu folder into the box, when you are done press Enter, if the box is empty the query will be discarded."
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                DO
                    _LIMIT 1
                    INPUT #jarvisboard, response$
                LOOP UNTIL response$ <> ""
                IF response$ <> CHR$(255) THEN programdir$ = response$
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "music" THEN
                request$ = "Enter the full directory of your Music folder" + CHR$(13) + "ex/ 'C:\Documents and Settings\All Users\Start Menu\Programs'"
                PRINT #jarvisboard, request$
                speechoutput$ = "Enter the full directory of your Music folder into the box, enter 0 to look for music on your entire computer, when you are done press Enter, if the box is empty the query will be discarded."
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                DO
                    _LIMIT 1
                    INPUT #jarvisboard, response$
                LOOP UNTIL response$ <> ""
                IF response$ <> CHR$(255) THEN musicdir$ = response$
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
