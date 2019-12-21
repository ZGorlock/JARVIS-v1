IF usercommand$(runcommands) = "desktop" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "open" OR usercommand$(runcommands2) = "explore" THEN
                speechoutput$ = "opening desktop"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "start shell:Desktop"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        speechoutput$ = "showing desktop"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        SHELL _DONTWAIT _HIDE "start showdesktop.scf"
        usercommands = -1
        EXIT DO
    LOOP
END IF
