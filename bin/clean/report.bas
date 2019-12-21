_TITLE "Report"
SCREEN 13
icon = _LOADIMAGE("..\resources\jarvis.png")
_ICON icon
SCREEN 12
cf$ = CHR$(13) + CHR$(10)
REDIM lines$(16384)
message$ = CHR$(255)
lines$(1) = CHR$(255)
DO
    _LIMIT 32
    CLS
    k$ = INKEY$
    PRINT "Please take a minute to tell me about your experience with Jarvis. You could include things you like, complaints, or ideas you have. Your opinion is very important to me and to the development of this program. If you do not want to help evolve the program with your input, submit an empty message and the program will close without sending anything. To submit a message hold Enter for 1 second, then release. Please write a message below:"
    PRINT
    VIEW PRINT 8 TO 24
    FOR lineprint = lined TO (lined + 15)
        PRINT lines$(lineprint)
    NEXT lineprint
    VIEW PRINT
    IF k$ = CHR$(13) THEN
        message$ = message$ + cf$
    END IF
    IF k$ = CHR$(27) THEN SYSTEM
    IF k$ = CHR$(8) AND message$ <> CHR$(255) THEN message$ = MID$(message$, 1, (LEN(message$) - 1))
    IF LEN(message$) > 1310720 THEN message$ = MID$(message$, 1, 1310720)
    IF k$ >= CHR$(32) AND k$ <= CHR$(126) THEN message$ = message$ + k$
    IF k$ = (CHR$(0) + CHR$(83)) THEN message$ = CHR$(255)
    IF k$ = CHR$(3) THEN _CLIPBOARD$ = message$
    IF k$ = CHR$(22) THEN
        message$ = message$ + _CLIPBOARD$
        DO
            _LIMIT 64
            k$ = INKEY$
        LOOP UNTIL k$ = ""
    END IF
    IF k$ = (CHR$(0) + CHR$(72)) THEN lined = lined - 1
    IF k$ = (CHR$(0) + CHR$(75)) THEN lined = 1
    IF k$ = (CHR$(0) + CHR$(77)) THEN
        DO
            FOR lined = 16384 TO 1 STEP -1
                IF lines$(lined) <> "" THEN EXIT DO
            NEXT
            EXIT DO
        LOOP
    END IF
    IF k$ = (CHR$(0) + CHR$(80)) THEN lined = lined + 1
    DO WHILE _MOUSEINPUT
        lined = lined + _MOUSEWHEEL
    LOOP
    IF lined < 1 THEN lined = 1
    DO
        IF lines$(lined) = "" THEN
            FOR linecheck = lined TO 16384
                IF lines$(linecheck) <> "" THEN EXIT DO
            NEXT linecheck
            lined = lined - 1
        ELSE
            EXIT DO
        END IF
    LOOP
    REDIM lines$(16384)
    sorter = 1
    FOR sort = 1 TO LEN(message$)
        sort$ = MID$(message$, sort, 1)
        IF sort$ = CHR$(13) THEN
            sort = sort + 1
            sorter = sorter + 1
        ELSE
            lines$(sorter) = lines$(sorter) + sort$
        END IF
        IF LEN(lines$(sorter)) = 80 THEN sorter = sorter + 1
    NEXT sort
    holdstart = _KEYDOWN(13)
    IF holdstart = 0 THEN
        hold = TIMER
    END IF
    IF nextexit = 1 THEN nextexit = 2
    IF (TIMER - hold) >= 1 THEN
        lined = 1
        nextexit = 1
    END IF
    _DISPLAY
LOOP UNTIL nextexit = 2
IF message$ = CHR$(255) THEN SYSTEM
message$ = MID$(message$, 2, (LEN(message$) - 1))
DO
    endneck$ = RIGHT$(message$, 2)
    IF endneck$ = cf$ THEN
        message$ = MID$(message$, 1, (LEN(message$) - 2))
    ELSE
        EXIT DO
    END IF
LOOP
log$ = ""
LOCATE 25, 1
PRINT "Would you like to include your log to help development? (y/n): "
_DISPLAY
DO
    _LIMIT 32
    k$ = INKEY$
    IF k$ = CHR$(27) THEN SYSTEM
    IF k$ = CHR$(89) OR k$ = CHR$(121) THEN log$ = "Y"
    IF k$ = CHR$(78) OR k$ = CHR$(110) THEN log$ = "N"
