getinput:
IF control = 1 AND keys(74) = 1 THEN
    SELECT CASE screenstate
        CASE 0
            _SCREENSHOW
            screenstate = 1
            focus& = ShowWindow&(hwnd, 1)
        CASE 1
            _SCREENHIDE
            screenstate = 0
    END SELECT
END IF
k$ = INKEY$
IF k$ <> "" THEN startactive = TIMER
IF k$ = CHR$(3) THEN
    IF LEN(speechcopy$) THEN
        _CLIPBOARD$ = speechcopy$
    ELSE
        _CLIPBOARD$ = outputrecord$((outputrecord - justcopied))
    END IF
END IF
IF k$ = CHR$(22) THEN typing$ = typing$ + _CLIPBOARD$
IF k$ >= CHR$(32) AND k$ <= CHR$(126) THEN typing$ = typing$ + k$
IF LEN(typing$) > 256 THEN typing$ = LEFT$(typing$, 256)
IF k$ = (CHR$(0) + CHR$(62)) THEN GOSUB xcleanup
IF k$ = (CHR$(0) + CHR$(72)) AND inputrecord <> 1 THEN
    inputrecord = inputrecord - 1
    typing$ = inputrecord$(inputrecord)
    DO
        k$ = INKEY$
    LOOP UNTIL k$ = ""
END IF
IF k$ = (CHR$(0) + CHR$(80)) AND inputrecord <> inputcount THEN
    inputrecord = inputrecord + 1
    typing$ = inputrecord$(inputrecord)
    DO
        k$ = INKEY$
    LOOP UNTIL k$ = ""
END IF
IF k$ = CHR$(8) AND LEN(k$) <> 0 THEN typing$ = MID$(typing$, 1, (LEN(typing$) - 1))
IF k$ = (CHR$(0) + CHR$(83)) THEN typing$ = ""
IF k$ = CHR$(13) THEN
    IF nowspeaking = 1 THEN
        hr& = dABSOLUTEppdp(peekp(peekp(pVoice%&) + 80), pVoice%&, 0, dwFlags~& OR 2, 0)
        IF 0 > hr& THEN
            error$ = "Speak failed: 0x" + hexd(hr&)
            GOSUB xcleanup
        END IF
    END IF
    typing$ = LCASE$(typing$)
    inputrecord$(inputcount) = typing$
    inputcount = inputcount + 1
    inputrecord = inputcount - 1
    useroutputuse$ = typing$
    useroutput$ = typing$
    typing$ = typing$ + CHR$(10)
    userinput$ = typing$
    typing$ = ""
END IF
IF typing$ <> "" THEN useroutput$ = ""
justcopied = 0
ERASE userinput$
REDIM userinput$(buffer&)
ERASE usercommand$
REDIM usercommand$(buffer&)
hr& = dABSOLUTEpdpp(peekp(peekp(pReco%&) + 44), pReco%&, 1, _OFFSET(Event), 0)
checkHR hr&, 0, "GetEvents"
IF hr& = 0 AND recognition = 1 THEN
    IF 38 <> Event.eEventId THEN error$ = "Error: unknown event."
    hr& = dABSOLUTEpdddpp(peekp(peekp(Event.lParam) + 20), Event.lParam, -1, -1, 1, _OFFSET(pszCoMemText%&), _OFFSET(bDisplayAttributes~%%))
    checkHR hr&, 0, "GetText"
    IF pszCoMemText%& THEN
        p~%& = pszCoMemText%&
        text$ = ""
        DO WHILE peekw(p~%&)
            text$ = text$ + CHR$(peekb(p~%&))
            p~%& = p~%& + 2
        LOOP
        ON ERROR GOTO xcleanup
        CoTaskMemFree pszCoMemText%&
        pszCoMemText%& = 0
        ON ERROR GOTO xcleanup
    END IF
    GOSUB clearevent
    lowercase$ = ""
    FOR lowercase = 1 TO LEN(text$)
        userinputcrosssection$ = MID$(text$, lowercase, 1)
        userinputcrosssection = ASC(userinputcrosssection$)
        IF userinputcrosssection >= 65 AND userinputcrosssection <= 90 THEN userinputcrosssection$ = CHR$((userinputcrosssection + 32))
        lowercase$ = lowercase$ + userinputcrosssection$
    NEXT lowercase
    text$ = lowercase$
    inputrecord$(inputcount) = text$
    inputcount = inputcount + 1
    inputrecord = inputcount - 1
    useroutputuse$ = text$
    useroutput$ = text$
    text$ = text$ + CHR$(10)
    userinput$ = text$
    typing$ = ""
