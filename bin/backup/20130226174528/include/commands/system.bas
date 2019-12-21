IF usercommand$(runcommands) = "system" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "clock" THEN EXIT DO
        NEXT runcommands2
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "information" OR usercommand$(runcommands2) = "info" THEN
                speechoutput$ = "opening system information"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "start " + CHR$(34) + "C:\Program Files\Common Files\Microsoft Shared\MSInfo" + CHR$(34) + "msinfo32.exe"
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "backup" THEN
                speechoutput$ = "launching system backup tool"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "start C:\WINDOWS\system32\ntbackup.exe"
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "restore" THEN
                speechoutput$ = "launching system restore tool"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "start %SystemRoot%\system32\restore\rstrui.exe"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        speechoutput$ = "opening system folder"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        SHELL _DONTWAIT _HIDE "start shell:System"
        usercommands = -1
        EXIT DO
    LOOP
END IF
