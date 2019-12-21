IF usercommand$(runcommands) = "program" OR usercommand$(runcommands) = "programs" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "files" THEN
                speechoutput$ = "opening program files"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "start shell:ProgramFiles"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        speechoutput$ = "opening programs folder"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        SHELL _DONTWAIT _HIDE "start shell:Programs"
        usercommands = -1
        EXIT DO
    LOOP
END IF