END IF
againsend:
IF userinput$ <> "" THEN
    endui$ = ""
    FOR commaknock = 1 TO LEN(userinput$)
        commacheck$ = MID$(userinput$, commaknock, 1)
        IF commacheck$ = CHR$(44) THEN commacheck$ = ""
        endui$ = endui$ + commacheck$
    NEXT commaknock
    userinput$ = endui$
    oldaddloc = 1
    DO
        operatorfine = 0
        addloc = INSTR(oldaddloc, userinput$, CHR$(45))
        IF addloc <> 0 THEN
            afterit$ = MID$(userinput$, (addloc + 1), 1)
            beforeit$ = MID$(userinput$, (addloc - 1), 1)
            IF afterit$ <> CHR$(32) THEN
                userinput$ = MID$(userinput$, 1, (addloc)) + " " + MID$(userinput$, (addloc + 1), (LEN(userinput$) - (addloc)))
                operatorfine = 1
            END IF
            IF beforeit$ <> CHR$(32) THEN
                userinput$ = MID$(userinput$, 1, (addloc - 1)) + " " + MID$(userinput$, addloc, (LEN(userinput$) - (addloc - 1)))
                addloc = addloc + 1
                operatorfine = 1
            END IF
        END IF
        oldaddloc = addloc + 1
    LOOP UNTIL operatorfine = 0
    oldsubloc = 1
    DO
        operatorfine = 0
        subloc = INSTR(oldsubloc, userinput$, CHR$(45))
        IF subloc <> 0 THEN
            afterit$ = MID$(userinput$, (subloc + 1), 1)
            beforeit$ = MID$(userinput$, (subloc - 1), 1)
            IF afterit$ <> CHR$(32) THEN
                userinput$ = MID$(userinput$, 1, (subloc)) + " " + MID$(userinput$, (subloc + 1), (LEN(userinput$) - (subloc)))
                operatorfine = 1
            END IF
            IF beforeit$ <> CHR$(32) THEN
                userinput$ = MID$(userinput$, 1, (subloc - 1)) + " " + MID$(userinput$, subloc, (LEN(userinput$) - (subloc - 1)))
                subloc = subloc + 1
                operatorfine = 1
            END IF
        END IF
        oldsubloc = subloc + 1
    LOOP UNTIL operatorfine = 0
    oldmulloc = 1
    DO
        operatorfine = 0
        mulloc = INSTR(oldmulloc, userinput$, CHR$(45))
        IF mulloc <> 0 THEN
            afterit$ = MID$(userinput$, (mulloc + 1), 1)
            beforeit$ = MID$(userinput$, (mulloc - 1), 1)
            IF afterit$ <> CHR$(32) THEN
                userinput$ = MID$(userinput$, 1, (mulloc)) + " " + MID$(userinput$, (mulloc + 1), (LEN(userinput$) - (mulloc)))
                operatorfine = 1
            END IF
            IF beforeit$ <> CHR$(32) THEN
                userinput$ = MID$(userinput$, 1, (mulloc - 1)) + " " + MID$(userinput$, mulloc, (LEN(userinput$) - (mulloc - 1)))
                mulloc = mulloc + 1
                operatorfine = 1
            END IF
        END IF
        oldmulloc = mulloc + 1
    LOOP UNTIL operatorfine = 0
    olddivloc = 1
    DO
        operatorfine = 0
        divloc = INSTR(olddivloc, userinput$, CHR$(45))
        IF divloc <> 0 THEN
            afterit$ = MID$(userinput$, (divloc + 1), 1)
            beforeit$ = MID$(userinput$, (divloc - 1), 1)
            IF afterit$ <> CHR$(32) THEN
                userinput$ = MID$(userinput$, 1, (divloc)) + " " + MID$(userinput$, (divloc + 1), (LEN(userinput$) - (divloc)))
                operatorfine = 1
            END IF
            IF beforeit$ <> CHR$(32) THEN
                userinput$ = MID$(userinput$, 1, (divloc - 1)) + " " + MID$(userinput$, divloc, (LEN(userinput$) - (divloc - 1)))
                divloc = divloc + 1
                operatorfine = 1
            END IF
        END IF
        olddivloc = divloc + 1
    LOOP UNTIL operatorfine = 0
    REDIM userinput$(256)
    userinputs = 0
    FOR userinputloc = 1 TO LEN(userinput$)
        userinputcrosssection$ = MID$(userinput$, userinputloc, 1)
        IF userinputcrosssection$ <> CHR$(32) THEN
            userinputs = userinputs + 1
            DO
                userinputcrosssection$ = MID$(userinput$, userinputloc, 1)
                IF userinputcrosssection$ = CHR$(32) OR userinputloc = LEN(userinput$) THEN EXIT DO
                userinput$(userinputs) = userinput$(userinputs) + userinputcrosssection$
                userinputloc = userinputloc + 1
            LOOP
        END IF
    NEXT userinputloc
    FOR punctcheck = 1 TO userinputs
        punctuation$ = RIGHT$(userinput$(punctcheck), 1)
        IF (punctuation$ >= CHR$(48) AND punctuation$ <= CHR$(57)) OR (punctuation$ >= CHR$(65) AND punctuation$ <= CHR$(90)) OR (punctuation$ >= CHR$(97) AND punctuation$ <= CHR$(122)) THEN
        ELSE
            IF LEN(userinput$(punctcheck)) <> 1 THEN userinput$(punctcheck) = LEFT$(userinput$(punctcheck), (LEN(userinput$(punctcheck)) - 1))
        END IF
    NEXT punctcheck
    FOR numconv = 1 TO userinputs
        SELECT CASE userinput$(numconv)
            CASE "zero"
                userinput$(numconv) = "0"
            CASE "one"
                userinput$(numconv) = "1"
            CASE "two"
                userinput$(numconv) = "2"
            CASE "three"
                userinput$(numconv) = "3"
            CASE "four"
                userinput$(numconv) = "4"
            CASE "five"
                userinput$(numconv) = "5"
            CASE "six"
                userinput$(numconv) = "6"
            CASE "seven"
                userinput$(numconv) = "7"
            CASE "eight"
                userinput$(numconv) = "8"
            CASE "nine"
                userinput$(numconv) = "9"
            CASE "ten"
                userinput$(numconv) = "10"
            CASE "eleven"
                userinput$(numconv) = "11"
            CASE "twelve"
                userinput$(numconv) = "12"
            CASE "thirteen"
                userinput$(numconv) = "13"
            CASE "fourteen"
                userinput$(numconv) = "14"
            CASE "fifteen"
                userinput$(numconv) = "15"
            CASE "sixteen"
                userinput$(numconv) = "16"
            CASE "seventeen"
                userinput$(numconv) = "17"
            CASE "eighteen"
                userinput$(numconv) = "18"
            CASE "nineteen"
                userinput$(numconv) = "19"
            CASE "twenty"
                userinput$(numconv) = "20"
        END SELECT
    NEXT numconv
    REDIM usercommand$(32768)
    usercommands = 0
    FOR userinputcheck = 1 TO userinputs
        FOR commandcheck = 1 TO commandcount
            IF userinput$(userinputcheck) = commands$(commandcheck) THEN
                usercommands = usercommands + 1
                usercommand$(usercommands) = userinput$(userinputcheck)
            END IF
        NEXT commandcheck
    NEXT userinputcheck
    FOR userinputcopy = 1 TO userinputs
        userinputcopy$(userinputcopy) = userinput$(userinputcopy)
    NEXT userinputcopy
    userinput$ = ""
    speechcopy$ = ""
    IF usercommands <> 0 THEN
        IF speechcopy = 2 THEN
            speechcopy = 0
            speechcopy$ = ""
        END IF
        IF speechcopy = 1 THEN speechcopy = 2
        keepjc = 0
        FOR checkyn = 1 TO usercommands
            IF usercommand$(checkyn) <> "again" THEN justagain = 0
            IF usercommand$(checkyn) <> "day" AND usercommand$(checkyn) <> "today" THEN justday = 0
            IF usercomand$(checkyn) = "clipboard" OR usercomand$(checkyn) = "copy" THEN
                IF justcopied > 0 THEN keepjc = 1
            ELSE
                speechcopy$ = ""
            END IF
            IF usercommand$(checkyn) <> "yes" AND usercommand$(checkyn) <> "ya" AND usercommand$(checkyn) <> "yea" AND usercommand$(checkyn) <> "yeah" AND usercommand$(checkyn) <> "sure" AND usercommand$(checkyn) <> "afirmative" AND usercommand$(checkyn) <> "no" AND usercommand$(checkyn) <> "nah" AND usercommand$(checkyn) <> "negative" THEN
                yndlud = 0
                ynlogclear = 0
                ynname = 0
                ynpackage = 0
                ynreset = 0
                ynrestart = 0
                ynsaveprofile = 0
                ynshutdown = 0
                ynuninstall = 0
            END IF
        NEXT checkyn
        IF keepjc = 0 THEN justcopied = 0
    END IF
END IF
RETURN