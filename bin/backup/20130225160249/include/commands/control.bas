IF usercommand$(runcommands) = "control" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF RIGHT$(usercommand$(runcommands2), 1) = "." THEN usercommand$(runcommands2) = MID$(usercommand$(runcommands2), 1, (LEN(usercommand$(runcommands2)) - 1))
            IF usercommand$(runcommands2) = "panel" THEN
                speechoutput$ = "opening control panel"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "start shell:ControlPanelFolder"
                usercommands = -1
            END IF
        NEXT runcommands2
        FOR ctrl = 1 TO userinputs
            IF RIGHT$(userinput$(ctrl), 1) = "." THEN userinput$(ctrl) = MID$(userinput$(ctrl), 1, (LEN(userinput$(ctrl)) - 1))
            IF userinput$(ctrl) = "a" THEN _SCREENPRINT CHR$(1)
            IF userinput$(ctrl) = "b" THEN _SCREENPRINT CHR$(2)
            IF userinput$(ctrl) = "c" THEN _SCREENPRINT CHR$(3)
            IF userinput$(ctrl) = "d" THEN _SCREENPRINT CHR$(4)
            IF userinput$(ctrl) = "e" THEN _SCREENPRINT CHR$(5)
            IF userinput$(ctrl) = "f" THEN _SCREENPRINT CHR$(6)
            IF userinput$(ctrl) = "g" THEN _SCREENPRINT CHR$(7)
            IF userinput$(ctrl) = "h" THEN _SCREENPRINT CHR$(8)
            IF userinput$(ctrl) = "i" THEN _SCREENPRINT CHR$(9)
            IF userinput$(ctrl) = "j" THEN _SCREENPRINT CHR$(10)
            IF userinput$(ctrl) = "k" THEN _SCREENPRINT CHR$(11)
            IF userinput$(ctrl) = "l" THEN _SCREENPRINT CHR$(12)
            IF userinput$(ctrl) = "m" THEN _SCREENPRINT CHR$(13)
            IF userinput$(ctrl) = "n" THEN _SCREENPRINT CHR$(14)
            IF userinput$(ctrl) = "o" THEN _SCREENPRINT CHR$(15)
            IF userinput$(ctrl) = "p" THEN _SCREENPRINT CHR$(16)
            IF userinput$(ctrl) = "q" THEN _SCREENPRINT CHR$(17)
            IF userinput$(ctrl) = "r" THEN _SCREENPRINT CHR$(18)
            IF userinput$(ctrl) = "s" THEN _SCREENPRINT CHR$(19)
            IF userinput$(ctrl) = "t" THEN _SCREENPRINT CHR$(20)
            IF userinput$(ctrl) = "u" THEN _SCREENPRINT CHR$(21)
            IF userinput$(ctrl) = "v" THEN _SCREENPRINT CHR$(22)
            IF userinput$(ctrl) = "w" THEN _SCREENPRINT CHR$(23)
            IF userinput$(ctrl) = "x" THEN _SCREENPRINT CHR$(24)
            IF userinput$(ctrl) = "y" THEN _SCREENPRINT CHR$(25)
            IF userinput$(ctrl) = "z" THEN _SCREENPRINT CHR$(26)
        NEXT ctrl
        EXIT DO
    LOOP
END IF
