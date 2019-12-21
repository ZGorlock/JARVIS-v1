IF dictate = 1 THEN
    startactive = TIMER
    DO
        face = 0
        FOR runcommands = 1 TO usercommands
            IF usercommand$(runcommands) = "dictation" OR usercommand$(runcommands) = "dictate" THEN
                FOR runcommands2 = 1 TO usercommands
                    IF usercommand$(runcommands2) = "off" OR usercommand$(runcommands2) = "stop" OR usercommand$(runcommands2) = "end" THEN
                        dictate = 0
                        speechoutput$ = "dictation stopped"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        EXIT DO
                    END IF
                NEXT runcommands2
            END IF
            IF usercommand$(runcommands) = "face" THEN face = 1
        NEXT runcommands
        IF face = 1 AND userinputs = 2 THEN
            face$ = ""
            DO
                DO
                    FOR facecheck = 1 TO userinputs
                        IF userinputcopy$(facecheck) <> "face" THEN
                            face$ = userinputcopy$(facecheck)
                            EXIT DO
                        END IF
                    NEXT facecheck
                    EXIT DO
                LOOP
                SELECT CASE face$
                    CASE "happy", "smiley", "good"
                        useroutputuse$ = ":)"
                    CASE "sad", "frowny", "bad"
                        useroutputuse$ = ":("
                    CASE "crying", "tear", "teary"
                        useroutputuse$ = ":'("
                    CASE "silly", "tongue"
                        useroutputuse$ = ":P"
                    CASE "duh"
                        useroutputuse$ = "T-T"
                    CASE "cynical", "squint", "squinty"
                        useroutputuse$ = "e-e"
                    CASE "surprised", "shocked"
                        useroutputuse$ = ":o"
                    CASE "excited"
                        useroutputuse$ = ":D"
                    CASE "grumpy"
                        useroutputuse$ = "TnT"
                    CASE "indifferent"
                        useroutputuse$ = ":l"
                    CASE "winky", "wink"
                        useroutputuse$ = ";)"
                    CASE "funny"
                        useroutputuse$ = "XD"
                    CASE "angry", "mad"
                        useroutputuse$ = ">:("
                    CASE "furious"
                        useroutputuse$ = "D:<"
                    CASE "worried", "worry"
                        useroutputuse$ = "D:"
                    CASE "smug"
                        useroutputuse$ = "TuT"
                    CASE "twitch", "twitching"
                        useroutputuse$ = "e-o"
                    CASE "stare"
                        useroutputuse$ = "ono"
                    CASE "cute"
                        useroutputuse$ = ":3"
                    CASE "elated"
                        useroutputuse$ = "n-n"
                    CASE "oh", "o"
                        useroutputuse$ = "-o-"
                    CASE "no"
                        useroutputuse$ = "o-o"
                    CASE "disbelief", "unbelievable"
                        useroutputuse$ = "O-O"
                END SELECT
                EXIT DO
            LOOP
        END IF
        speechoutput$ = ""
        speechprint$ = useroutputuse$
        GOSUB textprint
        GOSUB speechoutput
        IF useroutputuse$ = "all" THEN
            speechoutput$ = "select all"
            speechprint$ = speechoutput$
            GOSUB textprint
            GOSUB speechoutput
            _SCREENPRINT CHR$(1)
            useroutputuse$ = ""
        END IF
        IF useroutputuse$ = "back" OR useroutputuse$ = "backspace" THEN
            speechoutput$ = ""
            speechprint$ = speechoutput$
            GOSUB textprint
            GOSUB speechoutput
            _SCREENPRINT CHR$(8)
            useroutputuse$ = ""
        END IF
        IF useroutputuse$ = "copy" THEN
            speechoutput$ = "copying"
            speechprint$ = speechoutput$
            GOSUB textprint
            GOSUB speechoutput
            _SCREENPRINT CHR$(3)
            useroutputuse$ = ""
        END IF
        IF useroutputuse$ = "delete" THEN
            speechoutput$ = "deleting"
            speechprint$ = speechoutput$
            GOSUB textprint
            GOSUB speechoutput
            _SCREENPRINT (CHR$(0) + CHR$(83))
            useroutputuse$ = ""
        END IF
        IF useroutputuse$ = "enter" OR useroutputuse$ = "send" OR useroutputuse$ = "go" THEN
            speechoutput$ = ""
            speechprint$ = speechoutput$
            GOSUB textprint
            GOSUB speechoutput
            _SCREENPRINT CHR$(13)
            useroutputuse$ = ""
        END IF
        IF useroutputuse$ = "escape" THEN
            speechoutput$ = ""
            speechprint$ = speechoutput$
            GOSUB textprint
            GOSUB speechoutput
            _SCREENPRINT CHR$(27)
            useroutputuse$ = ""
        END IF
        IF useroutputuse$ = "paste" THEN
            speechoutput$ = "pasting"
            speechprint$ = speechoutput$
            GOSUB textprint
            GOSUB speechoutput
            _SCREENPRINT CHR$(22)
            useroutputuse$ = ""
        END IF
        IF useroutputuse$ = "redo" THEN
            speechoutput$ = "redoing"
            speechprint$ = speechoutput$
            GOSUB textprint
            GOSUB speechoutput
            _SCREENPRINT CHR$(25)
            useroutputuse$ = ""
        END IF
        IF useroutputuse$ = "scratch that" OR useroutputuse$ = "delete that" OR useroutputuse$ = "erase that" THEN
            speechoutput$ = ""
            speechprint$ = speechoutput$
            GOSUB textprint
            GOSUB speechoutput
            scratchthat$ = STRING$(scratchthat, 8)
            _SCREENPRINT scratchthat$
            useroutputuse$ = ""
        END IF
        IF useroutputuse$ = "space" THEN
            speechoutput$ = ""
            speechprint$ = speechoutput$
            GOSUB textprint
            GOSUB speechoutput
            _SCREENPRINT CHR$(32)
            useroutputuse$ = ""
        END IF
        IF useroutputuse$ = "undo" OR useroutputuse$ = "undue" THEN
            speechoutput$ = "undoing"
            speechprint$ = speechoutput$
            GOSUB textprint
            GOSUB speechoutput
            _SCREENPRINT CHR$(26)
            useroutputuse$ = ""
        END IF
        IF useroutputuse$ <> "" THEN
            _SCREENPRINT useroutputuse$ + " "
        END IF
        EXIT DO
    LOOP
    scratchthat = LEN(useroutputuse$)
    useroutputuse$ = ""
    usercommands = -1
END IF
