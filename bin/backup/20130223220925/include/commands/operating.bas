IF usercommand$(runcommands) = "operating" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "system" THEN
                IF INSTR(_OS$, "[LINUX]") THEN os$ = "Linux"
                IF INSTR(_OS$, "[WINDOWS]") THEN os$ = "Windows"
                IF INSTR(_OS$, "[MACOSX]") THEN os$ = "MacOS"
                IF INSTR(_OS$, "[32BIT]") THEN bit$ = " 32 Bit"
                IF INSTR(_OS$, "[64BIT]") THEN bit$ = " 64 Bit"
                speechoutput$ = "your operating system is " + os$ + bit$
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
