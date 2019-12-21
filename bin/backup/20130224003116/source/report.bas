_TITLE "Report"
SCREEN 13
icon = _LOADIMAGE("..\resources\jarvis.png")
_ICON icon
SCREEN 12
cf$ = CHR$(13) + CHR$(10)
REDIM lines$(16384)
uemail$ = "jarvis.report@gmx.com"
upass$ = "jarvisreport"
remail$ = "jarvis.dla@gmx.com"
REDIM getset$(256)
OPEN "..\data\jarvis.ini" FOR INPUT AS #1
DO
    getset = getset + 1
    LINE INPUT #1, getset$(getset)
LOOP UNTIL getset$(getset) = ""
CLOSE #1
id$ = getset$(6)
emailaddress$ = getset$(36)
DO
    _LIMIT 32
    CLS
    k$ = INKEY$
    PRINT "Please take a minute to tell me about your experience with Jarvis. You could include things you like complaints or ideas you have. Your opinion is very important to me and to the development of this program. If you do not want to help evolve the program with your input, submit an empty message and the program will close without sending anything. To submit a message press [End]. Please write a message below:"
    PRINT
    VIEW PRINT 8 TO 24
    FOR lineprint = lined TO (lined + 15)
        PRINT lines$(lineprint)
    NEXT lineprint
    VIEW PRINT
    IF k$ = CHR$(13) THEN message$ = message$ + cf$
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
    IF k$ = (CHR$(0) + CHR$(79)) THEN EXIT DO
    IF k$ = (CHR$(0) + CHR$(80)) THEN lined = lined + 1
    DO WHILE _MOUSEINPUT
        lined = lined + _MOUSEWHEEL
    LOOP
    IF lined < 1 THEN lined = 1
    DO
        IF lines$(lined) = "" AND lined > 1 THEN
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
    _DISPLAY
LOOP UNTIL nextexit = 2
IF message$ = "" THEN SYSTEM
DO
    endneck$ = RIGHT$(message$, 2)
    IF endneck$ = cf$ THEN
        message$ = MID$(message$, 1, (LEN(message$) - 2))
    ELSE
        EXIT DO
    END IF
LOOP
settings$ = ""
LOCATE 25, 1
PRINT "Would you like to include your settings to help development? (y/n): "
_DISPLAY
DO
    _LIMIT 32
    k$ = INKEY$
    IF k$ = CHR$(27) THEN SYSTEM
    IF k$ = CHR$(89) OR k$ = CHR$(121) THEN settings$ = "Y"
    IF k$ = CHR$(78) OR k$ = CHR$(110) THEN settings$ = "N"
LOOP UNTIL settings$ <> ""
LOCATE 25, 1
PRINT "Would you like to include your settings to help development? (y/n): "; settings$
commands$ = ""
LOCATE 26, 1
PRINT "Would you like to include your custom commands to help development? (y/n): "
_DISPLAY
DO
    _LIMIT 32
    k$ = INKEY$
    IF k$ = CHR$(27) THEN SYSTEM
    IF k$ = CHR$(89) OR k$ = CHR$(121) THEN commands$ = "Y"
    IF k$ = CHR$(78) OR k$ = CHR$(110) THEN commands$ = "N"
LOOP UNTIL commands$ <> ""
LOCATE 26, 1
PRINT "Would you like to include your custom commands to help development? (y/n): "; commands$
log$ = ""
LOCATE 27, 1
PRINT "Would you like to include your log to help development? (y/n): "
_DISPLAY
DO
    _LIMIT 32
    k$ = INKEY$
    IF k$ = CHR$(27) THEN SYSTEM
    IF k$ = CHR$(89) OR k$ = CHR$(121) THEN log$ = "Y"
    IF k$ = CHR$(78) OR k$ = CHR$(110) THEN log$ = "N"
LOOP UNTIL log$ <> ""
LOCATE 27, 1
PRINT "Would you like to include your log to help development? (y/n): "; log$
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
IF settings$ = "Y" THEN
    settingsmes$ = ""
    REDIM setmes$(256)
    OPEN "..\data\jarvis.ini" FOR INPUT AS #1
    DO
        setmes = setmes + 1
        LINE INPUT #1, setmes$(setmes)
        IF setmes$(setmes) = "" THEN EXIT DO
        settingsmes$ = settingsmes$ + setmes$(setmes) + cf$
    LOOP
    CLOSE #1
    message$ = message$ + cf$ + cf$ + cf$ + cf$ + "jarvis.ini" + cf$ + cf$ + settingsmes$ + cf$
END IF
IF commands$ = "Y" THEN
    commandmes$ = ""
    REDIM cmdfiles$(32768)
    OPEN "..\include\customcmd.bas" FOR INPUT AS #1
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
        commandmes$ = commandmes$ + cf$ + cf$
    NEXT cmdget
    message$ = message$ + cf$ + cf$ + cf$ + commandmes$
END IF
IF log$ = "Y" THEN
    logmes$ = ""
    OPEN "..\data\log.jdf" FOR INPUT AS #1
    DO
        LINE INPUT #1, logmesline$
        logmes$ = logmes$ + logmesline$ + cf$
    LOOP UNTIL EOF(1) = -1
    CLOSE #1
    OPEN "..\data\log.jdf" FOR OUTPUT AS #1
    PRINT #1, ""
    CLOSE #1
    message$ = message$ + cf$ + cf$ + cf$ + cf$ + "log.jdf" + cf$ + logmes$
END IF
message$ = message$ + cf$ + cf$ + cf$ + cf$ + DATE$ + cf$ + TIME$ + cf$ + cf$ + emailaddress$ + cf$ + id$
timestamp$ = RIGHT$(DATE$, 4) + LEFT$(DATE$, 2) + MID$(DATE$, 4, 2) + LEFT$(TIME$, 2) + MID$(TIME$, 4, 2) + RIGHT$(TIME$, 2)
messageloc$ = "..\data\reports\" + timestamp$ + ".txt"
OPEN messageloc$ FOR OUTPUT AS #1
PRINT #1, message$
CLOSE #1
flag = 0
CALL email(uemail$, upass$, remail$, id$, messageloc$, flag)
CLS
IF flag THEN
    PRINT "Report sent successfully!"
ELSE
    PRINT "There was an error sending the report!"
END IF
_DISPLAY
SLEEP
SYSTEM

'$include:'..\include\func\bin.bas'
'$include:'..\include\func\convbase64.bas'
'$include:'..\include\func\todecimal.bas'
'$include:'..\include\sub\email.bas'