LOOP UNTIL log$ <> ""
LOCATE 25, 1
PRINT "Would you like to include your log to help development? (y/n): "; log$
settings$ = ""
LOCATE 26, 1
PRINT "Would you like to include your settings to help development? (y/n): "
_DISPLAY
DO
    _LIMIT 32
    k$ = INKEY$
    IF k$ = CHR$(27) THEN SYSTEM
    IF k$ = CHR$(89) OR k$ = CHR$(121) THEN settings$ = "Y"
    IF k$ = CHR$(78) OR k$ = CHR$(110) THEN settings$ = "N"
LOOP UNTIL settings$ <> ""
LOCATE 26, 1
PRINT "Would you like to include your settings to help development? (y/n): "; settings$
commands$ = ""
LOCATE 27, 1
PRINT "Would you like to include your custom commands to help development? (y/n): "
_DISPLAY
DO
    _LIMIT 32
    k$ = INKEY$
    IF k$ = CHR$(27) THEN SYSTEM
    IF k$ = CHR$(89) OR k$ = CHR$(121) THEN commands$ = "Y"
    IF k$ = CHR$(78) OR k$ = CHR$(110) THEN commands$ = "N"
LOOP UNTIL commands$ <> ""
LOCATE 27, 1
PRINT "Would you like to include your custom commands to help development? (y/n): "; commands$
_DISPLAY
_DELAY .5
LOCATE 30, 1
PRINT "Sending report, this may take a while. The program will close when it is done.";
_DISPLAY
SHELL _HIDE "wget http://checkip.dyndns.com/ -O ..\temp\globalIP.htm"
OPEN "..\temp\globalIP.htm" FOR INPUT AS #1
LINE INPUT #1, IP$
CLOSE
IP$ = MID$(IP$, INSTR(IP$, ":") + 2)
IP$ = LEFT$(IP$, INSTR(IP$, "<") - 1)
message$ = MID$(message$, 1, (LEN(message$) - spacerem))
message$ = "IP:" + IP$ + cf$ + cf$ + message$ + cf$ + cf$ + cf$ + cf$ + cf$ + cf$
IF log$ = "Y" THEN
    logmes$ = ""
    OPEN "..\data\log.jdf" FOR INPUT AS #1
    DO
        LINE INPUT #1, logmesline$
        logmes$ = logmes$ + logmesline$ + cf$
    LOOP UNTIL EOF(1) = -1
    CLOSE #1
    message$ = message$ + "log.jdf" + cf$ + logmes$
END IF
IF settings$ = "Y" THEN
    settingsmes$ = ""
    OPEN "..\data\jarvis.ini" FOR INPUT AS #1
    DO
        LINE INPUT #1, settingsmesline$
        settingsmes$ = settingsmes$ + settingsmesline$ + cf$
    LOOP UNTIL EOF(1) = -1
    CLOSE #1
    message$ = message$ + cf$ + cf$ + cf$ + cf$ + "jarvis.ini" + cf$ + cf$ + settingsmes$ + cf$
END IF
IF commands$ = "Y" THEN
    commandmes$ = ""
    REDIM cmdfiles$(32768)
    OPEN "..\source\customcmd.bas" FOR INPUT AS #1
    DO
        cmdfile = cmdfile + 1
        LINE INPUT #1, cmdfiles$(cmdfile)
    LOOP UNTIL EOF(1) = -1
    CLOSE #1
    FOR cmdget = 1 TO cmdfile
        cmdgetname$ = MID$(cmdfiles$(cmdget), 12, (LEN(cmdfiles$(cmdget)) - 12))
        commandmes$ = commandmes$ + cf$ + cf$ + cmdgetname$ + cf$
        OPEN cmdgetname$ FOR INPUT AS #1
        DO
            LINE INPUT #1, commandmesline$
            commandmes$ = commandmes$ + commandmesline$ + cf$
        LOOP UNTIL EOF(1) = -1
        CLOSE #1
    NEXT cmdget
    message$ = message$ + cf$ + cf$ + commandmes$
END IF
message$ = message$ + cf$ + cf$ + DATE$ + cf$ + TIME$
timestamp$ = RIGHT$(DATE$, 4) + LEFT$(DATE$, 2) + MID$(DATE$, 4, 2) + LEFT$(TIME$, 2) + MID$(TIME$, 4, 2) + RIGHT$(TIME$, 2)
OPEN "..\" + timestamp$ + "\.txt" FOR OUTPUT AS #1
PRINT #1, message$
CLOSE #1
OPEN "..\resources\server.inf" FOR INPUT AS #1
LINE INPUT #1, server$
CLOSE #1
SHELL _HIDE "wget --post-data=" + CHR$(34) + message$ + CHR$(34) + " " + server$
SYSTEM