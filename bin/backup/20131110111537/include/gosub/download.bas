download:
SHELL _HIDE "del /f /q temp\update\*.*"
SELECT CASE ostype%
    CASE 1
        ostype$ = "XP"
    CASE 2
        ostype$ = "Vista"
    CASE 3
        ostype$ = "7"
    CASE 4
        ostype$ = "Mac"
    CASE 5
        ostype$ = "Linux"
END SELECT
filelistloc$ = "http://dl.dropbox.com/u/30616191/JARVIS/Updates/" + ostype$ + "/" + LTRIM$(STR$(fileversion#)) + "/" + "filelist.txt"
getfilelist = _OPENCLIENT("TCP/IP:80:" + "dl.dropbox.com")
IF getfilelist THEN
    request$ = "GET " + filelistloc$ + " HTTP/1.0" + CR$ + CR$
    PUT #getfilelist, , request$
    _DELAY 2
    GET #getfilelist, , response$
    CLOSE #getfilelist
END IF
filelist$ = RIGHT$(response$, VAL(MID$(response$, ((INSTR(response$, "content-length: ")) + 16), ((INSTR(((INSTR(response$, "content-length: ")) + 16), response$, CHR$(10))) - ((INSTR(response$, "content-length: ")) + 16)))))
OPEN "filelist.tmp" FOR OUTPUT AS #1
PRINT #1, filelist$
CLOSE #1
REDIM updatelist$(1024)
updatelist = 0
OPEN "filelist.tmp" FOR INPUT AS #1
DO
    updatelist = updatelist + 1
    LINE INPUT #1, updatelist$(updatelist)
LOOP UNTIL EOF(1) = -1
CLOSE #1
KILL "filelist.tmp"
REDIM updateoutput$(1024)
FOR locfiles = 1 TO updatelist
    updateoutput$(locfiles) = "temp\update\" + updatelist$(locfiles)
    updatelist$(locfiles) = "http://dl.dropbox.com/u/30616191/JARVIS/Updates/" + ostype$ + "/" + LTRIM$(STR$(fileversion#)) + "/" + updatelist$(locfiles)
NEXT locfiles
dltotal = -1
CLS
DO
    FOR x = 1 TO updatelist
        link$ = updatelist$(x)
        f$ = updateoutput$(x)
        fd$ = ""
        DO
            FOR findfd = LEN(f$) TO 1 STEP -1
                IF INSTR(findfd, f$, "\") THEN
                    fd$ = MID$(f$, (findfd + 1))
                    EXIT DO
                END IF
            NEXT findfd
            IF fd$ = "" THEN fd$ = f$
            EXIT DO
        LOOP
        PRINT "Downloading ("; LTRIM$(RTRIM$(STR$(x))); "/"; LTRIM$(RTRIM$(STR$(updatelist))); ") "; fd$; " -";
        SELECT CASE Download(link$, f$, 0, CSRLIN, POS(0), _WIDTH(0) - POS(0) - 7)
            CASE 0
                dltotal = 0
                EXIT DO
            CASE 1
                dltotal = 1
                EXIT DO
            CASE 2
                dltotal = 2
                EXIT DO
        END SELECT
    NEXT x
    EXIT DO
LOOP
dlresponse$ = ""
SELECT CASE dltotal
    CASE 0
        dlresponse$ = "The download was unsuccessful due to an error"
    CASE 1
        dlresponse$ = "The download was unsuccessful due to a timeout" + CR$ + "This could be because of a slow connection or some other error"
    CASE 2
        dlresponse$ = "The download was unseccessful because a connection could not be made" + CR$ + "This could be because of no internet or some other error"
END SELECT
SELECT CASE dlresponse$
    CASE ""
        DO
            _LIMIT 64
            CLS
            PRINT "The download was successful!"
            PRINT "Press any key to begin the update"
            k$ = INKEY$
            _DISPLAY
        LOOP UNTIL k$ <> ""
        SHELL _HIDE "start " + updateoutput$(1)
        _DELAY 2
        SYSTEM
    CASE ELSE
        DO
            _LIMIT 64
            CLS
            PRINT dlresponse$
            PRINT "You can download the updates manually from the webpage, to go there say 'website' or 'webpage'"
            PRINT "Press any key to return to JARVIS"
            k$ = INKEY$
            _DISPLAY
        LOOP UNTIL k$ <> ""
END SELECT
RETURN