IF usercommand$(runcommands) = "download" OR usercommand$(runcommands) = "downloads" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "set" THEN
                request$ = "Enter the location of your Downloads folder" + CHR$(13) + "ex/ 'C:\Documents and Settings\Owner\My Documents\Downloads\'"
                PRINT #jarvisboard, request$
                speechoutput$ = "Enter the full path of your downloads folder into the box, when you are done press Enter, if the box is empty the query will be discarded"
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
        NEXT runcommands2
        speechoutput$ = "opening downloads folder"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        SHELL _DONTWAIT "explorer /n, /root," + CHR$(34) + downloadpath$ + CHR$(34)
        usercommands = -1
        EXIT DO
    LOOP
END IF
