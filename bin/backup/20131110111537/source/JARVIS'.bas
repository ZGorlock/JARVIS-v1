'


ON ERROR GOTO sierr
OPEN "temp\si.tmp" FOR OUTPUT AS #3
LOCK #3
sierrpass:
ON ERROR GOTO 0

_FULLSCREEN
_DELAY 1
_SCREENCLICK 1, 1
SOUND 0, 0
_FULLSCREEN _OFF
_SCREENHIDE
_TITLE "JARVIS"
SCREEN 13
icon& = _LOADIMAGE("resources\jarvis.png")
_ICON icon&
SCREEN 0
WIDTH 64, 13

DIM SHARED crlf$
DIM SHARED ostype
DIM SHARED dq$
DIM SHARED version#
crlf$ = CHR$(13) + CHR$(10)
ostype = 1
dq$ = CHR$(34)
version# = .01
DEFDBL A-Z


DECLARE DYNAMIC LIBRARY "kernel32"
    FUNCTION GetLastError~& ()
    FUNCTION MultiByteToWideChar& (BYVAL CodePage~&, BYVAL dwFlags~&, BYVAL lpMultiByteStr~%&, BYVAL cbMultiByte&, BYVAL lpWideCharStr~%&, BYVAL cchWideChar&)
    FUNCTION OpenProcess%& (BYVAL dwDesiredAccess~&, BYVAL bInheritHandle&, BYVAL dwProcessId~&)
    FUNCTION TerminateProcess& (BYVAL hProcess%&, BYVAL uExitCode~&)
    FUNCTION WaitForSingleObject~& (BYVAL hHandle%&, BYVAL dwMilliseconds~&)
END DECLARE
DECLARE DYNAMIC LIBRARY "ole32"
    FUNCTION CoCreateInstance& (BYVAL rclsid%&, BYVAL pUnkOuter%&, BYVAL dwClsContext&, BYVAL riid%&, BYVAL ppv%&)
    FUNCTION CoInitializeEx& (BYVAL pvReserved%&, BYVAL dwCoInit~&)
    SUB CoTaskMemFree (BYVAL pv%&)
    SUB CoUninitialize ()
END DECLARE
DECLARE CUSTOMTYPE LIBRARY "..\lib\peekpoke"
    FUNCTION peekb~%% (BYVAL p~%&)
    FUNCTION peekw~% (BYVAL p~%&)
    FUNCTION peekd~& (BYVAL p~%&)
    FUNCTION peekp~%& (BYVAL p~%&)
    FUNCTION peekq~&& (BYVAL p~%&)
    SUB pokeb (BYVAL p~%&, BYVAL n~%%)
    SUB pokew (BYVAL p~%&, BYVAL n~%)
    SUB poked (BYVAL p~%&, BYVAL n~&)
    SUB pokep (BYVAL p~%&, BYVAL n~%&)
    SUB pokeq (BYVAL p~%&, BYVAL n~&&)
END DECLARE
DECLARE DYNAMIC LIBRARY "powrprof"
    FUNCTION SetSuspendState
END DECLARE
DECLARE CUSTOMTYPE LIBRARY "..\lib\text_speak_qb64"
    FUNCTION dABSOLUTEpdddpp~& (BYVAL pf%&, BYVAL v0%&, BYVAL v1~&, BYVAL v2~&, BYVAL v3~&, BYVAL v4%&, BYVAL v5%&)
    FUNCTION dABSOLUTEpdpp~& (BYVAL pf%&, BYVAL v0%&, BYVAL v1~&, BYVAL v2%&, BYVAL v3%&)
    FUNCTION dABSOLUTEpd~& (BYVAL pf%&, BYVAL v0%&, BYVAL v1~&)
    FUNCTION dABSOLUTEppdp~& (BYVAL pf%&, BYVAL v0%&, BYVAL v1%&, BYVAL v2~&, BYVAL v3%&)
    FUNCTION dABSOLUTEppd~& (BYVAL pf%&, BYVAL v0%&, BYVAL v1%&, BYVAL v2~&)
    FUNCTION dABSOLUTEppp~& (BYVAL pf%&, BYVAL v0%&, BYVAL v1%&, BYVAL v2%&)
    FUNCTION dABSOLUTEpqp~& (BYVAL pf%&, BYVAL v0%&, BYVAL v1~&&, BYVAL v2%&)
    FUNCTION dABSOLUTEp~& (BYVAL pf%&, BYVAL v0%&)
    SUB vABSOLUTEp ALIAS dABSOLUTEp (BYVAL pf%&, BYVAL v0%&)
END DECLARE
DECLARE DYNAMIC LIBRARY "user32"
    FUNCTION CloseWindow (BYVAL hWnd%&)
    FUNCTION DefWindowProcA& (BYVAL hwnd&, BYVAL wMsg&, BYVAL wParam&, BYVAL lParam&)
    FUNCTION GetCursorPos (BYVAL lpPoint%&)
    FUNCTION GetDesktopWindow%& ()
    FUNCTION GetForegroundWindow%& ()
    FUNCTION GetWindowThreadProcessId~& (BYVAL hWnd%&, BYVAL lpdwProcessId%&)
    FUNCTION GetSystemMetrics (BYVAL nIndex~&)
    FUNCTION LockWorkStation
    FUNCTION OpenInputDesktop%& (BYVAL dwFlags%&, BYVAL fInherit%&, BYVAL dwDesiredAccess%&)
    FUNCTION SendMessageA& (BYVAL hwnd&, BYVAL wMsg&, BYVAL wParam&, BYVAL lParam&)
    FUNCTION SendMessageTimeoutW%& (BYVAL hWnd%&, BYVAL Msg~&, BYVAL wParam%&, BYVAL lParam%&, BYVAL fuFlags~&, BYVAL uTimeout~&, BYVAL lpdwResult%&)
    FUNCTION SetThreadDesktop%& (BYVAL hDesktop%&)
    FUNCTION SystemParametersInfoW& (BYVAL uiAction~&, BYVAL uiParam~&, BYVAL pvParam%&, BYVAL fWinlni~&)
END DECLARE
DECLARE LIBRARY
    FUNCTION GetAsyncKeyState (BYVAL vkey~&)
END DECLARE
DECLARE CUSTOMTYPE LIBRARY
    FUNCTION FindWindow& (BYVAL ClassName%&, WindowName$)
    FUNCTION peekpoke_strnlen~%& ALIAS "strnlen" (BYVAL str~%&, BYVAL numberOfElements~%&)
    FUNCTION ShowWindow& (BYVAL hwnd&, BYVAL nCmdShow&)
    SUB memcpy (BYVAL dest~%&, BYVAL src~%&, BYVAL count~%&)
    SUB peekpoke_memcpy ALIAS "memcpy" (BYVAL dest~%&, BYVAL src~%&, BYVAL count~%&)
END DECLARE



TYPE GUID
    Data1 AS _UNSIGNED LONG
    Data2 AS _UNSIGNED INTEGER
    Data3 AS _UNSIGNED INTEGER
    data4 AS _UNSIGNED _INTEGER64
END TYPE
TYPE LPPOINT
    x AS _UNSIGNED LONG
    y AS _UNSIGNED LONG
END TYPE
TYPE RECT
    left AS LONG
    top AS LONG
    right AS LONG
    bottom AS LONG
END TYPE
TYPE SPEVENT
    eEventId AS _UNSIGNED INTEGER
    elParamType AS _UNSIGNED INTEGER
    ulStreamNum AS _UNSIGNED LONG
    ullAudioStreamOffset AS _UNSIGNED _INTEGER64
    wParam AS _OFFSET
    lParam AS _OFFSET
END TYPE
TYPE SPVOICESTATUS
    ulCurrentStream AS _UNSIGNED LONG
    ulLastStreamQueued AS _UNSIGNED LONG
    hrLastResult AS _UNSIGNED LONG
    dwRunningState AS _UNSIGNED LONG
    ulInputWordPos AS _UNSIGNED LONG
    ulInputWordLen AS _UNSIGNED LONG
    ulInputSentPos AS _UNSIGNED LONG
    ulInputSentLen AS _UNSIGNED LONG
    lBookmarkId AS LONG
    PhonemeId AS _UNSIGNED INTEGER
    padding AS INTEGER
    VisemeId AS LONG
    dwReserved1 AS _UNSIGNED LONG
    dwReserved2 AS _UNSIGNED LONG
END TYPE



CONST CLSCTX_INPROC_SERVER = &H1
CONST CLSCTX_INPROC_HANDLER = &H2
CONST CLSCTX_LOCAL_SERVER = &H4
CONST CLSCTX_REMOTE_SERVER = &H10
CONST CLSCTX_ALL = CLSCTX_INPROC_SERVER OR CLSCTX_INPROC_HANDLER OR CLSCTX_LOCAL_SERVER OR CLSCTX_REMOTE_SERVER
CONST COINIT_MULTITHREADED = &H0
CONST COINIT_APARTMENTTHREADED = &H2
CONST COINIT_DISABLE_OLE1DDE = &H4
CONST COINIT_SPEED_OVER_MEMORY = &H8
CONST CP_UTF8 = 65001
CONST DayFriday = 5
CONST DayMonday = 1
CONST DayThursday = 4
CONST DayTuesday = 2
CONST DaySaturday = 6
CONST DaySunday = 0
CONST DayWednesday = 3
CONST False = -1
CONST GENERIC_ALL = 268435456
CONST HK_ALT = &H400
CONST HK_CTRL = &H200
CONST HK_SHIFT = &H100
CONST LocIni = "data\jarvis.ini"
CONST LocNircmd = "resources\nircmd"
CONST LocWget = "resources\wget"
CONST NumOfCountryCode = 238
CONST NumOfCountryCodeData = 4
CONST NumOfElement = 118
CONST NumOfElementData = 20
CONST NumOfFact = 1448
CONST NumOfJoke = 9808
CONST NumOfLanguageCode = 185
CONST NumOfLanguageCodeData = 3
CONST NumOfLexicon = 44578
CONST NumOfQuote = 319
CONST PROCESS_QUERY_INFORMATION = &H400
CONST PROCESS_VM_READ = &H10
CONST SPI_GETWORKAREA = &H30
CONST SYNCHRONIZE = &H100000
CONST True = 0
CONST WM_CLOSE = &H10
CONST WM_SETHOTKEY = &H32
CONST WM_SHOWWINDOW = &H18



DIM CLSID_SpVoice AS GUID
DIM IID_ISpVoice AS GUID
DIM CLSID_SpSharedRecoContext AS GUID
DIM IID_ISpRecoContext AS GUID
DIM LPP AS LPPOINT
DIM Rec AS RECT
DIM Event AS SPEVENT
DIM voiceStatus AS SPVOICESTATUS



REDIM alarms$(32)
REDIM cloc(8)
REDIM closetime(16384)
REDIM commandfiles$(256)
REDIM commands$(2048)
REDIM commandwords$(32)
REDIM comparex(32)
REDIM comparey(32)
REDIM countrycodes$(NumOfCountryCode, NumOfCountryCodeData)
REDIM definition$(4, 1024)
REDIM dirload$(1048576)
REDIM elements$(NumOfElement, NumOfElementData)
REDIM emotionsneg$(64)
REDIM emotionspos$(64)
REDIM eventindex(1024)
REDIM events$(1024, 3)
REDIM factors(1024)
REDIM inidata$(256)
REDIM inputrecord$(32768)
REDIM inword$(NumOfLexicon)
REDIM jarvisini$(65536)
REDIM keys(32)
REDIM languagecodes$(NumOfLanguageCode, NumOfLanguageCodeData)
REDIM letters$(32)
REDIM lex$(NumOfLexicon)
REDIM loadcommand$(1024)
REDIM loadcustom$(256)
REDIM message$(65536)
REDIM movecustom$(256)
REDIM outputrecord$(32768)
REDIM packcommands$(32768)
REDIM packs$(128)
REDIM proglnk$(32768)
REDIM progname$(32768)
REDIM query$(256)
REDIM readevent$(128)
REDIM swcd$(1024)
REDIM synonym$(4, 1024)
REDIM synsetcount(4)
REDIM templetters$(32)
REDIM timers$(32)
REDIM timersay$(32)
REDIM updatelist$(64)
REDIM updateoutput$(64)
REDIM usercommand$(128)
REDIM userinput$(256)
REDIM userinputcopy$(128)
REDIM winini$(1024)

REDIM msdata$(2056)
REDIM msmonster$(39, 2048)
REDIM msmonsterfile$(2048)

IF _FILEEXISTS("temp\firsttime.tmp") THEN
    ON ERROR GOTO skipintro
    SHELL _HIDE "cd > temp\jarvisloc.tmp"
    OPEN "temp\jarvisloc.tmp" FOR INPUT AS #1
    INPUT #1, jarvisloc$
    CLOSE #1
    KILL "temp\jarvisloc.tmp"
    OPEN "C:\WINDOWS\jarvisloc.jdf" FOR OUTPUT AS #1
    PRINT #1, jarvisloc$
    CLOSE #1
    versionfile$ = "C:" + ENVIRON$("HOMEPATH") + "\Application Data\JARVIS\version.jdf"
    osfile$ = "C:" + ENVIRON$("HOMEPATH") + "\Application Data\JARVIS\os.jdf"
    SHELL _HIDE "mkdir " + CHR$(34) + "C:" + ENVIRON$("HOMEPATH") + "\Application Data\JARVIS" + CHR$(34)
    OPEN versionfile$ FOR OUTPUT AS #1
    PRINT #1, version#
    CLOSE #1
    OPEN osfile$ FOR OUTPUT AS #1
    PRINT #1, ostype%
    CLOSE #1
    bootdate$ = DATE$
    boottime$ = TIME$
    boottimer = TIMER
    SHELL _HIDE "copy " + CHR$(34) + jarvisloc$ + "\resources\mkshortcut.vbs" + CHR$(34) + " C:\WINDOWS\System32\mkshortcut.vbs"
    SHELL _HIDE "copy " + CHR$(34) + jarvisloc$ + "\resources\showdesktop.scf" + CHR$(34) + " C:\WINDOWS\System32\showdesktop.scf"
    SHELL _HIDE "copy " + CHR$(34) + jarvisloc$ + "\resources\PsInfo.exe" + CHR$(34) + " C:\WINDOWS\PsInfo.exe"
    SHELL _HIDE "copy " + CHR$(34) + jarvisloc$ + "\resources\memsnap.exe" + CHR$(34) + " C:\WINDOWS\memsnap.exe"
    SHELL _HIDE "copy " + CHR$(34) + jarvisloc$ + "\resources\mp3info.exe" + CHR$(34) + " C:\WINDOWS\mp3info.exe"
    SHELL _HIDE "batch\pathman.bat"
    _DELAY 1
    SHELL _DONTWAIT _HIDE "pathman /au ..\lib\;lib\"
    SHELL _HIDE "copy /y *.dll lib\*.dll"
    SHELL _HIDE "copy /y *.h lib\*.h"
    SHELL _HIDE "copy /y *.o lib\*.o"
    SHELL _HIDE "copy /y *.dll C:\WINDOWS\system32\*.dll"
    SHELL _HIDE "del /f /q *.dll"
    SHELL _HIDE "del /f /q *.h"
    SHELL _HIDE "del /f /q *.o"
    SHELL _HIDE "batch\cfb.bat"
    SHELL _DONTWAIT _HIDE "copy /y " + CHR$(34) + "..\source\JARVIS.bas" + CHR$(34) + " " + CHR$(34) + "..\bin\backup\bas\0.bas" + CHR$(34)
    SHELL _DONTWAIT _HIDE "copy /y " + CHR$(34) + "..\JARVIS.exe" + CHR$(34) + " " + CHR$(34) + "..\bin\backup\exe\0.exe" + CHR$(34)
    SHELL _DONTWAIT _HIDE "copy /y " + CHR$(34) + "..\include\customcmd.bas" + CHR$(34) + " " + CHR$(34) + "..\snapshots\0\customcmd.bas" + CHR$(34)
    SHELL _DONTWAIT _HIDE "copy /y " + CHR$(34) + "..\data\*.*" + CHR$(34) + " " + CHR$(34) + "..\snapshots\0\*.*" + CHR$(34)
    SHELL _DONTWAIT _HIDE "copy /y " + CHR$(34) + "..\tools\dimscreen.ini" + CHR$(34) + " " + CHR$(34) + "..\snapshots\0\dimscreen.ini" + CHR$(34)
    desktoppath$ = "C:" + ENVIRON$("HOMEPATH") + "\Desktop\jarvis"
    SHELL _HIDE "mkshortcut /target:" + CHR$(34) + jarvisloc$ + "\JARVIS.exe" + CHR$(34) + " /shortcut:" + CHR$(34) + desktoppath$ + CHR$(34)
    SHELL _HIDE "mkshortcut /target:" + CHR$(34) + jarvisloc$ + "\JARVIS.exe" + CHR$(34) + " /shortcut:" + CHR$(34) + jarvisloc$ + "\bin\jarvis" + CHR$(34)
    SHELL _HIDE "mkshortcut /target:" + CHR$(34) + jarvisloc$ + "\JARVIS.exe" + CHR$(34) + " /shortcut:" + CHR$(34) + jarvisloc$ + "\bin\clean\jarvis" + CHR$(34)
    SHELL _HIDE "mkdir " + CHR$(34) + "C:\Documents and Settings\All Users\Start Menu\Programs\JARVIS" + CHR$(34)
    SHELL _HIDE "mkshortcut /target:" + CHR$(34) + jarvisloc$ + "\JARVIS.exe" + CHR$(34) + " /shortcut:" + CHR$(34) + "C:\Documents and Settings\All Users\Start Menu\Programs\JARVIS\jarvis" + CHR$(34)
    startuppath$ = "C:" + ENVIRON$("HOMEPATH") + "\Start Menu\Programs\Startup\~startuptime"
    SHELL _DONTWAIT _HIDE "mkshortcut /target:" + CHR$(34) + jarvisloc$ + "\tools\startuptime.exe" + CHR$(34) + " /shortcut:" + CHR$(34) + startuppath$ + CHR$(34)
    SHELL _DONTWAIT _HIDE "mkshortcut /target:" + CHR$(34) + jarvisloc$ + "\tools\startuptime.exe" + CHR$(34) + " /shortcut:" + CHR$(34) + jarvisloc$ + "\bin\~startuptime" + CHR$(34)
    SHELL _DONTWAIT _HIDE "mkshortcut /target:" + CHR$(34) + jarvisloc$ + "\tools\startuptime.exe" + CHR$(34) + " /shortcut:" + CHR$(34) + jarvisloc$ + "\bin\clean\~startuptime" + CHR$(34)



    SHELL _HIDE "dir " + CHR$(34) + "C:\Documents and Settings\All Users\Start Menu\Programs" + CHR$(34) + " /b /s > " + CHR$(34) + "C:\dirload.txt"
    REDIM dirload$(1048576)
    dirload = 0
    OPEN "C:\dirload.txt" FOR INPUT AS #1
    DO
        dirload = dirload + 1
        LINE INPUT #1, dirload$(dirload)
    LOOP UNTIL EOF(1) = -1
    CLOSE #1
    KILL "C:\dirload.txt"
    proglnk$(1) = "{}"
    progname$(1) = "{}"
    proglnk = 0
    FOR proglnks = 1 TO dirload
        IF UCASE$(RIGHT$(dirload$(proglnks), 3)) = "LNK" THEN
            programlnkload = programlnkload + 1
            programnameload = programnameload + 1
            proglnk$(programlnkload) = dirload$(proglnks)
            DO
                FOR getprogname = (LEN(dirload$(proglnks)) - 4) TO 1 STEP -1
                    getprogname$ = MID$(dirload$(proglnks), getprogname)
                    IF LEFT$(getprogname$, 1) = "\" THEN
                        progname$(programnameload) = MID$(getprogname$, 2, (LEN(getprogname$) - 5))
                        EXIT DO
                    END IF
                NEXT getprogname
                EXIT DO
            LOOP
        END IF
    NEXT proglnks
    FOR programdel = 2 TO (programlnkload - 1)
        IF proglnk$(programdel) = proglnk$(programdel - 1) OR proglnk$(programdel) = proglnk$(programdel + 1) THEN proglnk$(programdel) = ""
    NEXT programdel
    FOR programrep = 1 TO programlnkload
        IF proglnk$(programrep) = "" THEN
            FOR programreps = programrep TO programlnkload
                proglnk$(programreps) = proglnk$(programreps + 1)
            NEXT programreps
        END IF
        IF progname$(programrep) = "" THEN
            FOR programreps = programrep TO programlnkload
                progname$(programreps) = progname$(programreps + 1)
            NEXT programreps
        END IF
    NEXT programrep



    SHELL _HIDE "dir " + CHR$(34) + "C:" + ENVIRON$("HOMEPATH") + "\My Documents\My Music" + CHR$(34) + " /b /s > " + CHR$(34) + "C:\dirload.txt"
    REDIM dirload$(1048576)
    dirload = 0
    OPEN "C:\dirload.txt" FOR INPUT AS #1
    DO
        dirload = dirload + 1
        LINE INPUT #1, dirload$(dirload)
    LOOP UNTIL EOF(1) = -1
    CLOSE #1
    KILL "C:\dirload.txt"
    musiclnk$(1) = "{}"
    musiclnk = 0
    FOR musiclnks = 1 TO dirload
        IF UCASE$(RIGHT$(dirload$(musiclnks), 3)) = "MP3" THEN
            musiclnkload = musiclnkload + 1
            musicnameload = musicnameload + 1
            musiclnk$(musiclnkload) = dirload$(musiclnks)
        END IF
    NEXT musiclnks
    FOR musicrep = 1 TO musiclnkload
        IF musiclnk$(musicrep) = "" THEN
            FOR musicreps = musicrep TO musiclnkload
                musiclnk$(musicreps) = musiclnk$(musicreps + 1)
            NEXT musicreps
        END IF
    NEXT musicrep
    IF _FILEEXISTS("C:\Program Files\JARVIS\temp\profile\jarvis.ini") = -1 THEN
        SHELL _HIDE "copy /y " + CHR$(34) + "C:\Program Files\JARVIS\temp\profile\jarvis.ini" + CHR$(34) + " data\jarvis.ini"
        SHELL _HIDE "copy /y " + CHR$(34) + "C:\Program Files\JARVIS\temp\profile\dimscreen.ini" + CHR$(34) + " tools\dimscreen.ini"
        SHELL _HIDE "copy /y " + CHR$(34) + "C:\Program Files\JARVIS\temp\profile\log.jdf" + CHR$(34) + " data\log.jdf"
        SHELL _HIDE "copy /y " + CHR$(34) + "C:\Program Files\JARVIS\temp\profile\customcmd.bas" + CHR$(34) + " customcmd.bas"
        SHELL _HIDE "copy /y " + CHR$(34) + "C:\Program Files\JARVIS\temp\profile\alarm.*" + CHR$(34) + " resources\alarm.*"
        SHELL _HIDE "xcopy /s /y " + CHR$(34) + "C:\Program Files\JARVIS\temp\profile\customcmd" + CHR$(34) + " customcmd\"
        SHELL _HIDE "xcopy /s /y " + CHR$(34) + "C:\Program Files\JARVIS\temp\profile\snapshots" + CHR$(34) + " snapshots\"
    END IF
END IF
skipintro:

versionfile$ = "C:" + ENVIRON$("HOMEPATH") + "\Application Data\JARVIS\version.jdf"
IF _FILEEXISTS(versionfile$) = 0 THEN
    SHELL _HIDE "mkdir " + CHR$(34) + "C:" + ENVIRON$("HOMEPATH") + "\Application Data\JARVIS" + CHR$(34)
    OPEN versionfile$ FOR OUTPUT AS #1
    PRINT #1, version#
    CLOSE #1
END IF
OPEN versionfile$ FOR INPUT AS #1
INPUT #1, fileversion#
CLOSE #1
DO
    IF fileversion# <> version# THEN
        SELECT CASE fileversion#
            CASE .01
        END SELECT
    END IF
LOOP UNTIL fileversion# = version#
OPEN versionfile$ FOR OUTPUT AS #1
PRINT #1, version#
CLOSE #1

OPEN "data\jarvis.ini" FOR INPUT AS #1
iniblock = 1
DO
    jarvisini = jarvisini + 1
    LINE INPUT #1, jarvisini$(jarvisini)
    IF LEFT$(jarvisini$(jarvisini), 1) <> "[" THEN
        IF jarvisini$(jarvisini) <> "" THEN
            SELECT CASE iniblock
                CASE 1
                    inidata = inidata + 1
                    inidata$(inidata) = jarvisini$(jarvisini)
                CASE 2
                    commandcount = commandcount + 1
                    loadcommands = loadcommands + 1
                    loadcommand$(loadcommands) = jarvisini$(jarvisini)
                    commands$(commandcount) = jarvisini$(jarvisini)
                CASE 3
                    commandcount = commandcount + 1
                    loadcustom = loadcustom + 1
                    loadcustom$(loadcustom) = jarvisini$(jarvisini)
                    commands$(commandcount) = jarvisini$(jarvisini)
                CASE 4
                    IF firsttime <> 1 THEN
                        programlnkload = programlnkload + 1
                        proglnk$(programlnkload) = jarvisini$(jarvisini)
                    END IF
                CASE 5
                    IF firsttime <> 1 THEN
                        programnameload = programnameload + 1
                        progname$(programnameload) = jarvisini$(jarvisini)
                    END IF
                CASE 6
                    emotionsposcount = emotionsposcount + 1
                    emotionspos$(emotionsposcount) = jarvisini$(jarvisini)
                CASE 7
                    emotionsnegcount = emotionsnegcount + 1
                    emotionsneg$(emotionsnegcount) = jarvisini$(jarvisini)
                CASE 8
                    alarms = alarms + 1
                    alarms$(alarms) = jarvisini$(jarvisini)
                CASE 9
                    closetimes = closetimes + 1
                    closetime(closetimes) = VAL(jarvisini$(jarvisini))
                CASE 10
                    packs = packs + 1
                    packs$(packs) = jarvisini$(jarvisini)
            END SELECT
        ELSE
            iniblock = iniblock + 1
        END IF
    END IF
LOOP UNTIL EOF(1) = -1
CLOSE #1
packcommands = 1


OPEN "packs\maplestory\data\commands.txt" FOR INPUT AS #1
DO
    packcommands = packcommands + 1
    commandcount = commandcount + 1
    LINE INPUT #1, inputcommand$
    packcommands$(packcommands) = inputcommand$
    commands$(commandcount) = inputcommand$
LOOP UNTIL EOF(1) = -1
CLOSE #1
IF jarvisloc$ = "" THEN jarvisloc$ = inidata$(1)
IF bootdate$ = "" THEN bootdate$ = inidata$(2)
IF boottime$ = "" THEN boottime$ = inidata$(3)
IF boottimer = 0 THEN boottimer = VAL(inidata$(4))
id$ = inidata$(5)
username$ = inidata$(6)
recognition = VAL(inidata$(7))
textcolor = VAL(inidata$(8))
standbytoggle = VAL(inidata$(9))
standbytime## = VAL(inidata$(10))
timepref = VAL(inidata$(11))
anglepref = VAL(inidata$(12))
afirmpref = VAL(inidata$(13))
alertpref = VAL(inidata$(14))
volincr = VAL(inidata$(15))
ssloc$ = inidata$(16)
ssfile$ = inidata$(17)
speed& = VAL(inidata$(18))
buffer& = VAL(inidata$(19))
IF screenx = 0 THEN screenx = VAL(inidata$(20))
IF screeny = 0 THEN screeny = VAL(inidata$(21))
IF workareax = 0 THEN workareax = VAL(inidata$(22))
IF workareay = 0 THEN workareay = VAL(inidata$(23))
screenpos = VAL(inidata$(24))
transparency = VAL(inidata$(25))
mdpath$ = inidata$(26)
downloadpath$ = inidata$(27)
updatecheck = VAL(inidata$(28))
skipversion# = VAL(inidata$(29))
programdir$ = inidata$(30)
musicdir$ = inidata$(31)
sndvol# = VAL(inidata$(32))
songs = VAL(inidata$(33))
IF songs = 0 THEN songs = musicnameload
programs = VAL(inidata$(34))
IF programs = 0 THEN programs = programnameload
emailaddress$ = inidata$(35)
zipcode = VAL(inidata$(36))
prognum = VAL(inidata$(37))
songnum = VAL(inidata$(38))
lang$ = inidata$(39)
saveyear = VAL(inidata$(40))
eventnum = VAL(inidata$(41))
birthday$ = inidata$(42)
SHELL _HIDE "chdir " + CHR$(34) + jarvisloc$ + CHR$(34)
OPEN "data\log.jdf" FOR APPEND AS #2

OPEN "resources\db\countrycode.jdb" FOR INPUT AS #1
FOR country = 1 TO NumOfCountryCode
    FOR countrydata = 1 TO NumOfCountryCodeData
        LINE INPUT #1, countrycodes$(country, countrydata)
NEXT countrydata, country
CLOSE #1
OPEN "resources\db\element.jdb" FOR INPUT AS #1
FOR element = 1 TO NumOfElement
    FOR elementdata = 1 TO NumOfElementData
        LINE INPUT #1, elements$(element, elementdata)
NEXT elementdata, element
CLOSE #1
OPEN "resources\db\event.jdb" FOR INPUT AS #1
FOR eventget = 1 TO eventnum
    FOR eventdata = 1 TO 3
        LINE INPUT #1, events$(eventget, eventdata)
NEXT eventdata, eventget
CLOSE #1
OPEN "resources\db\languagecode.jdb" FOR INPUT AS #1
FOR language = 1 TO NumOfLanguageCode
    FOR languagedata = 1 TO NumOfLanguageCodeData
        LINE INPUT #1, languagecodes$(language, languagedata)
NEXT languagedata, language
CLOSE #1
OPEN "resources\db\lexicon.jdb" FOR INPUT AS #1
FOR lex = 1 TO NumOfLexicon
    LINE INPUT #1, lex$(lex)
NEXT lex
CLOSE #1


tone1 = _SNDOPEN("resources\tone1.ogg", "VOL, SYNC")
tone2 = _SNDOPEN("resources\tone2.ogg", "VOL, SYNC")
tone3 = _SNDOPEN("resources\tone3.ogg", "VOL, SYNC")
defaultalarm = _SNDOPEN("resources\defaultalarm.ogg", "VOL,SYNC")
DO
    IF _FILEEXISTS("resources\alarm.mp3") = -1 THEN
        alarm = _SNDOPEN("resources\alarm.mp3", "VOL,SYNC")
        EXIT DO
    END IF
    IF _FILEEXISTS("resources\alarm.ogg") = -1 THEN
        alarm = _SNDOPEN("resources\alarm.ogg", "VOL,SYNC")
        EXIT DO
    END IF
    IF _FILEEXISTS("resources\alarm.wav") = -1 THEN
        alarm = _SNDOPEN("resources\alarm.wav", "VOL,SYNC")
        EXIT DO
    END IF
    IF _FILEEXISTS("resources\alarm.mod") = -1 THEN
        alarm = _SNDOPEN("resources\alarm.mod", "VOL,SYNC")
        EXIT DO
    END IF
    IF _FILEEXISTS("resources\alarm.voc") = -1 THEN
        alarm = _SNDOPEN("resources\alarm.voc", "VOL,SYNC")
        EXIT DO
    END IF
    IF _FILEEXISTS("resources\alarm.aif") = -1 THEN
        alarm = _SNDOPEN("resources\alarm.aif", "VOL,SYNC")
        EXIT DO
    END IF
    IF _FILEEXISTS("resources\alarm.rif") = -1 THEN
        alarm = _SNDOPEN("resources\alarm.rif", "VOL,SYNC")
        EXIT DO
    END IF
    EXIT DO
LOOP


IF updatecheck = 1 THEN
    GOSUB updatecheck
END IF


javishosttimeout = TIMER
DO
    _LIMIT 10
    jarvishost = _OPENHOST("TCP/IP:7319")
    IF jarvishosttimeout > TIMER THEN jarvishosttimeout = TIMER
LOOP UNTIL jarvishost < 0 OR javishosttimeout - TIMER >= 10
SHELL _HIDE _DONTWAIT "start tools\JARVISboard.exe"
jbct = 0
DO
    _LIMIT 10
    jbct = jbct + 1
    jarvisboard = _OPENCONNECTION(jarvishost)
LOOP UNTIL jarvisboard < 0 OR jbct = 100


resolution& = _SCREENIMAGE
screenx = _WIDTH(resolution&)
screeny = _HEIGHT(resolution&)
IF SystemParametersInfoW&(SPI_GETWORKAREA, 0, _OFFSET(Rec), 0) = 0 THEN
    error$ = "Cannot retrieve Work Area Parameters."
    GOSUB logger
END IF
workareax = Rec.right
workareay = Rec.bottom
dtwin%& = GetDesktopWindow
oidesk%& = OpenInputDesktop(0, 0, GENERIC_ALL)
IF oidesk%& <> dtwin%& AND oidesk%& > 0 THEN stdesk%& = SetThreadDesktop(oidesk%&)
SELECT CASE screenpos
    CASE 1
        _SCREENMOVE _MIDDLE
    CASE 2
        _SCREENMOVE ((workareax / 2) - 258), 0
    CASE 3
        _SCREENMOVE ((workareax / 2) - 258), (workareay - 240)
    CASE 4
        _SCREENMOVE 0, ((workareay / 2) - 120)
    CASE 5
        _SCREENMOVE (workareax - 517), ((workareay / 2) - 120)
    CASE 6
        _SCREENMOVE 0, 0
    CASE 7
        _SCREENMOVE (workareax - 517), 0
    CASE 8
        _SCREENMOVE 0, (workareay - 240)
    CASE 9
        _SCREENMOVE (workareax - 517), (workareay - 240)
END SELECT
SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " win trans ititle " + CHR$(34) + "jarvis" + CHR$(34) + " " + LTRIM$(STR$(transparency))
_SCREENSHOW
screenstate = 1

hwnd = FindWindow(0, "JARVIS" + CHR$(0))
hot& = SendMessageA&(hwnd, WM_SETHOTKEY, HK_ALT + ASC("J"), 0)
IF hot& <> 1 THEN
    error$ = "Could not set hotkey."
    GOSUB logger
ELSE
    top& = DefWindowProcA&(hwnd, WM_SHOWWINDOW, 0, 0)
END IF
IF eventnum = 0 THEN saveyear = 0
starttime = TIMER
_SNDPLAY tone3
_DELAY .3
cumclosetime = 0
FOR avgclosetime = 1 TO closetimes
    cumclosetime = cumclosetime + closetime(avgclosetime)
NEXT avgclosetime
avgclosetime = INT((cumclosetime / (closetimes - 1)))
timekey$ = DATE$ + " -- " + LEFT$(TIME$, 5)
PRINT #2, timekey$
bootmonth = VAL(LEFT$(bootdate$, 2))
bootday = VAL(MID$(bootdate$, 4, 2))
bootyear = VAL(RIGHT$(bootdate$, 4))
boothour = VAL(LEFT$(boottime$, 2))
bootminute = VAL(MID$(boottime$, 4, 2))
bootsecond = VAL(RIGHT$(boottime$, 2))
inputcount = 1
mouseswap = GetSystemMetrics(23)
status$ = "ACTIVE"
IF firsttime = 1 THEN
    speechoutput$ = "welcome " + username$ + ", I am Jarvis (Just Another Rather Very Intelligent System), a Digital Life Assistant for Windows XP Professional. Check out the documentation to learn how to use me, type or say 'help' or 'documentation'!"
ELSE
    speechoutput$ = "welcome back " + username$
END IF
speechprint$ = speechoutput$
GOSUB textprint
GOSUB speechoutput
active = 1
usercommands = 1
startactive = TIMER
activetimer = INT(TIMER)

DO
    _LIMIT speed&
    GOSUB getinput
    GOSUB textprint
    GOSUB commands
    GOSUB inform
    GOSUB converse
    GOSUB speechoutput
LOOP


activity:
GOSUB keyboard
GOSUB mousepos
IF keys > 0 OR xmouse& <> oldxmouse& OR ymouse& <> oldymouse& THEN activetimer&& = jarvistimer&&
oldxmouse& = xmouse&
oldymouse& = ymouse&
RETURN

clearevent:
SELECT CASE Event.elParamType
    ON ERROR GOTO 0
    CASE 1, 2
        IF 0 < dABSOLUTEp(peekp(peekp(Event.lParam) + 8), Event.lParam) THEN
            error$ = "Event.lParam reference count is > 0."
            Event.elParamType = 0
            Event.lParam = 0
            GOSUB logger
            GOSUB xcleanup
        END IF
    CASE 3, 4
        CoTaskMemFree Event.lParam
END SELECT
Event.elParamType = 0
Event.lParam = 0
ON ERROR GOTO xcleanup
RETURN

commands:

IF echo = 1 THEN
    startactive = TIMER
    DO
        FOR runcommands = 1 TO usercommands
            IF usercommand$(runcommands) = "echo" THEN
                FOR runcommands2 = 1 TO usercommands
                    IF usercommand$(runcommands2) = "off" THEN
                        echo = 0
                        speechoutput$ = "echo turned off"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        EXIT DO
                    END IF
                NEXT runcommands2
            END IF
        NEXT runcommands
        speechoutput$ = useroutputuse$
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        useroutputuse$ = ""
        EXIT DO
    LOOP
END IF

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
DO
    FOR runcommands = 1 TO usercommands

IF usercommand$(runcommands) = "jarvis" OR usercommand$(runcommands) = "computer" THEN
    active = 1
    speechoutput$ = "yes " + username$
    status$ = "ACTIVE"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    startactive = TIMER
END IF
        IF active = 1 THEN



IF mapleload = 0 THEN
    IF _FILEEXISTS("packs\maplestoy\data\settings.txt") = -1 THEN
        OPEN "packs\maplestory\data\settings.txt" FOR OUTPUT AS #1
        PRINT #1, ""
        CLOSE #1
    END IF
    msdata = 0
    REDIM msdata$(2056)
    OPEN "packs\maplestory\data\settings.txt" FOR INPUT AS #1
    DO
        msdata = msdata + 1
        LINE INPUT #1, msdata$(msdata)
    LOOP UNTIL EOF(1) = -1
    CLOSE #1
    msusername$ = msdata$(1)
    mspassword$ = msdata$(2)
    mspic$ = msdata$(3)
    mapleload = 1
END IF
IF usercommand$(runcommands) = "maplestory" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "on" THEN
                IF mson = 0 THEN
                    speechoutput$ = "turning checking for maplestory commands on"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    mson = 1
                    usercommands = -1
                END IF
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "off" THEN
                IF mson = 1 THEN
                    speechoutput$ = "turning checking for maplestory commands off"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    mson = 0
                    usercommands = -1
                END IF
                EXIT DO
            END IF
        NEXT runcommands2
        SELECT CASE mson
            CASE 0
                speechoutput$ = "turning checking for maplestory commands on"
                mson = 1
            CASE 1
                speechoutput$ = "turning checking for maplestory commands off"
                mson = 0
        END SELECT
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF
IF usercommand$(runcommands) = "maple" OR usercommand$(runcommands) = "maples" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "story" OR usercommand$(runcommands2) = "stories" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands3) = "on" THEN
                            IF mson = 0 THEN
                                speechoutput$ = "turning checking for maplestory commands on"
                                speechprint$ = speechoutput$
                                GOSUB textprint
                                GOSUB speechoutput
                                mson = 1
                                usercommands = -1
                            END IF
                            EXIT DO
                        END IF
                        IF usercommand$(runcommands3) = "off" THEN
                            IF mson = 1 THEN
                                speechoutput$ = "turning checking for maplestory commands off"
                                speechprint$ = speechoutput$
                                GOSUB textprint
                                GOSUB speechoutput
                                mson = 0
                                usercommands = -1
                            END IF
                            EXIT DO
                        END IF
                    NEXT runcommands3
                    SELECT CASE mson
                        CASE 0
                            speechoutput$ = "turning checking for maplestory commands on"
                            mson = 1
                        CASE 1
                            speechoutput$ = "turning checking for maplestory commands off"
                            mson = 0
                    END SELECT
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    usercommands = -1
                    EXIT DO
                LOOP
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
IF mson = 1 THEN

IF usercommand$(runcommands) = "password" THEN
    speechoutput$ = "entering password"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    _SCREENPRINT mspassword$
    usercommands = -1
END IF
IF usercommand$(runcommands) = "pass" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "word" THEN
                speechoutput$ = "entering password"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                _SCREENPRINT mspassword$
                usercommands = -1
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "username" THEN
    speechoutput$ = "entering username"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    _SCREENPRINT msusername$
    usercommands = -1
END IF
IF usercommand$(runcommands) = "user" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "name" THEN
                speechoutput$ = "entering username"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                _SCREENPRINT msusername$
                usercommands = -1
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
END IF

IF usercommand$(runcommands) = "afirmation" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "toggle" THEN
                SELECT CASE afirmpref
                    CASE 0
                        afirmpref = 1
                        speechoutput$ = "turning on afirmation"
                    CASE 1
                        afirmpref = 0
                        speechoutput$ = "turning off afirmation"
                END SELECT
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "on" THEN
                afirmpref = 1
                speechoutput$ = "turning on afirmation"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
            END IF
            IF usercommand$(runcommands2) = "off" THEN
                afirmpref = 0
                speechoutput$ = "turning off afirmation"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "again" THEN
    userinput$ = inputrecord$(inputrecord - (2 + justagain))
    justagain = justagain + 1
    usercommands = -1
    GOTO againsend
END IF

IF usercommand$(runcommands) = "alarm" OR usercommand$(runcommands) = "alarms" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "change" OR usercommand$(runcommands2) = "sound" THEN
                DO
                    request$ = "Enter the full location of the new alarm sound" + CHR$(13) + "ex/ 'C:\Documents and Settings\Owner\My Documents\alarm.mp3'"
                    PRINT #jarvisboard, request$
                    speechoutput$ = "Enter the the full location of the new alarm sound into the box, the file can be any of the following formats: mp3, ogg, wav, mod, voc, aif, or rif, if you enter '0' then the default alarm will be used, when you are done press Enter, if the box is empty the query will be discarded."
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    usercommands = -1
                    DO
                        _LIMIT 1
                        INPUT #jarvisboard, response$
                    LOOP UNTIL response$ <> ""
                    IF response$ <> CHR$(255) AND response$ <> CHR$(48) THEN
                        SHELL _HIDE "copy /y " + response$ + " resources\alarm." + RIGHT$(response$, 3)
                        alarm = _SNDOPEN("resources\alarm." + RIGHT$(response$, 3))
                    ELSE
                        IF response$ = CHR$(48) THEN
                            SHELL _HIDE "del /f /q resources\alarm.*"
                            alarm = 0
                        ELSE
                            EXIT DO
                        END IF
                    END IF
                    speechoutput$ = "new alarm sound has been added"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    usercommands = -1
                    EXIT DO
                LOOP
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "add" OR usercommand$(runcommands2) = "new" THEN
                speechoutput$ = "these are your set alarms, move using the arrow keys, press insert to add a new alarm, press escape to exit, I will be suspended until you close the alarm program"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                iniloc$ = "data\jarvis.ini"
                GOSUB updateini
                SHELL _DONTWAIT _HIDE "start tools\alarms.exe"
                DO
                    _LIMIT 1
                    alarms = _OPENCONNECTION(jarvishost)
                LOOP UNTIL alarms < 0
                DO
                    _LIMIT 1
                    INPUT #alarms, response$
                LOOP UNTIL response$ = "complete"
                CLOSE #alarms
                GOSUB getalarms
                speechoutput$ = "your alarms have been updated"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "delete" OR usercommand$(runcommands2) = "remove" THEN
                speechoutput$ = "these are your set alarms, move using the arrow keys, press delete to remove an alarm, press escape to exit, I will be suspended until you close the alarm program"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                iniloc$ = "data\jarvis.ini"
                GOSUB updateini
                SHELL _DONTWAIT _HIDE "start tools\alarms.exe"
                DO
                    _LIMIT 1
                    alarms = _OPENCONNECTION(jarvishost)
                LOOP UNTIL alarms < 0
                DO
                    _LIMIT 1
                    INPUT #alarms, response$
                LOOP UNTIL response$ = "complete"
                CLOSE #alarms
                GOSUB getalarms
                speechoutput$ = "your alarms have been updated"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        speechoutput$ = "these are your set alarms, move using the arrow keys, press delete to remove an alarm and insert to add a new one, press escape to exit, I will be suspended until you close the alarm program"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        iniloc$ = "data\jarvis.ini"
        GOSUB updateini
        SHELL _DONTWAIT _HIDE "start tools\alarms.exe"
        DO
            _LIMIT 1
            alarms = _OPENCONNECTION(jarvishost)
        LOOP UNTIL alarms < 0
        DO
            _LIMIT 1
            INPUT #alarms, response$
        LOOP UNTIL response$ = "complete"
        CLOSE #alarms
        GOSUB getalarms
        speechoutput$ = "your alarms have been updated"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "alert" OR usercommand$(runcommands) = "alerts" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "toggle" THEN
                SELECT CASE alertpref
                    CASE 0
                        alertpref = 1
                        speechoutput$ = "turning on alerts"
                    CASE 1
                        alertpref = 0
                        speechoutput$ = "turning off alerts"
                END SELECT
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "on" THEN
                alertpref = 1
                speechoutput$ = "turning on alerts"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
            END IF
            IF usercommand$(runcommands2) = "off" THEN
                alertpref = 0
                speechoutput$ = "turning off alerts"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "all" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = "select all"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT CHR$(1)
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "amazon" THEN
    speechoutput$ = "opening amazon"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\amazon.URL"
    usercommands = -1
END IF

IF usercommand$(runcommands) = "angle" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "toggle" THEN
                SELECT CASE anglepref
                    CASE 0
                        anglepref = 1
                        speechoutput$ = "setting angle to degree"
                    CASE 1
                        anglepref = 0
                        speechoutput$ = "setting angle to radian"
                END SELECT
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

IF usercommand$(runcommands) = "app" OR usercommand$(runcommands) = "application" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "data" THEN
                speechoutput$ = "opening application data"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "start shell:AppData"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "back" OR usercommand$(runcommands) = "backspace" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = ""
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT CHR$(8)
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "backup" OR usercommand$(runcommands) = "snapshot" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "load" THEN
                request$ = "Enter the timestamp of the snapshot" + CHR$(13) + "ex/ '20121221000000'"
                PRINT #jarvisboard, request$
                speechoutput$ = "Enter the the timestamp of the snapshot into the box, when you are done press Enter, if the box is empty the query will be discarded, enter 0 to load a snapshot of the default settings. After the snapshot is loaded you will have to restart me"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                DO
                    _LIMIT 1
                    INPUT #jarvisboard, response$
                LOOP UNTIL response$ <> ""
                IF response$ <> CHR$(255) THEN
                    IF _FILEEXISTS("snapshots\" + response$ + "\jarvis.ini") = -1 THEN
                        KILL "C:\WINDOWS\jarvisloc.jdf"
                        SHELL _HIDE "copy /y snapshots\" + response$ + "\dimscreen.ini tools\dimscreen.ini"
                        SHELL _HIDE "copy /y snapshots\" + response$ + "\jarvis.ini data\jarvis.ini"
                        CLOSE #2
                        SHELL _HIDE "copy /y snapshots\" + response$ + "\log.jdf data\log.jdf"
                        SHELL _HIDE "copy /y snapshots\" + response$ + "\customcmd.bas customcmd.bas"
                        SHELL _HIDE "xcopy /y snapshots\" + response$ + "\customcmd customcmd"
                        request$ = "terminate"
                        PRINT #jarvisboard, request$
                        _DELAY 2
                        CLOSE #jarvisboard
                        CLOSE #jarvishost
                        CLEAR
                        SYSTEM
                    END IF
                END IF
                EXIT DO
            END IF
        NEXT runcommands2
        stampmonth$ = LEFT$(DATE$, 2)
        stampday$ = MID$(DATE$, 4, 2)
        stampyear$ = RIGHT$(DATE$, 4)
        stamphour$ = LEFT$(TIME$, 2)
        stampminute$ = MID$(TIME$, 4, 2)
        stampsecond$ = RIGHT$(TIME$, 2)
        timestamp$ = stampyear$ + stampmonth$ + stampday$ + stamphour$ + stampminute$ + stampsecond$
        snapshotname$ = timestamp$ + "_0"
        IF _FILEEXISTS("snapshots\" + snapshotname$ + "\jarvis.ini") = -1 THEN
            snapshotname = 0
            DO
                snapshotname$ = timestamp$ + "_" + LTRIM$(STR$(snapshotname))
                snapshotname = snapshotname + 1
            LOOP UNTIL _FILEEXISTS("snapshots\" + snapshotname$ + "\jarvis.ini") = 0
        END IF
        SHELL _HIDE "mkdir snapshots\" + snapshotname$
        SHELL _HIDE "copy tools\dimscreen.ini snapshots\" + snapshotname$ + "\dimscreen.ini"
        iniloc$ = "snapshots\" + snapshotname$ + "\jarvis.ini"
        GOSUB updateini
        SHELL _HIDE "copy data\log.jdf snapshots\" + snapshotname$ + "\log.jdf"
        SHELL _HIDE "copy include\customcmd.bas snapshots\" + snapshotname$ + "\customcmd.bas"
        SHELL _HIDE "xcopy customcmd snapshots\" + snapshotname$ + "\customcmd"
        speechoutput$ = "A snapshot has been made, you can load this later, this snapshots timestamp is " + timestamp$
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "baidu" THEN
    speechoutput$ = "opening baidu"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\baidu.URL"
    usercommands = -1
END IF

IF usercommand$(runcommands) = "birthday" THEN
    IF INSTR(useroutputuse$, " your") THEN
        speechoutput$ = "my birthday is 11-27-2011"
    ELSE
        speechoutput$ = "your birthday is " + birthday$
    END IF
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF

IF usercommand$(runcommands) = "blog" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "spot" THEN
                speechoutput$ = "opening blogspot"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "start resources\urls\blogspot.URL"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
IF usercommand$(runcommands) = "blogspot" THEN
    speechoutput$ = "opening blogspot"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\blogspot.URL"
    usercommands = -1
END IF

IF usercommand$(runcommands) = "blue" THEN
    textcolor = 9
    usercommands = -1
END IF

IF usercommand$(runcommands) = "bold" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = ""
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT CHR$(2)
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "bright" THEN
    newtextcolor = textcolor + 8
    IF newtextcolor > 15 THEN newtextcolor = textcolor
    textcolor = newtextcolor
    usercommands = -1
END IF

IF usercommand$(runcommands) = "brightness" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "up" OR usercommand$(runcommands2) = "increase" THEN
                _SCREENPRINT (CHR$(0) + CHR$(131))
                dimcount = dimcount - 10
                IF dimcount = 0 THEN
                    SHELL _DONTWAIT _HIDE "taskkill /IM dimscreen.exe /F"
                    speechoutput$ = "closing ScreenDim"
                    EXIT DO
                END IF
                speechoutput$ = "increasing brightness"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "down" OR usercommand$(runcommands2) = "decrease" THEN
                _SCREENPRINT (CHR$(0) + CHR$(130))
                dimcount = dimcount + 10
                speechoutput$ = "decreasing brightness"
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

IF usercommand$(runcommands) = "buffer" THEN
    DO
        DO
            FOR numcheck = 1 TO userinputs
                IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                    num##(1) = VAL(userinputcopy$(numcheck))
                    containnum = 1
                    EXIT DO
                END IF
            NEXT numcheck
            EXIT DO
        LOOP
        IF containnum = 0 THEN EXIT DO
        buffer& = num##(1)
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "cache" THEN
    speechoutput$ = "opening cache"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start shell:Cache"
    usercommands = -1
END IF

IF usercommand$(runcommands) = "calculator" THEN
    DO
        speechoutputb$ = "launching calculator"
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "close" OR usercommand$(runcommands2) = "terminate" OR usercommand$(runcommands2) = "exit" OR usercommand$(runcommands2) = "end" THEN
                launchno = 2
                SHELL _DONTWAIT _HIDE "taskkill /IM calc.exe /F"
                speechoutput$ = "closing calculator"
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "set" THEN launchno = 1
            IF usercommand$(runcommands2) = "simple" THEN
                speechoutputa$ = "setting calculator to simple"
                speechoutputb$ = "launching simple calculator"
                REDIM winini$(1024)
                wininicount = 0
                OPEN "C:\WINDOWS\win.ini" FOR INPUT AS #1
                DO
                    wininicount = wininicount + 1
                    LINE INPUT #1, winini$(wininicount)
                LOOP UNTIL EOF(1) = -1
                CLOSE #1
                FOR wininicheck = 1 TO wininicount
                    IF winini$(wininicheck) = "[SciCalc]" THEN winini$(wininicheck + 1) = "layout=1"
                NEXT wininicheck
                OPEN "C:\WINDOWS\win.ini" FOR OUTPUT AS #1
                FOR wininiwrite = 1 TO wininicount
                    PRINT #1, winini$(wininiwrite)
                NEXT wininiwrite
                CLOSE #1
            END IF
            IF usercommand$(runcommands2) = "scientific" THEN
                speechoutputa$ = "setting calculator to scientific"
                speechoutputb$ = "launching scientific calculator"
                REDIM winini$(1024)
                wininicount = 0
                OPEN "C:\WINDOWS\win.ini" FOR INPUT AS #1
                DO
                    wininicount = wininicount + 1
                    LINE INPUT #1, winini$(wininicount)
                LOOP UNTIL EOF(1) = -1
                CLOSE #1
                FOR wininicheck = 1 TO wininicount
                    IF winini$(wininicheck) = "[SciCalc]" THEN winini$(wininicheck + 1) = "layout=0"
                NEXT wininicheck
                OPEN "C:\WINDOWS\win.ini" FOR OUTPUT AS #1
                FOR wininiwrite = 1 TO wininicount
                    PRINT #1, winini$(wininiwrite)
                NEXT wininiwrite
                CLOSE #1
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
    IF launchno = 0 THEN
        SHELL _DONTWAIT _HIDE "start calc.exe"
        speechoutput$ = speechoutputb$
    END IF
    IF launchno = 1 THEN speechoutput$ = speechoutputa$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
    launchno = 0
    speechoutputa$ = ""
    speechoutputb$ = ""
END IF

IF usercommand$(runcommands) = "character" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "map" THEN
                speechoutput$ = "opening character map"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "start %SystemRoot%\system32\charmap.exe"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "clip" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "board" THEN
                FOR runcommands3 = 1 TO usercommands
                    IF usercommand$(runcommands3) = "clear" OR usercommand$(runcommands3) = "empty" THEN
                        SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " clipboard clear"
                        speechoutput$ = "cliboard cleared"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        EXIT DO
                    END IF
                NEXT runcommands3
                speechoutput$ = "speech output copied to cliboard"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                IF LEN(speechcopy$) THEN
                    _CLIPBOARD$ = speechcopy$
                    speechcopy = 0
                    speechcopy$ = ""
                ELSE
                    _CLIPBOARD$ = outputrecord$((outputrecord - (1 + justcopied)))
                END IF
                usercommands = -1
                justcopied =  justcopied + 1
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
IF usercommand$(runcommands) = "clipboard" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "clear" OR usercommand$(runcommands2) = "empty" THEN
                SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " clipboard clear"
                speechoutput$ = "cliboard cleared"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        speechoutput$ = "speech output copied to cliboard"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        IF LEN(speechcopy$) THEN
            _CLIPBOARD$ = speechcopy$
            speechcopy = 0
            speechcopy$ = ""
        ELSE
            _CLIPBOARD$ = outputrecord$((outputrecord - (1 + justcopied)))
        END IF
        usercommands = -1
        justcopied =  justcopied + 1
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "clock" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "system" OR usercommand$(runcommands2) = "tray" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands3) = "show" THEN
                            speechoutput$ = "showing system clock"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " win child class " + CHR$(34) + "Shell_TrayWnd" + CHR$(34) + " show class " + CHR$(34) + "TrayClockWClass" + CHR$(34)
                            usercommands = -1
                            EXIT DO
                        END IF
                        IF usercommand$(runcommands3) = "hide" THEN
                            speechoutput$ = "hiding system clock"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " win child class " + CHR$(34) + "Shell_TrayWnd" + CHR$(34) + " hide class " + CHR$(34) + "TrayClockWClass" + CHR$(34)
                            usercommands = -1
                            EXIT DO
                        END IF
                    NEXT runcommands3
                    EXIT DO
                LOOP
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "polar" THEN
                speechoutput$ = "launching polar clock"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "start tools\polarclock.exe"
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "digital" THEN
                speechoutput$ = "launching digital clock"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "start tools\digitalclock.exe"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        speechoutput$ = "launching analog clock"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        SHELL _DONTWAIT _HIDE "start tools\clock.exe"
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "close" OR usercommand$(runcommands) = "exit" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "door" OR usercommand$(runcommands2) = "drive" OR usercommand$(runcommands2) = "calculator" OR usercommand$(runcommands2) = "command" OR usercommand$(runcommands2) = "fractal" OR usercommand$(runcommands2) = "log" OR usercommand$(runcommands2) = "task" THEN EXIT DO
        NEXT runcommands2
        speechoutput$ = "closing foreground window"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        fgwin%& = GetForegroundWindow
        getpid = GetWindowThreadProcessId(fgwin%&, _OFFSET(PID~&))
        hProcess%& = OpenProcess(1 OR PROCESS_QUERY_INFORMATION OR PROCESS_VM_READ OR SYNCHRONIZE, 0, PID~&)
        closemessage%& = SendMessageTimeoutW(fgwin%&, WM_CLOSE, 0, 0, 0, 3000, _OFFSET(dw~&))
        IF hProcess%& THEN
            waittime = 0
            DO
                IF WaitForSingleObject(hProcess%&, 100) = -1 THEN
                    waittime = waittime + 1
                ELSE
                    EXIT DO
                END IF
                IF waittime = 30 THEN
                    killprocess = TerminateProcess(hProcess%&, 0)
                    EXIT DO
                END IF
            LOOP
            waittime = 0
        END IF
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "code" OR usercommand$(runcommands) = "codes" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "country" THEN
                country$ = MID$(useroutput$, 1, (INSTR(useroutput$, "code") - 1)) + MID$(useroutput$, (INSTR(useroutput$, "code") + 5))
                country$ = MID$(country$, 1, (INSTR(country$, "country") - 1)) + MID$(country$, (INSTR(country$, "country") + 8))
                country$ = RemArbitraryWords$(country$)
                highest = 0
                FOR countrycheck = 1 TO NumOfCountryCode
                    countrycheckval = Compare(country$, countrycodes$(countrycheck, 1))
                    IF countrycheckval > highest THEN
                        highest = countrycheckval
                        countrychecknum = countrycheck
                    END IF
                NEXT countrycheck
                IF highest < 30 THEN EXIT DO
                speechoutput$ = "the country codes for " + countrycodes$(countrychecknum, 1) + " are " + countrycodes$(countrychecknum, 2) + ", " + countrycodes$(countrychecknum, 3) + ", and " + countrycodes$(countrychecknum, 4)
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "language" THEN
                language$ = MID$(useroutput$, 1, (INSTR(useroutput$, "code") - 1)) + MID$(useroutput$, (INSTR(useroutput$, "code") + 5))
                language$ = MID$(language$, 1, (INSTR(language$, "language") - 1)) + MID$(language$, (INSTR(language$, "language") + 8))
                language$ = RemArbitraryWords$(language$)
                highest = 0
                FOR languagecheck = 1 TO NumOfLanguageCode
                    languagecheckval = Compare(language$, languagecodes$(languagecheck, 1))
                    IF languagecheckval > highest THEN
                        highest = languagecheckval
                        languagechecknum = languagecheck
                    END IF
                NEXT languagecheck
                IF highest < 30 THEN EXIT DO
                speechoutput$ = "the language codes for " + languagecodes$(languagechecknum, 1) + " are " + languagecodes$(languagechecknum, 2) + " and " + languagecodes$(languagechecknum, 3)
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "zip" OR usercommand$(runcommands2) = "postal" THEN
            END IF
        NEXT runcommands2
        speechoutput$ = "you can find my code located in my program folder: " + jarvisloc$
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "command" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "new" THEN
                request$ = "Enter the name of the new command (no spaces)" + CHR$(13) + "ex/ 'New_Command'"
                PRINT #jarvisboard, request$
                speechoutput$ = "Enter the the name of the new command into the box, make sure there are no spaces, when you are done press Enter, if the box is empty the query will be discarded."
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                DO
                    _LIMIT 1
                    INPUT #jarvisboard, response$
                LOOP UNTIL response$ <> ""
                IF response$ <> CHR$(255) THEN
                    newcmdfile$ = "customcmd\" + response$ + ".txt"
                    IF _FILEEXISTS(newcmdfile$) = -1 THEN
                        DO
                            request$ = "Would you like to overwrite this command? (y/n)"
                            PRINT #jarvisboard, request$
                            speechoutput$ = "It looks like there is already a command file with this name, are you sure you want to overwrite the old file, yes or no, if you submit a blank query you will be asked again."
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            usercommands = -1
                            response$ = ""
                            DO
                                _LIMIT 1
                                INPUT #jarvisboard, response$
                            LOOP UNTIL response$ <> ""
                            IF response$ <> CHR$(255) THEN
                                IF response$ = CHR$(89) OR response$ = CHR$(121) OR response$ = CHR$(78) OR response$ = CHR$(110) THEN
                                    IF response$ = CHR$(89) OR response$ = CHR$(121) THEN
                                        dooverwrite = 1
                                    END IF
                                    IF response$ = CHR$(78) OR response$ = CHR$(110) THEN
                                        dooverwrite = 0
                                    END IF
                                    EXIT DO
                                END IF
                            END IF
                        LOOP
                    END IF
                    IF _FILEEXISTS(newcmdfile$) = 0 OR dooverwrite = 1 THEN
                        OPEN newcmdfile$ FOR OUTPUT AS #1
                        CLOSE #1
                        SHELL _DONTWAIT _HIDE "start /MAX " + newcmdfile$
                        DO
                            FOR d = 1 TO 50
                                s = _SCREENIMAGE
                                _SOURCE s
                                z = 0
                                FOR y = 0 TO _HEIGHT(s) - 1
                                    FOR x = 0 TO _WIDTH(s) - 1
                                        c = POINT(x, y)
                                        IF c = _RGB32(255, 255, 255) THEN z = z + 1
                                    NEXT
                                NEXT
                                IF z / (_HEIGHT(s) * _WIDTH(s)) > 0.8 THEN EXIT DO
                                _FREEIMAGE s
                                _DELAY .1
                            NEXT d
                            EXIT DO
                        LOOP
                        IF d < 50 THEN _SCREENPRINT cmdbase$
                    END IF
                    EXIT DO
                END IF
            END IF
            IF usercommand$(runcommands2) = "add" OR usercommand$(runcommands2) = "load" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands3) = "new" THEN EXIT DO
                    NEXT runcommands3
                    DO
                        request$ = "Enter the name of the command file to add" + CHR$(13) + "ex/ 'New_Command.txt'"
                        PRINT #jarvisboard, request$
                        speechoutput$ = "Enter the the name of the command file to add into the box, when you are done press Enter, if the box is empty the query will be discarded."
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        response$ = ""
                        DO
                            _LIMIT 1
                            INPUT #jarvisboard, response$
                        LOOP UNTIL response$ <> ""
                        IF response$ <> CHR$(255) THEN
                            cmdname$ = response$
                            cmdname$ = "customcmd\" + cmdname$
                            OPEN cmdname$ FOR INPUT AS #1
                            LINE INPUT #1, commandwords$
                            CLOSE #1
                            commandwords$ = MID$(commandwords$, 2, (LEN(commandwords$) - 1))
                            REDIM commandwords$(32)
                            commandwords = 1
                            FOR commandseperate = 1 TO LEN(commandwords$)
                                DO
                                    commandseperate$ = MID$(commandwords$, commandseperate, 1)
                                    IF commandseperate$ = CHR$(44) THEN
                                        commandwords = commandwords + 1
                                        EXIT DO
                                    END IF
                                    commandwords$(commandwords) = commandwords$(commandwords) + commandseperate$
                                    EXIT DO
                                LOOP
                            NEXT commandseperate
                            conflict = 0
                            FOR commandlowercase = 1 TO commandwords
                                buildword$ = ""
                                FOR wordlowercase = 1 TO LEN(commandwords$(commandlowercase))
                                    letterlowercase$ = MID$(commandwords$(commandlowercase), wordlowercase, 1)
                                    IF letterlowercase$ >= CHR$(65) AND letterlowercase$ <= CHR$(90) THEN letterlowercase$ = CHR$((ASC(letterlowercase$) + 32))
                                    buildword$ = buildword$ + letterlowercase$
                                NEXT wordlowercase
                                commandwords$(commandlowercase) = buildword$
                                FOR commanddouble = 1 TO commandcount
                                    IF commandwords$(commandlowercase) = commands$(commanddouble) THEN conflict = 1
                                NEXT commanddouble
                            NEXT commandlowercase
                        ELSE
                            EXIT DO
                        END IF
                        IF conflict = 1 THEN
                            DO
                                request$ = "Would you like to add this command? (y/n)"
                                PRINT #jarvisboard, request$
                                speechoutput$ = "It looks like this command could conflict with existing commands, are you sure you want to add it, yes or no, if you submit a blank query you will be asked again."
                                speechprint$ = speechoutput$
                                GOSUB textprint
                                GOSUB speechoutput
                                usercommands = -1
                                response$ = ""
                                DO
                                    _LIMIT 1
                                    INPUT #jarvisboard, response$
                                LOOP UNTIL response$ <> ""
                                IF response$ <> CHR$(255) THEN
                                    IF response$ = CHR$(89) OR response$ = CHR$(121) OR response$ = CHR$(78) OR response$ = CHR$(110) THEN
                                        IF response$ = CHR$(89) OR response$ = CHR$(121) THEN
                                            doadd = 1
                                        END IF
                                        IF response$ = CHR$(78) OR response$ = CHR$(110) THEN
                                            doadd = 0
                                        END IF
                                        EXIT DO
                                    END IF
                                END IF
                            LOOP
                        END IF
                        IF doadd = 1 OR conflict = 0 THEN
                            includefile$ = "'$include:'..\" + cmdname$ + "'"
                            OPEN "include\customcmd.bas" FOR APPEND AS #1
                            PRINT #1, includefile$
                            CLOSE #1
                            FOR commandadd = 1 TO commandwords
                                loadcustom = loadcustom + 1
                                loadcustom$(loadcustom) = commandwords$(commandadd)
                                commandcount = commandcount + 1
                                commands$(commandcount) = commandwords$(commandadd)
                            NEXT commandadd
                        END IF
                        IF doadd = 0 AND conflict = 1 THEN EXIT DO
                        DO
                            request$ = "Would you like to add another command? (y/n)"
                            PRINT #jarvisboard, request$
                            speechoutput$ = "Would you like to add another command, yes or no, if you submit a blank query you will be asked again."
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            usercommands = -1
                            response$ = ""
                            DO
                                _LIMIT 1
                                INPUT #jarvisboard, response$
                            LOOP UNTIL response$ <> ""
                            IF response$ <> CHR$(255) THEN
                                IF response$ = CHR$(89) OR response$ = CHR$(121) OR response$ = CHR$(78) OR response$ = CHR$(110) THEN
                                    IF response$ = CHR$(89) OR response$ = CHR$(121) THEN
                                        doneadd = 0
                                    END IF
                                    IF response$ = CHR$(78) OR response$ = CHR$(110) THEN
                                        doneadd = 1
                                    END IF
                                    EXIT DO
                                END IF
                            END IF
                        LOOP
                    LOOP UNTIL doneadd = 1
                    IF response$ = CHR$(255) THEN EXIT DO
                    iniloc$ = "data\jarvis.ini"
                    GOSUB updateini
                    request$ = "terminate"
                    PRINT #jarvisboard, request$
                    _DELAY 2
                    CLOSE #jarvisboard
                    CLOSE #jarvishost
                    SHELL _HIDE "start batch\compile.bat"
                    CLEAR
                    SYSTEM
                LOOP
            END IF
            IF usercommand$(runcommands2) = "delete" OR usercommand$(runcommands2) = "remove" THEN
                DO
                    request$ = "Enter the relative name of the command file to delete" + CHR$(13) + "ex/ 'New_Command.txt'"
                    PRINT #jarvisboard, request$
                    speechoutput$ = "Enter the the name of the command file to delete into the box, when you are done press Enter, if the box is empty the query will be discarded."
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    usercommands = -1
                    response$ = ""
                    DO
                        _LIMIT 1
                        INPUT #jarvisboard, response$
                    LOOP UNTIL response$ <> ""
                    IF response$ <> CHR$(255) THEN
                        cmdname$ = response$
                        cmdname$ = "customcmd\" + cmdname$
                        OPEN cmdname$ FOR INPUT AS #1
                        LINE INPUT #1, commandwords$
                        CLOSE #1
                        commandwords$ = MID$(commandwords$, 2, (LEN(commandwords$) - 1))
                        REDIM commandwords$(32)
                        commandwords = 1
                        FOR commandseperate = 1 TO LEN(commandwords$)
                            DO
                                commandseperate$ = MID$(commandwords$, commandseperate, 1)
                                IF commandseperate$ = CHR$(44) THEN
                                    commandwords = commandwords + 1
                                    EXIT DO
                                END IF
                                commandwords$(commandwords) = commandwords$(commandwords) + commandseperate$
                                EXIT DO
                            LOOP
                        NEXT commandseperate
                        FOR commandlowercase = 1 TO commandwords
                            buildword$ = ""
                            FOR wordlowercase = 1 TO LEN(commandwords$(commandlowercase))
                                letterlowercase$ = MID$(commandwords$(commandlowercase), wordlowercase, 1)
                                IF letterlowercase$ >= CHR$(65) AND letterlowercase$ <= CHR$(90) THEN letterlowercase$ = CHR$((ASC(letterlowercase$) + 32))
                                buildword$ = buildword$ + letterlowercase$
                            NEXT wordlowercase
                            commandwords$(commandlowercase) = buildword$
                        NEXT commandlowercase
                    ELSE
                        EXIT DO
                    END IF
                    REDIM commandfiles$(256)
                    OPEN "include\customcmd.bas" FOR INPUT AS #1
                    DO
                        commandfile = commandfile + 1
                        LINE INPUT #1, commandfilespre$
                        IF MID$(commandfilespre$, 15, (LEN(commandfilespre$) - 15)) <> cmdname$ THEN commandfiles$(commandfile) = commandfilespre$
                    LOOP UNTIL EOF(1) = -1
                    CLOSE #1
                    OPEN "include\customcmd.bas" FOR OUTPUT AS #1
                    FOR customfileprint = 1 TO commandfile
                        IF commandfiles$(customfileprint) <> "" THEN PRINT #1, commandfiles$(customfileprint)
                    NEXT customfileprint
                    CLOSE #1
                    REDIM movecustom$(256)
                    keepers = 0
                    FOR remcmd = 1 TO loadcustom
                        keeper = 0
                        FOR cmdrem = 1 TO commandwords
                            IF loadcustom$(remcmd) = commandwords$(cmdrem) THEN keeper = 1
                        NEXT cmdrem
                        IF keeper = 0 THEN
                            keepers = keepers + 1
                            movecustom$(keepers) = loadcustom$(remcmd)
                        END IF
                    NEXT remcmd
                    REDIM loadcustom$(256)
                    FOR keepermove = 1 TO keepers
                        loadcustom$(keepermove) = movecustom$(keepermove)
                    NEXT keepermove
                    loadcustom = keepers
                    DO
                        request$ = "Would you like to remove another command? (y/n)"
                        PRINT #jarvisboard, request$
                        speechoutput$ = "Would you like to remove another command, yes or no, if you submit a blank query you will be asked again."
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        response$ = ""
                        DO
                            _LIMIT 1
                            INPUT #jarvisboard, response$
                        LOOP UNTIL response$ <> ""
                        IF response$ <> CHR$(255) THEN
                            IF response$ = CHR$(89) OR response$ = CHR$(121) OR response$ = CHR$(78) OR response$ = CHR$(110) THEN
                                IF response$ = CHR$(89) OR response$ = CHR$(121) THEN
                                    donerem = 0
                                END IF
                                IF response$ = CHR$(78) OR response$ = CHR$(110) THEN
                                    donerem = 1
                                END IF
                                EXIT DO
                            END IF
                        END IF
                    LOOP
                LOOP UNTIL donerem = 1
                IF response$ = CHR$(255) THEN EXIT DO
                iniloc$ = "data\jarvis.ini"
                GOSUB updateini
                request$ = "terminate"
                PRINT #jarvisboard, request$
                _DELAY 2
                CLOSE #jarvisboard
                CLOSE #jarvishost
                SHELL _HIDE "start batch\compile.bat"
                CLEAR
                SYSTEM
            END IF
            IF usercommand$(runcommands2) = "prompt" THEN
                FOR runcommands3 = 1 TO usercommands
                    IF usercommand$(runcommands3) = "close" OR usercommand$(runcommands3) = "terminate" OR usercommand$(runcommands3) = "exit" OR usercommand$(runcommands3) = "end" THEN
                        SHELL _HIDE _DONTWAIT "taskkill /IM cmd.exe /F"
                        speechoutput$ = "closing command prompt"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        EXIT DO
                    END IF
                NEXT runcommands3
                speechoutput$ = "opening command prompt"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "start cmd.exe"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "copy" THEN
    DO
        IF useroutputuse$ = "copy that" THEN
            speechoutput$ = "yes " + username$
            speechprint$ = speechoutput$
            GOSUB textprint
            GOSUB speechoutput
            _CLIPBOARD$ = outputrecord$((outputrecord - 1))
            usercommands = -1
            EXIT DO
        END IF
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = "copying"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT CHR$(3)
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF

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

IF usercommand$(runcommands) = "face" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "book" THEN
                speechoutput$ = "opening facebook"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "start resources\urls\facebook.URL"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
IF usercommand$(runcommands) = "facebook" THEN
    speechoutput$ = "opening facebook"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\facebook.URL"
    usercommands = -1
END IF

IF usercommand$(runcommands) = "copy" THEN
    DO
        IF useroutputuse$ = "copy that" AND (TIMER(.001) - copythatlimit > .5 OR TIMER < copythatlimit) THEN
            copythatlimit = TIMER(.001)
            IF LEN(speechcopy$) THEN
                _CLIPBOARD$ = speechcopy$
                speechcopy = 0
                speechcopy$ = ""
            ELSE
                _CLIPBOARD$ = outputrecord$((outputrecord - (1 + justcopied)))
            END IF
            speechoutput$ = "yes " + username$
            speechprint$ = speechoutput$
            GOSUB textprint
            GOSUB speechoutput
            speechoutput$ = ""
            usercommands = -1
            justcopied = justcopied + 1
            EXIT DO
        END IF
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = "copying"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT CHR$(3)
        useroutputuse$ = ""
        usercommands = -1
        justcopied = justcopied + 1
        EXIT DO
    LOOP
    usercommands = -1
    speechoutput$ = ""
END IF

IF usercommand$(runcommands) = "cosecant" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            FOR runcommands3 = 1 TO commandcount
                IF usercommand$(runcommands2) = commands$(runcommands3) AND usercommand$(runcommands2) <> "cosecant" THEN EXIT DO
            NEXT runcommands3
        NEXT runcommands2
        containnum = 0
        DO
            FOR numcheck = 1 TO userinputs
                IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                    num##(1) = VAL(userinputcopy$(numcheck))
                    containnum = 1
                    EXIT DO
                END IF
            NEXT numcheck
            EXIT DO
        LOOP
        IF containnum = 0 THEN EXIT DO
        containnum = 0
        IF anglepref = 1 THEN
            answer## = 1 / (SIN((num##(1) * ((4 * (ATN(1))) / 180))))
            speechoutput$ = STR$(answer##) + " degrees"
        END IF
        IF anglepref = 0 THEN
            answer## = 1 / (SIN(num##(1)))
            speechoutput$ = STR$(answer##) + " radians"
        END IF
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "cosine" OR usercommand$(runcommands) = "cosign" THEN
    DO
        DO
            FOR numcheck = 1 TO userinputs
                IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                    num##(1) = VAL(userinputcopy$(numcheck))
                    containnum = 1
                    EXIT DO
                END IF
            NEXT numcheck
            EXIT DO
        LOOP
        IF containnum = 0 THEN EXIT DO
        containnum = 0
        IF anglepref = 1 THEN
            answer## = COS((num##(1) * ((4 * (ATN(1))) / 180)))
            speechoutput$ = STR$(answer##) + " degrees"
        END IF
        IF anglepref = 0 THEN
            answer## = COS(num##(1))
            speechoutput$ = STR$(answer##) + " radians"
        END IF
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "cotangent" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            FOR runcommands3 = 1 TO commandcount
                IF usercommand$(runcommands2) = commands$(runcommands3) AND usercommand$(runcommands2) <> "cotangent" THEN EXIT DO
            NEXT runcommands3
        NEXT runcommands2
        containnum = 0
        DO
            FOR numcheck = 1 TO userinputs
                IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                    num##(1) = VAL(userinputcopy$(numcheck))
                    containnum = 1
                    EXIT DO
                END IF
            NEXT numcheck
            EXIT DO
        LOOP
        IF containnum = 0 THEN EXIT DO
        containnum = 0
        IF anglepref = 1 THEN
            answer## = 1 / (TAN((num##(1) * ((4 * (ATN(1))) / 180))))
            speechoutput$ = STR$(answer##) + " degrees"
        END IF
        IF anglepref = 0 THEN
            answer## = 1 / (TAN(num##(1)))
            speechoutput$ = STR$(answer##) + " radians"
        END IF
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "cubed" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            FOR runcommands3 = 1 TO commandcount
                IF usercommand$(runcommands2) = commands$(runcommands3) AND usercommand$(runcommands2) <> "cubed" THEN EXIT DO
            NEXT runcommands3
        NEXT runcommands2
        containnum = 0
        DO
            FOR numcheck = 1 TO userinputs
                IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                    num##(1) = VAL(userinputcopy$(numcheck))
                    containnum = 1
                    EXIT DO
                END IF
            NEXT numcheck
            EXIT DO
        LOOP
        IF containnum = 0 THEN EXIT DO
        containnum = 0
        answer## = num##(1) ^ 3
        speechoutput$ = STR$(answer##)
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "cut" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = "cutting"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT CHR$(24)
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "cyan" THEN
    textcolor = 11
    usercommands = -1
END IF

IF usercommand$(runcommands) = "date" THEN
    speechoutput$ = "it is currently " + DATE$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF

IF usercommand$(runcommands) = "dark" THEN
    newtextcolor = textcolor - 8
    IF newtextcolor < 0 THEN newtextcolor = textcolor
    textcolor = newtextcolor
    usercommands = -1
END IF

IF usercommand$(runcommands) = "day" OR usercommand$(runcommands) = "today" THEN
    IF justday = 0 THEN
        day = VAL(STR$(VAL(MID$(DATE$, 4, 2))))
        month = VAL(LEFT$(DATE$, 2))
        year = VAL(RIGHT$(DATE$, 4))
        IF month < 3 THEN
            month = month + 12
            year = year - 1
        END IF
        century = year \ 100
        year = year MOD 100
        S1 = (century \ 4) - (2 * century) - 1
        S2 = (5 * year) \ 4
        S3 = 26 * (month + 1) \ 10
        weekday = (S1 + S2 + S3 + day) MOD 7
        IF weekday < 0 THEN weekday = weekday + 7
        SELECT CASE weekday
            CASE 0
                day$ = "Sunday"
            CASE 1
                day$ = "Monday"
            CASE 2
                day$ = "Tuesday"
            CASE 3
                day$ = "Wednesday"
            CASE 4
                day$ = "Thursday"
            CASE 5
                day$ = "Friday"
            CASE 6
                day$ = "Saturday"
        END SELECT
        speechoutput$ = "today it is " + day$
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        justday = 1
    END IF
END IF

IF usercommand$(runcommands) = "deactivate" THEN
    active = 0
    speechoutput$ = "standing by"
    status$ = "INACTIVE"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF

IF usercommand$(runcommands) = "define" OR usercommand$(runcommands) = "definition" THEN

END IF

IF usercommand$(runcommands) = "defragment" THEN
    speechoutput$ = "launching defragment tool"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start %SystemRoot%\system32\dfrg.msc"
    usercommands = -1
END IF

IF usercommand$(runcommands) = "degree" OR usercommand$(runcommands) = "degrees" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "set" THEN
                anglepref = 1
                speechoutput$ = "setting angles to degree"
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

IF usercommand$(runcommands) = "afirmation" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "toggle" THEN
                SELECT CASE afirmpref
                    CASE 0
                        afirmpref = 1
                        speechoutput$ = "turning on afirmation"
                    CASE 1
                        afirmpref = 0
                        speechoutput$ = "turning off afirmation"
                END SELECT
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "on" THEN
                afirmpref = 1
                speechoutput$ = "turning on afirmation"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
            END IF
            IF usercommand$(runcommands2) = "off" THEN
                afirmpref = 0
                speechoutput$ = "turning off afirmation"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF

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

IF usercommand$(runcommands) = "dictation" OR usercommand$(runcommands) = "dictate" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "start" OR usercommand$(runcommands2) = "begin" OR usercommand$(runcommands2) = "on" THEN
                dictate = 1
                speechoutput$ = "dictation started"
                speechprint$ = speechoutput$
                useroutputuse$ = ""
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "dictionary" THEN
    speechoutput$ = "opening dictionary"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\dictionary.URL"
    usercommands = -1
END IF

IF (usercommand$(runcommands) = "die" OR usercommand$(runcommands) = "dye" OR usercommand$(runcommands) = "terminate") AND usercommands = 1 THEN GOSUB xcleanup

IF usercommand$(runcommands) = "dim" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "launch" OR usercommand$(runcommands2) = "start" OR usercommand$(runcommands2) = "run" OR usercommand$(runcommands2) = "screen" THEN
                SHELL _DONTWAIT _HIDE "start tools\dimscreen.exe"
                OPEN "tools\dimscreen.ini" FOR INPUT AS #1
                FOR getdimcount = 1 TO 4
                    LINE INPUT #1, getdimcount$(getdimcount)
                NEXT getdimcount
                CLOSE #1
                getdimcount$ = RIGHT$(getdimcount$(4), 1)
                dimcount = (VAL(getdimcount$) * 10)
                speechoutput$ = "launching ScreenDim"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "up" OR usercommand$(runcommands2) = "increase" THEN
                _SCREENPRINT (CHR$(0) + CHR$(130))
                dimcount = dimcount + 10
                speechoutput$ = "increasing dim"
                speechprint$ = speechoutput$
                GOSUB textprint
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "down" OR usercommand$(runcommands2) = "decrease" THEN
                _SCREENPRINT (CHR$(0) + CHR$(131))
                dimcount = dimcount - 10
                IF dimcount = 0 THEN
                    SHELL _DONTWAIT _HIDE "taskkill /IM dimscreen.exe /F"
                    speechoutput$ = "closing ScreenDim"
                    EXIT DO
                END IF
                speechoutput$ = "decreasing dim"
                speechprint$ = speechoutput$
                GOSUB textprint
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "off" THEN
                SHELL _DONTWAIT _HIDE "taskkill /IM dimscreen.exe /F"
                speechoutput$ = "closing ScreenDim"
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

IF usercommand$(runcommands) = "directory" OR usercommand$(runcommands) = "directories" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "screenshot" THEN
                request$ = "Enter the full directory of your JARVIS Screenshot folder" + CHR$(13) + "ex/ 'D:\My Pictures\Screenshots\'"
                PRINT #jarvisboard, request$
                speechoutput$ = "Enter the full directory of your JARVIS Screenshot folder into the box, when you are done press Enter, if the box is empty the query will be discarded."
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                DO
                    _LIMIT 1
                    INPUT #jarvisboard, response$
                LOOP UNTIL response$ <> ""
                IF response$ <> CHR$(255) THEN ssloc$ = response$
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "document" OR usercommand$(runcommands2) = "documents" THEN
                request$ = "Enter the full directory of your My Documents folder" + CHR$(13) + "ex/ 'C:\Documents and Settings\Owner\My Documents\'"
                PRINT #jarvisboard, request$
                speechoutput$ = "Enter the full directory of your My Documents folder into the box, when you are done press Enter, if the box is empty the query will be discarded."
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                DO
                    _LIMIT 1
                    INPUT #jarvisboard, response$
                LOOP UNTIL response$ <> ""
                IF response$ <> CHR$(255) THEN mdpath$ = response$
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "download" OR usercommand$(runcommands2) = "downloads" THEN
                request$ = "Enter the full directory of your Downloads folder" + CHR$(13) + "ex/ 'C:\Documents and Settings\Owner\My Documents\Downloads\'"
                PRINT #jarvisboard, request$
                speechoutput$ = "Enter the full directory of your Downloads folder into the box, when you are done press Enter, if the box is empty the query will be discarded."
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                DO
                    _LIMIT 1
                    INPUT #jarvisboard, response$
                LOOP UNTIL response$ <> ""
                IF response$ <> CHR$(255) THEN downloadpath$ = response$
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "program" OR usercommand$(runcommands2) = "programs" THEN
                request$ = "Enter the full directory of your Start Menu folder" + CHR$(13) + "ex/ 'C:\Documents and Settings\All Users\Start Menu\Programs'"
                PRINT #jarvisboard, request$
                speechoutput$ = "Enter the full directory of your Start Menu folder into the box, when you are done press Enter, if the box is empty the query will be discarded."
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                DO
                    _LIMIT 1
                    INPUT #jarvisboard, response$
                LOOP UNTIL response$ <> ""
                IF response$ <> CHR$(255) THEN programdir$ = response$
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "music" THEN
                request$ = "Enter the full directory of your Music folder" + CHR$(13) + "ex/ 'C:\Documents and Settings\All Users\Start Menu\Programs'"
                PRINT #jarvisboard, request$
                speechoutput$ = "Enter the full directory of your Music folder into the box, enter 0 to look for music on your entire computer, when you are done press Enter, if the box is empty the query will be discarded."
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                DO
                    _LIMIT 1
                    INPUT #jarvisboard, response$
                LOOP UNTIL response$ <> ""
                IF response$ <> CHR$(255) THEN musicdir$ = response$
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "disk" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "cleanup" THEN
                speechoutput$ = "launching cleanup tool"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "start %SystemRoot%\system32\cleanmgr.exe"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "divided" OR usercommand$(runcommands) = "/" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            FOR runcommands3 = 1 TO commandcount
                IF usercommand$(runcommands2) = commands$(runcommands3) AND usercommand$(runcommands2) <> "divided" AND usercommand$(runcommands2) <> "/" AND usercommand$(runcommands2) <> "by" THEN EXIT DO
            NEXT runcommands3
        NEXT runcommands2
        nums = 0
        DO
            FOR numcheck = 1 TO userinputs
                IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                    nums = nums + 1
                    num##(nums) = VAL(userinputcopy$(numcheck))
                    IF nums = 2 THEN EXIT DO
                END IF
            NEXT numcheck
            EXIT DO
        LOOP
        IF nums <> 2 THEN EXIT DO
        answer## = num##(1) / num##(2)
        speechoutput$ = STR$(answer##)
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
    nums = 0
END IF

IF usercommand$(runcommands) = "down" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = ""
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT (CHR$(0) + CHR$(80))
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "download" OR usercommand$(runcommands) = "downloads" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "set" THEN
                request$ = "Enter the location of your Downloads folder" + CHR$(13) + "ex/ 'C:\Documents and Settings\Owner\My Documents\Downloads\'"
                PRINT #jarvisboard, request$
                speechoutput$ = "Enter the full path of your downloads folder into the box, when you are done press Enter, if the box is empty the query will be discarded"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                DO
                    _LIMIT 1
                    INPUT #jarvisboard, response$
                LOOP UNTIL response$ <> ""
                IF response$ <> CHR$(255) THEN downloadpath$ = response$
                EXIT DO
            END IF
        NEXT runcommands2
        speechoutput$ = "opening downloads folder"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        SHELL _DONTWAIT "explorer /n, /root," + CHR$(34) + downloadpath$ + CHR$(34)
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "drive" THEN
    DO
        FOR drivevol = 97 TO 122
            IF INSTR(useroutput$, (" " + CHR$(drivevol) + " ")) <> 0 OR INSTR(useroutput$, (CHR$(drivevol) + ".")) <> 0 OR INSTR(useroutput$, (" " + CHR$(drivevol))) = (LEN(useroutput$) - 1) THEN
                drivevol$ = CHR$(drivevol) + ":"
                FOR runcommands2 = 1 TO usercommands
                    IF usercommand$(runcommands2) = "open" OR usercommand$(runcommands2) = "explore" THEN
                        DO
                            FOR runcommands3 = 1 TO usercommands
                                IF usercommand$(runcommands3) = "door" THEN
                                    DO
                                        FOR runcommands4 = 1 TO usercommands
                                            IF usercommand$(runcommands4) = "close" OR usercommand$(runcommands4) = "shut" THEN
                                                speechoutput$ = "shutting door to " + drivevol$
                                                speechprint$ = speechoutput$
                                                GOSUB textprint
                                                GOSUB speechoutput
                                                SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " cdrom close " + drivevol$
                                                usercommands = -1
                                                EXIT DO
                                            END IF
                                        NEXT runcommands4
                                        speechoutput$ = "opening door to " + drivevol$
                                        speechprint$ = speechoutput$
                                        GOSUB textprint
                                        GOSUB speechoutput
                                        SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " cdrom open " + drivevol$
                                        usercommands = -1
                                        EXIT DO
                                    LOOP
                                    EXIT DO
                                END IF
                            NEXT runcommands3
                            speechoutput$ = "opening " + drivevol$
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            SHELL _DONTWAIT "explorer " + drivevol$
                            usercommands = -1
                            EXIT DO
                        LOOP
                        EXIT DO
                    END IF
                    IF usercommand$(runcommands2) = "door" THEN
                        DO
                            FOR runcommands3 = 1 TO usercommands
                                IF usercommand$(runcommands3) = "close" OR usercommand$(runcommands3) = "shut" THEN
                                    speechoutput$ = "shutting door to " + drivevol$
                                    speechprint$ = speechoutput$
                                    GOSUB textprint
                                    GOSUB speechoutput
                                    SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " cdrom close " + drivevol$
                                    usercommands = -1
                                    EXIT DO
                                END IF
                            NEXT runcommands3
                            speechoutput$ = "opening door to " + drivevol$
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " cdrom open " + drivevol$
                            usercommands = -1
                            EXIT DO
                        LOOP
                        EXIT DO
                    END IF
                NEXT runcommands2
                EXIT DO
            END IF
        NEXT drivevol
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "ebay" THEN
    speechoutput$ = "opening ebay"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\ebay.URL"
    usercommands = -1
END IF

IF usercommand$(runcommands) = "echo" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "off" THEN EXIT DO
        NEXT runcommands2
        echo = 1
        speechoutput$ = "echo turned on"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "enter" OR usercommand$(runcommands) = "send" OR usercommand$(runcommands) = "go" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = ""
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT CHR$(13)
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "escape" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = ""
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT CHR$(27)
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "dim" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "launch" OR usercommand$(runcommands2) = "start" OR usercommand$(runcommands2) = "run" OR usercommand$(runcommands2) = "screen" THEN
                SHELL _DONTWAIT _HIDE "start tools\dimscreen.exe"
                OPEN "tools\dimscreen.ini" FOR INPUT AS #1
                FOR getdimcount = 1 TO 4
                    LINE INPUT #1, getdimcount$(getdimcount)
                NEXT getdimcount
                CLOSE #1
                getdimcount$ = RIGHT$(getdimcount$(4), 1)
                dimcount = (VAL(getdimcount$) * 10)
                speechoutput$ = "launching ScreenDim"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "up" OR usercommand$(runcommands2) = "increase" THEN
                _SCREENPRINT (CHR$(0) + CHR$(130))
                dimcount = dimcount + 10
                speechoutput$ = "increasing dim"
                speechprint$ = speechoutput$
                GOSUB textprint
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "down" OR usercommand$(runcommands2) = "decrease" THEN
                _SCREENPRINT (CHR$(0) + CHR$(131))
                dimcount = dimcount - 10
                IF dimcount = 0 THEN
                    SHELL _DONTWAIT _HIDE "taskkill /IM dimscreen.exe /F"
                    speechoutput$ = "closing ScreenDim"
                    EXIT DO
                END IF
                speechoutput$ = "decreasing dim"
                speechprint$ = speechoutput$
                GOSUB textprint
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "off" THEN
                SHELL _DONTWAIT _HIDE "taskkill /IM dimscreen.exe /F"
                speechoutput$ = "closing ScreenDim"
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

IF usercommand$(runcommands) = "face" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "book" THEN
                speechoutput$ = "opening facebook"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "start resources\urls\facebook.URL"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
IF usercommand$(runcommands) = "facebook" THEN
    speechoutput$ = "opening facebook"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\facebook.URL"
    usercommands = -1
END IF

IF usercommand$(runcommands) = "fact" OR usercommand$(runcommands) = "facts" THEN
    fact = 0
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "last" THEN fact = lastfact
        NEXT runcommands2
        EXIT DO
    LOOP
    IF fact = 0 THEN 
        RANDOMIZE TIMER
        fact = INT(RND * NumOfFact + 1)
    END IF
    DIM factstart AS _UNSIGNED _INTEGER64
    DIM factend AS _UNSIGNED _INTEGER64
    OPEN "resources\db\fact.jdb" FOR BINARY AS #1
    GET #1, ((fact - 1) * 8) + 1, factstart
    GET #1, (fact * 8) + 1, factend
    fact$ = SPACE$(factend - factstart)
    GET #1, (factstart + 1), fact$
    CLOSE #1        
    lastfact = fact
    fact = 0
    speechoutput$ = fact$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF

IF usercommand$(runcommands) = "factor" OR usercommand$(runcommands) = "factors" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            FOR runcommands3 = 1 TO commandcount
                IF usercommand$(runcommands2) = commands$(runcommands3) AND usercommand$(runcommands2) <> "factor" AND usercommand$(runcommands2) <> "factors" THEN EXIT DO
            NEXT runcommands3
        NEXT runcommands2
        containnum = 0
        DO
            FOR numcheck = 1 TO userinputs
                IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                    num = VAL(userinputcopy$(numcheck))
                    containnum = 1
                    EXIT DO
                END IF
            NEXT numcheck
            EXIT DO
        LOOP
        IF containnum = 0 THEN EXIT DO
        containnum = 0
        IF num <> INT(num) THEN EXIT DO
        factors = 0
        REDIM factors(1024)
        maxval = (num / 2) + 1
        $CHECKING:OFF
        FOR checkdiv = 1 TO maxval
            IF num MOD checkdiv = 0 THEN
                factors = factors + 1
                factors(factors) = checkdiv
            END IF
        NEXT checkdiv
        $CHECKING:ON
        factors = factors + 1
        factors(factors) = num
        speechoutput$ = "the factors of " + TRIM$(STR$(num)) + " are "
        FOR addfactor = 1 TO factors
            SELECT CASE addfactor
                CASE factors
                    speechoutput$ = speechoutput$ + TRIM$(STR$(factors(addfactor)))
                CASE (factors - 1)
                    speechoutput$ = speechoutput$ + TRIM$(STR$(factors(addfactor))) + ", and "
                CASE ELSE
                    speechoutput$ = speechoutput$ + TRIM$(STR$(factors(addfactor))) + ", "
            END SELECT
        NEXT addfactor
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "factorial" OR usercommand$(runcommands) = "!" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            FOR runcommands3 = 1 TO commandcount
                IF usercommand$(runcommands2) = commands$(runcommands3) AND usercommand$(runcommands2) <> "factorial" AND usercommand$(runcommands2) <> "!" THEN EXIT DO
            NEXT runcommands3
        NEXT runcommands2
        containnum = 0
        DO
            FOR numcheck = 1 TO userinputs
                IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                    num##(1) = VAL(userinputcopy$(numcheck))
                    containnum = 1
                    EXIT DO
                END IF
            NEXT numcheck
            EXIT DO
        LOOP
        IF containnum = 0 THEN EXIT DO
        containnum = 0
        answer## = num##(1)
        FOR factorial = (num##(1) - 1) TO 1 STEP -1
            answer## = answer## * factorial
        NEXT factorial
        speechoutput$ = STR$(answer##)
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "favorite" OR usercommand$(runcommands) = "favorites" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "add" THEN
                request$ = "Enter the website you want to favorite" + CHR$(13) + "ex/ 'http://www.google.com'"
                PRINT #jarvisboard, request$
                speechoutput$ = "Enter the data for the website into the box, when you are done press Enter, if the box is empty the query will be discarded"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                DO
                    _LIMIT 1
                    INPUT #jarvisboard, response$
                LOOP UNTIL response$ <> ""
                IF response$ <> CHR$(255) THEN
                    webaddress$ = response$
                    request$ = "Enter the title of the favorite" + CHR$(13) + "ex/ 'Google'"
                    PRINT #jarvisboard, request$
                    DO
                        _LIMIT 1
                        INPUT #jarvisboard, response$
                    LOOP UNTIL response$ <> ""
                    IF response$ <> CHR$(255) THEN
                        webname$ = response$
                        speechoutput$ = "Adding favorite '" + webname$ + "' target '" + webaddress$ + "'"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " urlshortcut " + CHR$(34) + webaddress$ + CHR$(34) + " " + CHR$(34) + "~$folder.favorites$\Links" + CHR$(34) + " " + CHR$(34) + webname$ + CHR$(34)
                    END IF
                END IF
                EXIT DO
            END IF
        NEXT runcommands2
        speechoutput$ = "opening favorites"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        SHELL _DONTWAIT _HIDE "start shell:Favorites"
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "feel" OR usercommand$(runcommands) = "feeling" THEN
    DO
        emotiontype = 0
        DO
            FOR emotioncheck = 1 TO userinputs
                FOR poscheck = 1 TO emotionsposcount
                    IF userinputcopy$(emotioncheck) = emotionspos$(poscheck) THEN
                        emotiontype = 1
                        EXIT DO
                    END IF
                NEXT poscheck
                FOR negcheck = 1 TO emotionsnegcount
                    IF userinputcopy$(emotioncheck) = emotionsneg$(negcheck) THEN
                        emotiontype = 2
                        EXIT DO
                    END IF
                NEXT negcheck
                PRINT userinputcopy$(emotioncheck)
            NEXT emotioncheck
            EXIT DO
        LOOP
        SELECT CASE emotiontype
            CASE 0
                EXIT DO
            CASE 1
                speechoutput$ = "that is good to hear " + username$
            CASE 2
                feelresponse = INT(RND * 14 + 1)
                SELECT CASE feelresponse
                    CASE 1
                        advice$ = "do a quick excersise"
                    CASE 2
                        advice$ = "eat a snack"
                    CASE 3
                        advice$ = "tell someone whats on your mind"
                    CASE 4
                        advice$ = "take a break from life"
                    CASE 5
                        advice$ = "do something fun"
                    CASE 6
                        advice$ = "go outside"
                    CASE 7
                        advice$ = "make physical contact with someone"
                    CASE 8
                        advice$ = "talk to a friend"
                    CASE 9
                        advice$ = "unexpectedly be kind to someone"
                    CASE 10
                        advice$ = "take a nap"
                    CASE 11
                        advice$ = "bring back good memories"
                    CASE 12
                        advice$ = "smile a little"
                    CASE 13
                        advice$ = "listen to some music"
                    CASE 14
                        advice$ = "watch some funny videos"
                END SELECT
                speechoutput$ = "i am sorry to hear that " + username$ + ", maybe you should " + advice$
        END SELECT
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "focus" THEN
    speechoutput$ = "switching to focus"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    focus& = ShowWindow&(hwnd, 1)
    usercommands = -1
END IF

IF usercommand$(runcommands) = "font" OR usercommand$(runcommands) = "fonts" THEN
    speechoutput$ = "opening fonts folder"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start shell:Fonts"
    usercommands = -1
END IF

IF usercommand$(runcommands) = "fractal" THEN
    DO
        DO
            fractaltype = 5
            speechoutput$ = "launching random fractal"
            FOR runcommands2 = 1 TO usercommands
                IF usercommand$(runcommands2) = "close" OR usercommand$(runcommands2) = "terminate" OR usercommand$(runcommands2) = "exit" OR usercommand$(runcommands2) = "end" THEN
                    SHELL _DONTWAIT _HIDE "taskkill /IM fractal.exe /F"
                    speechoutput$ = "closing fractal"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    usercommands = -1
                    EXIT DO
                END IF
                IF usercommand$(runcommands2) = "warp" THEN
                    fractaltype = 0
                    speechoutput$ = "launching warp fractal"
                    EXIT DO
                END IF
                IF usercommand$(runcommands2) = "leaf" THEN
                    fractaltype = 1
                    speechoutput$ = "launching leaf fractal"
                    EXIT DO
                END IF
                IF usercommand$(runcommands2) = "geometric" THEN
                    fractaltype = 2
                    speechoutput$ = "launching geometric fractal"
                    EXIT DO
                END IF
                IF usercommand$(runcommands2) = "burst" THEN
                    fractaltype = 3
                    speechoutput$ = "launching burst fractal"
                    EXIT DO
                END IF
                IF usercommand$(runcommands2) = "mandlebrot" THEN
                    fractaltype = 4
                    speechoutput$ = "launching mandlebrot fractal"
                    EXIT DO
                END IF
            NEXT runcommands2
            EXIT DO
        LOOP
        IF usercommands = -1 THEN EXIT DO
        OPEN "temp\fractaltype.tmp" FOR OUTPUT AS #1
        PRINT #1, LTRIM$(STR$(fractaltype))
        CLOSE #1
        SHELL _DONTWAIT _HIDE "start tools\fractal.exe"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "google" AND RIGHT$(useroutputuse$, 6) = "google" THEN
    speechoutput$ = "opening google"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\google.URL"
    usercommands = -1
END IF

IF usercommand$(runcommands) = "green" THEN
    textcolor = 10
    usercommands = -1
END IF

IF usercommand$(runcommands) = "grey" THEN
    textcolor = 8
    usercommands = -1
END IF

IF usercommand$(runcommands) = "hello" OR usercommand$(runcommands) = "hey" OR usercommand$(runcommands) = "yo" OR usercommand$(runcommands) = "hi" THEN
    speechoutput$ = "yes " + username$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF

IF usercommand$(runcommands) = "help" OR usercommand$(runcommands) = "documentation" OR usercommand$(runcommands) = "website" OR usercommand$(runcommands) = "webpage" THEN
    speechoutput$ = "opening documentation"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF

IF usercommand$(runcommands) = "hibernate" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "on" THEN
                speechoutput$ = "hibernation turned on"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "powercfg.exe /hibernate on"
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "off" THEN
                speechoutput$ = "hibernation turned off"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "cmd c\ powercfg.exe /hibernate off"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        speechoutput$ = "hibernating computer"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        SHELL _DONTWAIT _HIDE "powercfg.exe /hibernate on"
        commander = SetSuspendState
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "hibernation" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "on" THEN
                speechoutput$ = "hibernation turned on"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "powercfg.exe /hibernate on"
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "off" THEN
                speechoutput$ = "hibernation turned off"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "powercfg.exe /hibernate off"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "hide" AND usercommands = 1 THEN
    _SCREENHIDE
    screenstate = 0
    speechoutput$ = ""
    speechprint$ = ""
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF

IF usercommand$(runcommands) = "history" AND usercommands = userinputs THEN
    speechoutput$ = "opening history"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start shell:History"
    usercommands = -1
END IF

IF usercommand$(runcommands) = "internet" OR usercommand$(runcommands) = "browser" THEN
    speechoutput$ = "launching browser"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\internet.LNK"
    usercommands = -1
END IF

IF usercommand$(runcommands) = "inverse" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            FOR runcommands3 = 1 TO commandcount
                IF usercommand$(runcommands2) = commands$(runcommands3) AND usercommand$(runcommands2) <> "inverse" THEN EXIT DO
            NEXT runcommands3
        NEXT runcommands2
        containnum = 0
        DO
            FOR numcheck = 1 TO userinputs
                IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                    num##(1) = VAL(userinputcopy$(numcheck))
                    containnum = 1
                    EXIT DO
                END IF
            NEXT numcheck
            EXIT DO
        LOOP
        IF containnum = 0 THEN EXIT DO
        containnum = 0
        answer## = num##(1) ^ (-1)
        speechoutput$ = STR$(answer##)
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "ip" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "copy" THEN
                SHELL _HIDE "resources\wget http://checkip.dyndns.com/ -O temp\globalIP.htm"
                OPEN "temp\globalIP.htm" FOR INPUT AS 1
                LINE INPUT #1, ip$
                CLOSE #1
                KILL "temp\globalIP.htm"
                ip$ = MID$(ip$, INSTR(ip$, ":") + 2)
                ip$ = LEFT$(ip$, INSTR(ip$, "<") - 1)
                speechoutput$ = "copying ip adress to clipboard"
                speechprint$ = speechoutput$
                speechcopy$ = ip$
                GOSUB textprint
                GOSUB speechoutput
                _CLIPBOARD$ = ip$
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        SHELL _HIDE "resources\wget http://checkip.dyndns.com/ -O temp\globalIP.htm"
        OPEN "temp\globalIP.htm" FOR INPUT AS 1
        LINE INPUT #1, ip$
        CLOSE #1
        KILL "temp\globalIP.htm"
        ip$ = MID$(ip$, INSTR(ip$, ":") + 2)
        ip$ = LEFT$(ip$, INSTR(ip$, "<") - 1)
        speechoutput$ = "your current ip adress is " + ip$
        speechprint$ = speechoutput$
        speechcopy$ = ip$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "italicize" OR usercommand$(runcommands) = "italic" OR usercommand$(runcommands) = "italics" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = "printing"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT CHR$(9)
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "joke" OR usercommand$(runcommands) = "jokes" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "last" THEN joke = lastjoke
        NEXT runcommands2
        EXIT DO
    LOOP
    IF joke = 0 THEN 
        RANDOMIZE TIMER
        joke = INT(RND * NumOfJoke + 1)
    END IF
    DIM jokestart AS _UNSIGNED _INTEGER64
    DIM jokeend AS _UNSIGNED _INTEGER64
    OPEN "resources\db\joke.jdb" FOR BINARY AS #1
    GET #1, ((joke - 1) * 8) + 1, jokestart
    GET #1, (joke * 8) + 1, jokeend
    joke$ = SPACE$(jokeend - jokestart)
    GET #1, (jokestart + 1), joke$
    CLOSE #1        
    lastjoke = joke
    joke = 0
    speechoutput$ = joke$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF

IF usercommand$(runcommands) = "keyboard" THEN
    speechoutput$ = "launching virtual keyboard"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start %SystemRoot%\system32\osk.exe"
    usercommands = -1
END IF

IF usercommand$(runcommands) = "left" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = ""
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT (CHR$(0) + CHR$(75))
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "linkedin" THEN
    speechoutput$ = "opening linkedin"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\linkedin.URL"
    usercommands = -1
END IF

IF usercommand$(runcommands) = "listen" OR usercommand$(runcommands) = "listening" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "toggle" THEN
                SELECT CASE recognition
                CASE 0
                    recognition = 1
                    speechoutput$ = "voice recognition turned on"
                CASE 1
                    recognition = 0
                    speechoutput$ = "voice recognition turned off"
                END SELECT
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "start" AND recognition = 0 THEN
                speechoutput$ = "voice recognition turned on"
                speechprint$ = speechoutput$
                recognition = 0
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "stop" AND recognition = 1 THEN
                speechoutput$ = "voice recognition turned off"
                speechprint$ = speechoutput$
                recognition = 0
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        IF recognition = 0 THEN
            speechoutput$ = "voice recognition turned on"
            speechprint$ = speechoutput$
            recognition = 1
            GOSUB textprint
            GOSUB speechoutput
            usercommands = -1
        END IF
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "live" THEN
    speechoutput$ = "opening windows live"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\live.URL"
    usercommands = -1
END IF

IF usercommand$(runcommands) = "location" THEN
    speechoutput$ = jarvisloc$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF

IF usercommand$(runcommands) = "lock" THEN
    speechoutput$ = "locking computer"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    commander = LockWorkStation
    usercommands = -1
END IF

IF usercommand$(runcommands) = "log" THEN
    DO
        nums = 0
        numhas = 0
        FOR numcheck = 1 TO userinputs
            IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                nums = nums + 1
                num##(nums) = VAL(userinputcopy$(numcheck))
                numhas = 1
            END IF
        NEXT numcheck
        IF numhas = 0 THEN
            DO
                FOR runcommands2 = 1 TO usercommands
                    IF usercommand$(runcommands2) = "close" OR usercommand$(runcommands2) = "terminate" OR usercommand$(runcommands2) = "exit" OR usercommand$(runcommands2) = "end" THEN
                        SHELL _DONTWAIT _HIDE "taskkill /IM log.exe /F"
                        speechoutput$ = "closing the log"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        EXIT DO
                    END IF
                    IF usercommand$(runcommands2) = "clear" THEN
                        speechoutput$ = "the log is used to help me learn in future update, are you sure you want to clear it?"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        ynlogclear = 1
                        EXIT DO
                    END IF
                    IF usercommand$(runcommands2) = "off" OR usercommand$(runcommands2) = "out" THEN
                        speechoutput$ = "logging off computer"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " exitwin logoff"
                        usercommands = -1
                        EXIT DO
                    END IF
                NEXT runcommands2
                SHELL _DONTWAIT _HIDE "start tools\log.exe"
                speechoutput$ = "opening log"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            LOOP
        ELSE
            IF nums = 1 THEN
                answer## = LOG(num##(1))
                speechoutput$ = STR$(answer##)
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                nums = 0
                EXIT DO
            END IF
            IF nums = 2 THEN
                logbase = 0
                DO
                    FOR runcommands2 = 1 TO usercommands
                        IF usercommand$(runcommands2) = "base" THEN
                            logbase = 1
                            EXIT DO
                        END IF
                    NEXT runcommands2
                    EXIT DO
                LOOP
                IF logbase = 1 THEN
                    answer## = (LOG(num##(1)) / LOG(num##(2)))
                ELSE
                    answer## = (LOG(num##(2)) / LOG(num##(1)))
                END IF
                speechoutput$ = STR$(answer##)
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                logbase = 0
                nums = 0
            END IF
        END IF
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "magnifier" OR usercommand$(runcommands) = "magnify" THEN
    speechoutput$ = "launching magnifier"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start %SystemRoot%\system32\magnify.exe"
    usercommands = -1
END IF

IF usercommand$(runcommands) = "magenta" THEN
    textcolor = 13
    speechprint$ = speechoutput$
    GOSUB textprint
    usercommands = -1
END IF

IF usercommand$(runcommands) = "minimize" THEN
    speechoutput$ = "minimizing foreground window"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    fgwin%& = GetForegroundWindow
    miniwin = CloseWindow(fgwin%&)
    usercommands = -1
END IF

IF usercommand$(runcommands) = "minus" OR usercommand$(runcommands) = "-" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            FOR runcommands3 = 1 TO commandcount
                IF usercommand$(runcommands2) = commands$(runcommands3) AND usercommand$(runcommands2) <> "minus" AND usercommand$(runcommands2) <> "-" THEN EXIT DO
            NEXT runcommands3
        NEXT runcommands2
        nums = 0
        DO
            FOR numcheck = 1 TO userinputs
                IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                    nums = nums + 1
                    num##(nums) = VAL(userinputcopy$(numcheck))
                    IF nums = 2 THEN EXIT DO
                END IF
            NEXT numcheck
            EXIT DO
        LOOP
        IF nums <> 2 THEN EXIT DO
        answer## = num##(1) - num##(2)
        speechoutput$ = STR$(answer##)
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
    nums = 0
END IF

IF usercommand$(runcommands) = "mod" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            FOR runcommands3 = 1 TO commandcount
                IF usercommand$(runcommands2) = commands$(runcommands3) AND usercommand$(runcommands2) <> "mod" THEN EXIT DO
            NEXT runcommands3
        NEXT runcommands2
        nums = 0
        DO
            FOR numcheck = 1 TO userinputs
                IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                    nums = nums + 1
                    num##(nums) = VAL(userinputcopy$(numcheck))
                    IF nums = 2 THEN EXIT DO
                END IF
            NEXT numcheck
            EXIT DO
        LOOP
        IF nums <> 2 THEN EXIT DO
        answer## = num##(1) MOD num##(2)
        speechoutput$ = STR$(answer##)
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
    nums = 0
END IF

IF usercommand$(runcommands) = "monitor" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "on" THEN
                speechoutput$ = "monitor on"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " monitor on"
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "off" THEN
                speechoutput$ = "monitor off"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " monitor off"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "month" THEN
    month$ = LEFT$(DATE$, 2)
    month = VAL(month$)
    SELECT CASE month
        CASE 1
            monthsay$ = "January"
        CASE 2
            monthsay$ = "February"
        CASE 3
            monthsay$ = "March"
        CASE 4
            monthsay$ = "April"
        CASE 5
            monthsay$ = "May"
        CASE 6
            monthsay$ = "June"
        CASE 7
            monthsay$ = "July"
        CASE 8
            monthsay$ = "August"
        CASE 9
            monthsay$ = "September"
        CASE 10
            monthsay$ = "October"
        CASE 11
            monthsay$ = "November"
        CASE 12
            monthsay$ = "December"
    END SELECT
    speechoutput$ = "it is currently the month of " + monthsay$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF

IF usercommand$(runcommands) = "msn" THEN
    speechoutput$ = "opening msn"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\msn.URL"
    usercommands = -1
END IF

IF usercommand$(runcommands) = "mute" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "on" THEN
                speechoutput$ = "volume muted"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                _DELAY 1
                SHELL _HIDE _DONTWAIT CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " mutesysvolume 1"
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "off" THEN
                SHELL _HIDE _DONTWAIT CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " mutesysvolume 0"
                _DELAY .5
                speechoutput$ = "volume unmuted"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "toggle" THEN
                SHELL _HIDE _DONTWAIT CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " mutesysvolume 2"
                speechoutput$ = "volume muted"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        speechoutput$ = "volume muted"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _DELAY 1
        SHELL _HIDE _DONTWAIT CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " mutesysvolume 1"
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "my" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "computer" THEN
                speechoutput$ = "opening my computer"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT "explorer /n, /select, c:\"
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "documents" OR usercommand$(runcommands2) = "document" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands3) = "set" THEN
                            request$ = "Enter the location of your My Documents folder" + CHR$(13) + "ex/ 'C:\Documents and Settings\Owner\My Documents'"
                            PRINT #jarvisboard, request$
                            speechoutput$ = "Enter the full path of your my documents folder into the box, when you are done press Enter, if the box is empty the query will be discarded"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            usercommands = -1
                            DO
                                _LIMIT 1
                                INPUT #jarvisboard, response$
                            LOOP UNTIL response$ <> ""
                            IF response$ <> CHR$(255) THEN mdpath$ = response$
                            EXIT DO
                        END IF
                    NEXT runcommands3
                    speechoutput$ = "opening my documents"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    SHELL _DONTWAIT _HIDE "start shell:Personal"
                    usercommands = -1
                    EXIT DO
                LOOP
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "music" THEN
                speechoutput$ = "opening my music"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT "explorer /n, /root," + CHR$(34) + mdpath$ + "My Music" + CHR$(34)
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "pictures" OR usercommand$(runcommands2) = "picture" THEN
                speechoutput$ = "opening my pictures"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT "explorer /n, /root," + CHR$(34) + mdpath$ + "My Pictures" + CHR$(34)
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "videos" OR usercommand$(runcommands2) = "video" THEN
                speechoutput$ = "opening my videos"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT "explorer /n, /root," + CHR$(34) + mdpath$ + "My Videos" + CHR$(34)
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "name" THEN
    DO
        FOR namealg = 1 TO userinputs
            IF userinput$(namealg) = "my" THEN
                FOR namealg2 = 1 TO userinputs
                    IF userinput$(namealg2) = "is" THEN
                        namefind = 0
                        FOR namealg3 = 1 TO userinputs
                            IF userinput$(namealg3) <> "my" AND userinput$(namealg3) <> "is" AND userinput$(namealg3) <> "name" AND userinput$(namealg3) <> "what" THEN
                                tempusername$ = userinput$(namealg3)
                                namefind = 1
                            END IF
                            IF userinput$(namealg3) = "what" THEN
                                speechoutput$ = "your name is " + username$
                                speechprint$ = speechoutput$
                                GOSUB textprint
                                GOSUB speechoutput
                                usercommands = -1
                                EXIT DO
                            END IF
                        NEXT namealg3
                        IF namefind = 0 THEN EXIT DO
                        ynname = 1
                        speechoutput$ = "your name is " + tempusername$ + ", is that right"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        EXIT DO
                    END IF
                NEXT namealg2
                speechoutput$ = "your name is " + username$
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF userinput$(namealg) = "your" THEN
                speechoutput$ = "my name is JARVIS, but my friends call me Just Another Rather Very Intelligent System"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
        NEXT namealg
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "no" OR usercommand$(runcommands) = "nah" OR usercommand$(runcommands) = "negative" THEN
    IF ynlogclear = 1 THEN
        speechoutput$ = "the log has not been cleared"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        ynlogclear = 0
    END IF
    IF ynname = 1 THEN
        request$ = "Enter your name" + CHR$(13) + "ex/ 'John Smith'"
        PRINT #jarvisboard, request$
        speechoutput$ = "maybe you would like to type it instead, enter your name in the box, when you are done press Enter, if the box is empty the query will be discarded"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        DO
            _LIMIT 1
            INPUT #jarvisboard, response$
        LOOP UNTIL response$ <> ""
        IF response$ <> CHR$(255) THEN username$ = response$
        speechoutput$ = "i have saved your name as " + username$
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        ynname = 0
    END IF
    IF ynpackage = 1 THEN
        speechoutput$ = "packaging has been aborted"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        ynpackage = 0
    END IF
    IF ynreset = 1 THEN
        speechoutput$ = "reset has been aborted"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        ynreset = 0
    END IF
    IF ynrestart = 1 THEN
        speechoutput$ = "restart has been aborted"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        ynrestart = 0
    END IF
    IF ynsaveprofile = 1 THEN
        speechoutput$ = "uninstalling"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        iniloc$ = "data\jarvis.ini"
        GOSUB updateini
        SHELL _HIDE "copy batch\uninstall.bat C:\uninstall.bat"
        SHELL _HIDE "start C:\uninstall.bat"
        ynsaveprofile = 0
        SYSTEM
    END IF
    IF ynshutdown = 1 THEN
        speechoutput$ = "shutdown has been aborted"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        ynshutdown = 0
    END IF
    IF ynuninstall = 1 THEN
        speechoutput$ = "uninstall has been aborted"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        ynuninstall = 0
    END IF
END IF

IF usercommand$(runcommands) = "note" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "pad" THEN
                speechoutput$ = "opening a notepad"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "start notepad.exe"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "notepad" THEN
    speechoutput$ = "opening a notepad"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start notepad.exe"
    usercommands = -1
END IF

IF usercommand$(runcommands) = "ok" OR usercommand$(runcommands) = "indeed" OR usercommand$(runcommands) = "correct" OR usercommand$(runcommands) = "right" OR usercommand$(runcommands) = "quite" OR usercommand$(runcommands) = "aight" OR usercommand$(runcommands) = "alright" OR usercommand$(runcommands) = "cool" OR usercommand$(runcommands) = "good" OR usercommand$(runcommands) = "nice" THEN
    RANDOMIZE TIMER
    acknowlegmentpick = INT(RND * 6)
    SELECT CASE acknowlegmentpick
        CASE 0
            speechoutput$ = "ok"
        CASE 1
            speechoutput$ = "right"
        CASE 2
            speechoutput$ = "indeed"
        CASE 3
            speechoutput$ = "correct"
        CASE 4
            speechoutput$ = "yes"
        CASE 5
            speechoutput$ = "quite"
    END SELECT
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF

IF usercommand$(runcommands) = "old" THEN
    DO
        year1 = VAL(RIGHT$(DATE$, 4))
        month1 = VAL(LEFT$(DATE$, 2))
        day1 = VAL(MID$(DATE$, 4, 2))
        hour1 = VAL(LEFT$(TIME$, 2))
        minute1 = VAL(MID$(TIME$, 4, 2))
        second1 = VAL(RIGHT$(TIME$, 2))
        IF INSTR(useroutputuse$, " you") > 0 THEN
            secdif&& = timebetween&&(2011, 11, 27, 0, 0, 0, year1, month1, day1, hour1, minute1, second1)
            IF secdif&& > 0 THEN
                years$ = STR$(INT((secdif&& / 31556952)))
                days$ = STR$(INT(((secdif&& - (VAL(years$) * 31556952)) / 86400)))
                hours$ = STR$(INT(((secdif&& - ((VAL(years$) * 31556952) + (VAL(days$) * 86400))) / 3600)))
                minutes$ = STR$(INT(((secdif&& - ((VAL(years$) * 31556952) + (VAL(days$) * 86400) + (VAL(hours$) * 3600))) / 60)))
                seconds$ = STR$(INT(((secdif&& - ((VAL(years$) * 31556952) + (VAL(days$) * 86400) + (VAL(hours$) * 3600) + (VAL(minutes$) * 60))))))
                speechoutput$ = "i am"
                IF VAL(years$) THEN speechoutput$ = speechoutput$ + years$ + " years"
                IF VAL(days$) THEN speechoutput$ = speechoutput$ + days$ + " days"
                IF VAL(hours$) THEN speechoutput$ = speechoutput$ + hours$ + " hours"
                IF VAL(minutes$) THEN speechoutput$ = speechoutput$ + minutes$ + " minutes"
                IF VAL(seconds$) THEN speechoutput$ = speechoutput$ + seconds$ + " seconds"
                speechoutput$ = speechoutput$ + " old"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
        ELSE
            year2 = VAL(RIGHT$(birthday$, 4))
            month2 = VAL(LEFT$(birthday$, 2))
            day2 = VAL(MID$(birthday$, 4, 2))
            secdif&& = timebetween&&(year2, month2, day2, 0, 0, 0, year1, month1, day1, hour1, minute1, second1)
            IF secdif&& > 0 THEN
                FOR runcommands2 = 1 TO usercommands
                    IF usercommand$(runcommands2) = "day" OR usercommand$(runcommands2) = "days" THEN
                        days$ = STR$(INT((secdif&& / 86400)))
                        speechoutput$ = "you are " + TRIM$(days$) + " days old"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        EXIT DO
                    END IF
                    IF usercommand$(runcommands2) = "hour" OR usercommand$(runcommands2) = "hour" THEN
                        hours$ = STR$(INT((secdif&& / 3600)))
                        speechoutput$ = "you are " + TRIM$(hours$) + " hours old"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        EXIT DO
                    END IF
                    IF usercommand$(runcommands2) = "minute" OR usercommand$(runcommands2) = "minutes" THEN
                        minutes$ = STR$(INT((secdif&& / 60)))
                        speechoutput$ = "you are " + TRIM$(minutes$) + " minutes old"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        EXIT DO
                    END IF
                    IF usercommand$(runcommands2) = "seconds" OR usercommand$(runcommands2) = "seconds" THEN
                        seconds$ = STR$(INT(secdif&&))
                        speechoutput$ = "you are " + TRIM$(seconds$) + " seconds old"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        EXIT DO
                    END IF
                    IF usercommand$(runcommands2) = "week" OR usercommand$(runcommands2) = "weeks" THEN
                        weeks$ = STR$(INT((secdif&& / 604800)))
                        speechoutput$ = "you are " + TRIM$(weeks$) + " weeks old"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        EXIT DO
                    END IF
                    IF usercommand$(runcommands2) = "year" OR usercommand$(runcommands2) = "years" THEN
                        years$ = STR$(INT((secdif&& / 31556952)))
                        speechoutput$ = "you are " + TRIM$(years$) + " years old"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        EXIT DO
                    END IF
                NEXT runcommands2
                years$ = STR$(INT((secdif&& / 31556952)))
                days$ = STR$(INT(((secdif&& - (VAL(years$) * 31556952)) / 86400)))
                hours$ = STR$(INT(((secdif&& - ((VAL(years$) * 31556952) + (VAL(days$) * 86400))) / 3600)))
                minutes$ = STR$(INT(((secdif&& - ((VAL(years$) * 31556952) + (VAL(days$) * 86400) + (VAL(hours$) * 3600))) / 60)))
                seconds$ = STR$(INT(((secdif&& - ((VAL(years$) * 31556952) + (VAL(days$) * 86400) + (VAL(hours$) * 3600) + (VAL(minutes$) * 60))))))
                speechoutput$ = "you are"
                IF VAL(years$) THEN speechoutput$ = speechoutput$ + years$ + " years"
                IF VAL(days$) THEN speechoutput$ = speechoutput$ + days$ + " days"
                IF VAL(hours$) THEN speechoutput$ = speechoutput$ + hours$ + " hours"
                IF VAL(minutes$) THEN speechoutput$ = speechoutput$ + minutes$ + " minutes"
                IF VAL(seconds$) THEN speechoutput$ = speechoutput$ + seconds$ + " seconds"
                speechoutput$ = speechoutput$ + " old"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
        END IF
        EXIT DO
    LOOP
END IF

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

IF usercommand$(runcommands) = "package" AND usercommands = 1 THEN
    ynpackage = 1
    speechoutput$ = "are you sure you want to package me for distribution?"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF

IF usercommand$(runcommands) = "paste" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = "pasting"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT CHR$(22)
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "plus" OR usercommand$(runcommands) = "+" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            FOR runcommands3 = 1 TO commandcount
                IF usercommand$(runcommands2) = commands$(runcommands3) AND usercommand$(runcommands2) <> "plus" AND usercommand$(runcommands2) <> "+" THEN EXIT DO
            NEXT runcommands3
        NEXT runcommands2
        nums = 0
        DO
            FOR numcheck = 1 TO userinputs
                IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                    nums = nums + 1
                    num##(nums) = VAL(userinputcopy$(numcheck))
                    IF nums = 2 THEN EXIT DO
                END IF
            NEXT numcheck
            EXIT DO
        LOOP
        IF nums <> 2 THEN EXIT DO
        answer## = num##(1) + num##(2)
        speechoutput$ = STR$(answer##)
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
    nums = 0
END IF

IF usercommand$(runcommands) = "position" OR usercommand$(runcommands) = "reposition" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "middle" THEN
                screenpos = 1
                speechoutput$ = "repositioning"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                _SCREENMOVE _MIDDLE
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "top" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands3) = "left" THEN
                            screenpos = 6
                            speechoutput$ = "repositioning"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            _SCREENMOVE 0, 0
                            usercommands = -1
                            EXIT DO
                        END IF
                        IF usercommand$(runcommands3) = "right" THEN
                            screenpos = 7
                            speechoutput$ = "repositioning"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            _SCREENMOVE (workareax - 517), 0
                            usercommands = -1
                            EXIT DO
                        END IF
                    NEXT runcommands3
                    screenpos = 2
                    speechoutput$ = "repositioning"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    _SCREENMOVE ((workareax / 2) - 258), 0
                    usercommands = -1
                    EXIT DO
                LOOP
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "bottom" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands3) = "left" THEN
                            screenpos = 8
                            speechoutput$ = "repositioning"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            _SCREENMOVE 0, (workareay - 240)
                            usercommands = -1
                            EXIT DO
                        END IF
                        IF usercommand$(runcommands3) = "right" THEN
                            screenpos = 9
                            speechoutput$ = "repositioning"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            _SCREENMOVE (workareax - 517), (workareay - 240)
                            usercommands = -1
                            EXIT DO
                        END IF
                    NEXT runcommands3
                    screenpos = 3
                    speechoutput$ = "repositioning"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    _SCREENMOVE ((workareax / 2) - 258), (workareay - 240)
                    usercommands = -1
                    EXIT DO
                LOOP
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "left" THEN
                screenpos = 4
                speechoutput$ = "repositioning"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                _SCREENMOVE 0, ((workareay / 2) - 120)
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "right" THEN
                screenpos = 5
                speechoutput$ = "repositioning"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                _SCREENMOVE (workareax - 517), ((workareay / 2) - 120)
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        screenpos = 7
        speechoutput$ = "repositioning"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENMOVE (workareax - 517), 0
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "print" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = "printing"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT CHR$(16)
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "printer" OR usercommand$(runcommands) = "printer" THEN
    speechoutput$ = "enumerating printers"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start shell:PrintersFolder"
    usercommands = -1
END IF

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

IF usercommand$(runcommands) = "quadratic" THEN
    speechoutput$ = "starting quadratic formula solver"
    SHELL _DONTWAIT _HIDE "start tools\quadratic.exe"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF

IF usercommand$(runcommands) = "quote" OR usercommand$(runcommands) = "quotes" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "last" THEN quote = lastquote
        NEXT runcommands2
        EXIT DO
    LOOP
    IF quote = 0 THEN 
        RANDOMIZE TIMER
        quote = INT(RND * NumOfQuote + 1)
    END IF
    DIM quotestart AS _UNSIGNED _INTEGER64
    DIM quoteend AS _UNSIGNED _INTEGER64
    OPEN "resources\db\quote.jdb" FOR BINARY AS #1
    GET #1, ((quote - 1) * 8) + 1, quotestart
    GET #1, (quote * 8) + 1, quoteend
    quote$ = SPACE$(quoteend - quotestart)
    GET #1, (quotestart + 1), quote$
    CLOSE #1        
    lastquote = quote
    quote = 0
    speechoutput$ = quote$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF

IF usercommand$(runcommands) = "radian" OR usercommand$(runcommands) = "radians" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "set" THEN
                anglepref = 0
                speechoutput$ = "setting angles to radian"
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

IF usercommand$(runcommands) = "raised" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            FOR runcommands3 = 1 TO commandcount
                IF usercommand$(runcommands2) = commands$(runcommands3) AND usercommand$(runcommands2) <> "raised" THEN EXIT DO
            NEXT runcommands3
        NEXT runcommands2
        nums = 0
        DO
            FOR numcheck = 1 TO userinputs
                IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                    nums = nums + 1
                    num##(nums) = VAL(userinputcopy$(numcheck))
                    IF nums = 2 THEN EXIT DO
                END IF
            NEXT numcheck
            EXIT DO
        LOOP
        IF nums <> 2 THEN EXIT DO
        answer## = num##(1) ^ num##(2)
        speechoutput$ = STR$(answer##)
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
    nums = 0
END IF

IF usercommand$(runcommands) = "random" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "number" THEN
                nums = 0
                DO
                    FOR numcheck = 1 TO userinputs
                        IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                            nums = nums + 1
                            num##(nums) = VAL(userinputcopy$(numcheck))
                            IF nums = 2 THEN EXIT DO
                        END IF
                    NEXT numcheck
                    EXIT DO
                LOOP
                IF nums <> 2 THEN EXIT DO
                IF num##(1) > num##(2) THEN
                    rngstart## = num##(2)
                    rngend## = num##(1)
                ELSE
                    IF num##(2) > num##(1) THEN
                        rngstart## = num##(1)
                        rngend## = num##(2)
                    ELSE
                        IF num##(1) = num##(2) THEN
                            rngstart## = num##(1)
                            rngend## = num##(1)
                        END IF
                    END IF
                END IF
                rngdif## = rngend## - rngstart##
                RANDOMIZE TIMER
                rng## = INT(RND * rngdif## + (rngstart## + 1))
                speechoutput$ = STR$(rng##)
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

IF usercommand$(runcommands2) = "recent" THEN
    speechoutput$ = "opening recent files folder"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start shell:Recent"
    usercommands = -1
END IF

IF usercommand$(runcommands) = "recognition" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "voice" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands3) = "on" AND recognition = 0 THEN
                            recognition = 1
                            speechoutput$ = "voice recognition turned on"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            usercommands = -1
                            EXIT DO
                        END IF
                        IF usercommand$(runcommands3) = "off" AND recognition = 1 THEN
                            recognition = 0
                            speechoutput$ = "voice recognition turned off"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            usercommands = -1
                            EXIT DO
                        END IF
                        IF usercommand$(runcommands3) = "toggle" THEN
                            SELECT CASE recognition
                            CASE 0
                                recognition = 1
                                speechoutput$ = "voice recognition turned on"
                            CASE 1
                                recognition = 0
                                speechoutput$ = "voice recognition turned off"
                            END SELECT
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            usercommands = -1
                            EXIT DO
                        END IF
                    NEXT runcommands3
                    EXIT DO
                LOOP
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
    usercommands = -1
END IF

IF (usercommand$(runcommands) = "recompile" OR usercommand$(runcommands) = "compile") AND runcommands = 1 THEN
    speechoutput$ = "recompiling"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
    _DELAY 1
    iniloc$ = "data\jarvis.ini"
    GOSUB updateini
    request$ = "terminate"
    PRINT #jarvisboard, request$
    _DELAY 2
    CLOSE #jarvisboard
    CLOSE #jarvishost
    SHELL _HIDE "start batch\compile.bat"
    CLEAR
    SYSTEM
END IF

IF usercommand$(runcommands) = "recorder" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "voice" THEN
                speechoutput$ = "launching voice recorder"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "start %SystemRoot%\system32\sndrec32.exe"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "recycle" OR usercommand$(runcommands) = "recycling" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "bin" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands3) = "open" OR usercommand$(runcommands3) = "explore" OR usercommand$(runcommands3) = "explorer" THEN
                            speechoutput$ = "opening recycle bin"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            SHELL _DONTWAIT _HIDE "start shell:RecycleBinFolder"
                            usercommands = -1
                            EXIT DO
                        END IF
                        IF usercommand$(runcommands3) = "empty" OR usercommand$(runcommands3) = "clear" THEN
                            speechoutput$ = "emptying recycle bin"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " emptybin"
                            usercommands = -1
                            EXIT DO
                        END IF
                    NEXT runcommands3
                    speechoutput$ = "opening recycle bin"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    SHELL _DONTWAIT _HIDE "start shell:RecycleBinFolder"
                    usercommands = -1
                    EXIT DO
                LOOP
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "red" THEN
    textcolor = 12
    usercommands = -1
END IF

IF usercommand$(runcommands) = "redo" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = "redoing"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT CHR$(25)
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "registry" THEN
    speechoutput$ = "opening registry"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start regedit.exe"
    usercommands = -1
END IF

IF usercommand$(runcommands) = "relaunch" THEN
    speechoutput$ = "relaunching"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "batch\relaunch.bat"
    usercommands = -1
    _DELAY .5
    GOSUB xcleanup
END IF

IF usercommand$(runcommands) = "repeat" THEN
    speechoutput$ = outputrecord$(outputrecord)
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF

IF usercommand$(runcommands) = "report" THEN
    speechoutput$ = "thank you for taking the time to send us a report, please fill in the form that will pop up and it will be sent to us"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start tools\report.exe"
    usercommands = -1
END IF

IF usercommand$(runcommands) = "reset" THEN
    speechoutput$ = "are you sure you would like to reset me? it will revert everything back to original settings"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
    ynreset = 1
END IF

IF usercommand$(runcommands) = "restart" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "stop" OR usercommand$(runcommands2) = "abort" THEN
                SHELL _DONTWAIT _HIDE "shutdown -a"
                speechoutput$ = "aborting restart"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "apache" THEN
                speechoutput$ = "restarting apache server"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " service restart apache"
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "iis" THEN
                speechoutput$ = "restarting IIS"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " service restart w3svc"
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "sql" THEN
                speechoutput$ = "restarting MySql"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " service restart MySql"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        ynrestart = 1
        speechoutput$ = "are you sure you want to restart your computer?"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "right" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = ""
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT (CHR$(0) + CHR$(77))
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "root" THEN
    DO
        nums = 0
        DO
            FOR runcommands2 = 1 TO usercommands
                IF usercommand$(runcommands2) = "square" THEN
                    num##(1) = 2
                    nums = 1
                    EXIT DO
                END IF
                IF usercommand$(runcommands2) = "cube" THEN
                    num##(1) = 3
                    nums = 1
                    EXIT DO
                END IF
            NEXT runcommands2
            EXIT DO
        LOOP
        FOR runcommands2 = 1 TO usercommands
            FOR runcommands3 = 1 TO commandcount
                IF usercommand$(runcommands2) = commands$(runcommands3) AND usercommand$(runcommands2) <> "root" AND usercommand$(runcommands2) <> "square" AND usercommand$(runcommands2) <> "cube" THEN EXIT DO
            NEXT runcommands3
        NEXT runcommands2
        DO
            FOR numcheck = 1 TO userinputs
                IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                    nums = nums + 1
                    num##(nums) = VAL(userinputcopy$(numcheck))
                    IF nums = 2 THEN EXIT DO
                END IF
            NEXT numcheck
            EXIT DO
        LOOP
        IF nums <> 2 THEN EXIT DO
        answer## = num##(2) ^ (1 / num##(1))
        speechoutput$ = STR$(answer##)
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
    nums = 0
END IF

IF usercommand$(runcommands) = "run" THEN
    DO
        prog$ = MID$(useroutput$, (INSTR(useroutput$, "run") + 3))
        highest = 0
        FOR progcheck = 1 TO programnameload
            progcheckval = Compare(prog$, progname$(progcheck))
            IF progcheckval > highest THEN
                highest = progcheckval
                progchecknum = progcheck
            END IF
        NEXT progcheck
        IF highest < 30 THEN EXIT DO
        OPEN "C:\TEMP\proglnk.bat" FOR OUTPUT AS #4
        PRINT #4, "copy /y " + CHR$(34) + proglnk$(progchecknum) + CHR$(34) + " C:\TEMP\proglnk.lnk"
        PRINT #4, "start C:\TEMP\proglnk.lnk"
        PRINT #4, "del /q C:\TEMP\proglnk.lnk"
        PRINT #4, "del /q C:\TEMP\proglnk.bat"
        CLOSE #4
        SHELL _HIDE "C:\TEMP\proglnk.bat"
        speechoutput$ = "running " + progname$(progchecknum)
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "save" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = "saving"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT CHR$(19)
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "say" OR usercommand$(runcommands) = "read" THEN
    saveclip$ = _CLIPBOARD$
    _SCREENPRINT CHR$(3)
    speechoutput$ = _CLIPBOARD$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    _CLIPBOARD$ = saveclip$
    usercommands = -1
END IF

IF usercommand$(runcommands) = "screen" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "shot" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands3) = "open" OR usercommand$(runcommands3) = "explore" THEN
                            speechoutput$ = "opening screen shot folder"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            SHELL _DONTWAIT "explorer /n, /select, " + CHR$(34) + ssloc$ + lastss$ + CHR$(34) + ""
                            usercommands = -1
                            EXIT DO
                        END IF
                        IF usercommand$(runcommands3) = "set" THEN
                            request$ = "Enter the full path location to save your screenshots" + CHR$(13) + "ex/ 'C:\Documents and Settings\Owner\Desktop\Screenshots\'"
                            PRINT #jarvisboard, request$
                            speechoutput$ = "Enter the location into the box, when you are done press Enter, if the box is empty the query will be discarded"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            usercommands = -1
                            DO
                                _LIMIT 1
                                INPUT #jarvisboard, response$
                            LOOP UNTIL response$ <> ""
                            IF response$ <> CHR$(255) THEN ssloc$ = response$
                            EXIT DO
                        END IF
                    NEXT runcommands3
                    stampmonth$ = LEFT$(DATE$, 2)
                    stampday$ = MID$(DATE$, 4, 2)
                    stampyear$ = RIGHT$(DATE$, 4)
                    stamphour$ = LEFT$(TIME$, 2)
                    stampminute$ = MID$(TIME$, 4, 2)
                    stampsecond$ = RIGHT$(TIME$, 2)
                    timestamp$ = stampyear$ + stampmonth$ + stampday$ + stamphour$ + stampminute$ + stampsecond$
                    ssnamer$ = ssloc$ + timestamp$
                    ssname$ = ssloc$ + timestamp$ + ssfile$
                    IF _FILEEXISTS(ssname$) = -1 THEN
                        ssname = 0
                        DO
                            newnamer$ = ssame$ + "_" + LTRIM$(STR$(ssname))
                            ssname = ssname + 1
                        LOOP UNTIL _FILEEXISTS(newname$) = 0
                        ssname$ = newname$ + ssfile$
                        lastss$ = ssname$
                    END IF
                    speechoutput$ = "screen shot"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    SHELL _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " savescreenshot " + CHR$(34) + ssname$ + CHR$(34)
                    usercommands = -1
                    EXIT DO
                LOOP
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "saver" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands3) = "on" OR usercommand$(runcommands3) = "start" THEN
                            speechoutput$ = "starting screensaver"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " screensaver"
                            usercommands = -1
                            EXIT DO
                        END IF
                        IF usercommand$(runcommands3) = "enable" OR usercommand$(runcommands3) = "enabled" THEN
                            speechoutput$ = "screensaver enabled"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " regsetval sz " + CHR$(34) + "HKCU\control panel\desktop" + CHR$(34) + " " + CHR$(34) + "ScreenSaveActive" + CHR$(34) + " 1"
                            usercommands = -1
                            EXIT DO
                        END IF
                        IF usercommand$(runcommands3) = "disable" OR usercommand$(runcommands3) = "disabled" THEN
                            speechoutput$ = "screensaver disabled"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " regsetval sz " + CHR$(34) + "HKCU\control panel\desktop" + CHR$(34) + " " + CHR$(34) + "ScreenSaveActive" + CHR$(34) + " 0"
                            usercommands = -1
                            EXIT DO
                        END IF
                    NEXT runcommands3
                    speechoutput$ = "starting screensaver"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " screensaver"
                    usercommands = -1
                    EXIT DO
                LOOP
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF

IF (usercommand$(runcommands) = "google" OR usercommand$(runcommands) = "search") AND usercommands <> 1 AND usercommands <> -1 THEN
    doublecheck$ = MID$(useroutput$, (INSTR(useroutput$, (usercommand$(runcommands))) + 7), 6)
    IF doublecheck$ = "google" OR doublecheck$ = "search" THEN
        qloc = INSTR(useroutput$, usercommand$(runcommands)) + 13
    ELSE
        qloc = INSTR(useroutput$, usercommand$(runcommands)) + 6
    END IF
    q$ = MID$(useroutput$, qloc, (LEN(useroutput$) - qloc + 1))
    speechoutput$ = "searching" + q$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    DO
        randname$ = ""
        FOR randname = 1 TO 64
            charsetselect = INT(RND * 3)
            SELECT CASE charsetselect
                CASE 0
                    characterselect = INT(RND * 10)
                    randname$ = randname$ + CHR$(characterselect + 48)
                CASE 1
                    characterselect = INT(RND * 26)
                    randname$ = randname$ + CHR$(characterselect + 65)
                CASE 2
                    characterselect = INT(RND * 26)
                    randname$ = randname$ + CHR$(characterselect + 97)
            END SELECT
        NEXT randname
    LOOP UNTIL _FILEEXISTS("temp\url\" + randname$ + ".URL") = 0
    ERASE query$
    REDIM query$(256)
    querybound = 0
    FOR queryparse = 1 TO LEN(q$)
        querycrosssection$ = MID$(q$, queryparse, 1)
        IF querycrosssection$ <> CHR$(32) THEN
            querybound = querybound + 1
            DO
                querycrosssection$ = MID$(q$, queryparse, 1)
                IF querycrosssection$ = CHR$(32) OR queryparse = (LEN(q$) + 1) THEN EXIT DO
                query$(querybound) = query$(querybound) + querycrosssection$
                queryparse = queryparse + 1
            LOOP
        END IF
    NEXT queryparse
    qparse$ = ""
    FOR qparse = 1 TO querybound
        qparse$ = qparse$ + query$(qparse) + "+"
    NEXT qparse
    qparse$ = MID$(qparse$, 1, (LEN(qparse$) - 1))
    OPEN "temp\url\" + randname$ + ".URL" FOR OUTPUT AS #1
    PRINT #1, "[InternetShortcut]"
    PRINT #1, "URL=http://www.google.com/#q=" + qparse$
    CLOSE #1
    SHELL _DONTWAIT _HIDE "start temp\url\" + randname$ + ".URL"
    randname$ = ""
    usercommands = -1
END IF

IF usercommand$(runcommands) = "secant" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            FOR runcommands3 = 1 TO commandcount
                IF usercommand$(runcommands2) = commands$(runcommands3) AND usercommand$(runcommands2) <> "secant" THEN EXIT DO
            NEXT runcommands3
        NEXT runcommands2
        containnum = 0
        DO
            FOR numcheck = 1 TO userinputs
                IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                    num##(1) = VAL(userinputcopy$(numcheck))
                    containnum = 1
                    EXIT DO
                END IF
            NEXT numcheck
            EXIT DO
        LOOP
        IF containnum = 0 THEN EXIT DO
        containnum = 0
        IF anglepref = 1 THEN
            answer## = 1 / (COS((num##(1) * ((4 * (ATN(1))) / 180))))
            speechoutput$ = STR$(answer##) + " degrees"
        END IF
        IF anglepref = 0 THEN
            answer## = 1 / (COS(num##(1)))
            speechoutput$ = STR$(answer##) + " radians"
        END IF
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "shark" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "week" THEN
                SHELL _HIDE "resources\wget http://sharkweekcountdown.com/ -O temp\sharkweekcd.htm"
                REDIM swcd$(1024)
                OPEN "temp\sharkweekcd.htm" FOR INPUT AS #1
                DO
                    swcd = swcd + 1
                    LINE INPUT #1, swcd$(swcd)
                LOOP UNTIL EOF(1) = -1
                CLOSE #1
                KILL "temp\sharkweekcd.htm"
                FOR swfd = 1 TO swcd
                    IF INSTR(swcd$(swfd), "sharkweek=new Date(") THEN
                        swfd$ = MID$(swcd$(swfd), (INSTR(swcd$(swfd), "sharkweek=new Date(") + 19), ((INSTR((INSTR(swcd$(swfd), "sharkweek=new Date(") + 19), swcd$(swfd), ")")) - (INSTR(swcd$(swfd), "sharkweek=new Date(") + 19)))
                    END IF
                NEXT swfd
                REDIM cloc(8)
                DO
                    cloc = cloc + 1
                    cloc(cloc) = INSTR((cloc(cloc - 1) + 1), swfd$, ",")
                LOOP UNTIL cloc(cloc) = 0
                cloc = cloc - 1
                year2 = VAL(LEFT$(swfd$, 4))
                month2 = VAL(MID$(swfd$, (cloc(1) + 1), (cloc(2) - (cloc(1) + 1)))) + 1
                IF cloc(3) THEN
                    day2 = VAL(MID$(swfd$, (cloc(2) + 1), (cloc(3) - (cloc(2) + 1)))) + 1
                    IF cloc(4) THEN
                        hour2 = VAL(MID$(swfd$, (cloc(3) + 1), (cloc(4) - (cloc(3) + 1))))
                        IF cloc(5) THEN
                            minute2 = VAL(MID$(swfd$, (cloc(4) + 1), (cloc(5) - (cloc(4) + 1))))
                            second2 = VAL(MID$(swfd$, (cloc(5) + 1)))
                        ELSE
                            minute2 = VAL(MID$(swfd$, (cloc(4) + 1)))
                            second2 = 0
                        END IF
                    ELSE
                        hour2 = VAL(MID$(swfd$, (cloc(3) + 1)))
                        minute2 = 0
                        second2 = 0
                    END IF
                ELSE
                    day2 = VAL(MID$(swfd$, (cloc(2) + 1))) + 1
                    hour2 = 0
                    minute2 = 0
                    second2 = 0
                END IF
                year1 = VAL(RIGHT$(DATE$, 4))
                month1 = VAL(LEFT$(DATE$, 2))
                day1 = VAL(MID$(DATE$, 4, 2))
                hour1 = VAL(LEFT$(TIME$, 2))
                minute1 = VAL(MID$(TIME$, 4, 2))
                second1 = VAL(RIGHT$(TIME$, 2))
                secdif&& = timebetween&&(year1, month1, day1, hour1, minute1, second1, year2, month2, day2, hour2, minute2, second2)
                IF secdif&& > 0 THEN
                    days$ = STR$(INT((secdif&& / 86400)))
                    hours$ = STR$(INT(((secdif&& - (VAL(days$) * 86400)) / 3600)))
                    minutes$ = STR$(INT(((secdif&& - ((VAL(days$) * 86400) + (VAL(hours$) * 3600))) / 60)))
                    seconds$ = STR$(INT(((secdif&& - ((VAL(days$) * 86400) + (VAL(hours$) * 3600) + (VAL(minutes$) * 60))))))
                    speechoutput$ = "there are"
                    IF VAL(days$) THEN speechoutput$ = speechoutput$ + days$ + " days"
                    IF VAL(hours$) THEN speechoutput$ = speechoutput$ + hours$ + " hours"
                    IF VAL(minutes$) THEN speechoutput$ = speechoutput$ + minutes$ + " minutes"
                    IF VAL(seconds$) THEN speechoutput$ = speechoutput$ + seconds$ + " seconds"
                    speechoutput$ = speechoutput$ + " until Shark Week!"
                ELSE
                    speechoutput$ = "it is Shark Week!"
                END IF
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "show" AND usercommands = 1 THEN
    _SCREENSHOW
    screenstate = 1
    speechoutput$ = ""
    speechprint$ = ""
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF

IF usercommand$(runcommands) = "shut" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "down" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands3) = "stop" OR usercommand$(runcommands3) = "abort" THEN
                            SHELL _DONTWAIT _HIDE "cmd c\ shutdown -a"
                            speechoutput$ = "aborting shutdown"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            usercommands = -1
                            EXIT DO
                        END IF
                    NEXT runcommands3
                    ynshutdown = 1
                    speechoutput$ = "are you sure you want to shut down your computer"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    usercommands = -1
                    EXIT DO
                LOOP
            END IF
            IF usercommand$(runcommands2) = "up" THEN
                speechoutput$ = "i am sorry " + username$
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
IF usercommand$(runcommands) = "shutdown" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "stop" OR usercommand$(runcommands2) = "abort" THEN
                SHELL _DONTWAIT _HIDE "cmd c\ shutdown -a"
                speechoutput$ = "aborting shutdown"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        ynshutdown = 1
        speechoutput$ = "are you sure you want to shut down your computer"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "sine" OR usercommand$(runcommands) = "sign" THEN
    DO
        containnum = 0
        DO
            FOR numcheck = 1 TO userinputs
                IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                    num##(1) = VAL(userinputcopy$(numcheck))
                    containnum = 1
                    EXIT DO
                END IF
            NEXT numcheck
            EXIT DO
        LOOP
        IF containnum = 0 THEN EXIT DO
        containnum = 0
        IF anglepref = 1 THEN
            answer## = SIN((num##(1) * ((4 * (ATN(1))) / 180)))
            speechoutput$ = STR$(answer##) + " degrees"
        END IF
        IF anglepref = 0 THEN
            answer## = SIN(num##(1))
            speechoutput$ = STR$(answer##) + " radians"
        END IF
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "sleep" THEN
    speechoutput$ = "putting computer to sleep"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "powercfg.exe /hibernate off"
    commander = SetSuspendState
    usercommands = -1
END IF

IF usercommand$(runcommands) = "soduko" THEN
    speechoutput$ = "launching soduko solver"
    SHELL _DONTWAIT _HIDE "start tools\soduko.exe"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF

IF usercommand$(runcommands) = "space" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = ""
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT CHR$(32)
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "speed" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "set" THEN
                containnum = 0
                DO
                    FOR numcheck = 1 TO userinputs
                        IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                            num##(1) = VAL(userinputcopy$(numcheck))
                            containnum = 1
                            EXIT DO
                        END IF
                    NEXT numcheck
                    EXIT DO
                LOOP
                IF containnum = 0 THEN EXIT DO
                speed& = num##(1)
                speechoutput$ = "speed set to " + LTRIM$(STR$(speed&)) + " loops per second"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                useroutputuse$ = ""
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        speechoutput$ = "current speed is " + LTRIM$(STR$(speed&)) + "loops per second"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "spell" THEN
    word$ = MID$(useroutputuse$, (INSTR(useroutputuse$, "spell") + 6), (INSTR((INSTR(useroutputuse$, "spell") + 6), useroutputuse$, " ")))
    IF word$ = "" THEN word$ = MID$(useroutputuse$, (INSTR(useroutputuse$, "spell") + 6))
    speechoutput$ = word$ + " - "
    speechprint$ = speechoutput$
    FOR spellword = 1 TO LEN(word$)
        speechoutput$ = speechoutput$ + MID$(word$, spellword, 1) + ", "
        speechprint$ = speechprint$ + MID$(word$, spellword, 1) + "-"
    NEXT spellword
    speechoutput$ = LEFT$(speechoutput$, (LEN(speechoutput$) - 1))
    speechprint$ = LEFT$(speechprint$, (LEN(speechprint$) - 1))
    speechcopy$ = speechprint$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF

IF usercommand$(runcommands) = "squared" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            FOR runcommands3 = 1 TO commandcount
                IF usercommand$(runcommands2) = commands$(runcommands3) AND usercommand$(runcommands2) <> "squared" THEN EXIT DO
            NEXT runcommands3
        NEXT runcommands2
        containnum = 0
        DO
            FOR numcheck = 1 TO userinputs
                IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                    num##(1) = VAL(userinputcopy$(numcheck))
                    containnum = 1
                    EXIT DO
                END IF
            NEXT numcheck
            EXIT DO
        LOOP
        IF containnum = 0 THEN EXIT DO
        containnum = 0
        answer## = num##(1) ^ 2
        speechoutput$ = STR$(answer##)
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "standby" OR usercommand$(runcommands) = "stand" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "on" AND standbytoggle = 1 THEN
                standbytoggle = 0
                speechoutput$ = "standby turned on"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "off" AND standbytoggle = 0 THEN
                standbytoggle = 1
                speechoutput$ = "standby turned off"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "toggle" THEN
                SELECT CASE standbytoggle
                    CASE 0
                        standbytoggle = 1
                        speechoutput$ = "standby turned off"
                    CASE 1
                        standbytoggle = 0
                        speechoutput$ = "standby turned on"
                END SELECT
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "time" THEN
                containnum = 0
                DO
                    FOR numcheck = 1 TO userinputs
                        IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                            num##(1) = VAL(userinputcopy$(numcheck))
                            containnum = 1
                            EXIT DO
                        END IF
                    NEXT numcheck
                    EXIT DO
                LOOP
                IF containnum = 0 THEN EXIT DO
                containnum = 0
                standbytime## = num##(1)
                speechoutput$ = "time before standby set to" + STR$(standbytime##)
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        active = 0
        speechoutput$ = "standing by"
        speechprint$ = speechoutput$
        GOSUB textprint
        status$ = "INACTIVE"
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "start" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "up" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands2) = "launch" OR usercommand$(runcommands2) = "run" THEN
                            DO
                                FOR runcommands4 = 1 TO usercommands
                                    IF usercommand$(runcommands4) = "no" OR usercommand$(runcommands4) = "not" THEN
                                        speechoutput$ = "setting myself to not run at startup"
                                        speechprint$ = speechoutput$
                                        GOSUB textprint
                                        GOSUB speechoutput
                                        startuppath$ = "C:" + ENVIRON$("HOMEPATH") + "\Start Menu\Programs\Startup\jarvis.LNK"
                                        SHELL _DONTWAIT _HIDE "del " + CHR$(34) + startuppath$ + CHR$(34)
                                        usercommands = -1
                                        EXIT DO
                                    END IF
                                NEXT runcommands4
                                speechoutput$ = "setting myself to run at startup"
                                speechprint$ = speechoutput$
                                GOSUB textprint
                                GOSUB speechoutput
                                startuppath$ = "C:" + ENVIRON$("HOMEPATH") + "\Start Menu\Programs\Startup\jarvis.LNK"
                                SHELL _DONTWAIT _HIDE "copy " + CHR$(34) + jarvisloc$ + "\bin\jarvis.LNK" + CHR$(34) + " " + CHR$(34) + startuppath$ + CHR$(34)
                                usercommands = -1
                                EXIT DO
                            LOOP
                            EXIT DO
                        END IF
                    NEXT runcommands3
                    speechoutput$ = "opening startup folder"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    SHELL _DONTWAIT _HIDE "start shell:Startup"
                    usercommands = -1
                    EXIT DO
                LOOP
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "start" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "up" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands2) = "launch" OR usercommand$(runcommands2) = "run" THEN
                            DO
                                FOR runcommands4 = 1 TO usercommands
                                    IF usercommand$(runcommands4) = "no" OR usercommand$(runcommands4) = "not" THEN
                                        speechoutput$ = "setting myself to not run at startup"
                                        speechprint$ = speechoutput$
                                        GOSUB textprint
                                        GOSUB speechoutput
                                        startuppath$ = "C:" + ENVIRON$("HOMEPATH") + "\Start Menu\Programs\Startup\jarvis.LNK"
                                        SHELL _DONTWAIT _HIDE "del " + CHR$(34) + startuppath$ + CHR$(34)
                                        usercommands = -1
                                        EXIT DO
                                    END IF
                                NEXT runcommands4
                                speechoutput$ = "setting myself to run at startup"
                                speechprint$ = speechoutput$
                                GOSUB textprint
                                GOSUB speechoutput
                                startuppath$ = "C:" + ENVIRON$("HOMEPATH") + "\Start Menu\Programs\Startup\jarvis.LNK"
                                SHELL _DONTWAIT _HIDE "copy " + CHR$(34) + jarvisloc$ + "\bin\jarvis.LNK" + CHR$(34) + " " + CHR$(34) + startuppath$ + CHR$(34)
                                usercommands = -1
                                EXIT DO
                            LOOP
                            EXIT DO
                        END IF
                    NEXT runcommands3
                    speechoutput$ = "opening startup folder"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    SHELL _DONTWAIT _HIDE "start shell:Startup"
                    usercommands = -1
                    EXIT DO
                LOOP
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
IF usercommand$(runcommands) = "startup" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "launch" OR usercommand$(runcommands2) = "run" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands3) = "no" OR usercommand$(runcommands3) = "not" THEN
                            speechoutput$ = "setting myself to not run at startup"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            startuppath$ = "C:" + ENVIRON$("HOMEPATH") + "\Start Menu\Programs\Startup\jarvis.LNK"
                            SHELL _DONTWAIT _HIDE "del " + CHR$(34) + startuppath$ + CHR$(34)
                            usercommands = -1
                            EXIT DO
                        END IF
                    NEXT runcommands3
                    speechoutput$ = "setting myself to run at startup"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    startuppath$ = "C:" + ENVIRON$("HOMEPATH") + "\Start Menu\Programs\Startup\jarvis.LNK"
                    SHELL _DONTWAIT _HIDE "copy " + CHR$(34) + jarvisloc$ + "\bin\jarvis.LNK" + CHR$(34) + " " + CHR$(34) + startuppath$ + CHR$(34)
                    usercommands = -1
                    EXIT DO
                LOOP
                EXIT DO
            END IF
        NEXT runcommands2
        speechoutput$ = "opening startup folder"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        SHELL _DONTWAIT _HIDE "start shell:Startup"
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "stopwatch" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "start" THEN
                startsw! = TIMER
                sw = 1
                speechoutput$ = "starting stopwatch"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "stop" AND sw = 1 THEN
                stopsw! = TIMER
                sw = 0
                swtime! = (stopsw! - startsw!)
                swsave! = swtime!
                speechoutput$ = "stopwatch ran for" + STR$(swtime!) + " seconds"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "recall" THEN
                speechoutput$ = "last stopwatch ran for" + STR$(swsave!) + " seconds"
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

IF usercommand$(runcommands) = "tangent" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            FOR runcommands3 = 1 TO commandcount
                IF usercommand$(runcommands2) = commands$(runcommands3) AND usercommand$(runcommands2) <> "tangent" THEN EXIT DO
            NEXT runcommands3
        NEXT runcommands2
        containnum = 0
        DO
            FOR numcheck = 1 TO userinputs
                IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                    num##(1) = VAL(userinputcopy$(numcheck))
                    containnum = 1
                    EXIT DO
                END IF
            NEXT numcheck
            EXIT DO
        LOOP
        IF containnum = 0 THEN EXIT DO
        containnum = 0
        IF anglepref = 1 THEN
            answer## = TAN((num##(1) * ((4 * (ATN(1))) / 180)))
            answer## = answer## * 180 / (4 * ATN(1))
            speechoutput$ = STR$(answer##) + " degrees"
        END IF
        IF anglepref = 0 THEN
            answer## = TAN(num##(1))
            speechoutput$ = STR$(answer##) + " radians"
        END IF
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "task" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "manager" THEN
                FOR runcommands3 = 1 TO usercommands
                    IF usercommand$(runcommands3) = "close" OR usercommand$(runcommands3) = "terminate" OR usercommand$(runcommands3) = "exit" OR usercommand$(runcommands3) = "end" THEN
                        SHELL _DONTWAIT _HIDE "taskkill /IM taskmgr.exe /F"
                        speechoutput$ = "closing task manager"
                        speechprint$ = speechoutput$
                        GOSUB textprint
                        GOSUB speechoutput
                        usercommands = -1
                        EXIT DO
                    END IF
                NEXT runcommands3
                SHELL _DONTWAIT _HIDE "start taskmgr.exe"
                speechoutput$ = "launching task manager"
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

IF usercommand$(runcommands) = "template" OR usercommand$(runcommands) = "templates" THEN
    speechoutput$ = "opening templates folder"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start shell:Templates"
    usercommands = -1
END IF

IF usercommand$(runcommands) = "thank" OR usercommand$(runcommands) = "thanks" THEN
    speechoutput$ = "you are welcome " + username$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF

IF usercommand$(runcommands) = "time" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "standby" OR usercommand$(runcommands2) = "stand" THEN EXIT DO
        NEXT runcommands2
        hours$ = LEFT$(TIME$, 2)
        hours = VAL(hours$)
        IF timepref = 1 THEN
            daytime$ = " AM"
            IF hours > 12 THEN
                hours = hours - 12
                daytime$ = " PM"
            END IF
            IF hours = 12 THEN daytime$ = " PM"
            IF hours = 0 THEN
                hours = 12
            END IF
        END IF
        minutes$ = MID$(TIME$, 4, 2)
        IF timepref = 1 THEN
            timesimple$ = LTRIM$(STR$(hours)) + ":" + minutes$ + daytime$
        ELSE
            timesimple$ = hours$ + minutes$ + " hours"
        END IF
        speechoutput$ = "it is currently " + timesimple$
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "timer" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "second" OR usercommand$(runcommands2) = "seconds" THEN
                DO
                    num = 0
                    DO
                        FOR numcheck = 1 TO userinputs
                            IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                                num = VAL(userinputcopy$(numcheck))
                                EXIT DO
                            END IF
                        NEXT numcheck
                        EXIT DO
                    LOOP
                    timers = timers + 1
                    timers$(timers) = STR$((jarvistimer&& + num))
                    timersay$(timers) = LTRIM$(STR$(num)) + " " + usercommand$(runcommands2)
                    speechoutput$ = "timer set"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    usercommands = -1
                    EXIT DO
                LOOP
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "minute" OR usercommand$(runcommands2) = "minutes" THEN
                DO
                    num = 0
                    DO
                        FOR numcheck = 1 TO userinputs
                            IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                                num = VAL(userinputcopy$(numcheck))
                                EXIT DO
                            END IF
                        NEXT numcheck
                        EXIT DO
                    LOOP
                    timers = timers + 1
                    timers$(timers) = STR$((jarvistimer&& + (num * 60)))
                    timersay$(timers) = LTRIM$(STR$(num)) + " " + usercommand$(runcommands2)
                    speechoutput$ = "timer set"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    usercommands = -1
                    EXIT DO
                LOOP
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "hour" OR usercommand$(runcommands2) = "hours" THEN
                DO
                    num = 0
                    DO
                        FOR numcheck = 1 TO userinputs
                            IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                                num = VAL(userinputcopy$(numcheck))
                                EXIT DO
                            END IF
                        NEXT numcheck
                        EXIT DO
                    LOOP
                    timers = timers + 1
                    timers$(timers) = STR$((jarvistimer&& + (num * 3600)))
                    timersay$(timers) = LTRIM$(STR$(num)) + " " + usercommand$(runcommands2)
                    speechoutput$ = "timer set"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    usercommands = -1
                    EXIT DO
                LOOP
                EXIT DO
            END IF
        NEXT runcommands2
        speechoutput$ = "the system timer is" + STR$(TIMER)
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "times" OR usercommand$(runcommands) = "*" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            FOR runcommands3 = 1 TO commandcount
                IF usercommand$(runcommands2) = commands$(runcommands3) AND usercommand$(runcommands2) <> "times" AND usercommand$(runcommands2) <> "*" THEN EXIT DO
            NEXT runcommands3
        NEXT runcommands2
        nums = 0
        DO
            FOR numcheck = 1 TO userinputs
                IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                    nums = nums + 1
                    num##(nums) = VAL(userinputcopy$(numcheck))
                    IF nums = 2 THEN EXIT DO
                END IF
            NEXT numcheck
            EXIT DO
        LOOP
        IF nums <> 2 THEN EXIT DO
        answer## = num##(1) * num##(2)
        speechoutput$ = STR$(answer##)
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
    nums = 0
END IF

IF usercommand$(runcommands) = "tomorrow" THEN
    day = VAL(STR$(VAL(MID$(DATE$, 4, 2))))
    month = VAL(LEFT$(DATE$, 2))
    year = VAL(RIGHT$(DATE$, 4))
    IF month < 3 THEN
        month = month + 12
        year = year - 1
    END IF
    century = year \ 100
    year = year MOD 100
    S1 = (century \ 4) - (2 * century) - 1
    S2 = (5 * year) \ 4
    S3 = 26 * (month + 1) \ 10
    weekday = (S1 + S2 + S3 + day + 1) MOD 7
    IF weekday < 0 THEN weekday = weekday + 7
    SELECT CASE weekday
        CASE 0
            day$ = "Sunday"
        CASE 1
            day$ = "Monday"
        CASE 2
            day$ = "Tuesday"
        CASE 3
            day$ = "Wednesday"
        CASE 4
            day$ = "Thursday"
        CASE 5
            day$ = "Friday"
        CASE 6
            day$ = "Saturday"
    END SELECT
    speechoutput$ = "tomorrow is " + day$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF

IF usercommand$(runcommands) = "translate" OR usercommand$(runcommands) = "translator" THEN
    text$ = useroutputuse$
    DO
        IF LEFT$(text$, 9) = "translate" THEN text$ = MID$(text$, 11)
        IF LEFT$(text$, 11) = "translation" THEN text$ = MID$(text$, 13)
        findlangto$ = ""
        findto = 0
        FOR findlang = LEN(text$) TO 1 STEP -1
            findlangto$ = MID$(text$, findlang)
            IF LEFT$(findlangto$, 4) = " to " THEN
                findto = 1
                langto$ = MID$(text$, findlang + 4)
                text$ = LEFT$(text$, findlang - 1)
                EXIT FOR
            END IF
        NEXT findlang
        IF findto = 0 THEN EXIT DO
        highest = 0
        FOR spotlang = 1 TO NumOfLanguageCode
            langcheckval = Compare(langto$, languagecodes$(spotlang, 1))
            IF langcheckval > highest THEN
                highest = langcheckval
                langchecknum = spotlang
            END IF
        NEXT spotlang
        IF highest < 75 THEN EXIT DO
        langto$ = languagecodes$(langchecknum, 2)
        OPEN "resources\mtc.txt" FOR INPUT AS #1
        LINE INPUT #1, clientid$
        LINE INPUT #1, clientsecret$
        CLOSE #1
        request$ = "grant_type=client_credentials&client_id=" + UrlEncode$(clientid$) + "&client_secret=" + UrlEncode$(clientsecret$) + "&scope=http://api.microsofttranslator.com"
        datamarketaccessuri$ = "https://datamarket.accesscontrol.windows.net/v2/OAuth2-13"
        IF TokenExpired&(expiresin&) THEN
            SHELL _HIDE "resources\wget -O temp\mttoken.txt --post-data=" + CHR$(34) + request$ + CHR$(34) + " --no-check-certificate " + datamarketaccessuri$
            OPEN "temp\mttoken.txt" FOR INPUT AS #1
            LINE INPUT #1, response$
            CLOSE #1
            KILL "temp\mttoken.txt"
            access_token$ = Deserialize$(response$, "access_token")
            expires_in$ = Deserialize$(response$, "expires_in")
            authtoken$ = "Bearer " + access_token$
            expiresin& = VAL(expires_in$)
        END IF
        SHELL _HIDE "resources\wget -O temp\translation.txt --header=" + CHR$(34) + "Authorization: " + authtoken$ + CHR$(34) + " " + CHR$(34) + "http://api.microsofttranslator.com/v2/Http.svc/Translate?text=" + UrlEncode$(text$) + "&from=" + lang$ + "&to=" + langto$ + CHR$(34)
        OPEN "temp\translation.txt" FOR INPUT AS #1
        IF EOF(1) = -1 THEN
            translation$ = "no translation"
        ELSE
            LINE INPUT #1, translation$
            translation$ = MID$(translation$, INSTR(translation$, ">") + 1, INSTR(INSTR(translation$, ">") + 1, translation$, "<") - INSTR(translation$, ">") - 1)
        END IF
        CLOSE #1
        KILL "temp\translation.txt"
        speechoutput$ = "'" + text$ + "'" + " in " + languagecodes$(langchecknum, 1) + " is '" + translation$ + "'"
        speechcopy$ = dq$ + text$ + dq$ + crlf$ + lang$ + " - " + languagecodes$(langchecknum, 2) + crlf$ + dq$ + translation$ + dq$
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "transparent" OR usercommand$(runcommands) = "transparency" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "reset" THEN
                transparency = 255
                speechoutput$ = "resetting transparency"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " win trans ititle " + CHR$(34) + "jarvis" + CHR$(34) + " " + LTRIM$(STR$(255))
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        numfind = 0
        DO
            FOR numcheck = 1 TO userinputs
                IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                    num##(1) = VAL(userinputcopy$(numcheck))
                    numfind = 1
                    EXIT DO
                END IF
            NEXT numcheck
            EXIT DO
        LOOP
        IF numfind = 0 THEN EXIT DO
        numfind = 0
        percent = num##(1)
        IF percent > 100 THEN percent = 100
        IF percent < 0 THEN percent = 0
        perc = INT(((((50 - percent) + 50) / 100) * 256))
        IF perc = 256 THEN perc = 255
        IF perc = 0 THEN perc = 1
        transparency = perc
        speechoutput$ = "setting transparency to" + STR$(percent) + " percent"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " win trans ititle " + CHR$(34) + "jarvis" + CHR$(34) + " " + LTRIM$(STR$(transparency))
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "undo" OR usercommand$(runcommands) = "undue" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = "undoing"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT CHR$(26)
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "uninstall" THEN
    speechoutput$ = "are you sure you want to uninstall me?"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
    ynuninstall = 1
END IF

IF usercommand$(runcommands) = "unmute" THEN
    SHELL _HIDE _DONTWAIT CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " mutesysvolume 0"
    _DELAY .5
    speechoutput$ = "volume unmuted"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF

IF usercommand$(runcommands) = "until" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "birthday" THEN
                year1 = VAL(RIGHT$(DATE$, 4))
                month1 = VAL(LEFT$(DATE$, 2))
                day1 = VAL(MID$(DATE$, 4, 2))
                hour1 = VAL(LEFT$(TIME$, 2))
                minute1 = VAL(MID$(TIME$, 4, 2))
                second1 = VAL(RIGHT$(TIME$, 2))
                IF INSTR(useroutputuse$, " your") THEN
                    month2 = 11
                    day2 = 27
                ELSE
                    month2 = VAL(LEFT$(birthday$, 2))
                    day2 = VAL(MID$(birthday$, 4, 2))
                END IF
                IF month2 > month1 THEN
                    year2 = year1
                ELSE
                    IF month2 = month1 THEN
                        IF day2 > day1 THEN
                            year2 = year1
                        ELSE
                            IF day2 = day1 THEN
                                IF INSTR(useroutputuse$, " your") THEN
                                    speechoutput$ = "today is my birthday, " + username$
                                ELSE
                                    speechoutput$ = "today is your birthday, " + username$
                                END IF
                                speechprint$ = speechoutput$
                                GOSUB textprint
                                GOSUB speechoutput
                                usercommands = -1
                                EXIT DO
                            ELSE
                                year2 = year1 + 1
                            END IF
                        END IF
                    ELSE
                        year2 = year1 + 1
                    END IF
                END IF
                secdif&& = timebetween&&(year1, month1, day1, hour1, minute1, second1, year2, month2, day2, 0, 0, 0)
                IF secdif&& > 0 THEN
                    days$ = STR$(INT((secdif&& / 86400)))
                    hours$ = STR$(INT(((secdif&& - (VAL(days$) * 86400)) / 3600)))
                    minutes$ = STR$(INT(((secdif&& - ((VAL(days$) * 86400) + (VAL(hours$) * 3600))) / 60)))
                    seconds$ = STR$(INT(((secdif&& - ((VAL(days$) * 86400) + (VAL(hours$) * 3600) + (VAL(minutes$) * 60))))))
                    speechoutput$ = "there is"
                    IF VAL(days$) THEN speechoutput$ = speechoutput$ + days$ + " days"
                    IF VAL(hours$) THEN speechoutput$ = speechoutput$ + hours$ + " hours"
                    IF VAL(minutes$) THEN speechoutput$ = speechoutput$ + minutes$ + " minutes"
                    IF VAL(seconds$) THEN speechoutput$ = speechoutput$ + seconds$ + " seconds"
                    IF INSTR(useroutputuse$, " your") THEN
                        speechoutput$ = speechoutput$ + " until my birthday"
                    ELSE
                        speechoutput$ = speechoutput$ + " until your birthday"
                    END IF
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                END IF
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        findevent$ = MID$(useroutputuse$, (INSTR(useroutputuse$, "until") + 6))
        eventmonth = MonthToNum(TRIM$(findevent$))
        IF eventmonth THEN
            year1 = VAL(RIGHT$(DATE$, 4))
            month1 = VAL(LEFT$(DATE$, 2))
            day1 = VAL(MID$(DATE$, 4, 2))
            hour1 = VAL(LEFT$(TIME$, 2))
            minute1 = VAL(MID$(TIME$, 4, 2))
            second1 = VAL(RIGHT$(TIME$, 2))
            IF eventmonth > month1 THEN
                year2 = year1
            ELSE
                IF eventmonth = month1 THEN
                    speechoutput$ = "it is the month of " + findevent$
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    usercommands = -1
                    EXIT DO
                ELSE
                    year2 = year1 + 1
                END IF
            END IF
            secdif&& = timebetween&&(year1, month1, day1, hour1, minute1, second1, year2, eventmonth, 0, 0, 0, 0)
            IF secdif&& > 0 THEN
                days$ = STR$(INT((secdif&& / 86400)))
                hours$ = STR$(INT(((secdif&& - (VAL(days$) * 86400)) / 3600)))
                minutes$ = STR$(INT(((secdif&& - ((VAL(days$) * 86400) + (VAL(hours$) * 3600))) / 60)))
                seconds$ = STR$(INT(((secdif&& - ((VAL(days$) * 86400) + (VAL(hours$) * 3600) + (VAL(minutes$) * 60))))))
                speechoutput$ = "there is"
                IF VAL(days$) THEN speechoutput$ = speechoutput$ + days$ + " days"
                IF VAL(hours$) THEN speechoutput$ = speechoutput$ + hours$ + " hours"
                IF VAL(minutes$) THEN speechoutput$ = speechoutput$ + minutes$ + " minutes"
                IF VAL(seconds$) THEN speechoutput$ = speechoutput$ + seconds$ + " seconds"
                speechoutput$ = speechoutput$ + " until the month of " + findevent$
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
            END IF
            usercommands = -1
            EXIT DO
        END IF
        IF VAL(findevent$) OR WordToNum(findevent$) > 0 THEN
            findevent = VAL(findevent$)
            IF findevent = 0 THEN findevent = WordToNum(findevent$)
            year1 = VAL(RIGHT$(DATE$, 4))
            month1 = VAL(LEFT$(DATE$, 2))
            day1 = VAL(MID$(DATE$, 4, 2))
            hour1 = VAL(LEFT$(TIME$, 2)) MOD 12
            IF hour1 = 0 THEN hour1 = 12
            minute1 = VAL(MID$(TIME$, 4, 2))
            second1 = VAL(RIGHT$(TIME$, 2))
            SELECT CASE findevent
                CASE IS <= 12
                    findevent = findevent MOD 12
                    IF findevent = 0 THEN findevent = 12
                    IF findevent < hour1 THEN findevent = findevent + 12
                    secdif&& = timebetween&&(0, 0, 0, hour1, minute1, second1, 0, 0, 0, findevent, 0, 0)
                    IF secdif&& > 0 THEN
                        hours$ = STR$(INT((secdif&& / 3600)))
                        minutes$ = STR$(INT(((secdif&& - (VAL(hours$) * 3600)) / 60)))
                        seconds$ = STR$(INT(((secdif&& - ((VAL(hours$) * 3600) + (VAL(minutes$) * 60))))))
                        speechoutput$ = "there is"
                        IF VAL(hours$) THEN speechoutput$ = speechoutput$ + hours$ + " hours"
                        IF VAL(minutes$) THEN speechoutput$ = speechoutput$ + minutes$ + " minutes"
                        IF VAL(seconds$) THEN speechoutput$ = speechoutput$ + seconds$ + " seconds"
                        speechoutput$ = speechoutput$ + " until " + TRIM$(STR$((findevent MOD 12)))
                    END IF
                CASE IS < 1300
                    findeventhour = VAL(LEFT$(STR$(findevent), 2))
                    findeventmin = VAL(RIGHT$(STR$(findevent), 2))
                    IF eventmin > 60 THEN EXIT DO
                    findeventhour = findeventhour MOD 12
                    IF findeventhour = 0 THEN findeventhour = 12
                    IF findeventhour < hour1 THEN findeventhour = findeventhour + 12
                    secdif&& = timebetween&&(0, 0, 0, hour1, minute1, second1, 0, 0, 0, findeventhour, findeventmin, 0)
                    IF secdif&& > 0 THEN
                        hours$ = STR$(INT((secdif&& / 3600)))
                        minutes$ = STR$(INT(((secdif&& - (VAL(hours$) * 3600)) / 60)))
                        seconds$ = STR$(INT(((secdif&& - ((VAL(hours$) * 3600) + (VAL(minutes$) * 60))))))
                        speechoutput$ = "there is"
                        IF VAL(hours$) THEN speechoutput$ = speechoutput$ + hours$ + " hours"
                        IF VAL(minutes$) THEN speechoutput$ = speechoutput$ + minutes$ + " minutes"
                        IF VAL(seconds$) THEN speechoutput$ = speechoutput$ + seconds$ + " seconds"
                        speechoutput$ = speechoutput$ + " until " + TRIM$(STR$((findeventhour MOD 12))) + ":" + TRIM$(STR$(findeventmin))
                    END IF
                CASE ELSE
                    IF findevent > year1 THEN
                        secdif&& = timebetween&&(year1, month1, day1, hour1, minute1, second1, findevent, 0, 0, 0, 0, 0)
                        IF secdif&& > 0 THEN
                            years$ = STR$(INT((secdif&& / 31556952)))
                            days$ = STR$(INT(((secdif&& - (VAL(years$) * 31556952)) / 86400)))
                            hours$ = STR$(INT(((secdif&& - ((VAL(years$) * 31556952) + (VAL(days$) * 86400))) / 3600)))
                            minutes$ = STR$(INT(((secdif&& - ((VAL(years$) * 31556952) + (VAL(days$) * 86400) + (VAL(hours$) * 3600))) / 60)))
                            seconds$ = STR$(INT(((secdif&& - ((VAL(years$) * 31556952) + (VAL(days$) * 86400) + (VAL(hours$) * 3600) + (VAL(minutes$) * 60))))))
                            speechoutput$ = "there is"
                            IF VAL(years$) THEN speechoutput$ = speechoutput$ + years$ + " years"
                            IF VAL(days$) THEN speechoutput$ = speechoutput$ + days$ + " days"
                            IF VAL(hours$) THEN speechoutput$ = speechoutput$ + hours$ + " hours"
                            IF VAL(minutes$) THEN speechoutput$ = speechoutput$ + minutes$ + " minutes"
                            IF VAL(seconds$) THEN speechoutput$ = speechoutput$ + seconds$ + " seconds"
                            speechoutput$ = speechoutput$ + " until the year " + TRIM$(STR$(findevent))
                        END IF
                    ELSE
                        IF findevent = year1 THEN
                            speechoutput$ = "it is the year " + TRIM$(STR$(findevent))
                        ELSE
                            speechoutput$ = "the year " + TRIM$(STR$(findevent)) + " has already passed"
                        END IF
                    END IF
            END SELECT
            IF speechoutput$ > "" THEN
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
            END IF
            EXIT DO
        END IF
        IF LEFT$(findevent$, 3) = "the" THEN
            findevent = VAL(MID$(findevent$, 5))
            SELECT CASE month1
                CASE 2
                    isleap = (y2 MOD 4 = 0 AND y2 MOD 100 <> 0) OR y2 MOD 400 = 0
                    maxsay = 29 - isleap
                CASE 4, 6, 9, 11
                    maxday = 30
                CASE ELSE
                    maxday = 31
            END SELECT
            IF findevent <= maxday THEN
                IF findevent > day1 THEN
                    secdif&& = timebetween&&(0, 0, day1, hour1, minute1, second1, 0, 0, findevent, 0, 0, 0)
                    IF secdif&& > 0 THEN
                        days$ = STR$(INT((secdif&& / 86400)))
                        hours$ = STR$(INT(((secdif&& - (VAL(days$) * 86400)) / 3600)))
                        minutes$ = STR$(INT(((secdif&& - ((VAL(days$) * 86400) + (VAL(hours$) * 3600))) / 60)))
                        seconds$ = STR$(INT(((secdif&& - ((VAL(days$) * 86400) + (VAL(hours$) * 3600) + (VAL(minutes$) * 60))))))
                        speechoutput$ = "there is"
                        IF VAL(days$) THEN speechoutput$ = speechoutput$ + days$ + " days"
                        IF VAL(hours$) THEN speechoutput$ = speechoutput$ + hours$ + " hours"
                        IF VAL(minutes$) THEN speechoutput$ = speechoutput$ + minutes$ + " minutes"
                        IF VAL(seconds$) THEN speechoutput$ = speechoutput$ + seconds$ + " seconds"
                        speechoutput$ = speechoutput$ + " until the " + TRIM$(DaySuffix$(findevent))
                    END IF
                ELSE
                    IF findevent = day1 THEN
                        speechoutput$ = "today is the" + DaySuffix$(findevent)
                    ELSE
                        speechoutput$ = "the " + TRIM$(DaySuffix$(findevent)) + " has already passed"
                    END IF
                END IF
            END IF
            IF speechoutput$ > "" THEN
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
            END IF
            usercommands = -1
            EXIT DO
        END IF
        IF findevent$ = "sunday" OR findevent$ = "monday" OR findevent$ = "tuesday" OR findevent$ = "wednesday" OR findevent$ = "thursday" OR findevent$ = "friday" OR findevent$ = "saturday" THEN
            IF findevent$ = "sunday" THEN weekdayto = 1
            IF findevent$ = "monday" THEN weekdayto = 2
            IF findevent$ = "tuesday" THEN weekdayto = 3
            IF findevent$ = "wednesday" THEN weekdayto = 4
            IF findevent$ = "thursday" THEN weekdayto = 5
            IF findevent$ = "friday" THEN weekdayto = 6
            IF findevent$ = "saturday" THEN weekdayto = 7
            day = VAL(STR$(VAL(MID$(DATE$, 4, 2))))
            month = VAL(LEFT$(DATE$, 2))
            year = VAL(RIGHT$(DATE$, 4))
            IF month < 3 THEN
                month = month + 12
                year = year - 1
            END IF
            century = year \ 100
            year = year MOD 100
            S1 = (century \ 4) - (2 * century) - 1
            S2 = (5 * year) \ 4
            S3 = 26 * (month + 1) \ 10
            weekday = (S1 + S2 + S3 + day) MOD 7
            IF weekday < 0 THEN weekday = weekday + 7
            weekday = weekday + 1
            IF weekdayto > weekday THEN
                daysbetween = weekdayto - weekday
            ELSE
                daysbetween = 7 - weekday + weekdayto
            END IF
            IF weekday = weekdayto THEN
                speechoutput$ = "it is " + findevent$
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                EXIT DO
            END IF
            hour = VAL(LEFT$(TIME$, 2))
            minute = VAL(MID$(TIME$, 4, 2))
            second = VAL(RIGHT$(TIME$, 2))
            timein = (hour * 3600) + (minute * 60) + second
            timeuntil = (daysbetween * 86400) - timein
            IF timeuntil > 0 THEN
                days$ = STR$(INT((timeuntil / 86400)))
                hours$ = STR$(INT(((timeuntil - (VAL(days$) * 86400)) / 3600)))
                minutes$ = STR$(INT(((timeuntil - ((VAL(days$) * 86400) + (VAL(hours$) * 3600))) / 60)))
                seconds$ = STR$(INT(((timeuntil - ((VAL(days$) * 86400) + (VAL(hours$) * 3600) + (VAL(minutes$) * 60))))))
                speechoutput$ = "there is"
                IF VAL(days$) THEN speechoutput$ = speechoutput$ + days$ + " days"
                IF VAL(hours$) THEN speechoutput$ = speechoutput$ + hours$ + " hours"
                IF VAL(minutes$) THEN speechoutput$ = speechoutput$ + minutes$ + " minutes"
                IF VAL(seconds$) THEN speechoutput$ = speechoutput$ + seconds$ + " seconds"
                speechoutput$ = speechoutput$ + " until " + findevent$
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
            END IF
            EXIT DO
        END IF
        highest = 0
        year1 = VAL(RIGHT$(DATE$, 4))
        month1 = VAL(LEFT$(DATE$, 2))
        day1 = VAL(MID$(DATE$, 4, 2))
        hour1 = VAL(LEFT$(TIME$, 2))
        minute1 = VAL(MID$(TIME$, 4, 2))
        second1 = VAL(RIGHT$(TIME$, 2))
        FOR eventcheck = 1 TO eventnum
            month2 = VAL(LEFT$(events$(eventcheck, 2), 2))
            day2 = VAL(MID$(events$(eventcheck, 2), 4, 2))
            year2 = VAL(RIGHT$(events$(eventcheck, 2), 4))
            eventcheckval = Compare(findevent$, events$(eventcheck, 1))
            IF eventcheckval > highest AND timebetween&&(year1, month1, day1, hour1, minute1, second1, year2, month2, day2, 0, 0, 0) > 0 THEN
                highest = eventcheckval
                eventchecknum = eventcheck
            END IF
        NEXT eventcheck
        IF highest < 30 THEN EXIT DO
        year1 = VAL(RIGHT$(DATE$, 4))
        month1 = VAL(LEFT$(DATE$, 2))
        day1 = VAL(MID$(DATE$, 4, 2))
        year2 = VAL(RIGHT$(events$(eventchecknum, 2), 4))
        month2 = VAL(LEFT$(events$(eventchecknum, 2), 2))
        day2 = VAL(MID$(events$(eventchecknum, 2), 4, 2))
        IF year2 = year1 AND month2 = month1 AND day2 = day1 THEN
            speechoutput$ = "today is " + events$(eventchecknum, 1)
            speechprint$ = speechoutput$
            GOSUB textprint
            GOSUB speechoutput
            usercommands = -1
            EXIT DO
        END IF
        hour1 = VAL(LEFT$(TIME$, 2))
        minute1 = VAL(MID$(TIME$, 4, 2))
        second1 = VAL(RIGHT$(TIME$, 2))
        secdif&& = timebetween&&(year1, month1, day1, hour1, minute1, second1, year2, month2, day2, 0, 0, 0)
        IF secdif&& > 0 THEN
            days$ = STR$(INT((secdif&& / 86400)))
            hours$ = STR$(INT(((secdif&& - (VAL(days$) * 86400)) / 3600)))
            minutes$ = STR$(INT(((secdif&& - ((VAL(days$) * 86400) + (VAL(hours$) * 3600))) / 60)))
            seconds$ = STR$(INT(((secdif&& - ((VAL(days$) * 86400) + (VAL(hours$) * 3600) + (VAL(minutes$) * 60))))))
            speechoutput$ = "there is"
            IF VAL(days$) THEN speechoutput$ = speechoutput$ + days$ + " days"
            IF VAL(hours$) THEN speechoutput$ = speechoutput$ + hours$ + " hours"
            IF VAL(minutes$) THEN speechoutput$ = speechoutput$ + minutes$ + " minutes"
            IF VAL(seconds$) THEN speechoutput$ = speechoutput$ + seconds$ + " seconds"
            speechoutput$ = speechoutput$ + " until " + events$(eventchecknum, 1)
            speechprint$ = speechoutput$
            GOSUB textprint
            GOSUB speechoutput
        END IF
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "up" THEN
    DO
        IF usercommands <> 1 THEN EXIT DO
        speechoutput$ = ""
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        _SCREENPRINT (CHR$(0) + CHR$(72))
        useroutputuse$ = ""
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "update" OR usercommand$(runcommands) = "updates" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "check" OR usercommand$(runcommands2) = "checking" THEN
                updatecall = 1
                GOSUB updatecheck
                updatecall = 0
                SELECT CASE updateresponse
                    CASE 0
                        speechoutput$ = "There is currently no available updates"
                    CASE 1
                        speechoutput$ = "There is an update available, would you like to download it?"
                        yndlud = 1
                END SELECT
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
            END IF
            IF usercommand$(runcommands2) = "off" OR usercommand$(runcommands2) = "disable" OR usercommand$(runcommands2) = "disabled" THEN
                speechoutput$ = "Update checking has been disabled"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                updatecheck = 0
                usercommands = -1
            END IF
            IF usercommand$(runcommands2) = "on" OR usercommand$(runcommands2) = "enable" OR usercommand$(runcommands2) = "enabled" THEN
                speechoutput$ = "Update checking has been enabled"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                updatecheck = 1
                usercommands = -1
            END IF
            IF usercommand$(runcommands2) = "toggle" THEN
                SELECT CASE updatecheck
                    CASE 0
                        updatecheck = 1
                        speechoutput$ = "Update checking has been enabled"
                    CASE 1
                        updatecheck = 0
                        speechoutput$ = "Update checking has been disabled"
                END SELECT
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
            END IF
            IF usercommand$(runcommands2) = "version" OR usercommand$(runcommands2) = "versions" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands3) = "erase" OR usercommand$(runcommands3) = "erased" OR usercommand$(runcommands3) = "clear" OR usercommand$(runcommands3) = "cleared" THEN
                            speechoutput$ = "Version update restrictions for" + STR$(skipversion#) + "have been cleared"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            skipversion# = 0
                            usercommands = -1
                        END IF
                    NEXT runcommands3
                    speechoutput$ = "Version update restrictions in place for version" + STR$(skipversion#)
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    usercommands = -1
                    EXIT DO
                LOOP
            END IF
            IF usercommand$(runcommands2) = "program" OR usercommand$(runcommands2) = "programs" THEN
                speechoutput$ = "updating program list, this may take a while"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                SHELL _HIDE "dir " + CHR$(34) + programdir$ + CHR$(34) + " /b /s > " + CHR$(34) + "C:\dirload.txt" + CHR$(34)
                REDIM dirload$(4194304)
                dirload = 0
                OPEN "C:\dirload.txt" FOR INPUT AS #1
                DO
                    dirload = dirload + 1
                    LINE INPUT #1, dirload$(dirload)
                LOOP UNTIL EOF(1) = -1
                CLOSE #1
                KILL "C:\dirload.txt"
                REDIM _PRESERVE dirload$(dirload)
                REDIM proglnk$(32768)
                REDIM progname$(32768)
                proglnk$(1) = "{}"
                progname$(1) = "{}"
                proglnk = 0
                FOR proglnks = 1 TO dirload
                    IF UCASE$(RIGHT$(dirload$(proglnks), 3)) = "LNK" THEN
                        programlnkload = programlnkload + 1
                        programnameload = programnameload + 1
                        proglnk$(programlnkload) = dirload$(proglnks)
                        DO
                            FOR getprogname = (LEN(dirload$(proglnks)) - 4) TO 1 STEP -1
                                getprogname$ = MID$(dirload$(proglnks), getprogname)
                                IF LEFT$(getprogname$, 1) = "\" THEN
                                    progname$(programnameload) = MID$(getprogname$, 2, (LEN(getprogname$) - 5))
                                    EXIT DO
                                END IF
                            NEXT getprogname
                            EXIT DO
                        LOOP
                    END IF
                NEXT proglnks
                FOR programdel = 2 TO (programlnkload - 1)
                    IF proglnk$(programdel) = proglnk$(programdel - 1) OR proglnk$(programdel) = proglnk$(programdel + 1) THEN proglnk$(programdel) = ""
                NEXT programdel
                FOR programrep = 1 TO programlnkload
                    IF proglnk$(programrep) = "" THEN
                        FOR programreps = programrep TO programlnkload
                            proglnk$(programreps) = proglnk$(programreps + 1)
                        NEXT programreps
                    END IF
                    IF progname$(programrep) = "" THEN
                        FOR programreps = programrep TO programlnkload
                            progname$(programreps) = progname$(programreps + 1)
                        NEXT programreps
                    END IF
                NEXT programrep
                speechoutput$ = "done"
                GOSUB speechoutput
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "music" THEN
                speechoutput$ = "updating music list, this may take a while"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                IF musicdir$ = CHR$(48) THEN
                    OPEN "C:\allmusic.bat" FOR OUTPUT AS #2
                    FOR drive = 1 TO 26
                        PRINT #2, "cmd /c dir " + CHR$(64 + drive) + ":\ /b /s >> C:\dirload.txt"
                    NEXT drive
                    PRINT #2, "del /q C:\allmusic.bat"
                    CLOSE #2
                    SHELL _HIDE "C:\allmusic.bat"
                ELSE
                    SHELL _HIDE "dir " + CHR$(34) + musicdir$ + CHR$(34) + " /b /s > " + CHR$(34) + "C:\dirload.txt" + CHR$(34)
                END IF
                REDIM dirload$(4194304)
                dirload = 0
                OPEN "C:\dirload.txt" FOR INPUT AS #1
                DO
                    dirload = dirload + 1
                    LINE INPUT #1, dirload$(dirload)
                LOOP UNTIL EOF(1) = -1
                CLOSE #1
                REDIM _PRESERVE dirload$(dirload)
                KILL "C:\dirload.txt"
                REDIM musiclnk$(32768)
                musiclnk$(1) = "{}"
                musiclnk = 0
                FOR musiclnks = 1 TO dirload
                    IF UCASE$(RIGHT$(dirload$(musiclnks), 3)) = "MP3" THEN
                        musiclnkload = musiclnkload + 1
                        musicnameload = musicnameload + 1
                        musiclnk$(musiclnkload) = dirload$(musiclnks)
                    END IF
                NEXT musiclnks
                FOR musicrep = 1 TO musiclnkload
                    IF musiclnk$(musicrep) = "" THEN
                        FOR musicreps = musicrep TO musiclnkload
                            musiclnk$(musicreps) = musiclnk$(musicreps + 1)
                        NEXT musicreps
                    END IF
                NEXT musicrep
                speechoutput$ = "done"
                GOSUB speechoutput
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "location" THEN
                speechoutput$ = "updating location"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _HIDE "cd > temp\jarvisloc.tmp"
                OPEN "temp\jarvisloc.tmp" FOR INPUT AS #1
                INPUT #1, jarvisloc$
                CLOSE #1
                KILL "temp\jarvisloc.tmp"
                OPEN "C:\WINDOWS\jarvisloc.jdf" FOR OUTPUT AS #1
                PRINT #1, jarvisloc$
                CLOSE #1
                usercommands = -1
            END IF
        NEXT runcommands2
        updatecall = 1
        GOSUB updatecheck
        updatecall = 0
        SELECT CASE updateresponse
            CASE 0
                speechoutput$ = "There is currently no available updates"
            CASE 1
                speechoutput$ = "There is an update available, would you like to download it?"
                yndlud = 1
        END SELECT
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "user" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "path" OR usercommand$(runcommands2) = "folder" THEN
                speechoutput$ = "opening user path"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "start shell:Profile"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "version" THEN
    speechoutput$ = "i am currently version 0" + LTRIM$(STR$(version#))
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF

IF usercommand$(runcommands) = "visualize" OR usercommand$(runcommands) = "visualizer" THEN
    speechoutput$ = "launching visualizer"
    SHELL _DONTWAIT _HIDE "start tools\visualizer.exe"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF

IF usercommand$(runcommands) = "volume" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "increment" THEN
                DO
                    FOR numcheck = 1 TO userinputs
                        IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                            num##(1) = VAL(userinputcopy$(numcheck))
                            containnum = 1
                            EXIT DO
                        END IF
                    NEXT numcheck
                    EXIT DO
                LOOP
                IF containnum = 0 THEN EXIT DO
                volincr = num##(1)
                speechoutput$ = "volume increment set to" + STR$(volincr)
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "up" OR usercommand$(runcommands2) = "increase" THEN
                SHELL _HIDE _DONTWAIT CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " changesysvolume " + LTRIM$(STR$(volincr))
                speechoutput$ = "volume increased"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "down" OR usercommand$(runcommands2) = "decrease" THEN
                SHELL _HIDE _DONTWAIT CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " changesysvolume -" + LTRIM$(STR$(volincr))
                speechoutput$ = "volume decreased"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "max" OR usercommand$(runcommands2) = "maximum" THEN
                SHELL _HIDE _DONTWAIT CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " setsysvolume 65535"
                speechoutput$ = "volume maximized"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "min" OR usercommand$(runcommands2) = "minimum" THEN
                SHELL _HIDE _DONTWAIT CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " setsysvolume 0"
                speechoutput$ = "volume minimized"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        speechoutput$ = "launching volume panel"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        SHELL _DONTWAIT _HIDE "start %SystemRoot%\system32\sndvol32.exe"
        usercommands = -1
        EXIT DO
    LOOP
END IF

IF usercommand$(runcommands) = "white" THEN
    textcolor = 15
    usercommands = -1
END IF

IF usercommand$(runcommands) = "wikipedia" OR usercommand$(runcommands) = "wiki" THEN
    speechoutput$ = "opening wikipedia"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\wikipedia.URL"
    usercommands = -1
END IF

IF usercommand$(runcommands) = "windows" THEN
    speechoutput$ = "opening Windows folder"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start shell:Windows"
    usercommands = -1
END IF

IF usercommand$(runcommands) = "word" OR usercommand$(runcommands) = "words" THEN
    IF INSTR(useroutputuse$, "in") THEN start = (INSTR(useroutputuse$, "in") + 3)
    IF INSTR(useroutputuse$, "out of") THEN start = (INSTR(useroutputuse$, "out of") + 7)
    IF INSTR(useroutputuse$, "make from") THEN start = (INSTR(useroutputuse$, "make from") + 10)
    IF start > 0 THEN
        wordin$ = ""
        FOR gettext = start TO LEN(useroutputuse$)
            wordincs$ = MID$(useroutputuse$, gettext, 1)
            IF (ASC(wordincs$) >= 65 AND ASC(wordincs$) <= 90) OR (ASC(wordincs$) >= 97 AND ASC(wordincs$) <= 122) THEN
                wordin$ = wordin$ + wordincs$
            ELSE
                EXIT FOR
            END IF
        NEXT gettext
        IF LEN(wordin$) THEN
            wordin$ = LCASE$(wordin$)
            REDIM letters$(LEN(wordin$))
            FOR letters = 1 TO LEN(wordin$)
                letters$(letters) = MID$(wordin$, letters, 1)
            NEXT letters
            letters = letters - 1
            answer = 0
            REDIM answer$(NumOfLexicon)
            FOR check = 1 TO NumOfLexicon
                IF LEN(lex$(check)) <= letters AND LEN(lex$(check)) > 1 THEN
                    REDIM templetters$(letters)
                    FOR tempmove = 1 TO letters
                        templetters$(tempmove) = letters$(tempmove)
                    NEXT tempmove
                    DO
                        FOR checkletters = 1 TO LEN(lex$(check))
                            foundletter = 0
                            currentletter$ = MID$(lex$(check), checkletters, 1)
                            FOR isletter = 1 TO letters
                                IF templetters$(isletter) = currentletter$ THEN
                                    foundletter = 1
                                    templetters$(isletter) = ""
                                END IF
                            NEXT isletter
                            IF foundletter = 0 THEN EXIT DO
                        NEXT checkletters
                        answer = answer + 1
                        answer$(answer) = lex$(check)
                        EXIT DO
                    LOOP
                END IF
            NEXT check
            REDIM templetters$(0)
            REDIM _PRESERVE answer$(answer)
            order = Alphabetize(answer$())
            speechoutput$ = "from the letters in the word " + wordin$ + " you can make the words "
            speechcopy = 1
            speechcopy$ = ""
            FOR parseresults = 1 TO answer
                speechcopy$ = speechcopy$ + answer$(parseresults)
                IF parseresults = answer THEN
                    speechoutput$ = speechoutput$ + "and " + answer$(parseresults)
                ELSE
                    speechoutput$ = speechoutput$ + answer$(parseresults) + ", "
                    speechcopy$ = speechcopy$ + crlf$
                END IF
            NEXT parseresults
            speechprint$ = speechoutput$
            GOSUB textprint
            GOSUB speechoutput
            usercommands = -1
        END IF
    END IF
END IF

IF usercommand$(runcommands) = "word" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "press" THEN
                speechoutput$ = "opening wordpress"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "start resources\urls\wordpress.URL"
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
IF usercommand$(runcommands) = "wordpress" THEN
    speechoutput$ = "opening wordpress"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\wordpress.URL"
    usercommands = -1
END IF

IF usercommand$(runcommands) = "yahoo" THEN
    speechoutput$ = "opening yahoo"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\yahoo.URL"
    usercommands = -1
END IF

IF usercommand$(runcommands) = "year" THEN
    year$ = RIGHT$(DATE$, 4)
    year = VAL(year$)
    speechoutput$ = "it is the year " + year$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF

IF usercommand$(runcommands) = "yellow" THEN
    textcolor = 14
    usercommands = -1
END IF

IF usercommand$(runcommands) = "yes" OR usercommand$(runcommands) = "ya" OR usercommand$(runcommands) = "yea" OR usercommand$(runcommands) = "yeah" OR usercommand$(runcommands) = "sure" OR usercommand$(runcommands) = "afirmative" THEN
    IF yndlud = 1 THEN
        GOSUB download
    END IF
    IF ynlogclear = 1 THEN
        CLOSE #2
        OPEN "data\log.jdf" FOR OUTPUT AS #2
        PRINT #2, "--------------------------------------------------------------------------------------------------------------------------------"
        CLOSE #2
        OPEN "data\log.jdf" FOR APPEND AS #2
        speechoutput$ = "the log has been cleared"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        ynlogclear = 0
    END IF
    IF ynname = 1 THEN
        username$ = tempusername$
        speechoutput$ = "i have saved your name as " + username$
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        ynname = 0
    END IF
    IF ynpackage = 1 THEN
        speechoutput$ = "commencing packaging, this may take a while"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        ynpackage = 0
        SHELL _HIDE "mkdir " + CHR$(34) + jarvisloc$ + "\JARVIS" + CHR$(34)
        SHELL _HIDE "xcopy /s /y batch JARVIS\batch\"
        SHELL _HIDE "xcopy /s /y bin JARVIS\bin\"
        SHELL _HIDE "xcopy /s /y customcmd JARVIS\customcmd\"
        SHELL _HIDE "xcopy /s /y data JARVIS\data\"
        SHELL _HIDE "xcopy /s /y include JARVIS\include\"
        SHELL _HIDE "xcopy /s /y lib JARVIS\lib\"
        SHELL _HIDE "xcopy /s /y packs JARVIS\packs\"
        SHELL _HIDE "xcopy /s /y qb64 JARVIS\qb64\"
        SHELL _HIDE "xcopy /s /y resources JARVIS\resources\"
        SHELL _HIDE "xcopy /s /y snapshots JARVIS\snapshots\"
        SHELL _HIDE "xcopy /s /y source JARVIS\source\"
        SHELL _HIDE "xcopy /s /y temp JARVIS\temp\"
        SHELL _HIDE "xcopy /s /y tools JARVIS\tools\"
        SHELL _HIDE "copy /y JARVIS.exe JARVIS\JARVIS.exe"
        _DELAY 1
        SHELL _DONTWAIT _HIDE "mkdir JARVIS\temp\profile"
        SHELL _DONTWAIT _HIDE "mkdir JARVIS\packs"
        OPEN "JARVIS\data\log.jdf" FOR OUTPUT AS #1
        PRINT #1, ""
        CLOSE #1
        OPEN "JARVIS\temp\firsttime.tmp" FOR OUTPUT AS #1
        CLOSE #1
        OPEN "JARVIS\tools\dimscreen.ini" FOR OUTPUT AS #1
        PRINT #1, "[Settings]"
        PRINT #1, "dimming=5"
        PRINT #1, "hotkey1=!="
        PRINT #1, "hotkey2=!-"
        CLOSE #1
        OPEN "JARVIS\resources\db\event.jdb" FOR OUTPUT AS #1
        CLOSE #1
        SHELL _DONTWAIT _HIDE "del /f /q JARVIS\temp\url\*.URL"
        SHELL _DONTWAIT _HIDE "del /f /q JARVIS\snapshots\0\*.*"
        SHELL _DONTWAIT _HIDE "del /f /q JARVIS\bin\clean\*.*"
        SHELL _DONTWAIT _HIDE "del /f /q JARVIS\bin\backup\bas\*.bas"
        SHELL _DONTWAIT _HIDE "del /f /q JARVIS\bin\backup\exe\*.exe"
        loadcustom = 1
        loadcustom$(1) = "{}"
        alarms = 2
        alarms$(1) = "0"
        jarvisloc$ = "0"
        bootdate$ = "0"
        boottime$ = "0"
        boottimer = 0
        username$ = "sir"
        recognition = 1
        textcolor = 10
        standbytoggle = 0
        standbytime = 10
        timepref = 1
        anglepref = 0
        afirmpref = 0
        alertpref = 1
        volincr = 8192
        ssloc$ = "C:" + ENVIRON$("HOMEPATH") + "\My Documents\My Pictures\Screenshots\"
        ssfile$ = ".png"
        speed& = 32
        buffer& = 32
        screenx = 0
        screeny = 0
        workareax = 0
        workareay = 0
        screenpos = 7
        transparency = 255
        mdpath$ = "C:" + ENVIRON$("HOMEPATH") + "\My Documents\"
        downloadpath$ = "C:" + ENVIRON$("HOMEPATH") + "\Downloads\"
        updatecheck = 1
        skipversion# = 0
        programdir$ = "C:\Documents and Settings\All Users\Start Menu\Programs"
        musicdir$ = "C:" + ENVIRON$("HOMEPATH") + "\My Documents\My Music"
        sndvol# = .5
        songs = 0
        programs = 0
        programlnkload = 0
        programnameload = 0
        musiclnkload = 0
        musicnameload = 0
        closetimes = 1
        closetime(1) = 43200
        lang$ = "en"
        saveyear = 0
        eventnum = 0
        iniloc$ = "JARVIS\data\jarvis.ini"
        GOSUB updateini
        request$ = "terminate"
        PRINT #jarvisboard, request$
        _DELAY 2
        CLOSE #jarvisboard
        CLOSE #jarvishost
        CLEAR
        SYSTEM
    END IF
    IF ynreset = 1 THEN
        speechoutput$ = "commencing reset"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        ynreset = 0
        OPEN "data\log.jdf" FOR OUTPUT AS #1
        PRINT #1, ""
        CLOSE #1
        OPEN "JARVIS\temp\firsttime.tmp" FOR OUTPUT AS #1
        CLOSE #1
        OPEN "JARVIS\tools\dimscreen.ini" FOR OUTPUT AS #1
        PRINT #1, "[Settings]"
        PRINT #1, "dimming=5"
        PRINT #1, "hotkey1=!="
        PRINT #1, "hotkey2=!-"
        CLOSE #1
        OPEN "JARVIS\resources\db\event.jdb" FOR OUTPUT AS #1
        CLOSE #1
        OPEN "tools\dimscreen.ini" FOR OUTPUT AS #1
        PRINT #1, "[Settings]"
        PRINT #1, "dimming=5"
        PRINT #1, "hotkey1=!="
        PRINT #1, "hotkey2=!-"
        CLOSE #1
        SHELL _DONTWAIT _HIDE "del /f /q temp\url\*.URL"
        loadcustom = 1
        loadcustom$(1) = "{}"
        alarms = 2
        alarms$(1) = "0"
        jarvisloc$ = "0"
        bootdate$ = "0"
        boottime$ = "0"
        boottimer = 0
        username$ = "sir"
        recognition = 1
        textcolor = 10
        standbytoggle = 0
        standbytime = 10
        timepref = 1
        anglepref = 0
        afirmpref = 0
        alertpref = 1
        volincr = 8192
        ssloc$ = "C:" + ENVIRON$("HOMEPATH") + "\My Documents\My Pictures\Screenshots\"
        ssfile$ = ".png"
        speed& = 32
        buffer& = 32
        screenx = 0
        screeny = 0
        workareax = 0
        workareay = 0
        screenpos = 7
        transparency = 255
        mdpath$ = "C:" + ENVIRON$("HOMEPATH") + "\My Documents\"
        downloadpath$ = "C:" + ENVIRON$("HOMEPATH") + "\Downloads\"
        updatecheck = 1
        skipversion# = 0
        programdir$ = "C:\Documents and Settings\All Users\Start Menu\Programs"
        musicdir$ = "C:" + ENVIRON$("HOMEPATH") + "\My Documents\My Music"
        sndvol# = .5
        songs = 0
        programs = 0
        programlnkload = 0
        programnameload = 0
        musiclnkload = 0
        musicnameload = 0
        closetimes = 1
        closetime(1) = 43200
        lang$ = "en"
        saveyear = 0
        eventnum = 0
        iniloc$ = "data\jarvis.ini"
        GOSUB updateini
        KILL "C:\WINDOWS\jarvisloc.jdf"
        request$ = "terminate"
        PRINT #jarvisboard, request$
        _DELAY 2
        CLOSE #jarvisboard
        CLOSE #jarvishost
        CLEAR
        SYSTEM
    END IF
    IF ynrestart = 1 THEN
        speechoutput$ = "restarting computer"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        SHELL _DONTWAIT _HIDE "shutdown -r"
        usercommands = -1
        ynrestart = 0
        GOSUB xcleanup
    END IF
    IF ynsaveprofile = 1 THEN
        speechoutput$ = "uninstalling"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        iniloc$ = "data\jarvis.ini"
        GOSUB updateini
        uninstalltype = 1
        OPEN "temp\uninstall.tmp" FOR OUTPUT AS #1
        PRINT #1, LTRIM$(STR$(uninstalltype))
        CLOSE #1
        SHELL _HIDE "copy batch\uninstall.bat C:\uninstall.bat"
        SHELL _HIDE "start C:\uninstall.bat"
        ynsaveprofile = 0
        SYSTEM
    END IF
    IF ynshutdown = 1 THEN
        speechoutput$ = "shutting down computer"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        SHELL _DONTWAIT _HIDE "shutdown -s"
        usercommands = -1
        ynshutdown = 0
        GOSUB xcleanup
    END IF
    IF ynuninstall = 1 THEN
        speechoutput$ = "would you like to save your information in case you decide to install me at a later time?"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        ynuninstall = 0
        ynsaveprofile = 1
    END IF
END IF

IF usercommand$(runcommands) = "yesterday" THEN
    day = VAL(STR$(VAL(MID$(DATE$, 4, 2))))
    month = VAL(LEFT$(DATE$, 2))
    year = VAL(RIGHT$(DATE$, 4))
    IF month < 3 THEN
        month = month + 12
        year = year - 1
    END IF
    century = year \ 100
    year = year MOD 100
    S1 = (century \ 4) - (2 * century) - 1
    S2 = (5 * year) \ 4
    S3 = 26 * (month + 1) \ 10
    weekday = (S1 + S2 + S3 + day - 1) MOD 7
    IF weekday < 0 THEN weekday = weekday + 7
    SELECT CASE weekday
        CASE 0
            day$ = "Sunday"
        CASE 1
            day$ = "Monday"
        CASE 2
            day$ = "Tuesday"
        CASE 3
            day$ = "Wednesday"
        CASE 4
            day$ = "Thursday"
        CASE 5
            day$ = "Friday"
        CASE 6
            day$ = "Saturday"
    END SELECT
    speechoutput$ = "yesterday was " + day$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF

IF usercommand$(runcommands) = "youtube" THEN
    speechoutput$ = "opening youtube"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\youtube.URL"
    usercommands = -1
END IF
            IF usercommands = -1 THEN EXIT DO
        END IF
    NEXT runcommands
    EXIT DO
LOOP
GOSUB passiveproc
GOSUB timeproc
GOSUB errorhandler
RETURN

converse:

RETURN

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

errorhandler:
IF errorhandler = 1 THEN
    DO
        PRINT #2, "Error:"; ERR; ":"; _ERRORLINE
        errorcount = errorcount + 1
        active = 0
        speechoutput$ = "an error has occured"
        status$ = "INACTIVE"
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        CLOSE #1
        usercommands = 0
        EXIT DO
    LOOP
END IF
RETURN

getalarms:
REDIM alarms$(32)
alarms = 0
OPEN "data\jarvis.ini" FOR INPUT AS #1
DO
    LINE INPUT #1, getline$
    IF getline$ = "[Alarms]" THEN
        DO
            LINE INPUT #1, getline$
            IF getline$ <> "" THEN
                alarms = alarms + 1
                alarms$(alarms) = getline$
            ELSE
                EXIT DO
            END IF
        LOOP
        EXIT DO
    END IF
LOOP
CLOSE #1
RETURN

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

inform:
IF usercommands <> -1 AND active = 1 THEN
    DO
        FOR runinput = 1 TO userinputs

DO
    highest = 0
    FOR elementcheck = 1 TO NumOfElement
        elecheck = Compare(elements$(elementcheck, 1), userinput$(runinput))
        IF elecheck > highest THEN
            highest = elecheck
            elechecknum = elementcheck
        END IF
    NEXT elementcheck
    IF highest < 85 THEN EXIT DO
    speechoutput$ = ""
    FOR checkspec = 1 TO userinputs
        spec$ = userinput$(checkspec)
        SELECT CASE spec$
            CASE "abbreviation", "symbol"
                speechoutput$ = elements$(elechecknum, 2)
            CASE "number", "proton", "protons", "electron", "electrons"
                speechoutput$ = elements$(elechecknum, 3)
            CASE "weight", "mass"
                speechoutput$ = elements$(elechecknum, 4)
            CASE "melting", "melt"
                spec$ = "melting point"
                speechoutput$ = elements$(elechecknum, 5)
            CASE "boiling", "boil"
                spec$ = "boiling point"
                speechoutput$ = elements$(elechecknum, 6)
            CASE "density", "dense"
                speechoutput$ = elements$(elechecknum, 7)
            CASE "state", "phase"
                spec$ = spec$ + " at room temperature"
                speechoutput$ = elements$(elechecknum, 8)
            CASE "classification", "class"
                spec$ = "elemental " + spec$
                speechoutput$ = elements$(elechecknum, 9)
            CASE "period", "row"
                spec$ = spec$ + " number"
                speechoutput$ = elements$(elechecknum, 10)
            CASE "group", "column"
                IF spec$ = "group" THEN
                    oldspec$ = spec$
                    spec$ = userinput$(checkspec + 1)
                    SELECT CASE spec$
                        CASE "number"
                            spec$ = "group number"
                            speechoutput$ = elements$(elechecknum, 11)
                        CASE "name"
                            spec$ = "group name"
                            speechoutput$ = elements$(elechecknum, 12)
                    END SELECT
                END IF
                IF speechoutput$ = "" THEN
                    spec$ = spec$ + " number"
                    speechoutput$ = elements$(elechecknum, 11)
                END IF
            CASE "crust", "crustal"
                spec$ = "estimated crustal abundance"
                speechoutput$ = elements$(elechecknum, 13)
            CASE "oceanic", "ocean"
                spec$ = "estimated oceanic abundance"
                speechoutput$ = elements$(elechecknum, 14)
            CASE "isotopes", "isotope", "stable"
                spec$ = "number of stable isotopes"
                speechoutput$ = elements$(elechecknum, 15)
            CASE "ionization", "ion", "energy"
                spec$ = "ionization energy"
                speechoutput$ = elements$(elechecknum, 16)
            CASE "oxidation"
                spec$ = "oxidation states"
                speechoutput$ = elements$(elechecknum, 17)
            CASE "configuration", "shell"
                spec$ = "electron shell configuration"
                speechoutput$ = elements$(elechecknum, 18)
            CASE "origin", "etymology"
                speechoutput$ = elements$(elechecknum, 19)
            CASE "history", "uses", "use"
                speechoutput$ = elements$(elechecknum, 20)
        END SELECT
        IF speechoutput$ > "" THEN
            speechoutput$ = "The " + spec$ + " of " + elements$(elechecknum, 1) + " is " + speechoutput$
            EXIT FOR
        END IF
    NEXT checkspec
    IF speechoutput$ = "" THEN speechoutput$ = "For the element " + elements$(elechecknum, 1) + ", symbol is " + elements$(elechecknum, 2) + ", atomic number is " + elements$(elechecknum, 3) + ", atomic weight is " + elements$(elechecknum, 4) + ", melting point is " + elements$(elechecknum, 5) + ", boiling point is " + elements$(elechecknum, 6) + ", density is " + elements$(elechecknum, 7) + ", phase at room temperature is " + elements$(elechecknum, 8) + ", elemental classification is " + elements$(elechecknum, 9) + ", period number is " + elements$(elechecknum, 10) + ", group number is " + elements$(elechecknum, 11) + ", group name is " + elements$(elechecknum, 12) + ", estimated crustal abundance is " + elements$(elechecknum, 13) + ", estimated oceanic abundance is " + elements$(elechecknum, 14) + ", number of stable isotopes is " + elements$(elechecknum, 15) + ", ionization energy is " + elements$(elechecknum, 16) + ", oxidation states is " + elements$(elechecknum, 17) + ", electron shell configuration is " + elements$(elechecknum, 18) + ", origin is " + elements$(elechecknum, 19) + ", history and uses: " + elements$(elechecknum, 20)
    speechprint$ = speechoutput$
    speechcopy$ = UCASE$(elements$(elechecknum, 1)) + crlf$ + "Symbol: " + elements$(elechecknum, 2) + crlf$ + "Atomic Number: " + elements$(elechecknum, 3) + crlf$ + "Atomic Weight: " + elements$(elechecknum, 4) + crlf$ + "Melting Point: " + elements$(elechecknum, 5) + crlf$ + "Boiling Point: " + elements$(elechecknum, 6) + crlf$ + "Density: " + elements$(elechecknum, 7) + crlf$ + "Phase at Room Temperature: " + elements$(elechecknum, 8) + crlf$ + "Elemental Classification: " + elements$(elechecknum, 9) + crlf$ + "Period Number: " + elements$(elechecknum, 10) + crlf$ + "Group Number: " + elements$(elechecknum, 11) + crlf$ + "Group Name: " + elements$(elechecknum, 12) + crlf$ + "Estimated Crustal Abundance: " + elements$(elechecknum, 13) + crlf$ + "Estimated Oceanic Abundance: " + elements$(elechecknum, 14) + crlf$ + "Number of Stable Isotopes: " + elements$(elechecknum, 15) + crlf$ + "Ionization Energy: " + elements$(elechecknum, 16) + crlf$ + "Oxidation States: " + elements$(elechecknum, 17) + crlf$ + "Electron Shell Configuration: " + elements$(elechecknum, 18) + crlf$ + "Origin of Name: " + elements$(elechecknum, 19) + crlf$ + "History and Uses: " + elements$(elechecknum, 20)
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
    EXIT DO
LOOP
            IF usercommands = -1 THEN EXIT DO
        NEXT runinput
        EXIT DO
    LOOP
END IF
RETURN

keyboard:
REDIM keys(256)
keys = 0
click = 0
shift = 0
control = 0
alt = 0
FOR thekey = &H01 TO &HFE
    IF GetAsyncKeyState(thekey) THEN
        keys = keys + 1
        keys(thekey) = 1
    END IF
NEXT
IF keys(1) = 1 OR keys(2) = 1 THEN click = 1
IF keys(16) = 1 THEN shift = 1
IF keys(17) = 1 THEN control = 1
IF keys(18) = 1 THEN alt = 1
RETURN

logger:
timekey$ = DATE$ + " -- " + LEFT$(TIME$, 5)
IF timekey$ <> oldtimekey$ AND timeblock = 1 THEN
    PRINT #2, timekey$
    timeblock = 0
END IF
IF active = 1 THEN
    IF useroutputuse$ <> "" AND useroutputuse$ <> olduseroutputuse$ THEN
        userlogs = userlogs + 1
        PRINT #2, "USER  : "; useroutput$
        timeblock = 1
    END IF
    IF speechoutput$ <> "" THEN
        jarvislogs = jarvislogs + 1
        PRINT #2, "JARVIS: "; speechoutput$
        timeblock = 1
    END IF
END IF
IF error$ <> "" THEN
    PRINT #2, "ERROR : "; error$
    timeblock = 1
END IF
error$ = ""
olduseroutputuse$ = useroutputuse$
oldtimekey$ = timekey$
RETURN

mousepos:
getmousepos = GetCursorPos(_OFFSET(LPP))
xmouse& = LPP.x
ymouse& = LPP.y
RETURN

passiveproc:
IF active = 1 THEN
    nowactive = TIMER
    timeactive = nowactive - startactive
    IF timeactive >= standbytime## AND standbytoggle = 0 THEN
        active = 0
        IF alertpref = 1 THEN
            speechoutput$ = "standing by"
        ELSE
            speechoutput$ = ""
        END IF
        status$ = "INACTIVE"
        speechprint$ = "standing by"
        GOSUB textprint
        GOSUB speechoutput
        echo = 0
        usercommands = -1
    END IF
    IF usercommands = 0 AND LEN(useroutput$) <> 0 AND afirmpref = 1 THEN
        IF alertpref = 1 THEN
            speechoutput$ = "i am sorry, i didnt understand that, try again"
        ELSE
            speechoutput$ = ""
        END IF
        speechprint$ = "i am sorry, i didnt understand that, try again"
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
    END IF
END IF
GOSUB activity
RETURN

sierr:
IF ERR = 70 THEN SYSTEM
GOTO sierrpass

speechoutput:
IF speechsetup = 0 THEN
    txt2guid _OFFSET(CLSID_SpVoice), "96749377-3391-11D2-9EE3-00C04F797396"
    txt2guid _OFFSET(IID_ISpVoice), "6C44DF74-72B9-4992-A1EC-EF996E0422D4"
    txt2guid _OFFSET(CLSID_SpSharedRecoContext), "47206204-5ECA-11D2-960F-00C04F8EE628"
    txt2guid _OFFSET(IID_ISpRecoContext), "F740A62F-7C15-489E-8234-940A33D9272D"
    COMinit& = -1
    Voiceinit& = -1
    Graminit& = -1
    Recinit& = -1
    COMinit& = CoInitializeEx(0, COINIT_MULTITHREADED OR COINIT_SPEED_OVER_MEMORY)
    checkHR COMinit&, -1, "CoInitializeEx"
    Voiceinit& = CoCreateInstance(_OFFSET(CLSID_SpVoice), 0, CLSCTX_ALL, _OFFSET(IID_ISpVoice), _OFFSET(pVoice%&))
    checkHR Voiceinit&, -1, "CoCreateInstance"
    Recinit& = CoCreateInstance(_OFFSET(CLSID_SpSharedRecoContext), 0, CLSCTX_ALL, _OFFSET(IID_ISpRecoContext), _OFFSET(pReco%&))
    checkHR Recinit&, -1, "CoCreateInstance"
    Graminit& = dABSOLUTEpqp(peekp(peekp(pReco%&) + 56), pReco%&, 0, _OFFSET(pGrammar%&))
    checkHR hr&, -1, "CreateGrammar"
    hr& = dABSOLUTEppd(peekp(peekp(pGrammar%&) + 80), pGrammar%&, 0, 0)
    checkHR hr&, -1, "LoadDictation"
    hr& = dABSOLUTEpd(peekp(peekp(pGrammar%&) + 88), pGrammar%&, 1)
    checkHR hr&, -1, "SetDictationState"
    dwFlags~& = 1
    speechsetup = 1
END IF
IF speechoutput$ <> "" THEN
    ut$ = MKI$(0)
    FOR i& = LEN(speechoutput$) TO 1 STEP -1
        ut$ = MKI$(ASC(MID$(speechoutput$, i&, 1))) + ut$
    NEXT
    ut$ = ut$ + MKI$(0)
    hr& = dABSOLUTEppdp(peekp(peekp(pVoice%&) + 80), pVoice%&, _OFFSET(ut$), dwFlags~&, 0)
    IF 0 > hr& THEN
        error$ = "Speak failed: 0x" + hexd(hr&)
        GOSUB xcleanup
    END IF
    outputrecord = outputrecord + 1
    outputrecord$(outputrecord) = speechprint$
    speechoutput$ = ""
END IF
hr& = dABSOLUTEppp(peekp(peekp(pVoice%&) + 88), pVoice%&, _OFFSET(voiceStatus), 0)
checkHR hr&, 0, "GetStatus"
IF VAL(hexd(voiceStatus.dwRunningState)) = 1 THEN
    nowspeaking = 0
ELSE
    nowspeaking = 1
    startactive = TIMER
END IF
RETURN

textprint:
CLS
VIEW PRINT 1 TO 13
COLOR textcolor, 0
PRINT "JARVIS -- Just Another Rather Very Intelligent System"
PRINT "> "; status$
PRINT "> "; LEFT$(typing$, 60); LEFT$(useroutput$, 60)
IF LEN(typing$) > 60 OR LEN(useroutput$) > 60 THEN PRINT "  "; MID$(typing$, 61, 60); MID$(useroutput$, 61, 60)
IF LEN(typing$) > 120 OR LEN(useroutput$) > 120 THEN PRINT "  "; MID$(typing$, 121, 60); MID$(useroutput$, 121, 60)
IF LEN(typing$) > 180 OR LEN(useroutput$) > 180 THEN PRINT "  "; MID$(typing$, 181, 60); MID$(useroutput$, 181, 60)
IF (LEN(typing$) > 240 AND LEN(typing$) < 256) OR (LEN(useroutput$) > 240 AND LEN(useroutput$) < 256) THEN PRINT "  "; MID$(typing$, 241, 15); MID$(useroutput$, 241, 15)
IF LEN(typing$) > 256 OR LEN(useroutput$) > 256 THEN PRINT "  "; MID$(typing$, 241, 12); MID$(useroutput$, 241, 12); "..."
PRINT "> "; LEFT$(speechprint$, 60)
IF LEN(speechprint$) > 60 THEN PRINT "  "; MID$(speechprint$, 61, 60)
IF LEN(speechprint$) > 120 THEN PRINT "  "; MID$(speechprint$, 121, 60)
IF LEN(speechprint$) > 180 THEN PRINT "  "; MID$(speechprint$, 181, 60)
IF LEN(speechprint$) > 240 AND LEN(speechprint$) < 256 THEN PRINT "  "; MID$(speechprint$, 241, 15)
IF LEN(speechprint$) > 256 THEN PRINT "  "; MID$(speechprint$, 241, 12); "..."
IF LEN(module$) THEN
    LOCATE 2, (64 - (LEN(module$) + 1))
    PRINT module$; "<";
END IF
_DISPLAY
ON ERROR GOTO errorhandler
IF _EXIT THEN GOTO xcleanup
GOSUB logger
RETURN

timeproc:
IF oldtime$ <> TIME$ THEN
    jarvistimer&& = jarvistimer&& + 1
    DO
    LOOP WHILE TIMER < 1
    nowmonth = VAL(LEFT$(DATE$, 2))
    nowday = VAL(MID$(DATE$, 4, 2))
    nowyear = VAL(RIGHT$(DATE$, 4))
    nowhour = VAL(LEFT$(TIME$, 2))
    nowminute = VAL(MID$(TIME$, 4, 2))
    nowsecond = VAL(RIGHT$(TIME$, 2))
    timestamp$ = RIGHT$(DATE$, 4) + LEFT$(DATE$, 2) + MID$(DATE$, 4, 2) + LEFT$(TIME$, 2) + MID$(TIME$, 4, 2) + RIGHT$(TIME$, 2)
    elapse## = 0
    FOR years = (bootyear + 1) TO (nowyear - 1)
        isleap = (years MOD 4 = 0 AND years MOD 100 <> 0) OR years MOD 400 = 0
        elapse## = elapse## + (86400 * (365 - isleap))
    NEXT
    IF bootyear <> nowyear THEN
        FOR bootmonths = (bootmonth + 1) TO 12
            SELECT CASE bootmonths
                CASE 2
                    isleap = (bootyear MOD 4 = 0 AND bootyear MOD 100 <> 0) OR bootyear MOD 400 = 0
                    daysinmonth = 29 - isleap
                CASE 4, 6, 9, 11
                    daysinmonth = 30
                CASE ELSE
                    daysinmonth = 31
            END SELECT
            elapse## = elapse## + (86400 * daysinmonth)
        NEXT bootmonths
        FOR nowmonths = 1 TO (nowmonth - 1)
            SELECT CASE nowmonths
                CASE 2
                    isleap = (nowyear MOD 4 = 0 AND nowyear MOD 100 <> 0) OR nowyear MOD 400 = 0
                    daysinmonth = 29 - isleap
                CASE 4, 6, 9, 11
                    daysinmonth = 30
                CASE ELSE
                    daysinmonth = 31
            END SELECT
            elapse## = elapse## + (86400 * daysinmonth)
        NEXT nowmonths
        SELECT CASE bootmonth
            CASE 2
                isleap = (bootyear MOD 4 = 0 AND bootyear MOD 100 <> 0) OR bootyear MOD 400 = 0
                daysinmonth = 29 - isleap
            CASE 4, 6, 9, 11
                daysinmonth = 30
            CASE ELSE
                daysinmonth = 31
        END SELECT
        elapse## = elapse## + ((daysinmonth - bootday) * 86400)
        elapse## = elapse## + ((nowday - 1) * 86400)
    END IF
    IF bootyear = nowyear AND bootmonth <> nowmonth THEN
        FOR months = (bootmonth + 1) TO (nowmonth - 1)
            SELECT CASE month
                CASE 2
                    isleap = (bootyear MOD 4 = 0 AND bootyear MOD 100 <> 0) OR bootyear MOD 400 = 0
                    daysinmonth = 29 - isleap
                CASE 4, 6, 9, 11
                    daysinmonth = 30
                CASE ELSE
                    daysinmonth = 31
            END SELECT
            elapse## = elapse## + (86400 * daysinmonth)
        NEXT months
        SELECT CASE bootmonth
            CASE 2
                isleap = (bootyear MOD 4 = 0 AND bootyear MOD 100 <> 0) OR bootyear MOD 400 = 0
                daysinmonth = 29 - isleap
            CASE 4, 6, 9, 11
                daysinmonth = 30
            CASE ELSE
                daysinmonth = 31
        END SELECT
        elapse## = elapse## + ((daysinmonth - bootday) * 86400)
        elapse## = elapse## + ((nowday - 1) * 86400)
        elapse## = elapse## + (24 - 1 - boothour) * 3600
        elapse## = elapse## + (nowhour * 3600)
        elapse## = elapse## + (60 - 1 - bootminute) * 60
        elapse## = elapse## + (nowminute * 60)
        elapse## = elapse## + 60 - bootsecond
        elapse## = elapse## + nowsecond
    END IF
    IF bootyear = nowyear AND bootmonth = nowmonth AND bootday <> nowday THEN
        elapse## = elapse## + ((nowday - (bootday + 1)) * 86400)
        elapse## = elapse## + (24 - 1 - boothour) * 3600
        elapse## = elapse## + (nowhour * 3600)
        elapse## = elapse## + (60 - 1 - bootminute) * 60
        elapse## = elapse## + (nowminute * 60)
        elapse## = elapse## + 60 - bootsecond
        elapse## = elapse## + nowsecond
    END IF
    IF bootyear = nowyear AND bootmonth = nowmonth AND bootday = nowday AND boothour <> nowhour THEN
        elapse## = elapse## + (nowhour - 1 - boothour) * 3600
        elapse## = elapse## + (60 - 1 - bootminute) * 60
        elapse## = elapse## + (nowminute * 60)
        elapse## = elapse## + 60 - bootsecond
        elapse## = elapse## + nowsecond
    END IF
    IF bootyear = nowyear AND bootmonth = nowmonth AND bootday = nowday AND boothour = nowhour AND bootminute <> nowminute THEN
        elapse## = elapse## + (nowminute - 1 - bootminute) * 60
        elapse## = elapse## + 60 - bootsecond
        elapse## = elapse## + nowsecond
    END IF
    IF bootyear = nowyear AND bootmonth = nowmonth AND bootday = nowday AND boothour = nowhour AND bootminute = nowminute THEN elapse## = elapse## + nowsecond - bootsecond
    IF elapse## MOD 3600 = 0 THEN
        elapsehours = elapse## / 3600
        _SNDPLAY tone1
        _DELAY .3
        IF alertpref = 1 THEN
            speechoutput$ = "your computer has been on for" + STR$(elapsehours) + " hours, " + username$
        ELSE
            speechoutput$ = ""
        END IF
        speechprint$ = "your computer has been on for" + STR$(elapsehours) + " hours, " + username$
        GOSUB textprint
        GOSUB speechoutput
    END IF
    IF VAL(alarms$(2)) <= VAL(timestamp$) AND alertpref = 1 THEN
        IF VAL(timestamp$) - VAL(alarms$(2)) <= 100 THEN
            IF alarm <> 0 THEN
                _SNDLOOP alarm
            ELSE
                _SNDLOOP defaultalarm
            END IF
            DO
                _LIMIT 64
                k$ = INKEY$
            LOOP UNTIL k$ = CHR$(32)
            IF alarm <> 0 THEN
                _SNDSTOP alarm
            ELSE
                _SNDSTOP defaultalarm
            END IF
        END IF
        alarms$(2) = ""
        IF alarms >= 3 THEN
            FOR alarmmove = 3 TO alarms
                alarms$(alarmmove - 1) = alarms$(alarmmove)
            NEXT alarmmove
            alarms$(alarms) = ""
            alarms = alarms - 1
        END IF
    END IF
    FOR timercheck = 1 TO timers
        IF VAL(timers$(timercheck)) <= jarvistimer&& AND VAL(timers$(timercheck)) <> 0 THEN
            _SNDPLAY tone2
            _DELAY .3
            IF alertpref = 1 THEN
                speechoutput$ = "it has been " + timersay$(timercheck) + " " + username$
            ELSE
                speechoutput$ = ""
            END IF
            speechprint$ = "it has been " + timersay$(timercheck) + " " + username$
            GOSUB textprint
            GOSUB speechoutput
            timers$(timercheck) = ""
            timersay$(timercheck) = ""
            FOR timermove = timercheck TO (timers + 1)
                timers$(timermove) = timers$(timermove + 1)
                timersay$(timermove) = timersay$(timermove + 1)
            NEXT timermove
            timers = timers - 1
        END IF
    NEXT timercheck
    IF INT(TIMER) >= avgclosetime AND starttime < avgclosetime AND closeprompt = 0 THEN
        closeprompt = 1
        IF alertpref = 1 THEN
            speechoutput$ = "this is about the time you usually close me"
        ELSE
            speechoutput$ = ""
        END IF
        speechprint$ = "this is about the time you usually close me"
        GOSUB textprint
        GOSUB speechoutput
    END IF
END IF
IF nowyear <> saveyear THEN
    IF saveyear THEN
        speechoutput$ = "happy new year! it is now the year " + TRIM$(STR$(nowyear))
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
    END IF
    _DELAY 2
    speechoutput$ = "updating event database, this may take a while"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    REDIM eventindex(1024)
    REDIM events$(1024, 3)
    eventindex = 0
    getevent = 1
    year = VAL(RIGHT$(DATE$, 4))
    FOR eventyear = year TO (year + 1)
        SHELL _HIDE LocWget + " http://www.timeanddate.com/calendar/custom.html?year=" + RTRIM$(LTRIM$(STR$(eventyear))) + "&country=1&holm=1&df=1&hol=8519551 -O temp\events.htm"
        OPEN "temp\events.htm" FOR INPUT AS #1
        REDIM readevent$(128)
        readevent = 0
        DO
            readevent = readevent + 1
            LINE INPUT #1, readevent$(readevent)
        LOOP UNTIL EOF(1) = -1
        CLOSE #1
        FOR findevent = 1 TO readevent
            IF LEFT$(readevent$(findevent), 16) = "<div id=calarea>" THEN
                readevent$(findevent) = RemContainer$(readevent$(findevent), "(", ")")
                FOR foundevent = 1 TO LEN(readevent$(findevent))
                    IF MonthToNum(LEFT$(MID$(readevent$(findevent), foundevent, 5), 3)) > 0 AND VAL(RIGHT$(MID$(readevent$(findevent), foundevent, 5), 1)) > 0 AND MID$(readevent$(findevent), (foundevent - 1), 1) = ">" THEN
                        eventindex(eventindex) = foundevent
                        eventindex = eventindex + 1
                    END IF
                NEXT foundevent
                eventindex(eventindex) = LEN(readevent$(findevent))
                EXIT FOR
            END IF
        NEXT findevent
        FOR getevent = getevent TO eventindex
            events$(getevent, 1) = MID$(readevent$(findevent), eventindex(getevent - 1), (eventindex(getevent) - eventindex(getevent - 1)))
            storedate$ = LEFT$(events$(getevent, 1), (INSTR(events$(getevent, 1), "<") - 1))
            eventmonth$ = LTRIM$(STR$(MonthToNum(LEFT$(storedate$, 3))))
            IF LEN(eventmonth$) = 1 THEN eventmonth$ = "0" + eventmonth$
            eventday$ = LTRIM$(RIGHT$(storedate$, 2))
            IF LEN(eventday$) = 1 THEN eventday$ = "0" + eventday$
            eventdate$ = eventmonth$ + "-" + eventday$ + "-" + LTRIM$(STR$(eventyear))
            IF INSTR(events$(getevent, 1), "<a ") THEN
                event$ = HTMLConvResChar$(MID$(events$(getevent, 1), (INSTR(INSTR(events$(getevent, 1), "<a "), events$(getevent, 1), ">") + 1), (INSTR((INSTR(INSTR(events$(getevent, 1), "<a "), events$(getevent, 1), ">") + 1), events$(getevent, 1), "<") - (INSTR(INSTR(events$(getevent, 1), "<a "), events$(getevent, 1), ">") + 1))))
                IF INSTR(INSTR(events$(getevent, 1), "<a "), events$(getevent, 1), " title=") THEN
                    description$ = HTMLConvResChar$(MID$(events$(getevent, 1), (INSTR(INSTR(events$(getevent, 1), "<a "), events$(getevent, 1), " title=") + 8), (INSTR((INSTR(INSTR(events$(getevent, 1), "<a "), events$(getevent, 1), " title=") + 8), events$(getevent, 1), CHR$(34)) - (INSTR(INSTR(events$(getevent, 1), "<a "), events$(getevent, 1), " title=") + 8))))
                ELSE
                    description$ = ""
                END IF
            ELSE
                event$ = HTMLConvResChar$(MID$(events$(getevent, 1), (INSTR(events$(getevent, 1), "<td>") + 4), (INSTR((INSTR(events$(getevent, 1), "<td>") + 4), events$(getevent, 1), "</td>") - (INSTR(events$(getevent, 1), "<td>") + 4))))
                description$ = ""
            END IF
            events$(getevent, 1) = event$
            events$(getevent, 2) = eventdate$
            events$(getevent, 3) = description$
        NEXT getevent
    NEXT eventyear
    KILL "temp\events.htm"
    eventnum = getevent
    eventdb$ = ""
    OPEN "resources\db\event.jdb" FOR OUTPUT AS #1
    FOR row = 1 TO getevent
        FOR column = 1 TO 3
            eventdb$ = eventdb$ + events$(row, column) + CHR$(10)
    NEXT column, row
    eventdb$ = LEFT$(eventdb$, (LEN(eventdb$) - 1))
    PRINT #1, eventdb$
    CLOSE #1
    speechoutput$ = "done"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    saveyear = nowyear
END IF
IF (jarvistimer&& - activetimer&&) = 600 AND ooia = 1 THEN
    ooia = 0
    _SNDPLAY tone1
    _DELAY .3
    IF alertpref = 1 THEN
        speechoutput$ = "your computer has been inactive for 10 minutes, " + username$
    ELSE
        speechoutput$ = ""
    END IF
    speechprint$ = "your computer has been inactive for 10 minutes, " + username$
    GOSUB textprint
    GOSUB speechoutput
END IF
IF (jarvistimer&& - activetimer&&) = 601 THEN ooia = 1
IF (jarvistimer&& - activetimer&&) = 1800 AND ooia = 1 THEN
    ooia = 0
    _SNDPLAY tone1
    _DELAY .3
    IF alertpref = 1 THEN
        speechoutput$ = "your computer has been inactive for 30 minutes, " + username$
    ELSE
        speechoutput$ = ""
    END IF
    speechprint$ = "your computer has been inactive for 30 minutes, " + username$
    GOSUB textprint
    GOSUB speechoutput
END IF
IF (jarvistimer&& - activetimer&&) = 1801 THEN ooia = 1
IF (jarvistimer&& - activetimer&&) MOD 3600 = 0 AND activetimer&& <> jarvistimer&& AND ooia = 1 THEN
    ooia = 0
    inactivehour = (jarvistimer&& - activetimer&&) / 3600
    _SNDPLAY tone1
    _DELAY .3
    IF alertpref = 1 THEN
        speechoutput$ = "your computer has been inactive for" + STR$(inactivehour) + " hours, " + username$
    ELSE
        speechoutput$ = ""
    END IF
    speechprint$ = "your computer has been inactive for" + STR$(inactivehour) + " hours, " + username$
    GOSUB textprint
    GOSUB speechoutput
END IF
IF (jarvistimer&& - activetimer&&) MOD 3600 = 1 AND activetimer&& <> jarvistimer&& THEN ooia = 1
IF nowminute = 0 AND nowsecond = 0 AND oncetime = 0 THEN
    _SNDPLAY tone1
    _DELAY .3
    oncetime = 1
    RANDOMIZE TIMER
    survey = INT(RND * 240)
    IF survey = 0 THEN
        IF alertpref = 1 THEN
            speechoutput$ = "please take a minute to fill out a satisfaction report"
        ELSE
            speechoutput$ = ""
        END IF
        speechprint$ = "please take a minute to fill out a satisfaction report"
        GOSUB textprint
        GOSUB speechoutput
        SHELL _DONTWAIT _HIDE "start tools\report.exe"
    ELSE
        hours$ = LEFT$(TIME$, 2)
        hours = VAL(hours$)
        IF timepref = 1 THEN
            daytime$ = "AM"
            IF hours > 12 THEN
                hours = hours - 12
                daytime$ = "PM"
            END IF
            IF hours = 12 THEN daytime$ = "PM"
            IF hours = 0 THEN
                hours = 12
            END IF
        END IF
        IF timepref = 1 THEN
            hourmark$ = LTRIM$(STR$(hours)) + " o'clock " + daytime$ + " " + username$
            speechprint$ = "it is " + hourmark$
        ELSE
            hourmark$ = hours$ + " hundred hours, " + username$
            speechprint$ = "it is " + hours$ + "00 hours, " + username$
        END IF
        IF alertpref = 1 THEN
            speechoutput$ = "it is " + hourmark$
        ELSE
            speechoutput$ = ""
        END IF
        speechprint$ = "it is " + hourmark$
        GOSUB textprint
        GOSUB speechoutput
    END IF
END IF
IF nowhour = 0 AND nowminute = 0 AND nowsecond = 0 AND oncetime = 0 AND updatecheck = 1 THEN GOSUB updatecheck
IF nowminute > 0 AND nowsecond > 0 THEN oncetime = 0
oldtime$ = TIME$
RETURN

update:
_SCREENSHOW
COLOR textcolor, 0
DO
    _LIMIT 64
    CLS
    PRINT "It looks like there is an update for your JARVIS"
    PRINT "Current Version:"; version#
    PRINT "Available Version:"; fileversion#
    PRINT
    PRINT "What would you like to do?"
    PRINT "   0-Update now"
    PRINT "   1-Update later"
    k$ = INKEY$
    IF k$ = CHR$(48) THEN
        CLS
        PRINT "JARVIS will now download and automatically install an update"
        PRINT "Please do not close JARVIS or turn off your computer during this time"
        _DISPLAY
        _DELAY 4
        GOSUB download
        EXIT DO
    END IF
    IF k$ = CHR$(49) THEN
        DO
            _LIMIT 128
            k$ = INKEY$
        LOOP UNTIL k$ = ""
        DO
            _LIMIT 64
            CLS
            PRINT "Would you like any of the following options?"
            PRINT "0-Turn Checking for updates off"
            PRINT "1-Skip this version"
            PRINT "2-I changed my mind, let me update"
            PRINT "3-Just let me use JARVIS"
            k$ = INKEY$
            IF k$ = CHR$(48) THEN
                updatecheck = 0
                CLS
                PRINT "Update checking has been turned off"
                PRINT "To turn this back on say 'turn update checking on'"
                PRINT "JARVIS will run as usual after 4 seconds"
                _DISPLAY
                _DELAY 4
                exitupdate = 1
                EXIT DO
            END IF
            IF k$ = CHR$(49) THEN
                skipversion# = fileversion#
                CLS
                PRINT "This version will no longer attemp to download"
                PRINT "To download this version say 'check for update'"
                PRINT "To turn checking for this version on say 'turn version update restrictions off'"
                PRINT "Or you can just wait until a newer version is available"
                PRINT "JARVIS will run as usual after 4 seconds"
                _DISPLAY
                _DELAY 4
                exitupdate = 1
                EXIT DO
            END IF
            IF k$ = CHR$(50) THEN
                CLS
                PRINT "JARVIS will now download and automatically install an update"
                PRINT "Please do not close JARVIS or turn off your computer during this time"
                _DISPLAY
                _DELAY 4
                GOSUB download
                EXIT DO
            END IF
            IF k$ = CHR$(51) THEN
                exitupdate = 1
                EXIT DO
            END IF
            _DISPLAY
        LOOP
        IF exitupdate = 1 THEN EXIT DO
    END IF
    _DISPLAY
LOOP
CLS
_DISPLAY
IF updatecall = 0 THEN _SCREENHIDE
exitupdate = 0
RETURN

updatecheck:
versionfile$ = "http://dl.dropbox.com/u/30616191/JARVIS/version.txt"
getversion = _OPENCLIENT("TCP/IP:80:" + "dl.dropbox.com")
IF getversion THEN
    request$ = "GET " + versionfile$ + " HTTP/1.0" + CR$ + CR$
    PUT #getversion, , request$
    _DELAY 2
    GET #getversion, , response$
    CLOSE getversion
END IF
fileversion# = VAL(RIGHT$(response$, VAL(MID$(response$, ((INSTR(response$, "content-length: ")) + 16), ((INSTR(((INSTR(response$, "content-length: ")) + 16), response$, CHR$(10))) - ((INSTR(response$, "content-length: ")) + 16))))))
IF fileversion# <> version# THEN
    updateresponse = 1
ELSE
    updateresponse = 0
END IF
IF fileversion# <> version# AND fileversion# <> skipversion# AND updatecall = 0 THEN
    GOSUB update
END IF
RETURN

updateini:
OPEN iniloc$ FOR OUTPUT AS #1
PRINT #1, "[Settings]"
PRINT #1, jarvisloc$
PRINT #1, bootdate$
PRINT #1, boottime$
PRINT #1, LTRIM$(STR$(boottimer))
PRINT #1, id$
PRINT #1, username$
PRINT #1, LTRIM$(STR$(recognition))
PRINT #1, LTRIM$(STR$(textcolor))
PRINT #1, LTRIM$(STR$(standbytoggle))
PRINT #1, LTRIM$(STR$(standbytime##))
PRINT #1, LTRIM$(STR$(timepref))
PRINT #1, LTRIM$(STR$(anglepref))
PRINT #1, LTRIM$(STR$(afirmpref))
PRINT #1, LTRIM$(STR$(alertpref))
PRINT #1, LTRIM$(STR$(volincr))
PRINT #1, ssloc$
PRINT #1, ssfile$
PRINT #1, LTRIM$(STR$(speed&))
PRINT #1, LTRIM$(STR$(buffer&))
PRINT #1, LTRIM$(STR$(screenx))
PRINT #1, LTRIM$(STR$(screeny))
PRINT #1, LTRIM$(STR$(workareax))
PRINT #1, LTRIM$(STR$(workareay))
PRINT #1, LTRIM$(STR$(screenpos))
PRINT #1, LTRIM$(STR$(transparency))
PRINT #1, mdpath$
PRINT #1, downloadpath$
PRINT #1, LTRIM$(STR$(updatecheck))
PRINT #1, LTRIM$(STR$(skipversion#))
PRINT #1, programdir$
PRINT #1, musicdir$
PRINT #1, LTRIM$(STR$(sndvol#))
PRINT #1, LTRIM$(STR$(songs))
PRINT #1, LTRIM$(STR$(programs))
PRINT #1, emailaddress$
PRINT #1, LTRIM$(STR$(zipcode))
PRINT #1, LTRIM$(STR$(prognum))
PRINT #1, LTRIM$(STR$(songnum))
PRINT #1, lang$
PRINT #1, LTRIM$(STR$(saveyear))
PRINT #1, LTRIM$(STR$(eventnum))
PRINT #1, birthday$
PRINT #1, ""
commandprint = 0
PRINT #1, "[Command Words]"
DO
    commandprint = commandprint + 1
    PRINT #1, loadcommand$(commandprint)
LOOP UNTIL commandprint = loadcommands
PRINT #1, ""
customprint = 0
PRINT #1, "[Custom Command Words]"
DO
    customprint = customprint + 1
    PRINT #1, loadcustom$(customprint)
LOOP UNTIL customprint = loadcustom
PRINT #1, ""
programlnkprint = 0
PRINT #1, "[Program Links]
DO
    programlnkprint = programlnkprint + 1
    IF proglnk$(programlnkprint) <> "" THEN PRINT #1, proglnk$(programlnkprint)
LOOP UNTIL programlnkprint = programlnkload
PRINT #1, ""
programnameprint = 0
PRINT #1, "[Program Names]
DO
    programnameprint = programnameprint + 1
    IF progname$(programnameprint) <> "" THEN PRINT #1, progname$(programnameprint)
LOOP UNTIL programnameprint = programnameload
PRINT #1, ""
emotionsposprint = 0
PRINT #1, "[Positive Emotions]"
DO
    emotionsposprint = emotionsposprint + 1
    PRINT #1, emotionspos$(emotionsposprint)
LOOP UNTIL emotionsposprint = emotionsposcount
PRINT #1, ""
emotionsnegprint = 0
PRINT #1, "[Negative Emotions]"
DO
    emotionsnegprint = emotionsnegprint + 1
    PRINT #1, emotionsneg$(emotionsnegprint)
LOOP UNTIL emotionsnegprint = emotionsnegcount
PRINT #1, ""
alarmprint = 0
PRINT #1, "[Alarms]"
DO
    alarmprint = alarmprint + 1
    PRINT #1, alarms$(alarmprint)
LOOP UNTIL alarmprint = alarms
PRINT #1, ""
closetimesprint = 0
PRINT #1, "[Close Times]"
DO
    closetimesprint = closetimesprint + 1
    PRINT #1, LTRIM$(STR$(closetime(closetimesprint)))
LOOP UNTIL closetimesprint = closetimes
IF endprog = 1 THEN PRINT #1, LTRIM$(STR$(TIMER))
PRINT #1, ""
packprint = 0
PRINT #1, "[Packs]"
DO
    packprint = packprint + 1
    PRINT #1, packs$(packprint)
LOOP UNTIL packprint = packs
PRINT #1, ""
CLOSE #1
RETURN

xcleanup:
_SNDPLAY tone3
_DELAY .3
IF 0 <= COMinit& THEN CoUninitialize
IF pszCoMemText%& THEN CoTaskMemFree pszCoMemText%&
IF Event.elParamType THEN GOSUB clearevent
IF 0 <= Voiceinit& THEN error$ = "New reference count: 0x" + hexd(dABSOLUTEp(peekp(peekp(pVoice%&) + 8), pVoice%&))
GOSUB logger
IF 0 <= Graminit& THEN error$ = "New reference count: 0x" + hexd(dABSOLUTEp(peekp(peekp(pGrammar%&) + 8), pGrammar%&))
GOSUB logger
'IF 0 <= Recinit& THEN error$ = "New reference count: 0x" + hexd(dABSOLUTEp(peekp(peekp(pReco%&) + 8), pReco%&))
IF 0 <= Recinit& THEN error$ = "New reference count: 0x00000000"
GOSUB logger
_SCREENHIDE
closetime = TIMER
timespent = closetime - starttime
iniloc$ = "data\jarvis.ini"
endprog = 1
GOSUB updateini
PRINT #2, timekey$
PRINT #2, "Time Spent:"; timespent
PRINT #2, "Commands  :"; userlogs
PRINT #2, "Responses :"; jarvislogs
PRINT #2, "Errors    :"; errorcount
PRINT #2, LTRIM$(STR$(ERR)); ":"; LTRIM$(STR$(_ERRORLINE))
PRINT #2, "--------------------------------------------------------------------------------------------------------------------------------"
CLOSE #2
CLOSE #3
KILL "temp\si.tmp"
_SNDCLOSE tone1
_SNDCLOSE tone2
_SNDCLOSE tone3
_SNDCLOSE music
_SNDCLOSE defaultalarm
IF alarm <> 0 THEN _SNDCLOSE alarm
request$ = "terminate"
IF jbct < 30 THEN PRINT #jarvisboard, request$
_DELAY 1
IF jbct < 30 THEN CLOSE #jarvisboard
CLOSE #jarvishost
IF firsttime = 1 THEN SHELL _DONTWAIT _HIDE "start batch\dellib.bat"
CLEAR
SYSTEM
RETURN




SUB checkHR (hr&, action&, nam$)
IF hr& < 0 THEN
    error$ = nam$ + " failed. Error: 0x" + hexd(hr&)
    IF action& THEN ERROR 97
END IF
END SUB

SUB dictionary (searchstr$, definition$(), synonym$(), synsetcount(), flag)

CONST DICTDIR = "\dict"
CONST DEFAULTPATH = "resources\\WordNet\\2.1\\dict"
CONST DATAFILE = "%s\data.%s"
CONST INDEXFILE = "%s\index.%s"
CONST SENSEIDXFILE = "%s\index.sense"
CONST KEYIDXFILE = "%s\index.key"
CONST REVKEYIDXFILE = "%s\index.key.rev"
CONST VRBSENTFILE = "%s\sents.vrb"
CONST VRBIDXFILE = "%s\sentidx.vrb"
CONST CNTLISTFILE = "%s\cntlist.rev"
CONST SEARCHBUF = (200& * 1024)
CONST LINEBUF = (15 * 1024)
CONST SMLINEBUF = (3 * 1024)
CONST WORDBUF = 256
CONST ALLSENSES = 0
CONST MAXID = 1
CONST MAXDEPTH = 20
CONST MAXSENSE = 75
CONST MAX_FORMS = 5
CONST MAXFNUM = 44
CONST ANTPTR = 1
CONST HYPERPTR = 2
CONST HYPOPTR = 3
CONST ENTAILPTR = 4
CONST SIMPTR = 5
CONST ISMEMBERPTR = 6
CONST ISSTUFFPTR = 7
CONST ISPARTPTR = 8
CONST HASMEMBERPTR = 9
CONST HASSTUFFPTR = 10
CONST HASPARTPTR = 11
CONST MERONYM = 12
CONST HOLONYM = 13
CONST CAUSETO = 14
CONST PPLPTR = 15
CONST SEEALSOPTR = 16
CONST PERTPTR = 17
CONST ATTRIBUTE = 18
CONST VERBGROUP = 19
CONST DERIVATION = 20
CONST CLASSIFICATION = 21
CONST CLASS = 22
CONST LASTTYPE = CLASS
CONST SYNS = (LASTTYPE + 1)
CONST FREQ = (LASTTYPE + 2)
CONST FRAMES = (LASTTYPE + 3)
CONST COORDS = (LASTTYPE + 4)
CONST RELATIVES = (LASTTYPE + 5)
CONST HMERONYM = (LASTTYPE + 6)
CONST HHOLONYM = (LASTTYPE + 7)
CONST WNGREP = (LASTTYPE + 8)
CONST OVERVIEW = (LASTTYPE + 9)
CONST MAXSEARCH = OVERVIEW
CONST CLASSIF_START = (MAXSEARCH + 1)
CONST CLASSIF_CATEGORY = (CLASSIF_START)
CONST CLASSIF_USAGE = (CLASSIF_START + 1)
CONST CLASSIF_REGIONAL = (CLASSIF_START + 2)
CONST CLASSIF_END = CLASSIF_REGIONAL
CONST CLASS_START = (CLASSIF_END + 1)
CONST CLASS_CATEGORY = (CLASS_START)
CONST CLASS_USAGE = (CLASS_START + 1)
CONST CLASS_REGIONAL = (CLASS_START + 2)
CONST CLASS_END = CLASS_REGIONAL
CONST INSTANCE = (CLASS_END + 1)
CONST INSTANCES = (CLASS_END + 2)
CONST MAXPTR = INSTANCES
CONST NUMPARTS = 4
CONST NUMFRAMES = 35
CONST NOUN = 1
CONST VERB = 2
CONST ADJ = 3
CONST ADV = 4
CONST SATELLITE = 5
CONST ADJSAT = SATELLITE
CONST ALL_POS = 0
CONST PADJ = 1
CONST NPADJ = 2
CONST IPADJ = 3
CONST UNKNOWN_MARKER = 0
CONST ATTRIBUTIVE = NPADJ
CONST PREDICATIVE = PADJ
CONST IMMED_POSTNOMINAL = IPADJ
CONST DBLICENSE_SIZE = (1741)

DECLARE LIBRARY "..\lib\binsrch"
END DECLARE
DECLARE LIBRARY "..\lib\morph"
END DECLARE
DECLARE LIBRARY "..\lib\search"
END DECLARE
DECLARE LIBRARY "..\lib\wnglobal"
END DECLARE
DECLARE LIBRARY "..\lib\wnhelp"
END DECLARE
DECLARE LIBRARY "..\lib\wnrtl"
END DECLARE
DECLARE LIBRARY "..\lib\wnutil"
END DECLARE
DECLARE CUSTOMTYPE LIBRARY "..\lib\wncust"
    FUNCTION FmtSynset~%& (BYVAL Synset~%&, BYVAL int&)
    FUNCTION GetDataOffset& (BYVAL char~%&)
    FUNCTION GetKeyForOffset~& (BYVAL char~%&)
    FUNCTION GetOffsetForKey~%& (BYVAL uint~&)
    FUNCTION GetPolyCount& (BYVAL char~%&)
    FUNCTION GetSenseIndex~%& (BYVAL char~%&)
    FUNCTION GetSynsetForSense~%& (BYVAL char~%&)
    FUNCTION GetTagcnt& (BYVAL Index~%&, BYVAL int&)
    FUNCTION GetValidIndexPointer~%& (BYVAL char~%&, BYVAL int&)
    FUNCTION GetWNSense& (BYVAL char~%&, BYVAL char~%&)
    FUNCTION GetWNStr~%& (BYVAL char~%&, BYVAL int&)
    FUNCTION GetWORD~%& (BYVAL char~%&)
    FUNCTION Get_POS& ALIAS "GetPOS" (BYVAL char~%&)
    FUNCTION SetSearchdir~%& ()
    FUNCTION StrToPos& (BYVAL char~%&)
    FUNCTION ToLowerCase~%& (BYVAL char~%&)
    FUNCTION WNSnsToStr~%& (BYVAL Index~%&, BYVAL int&)
    FUNCTION bin_search~%& (BYVAL char~%&, BYVAL FILE~%&)
    FUNCTION cntwords& (BYVAL char~%&, char)
    FUNCTION do_trace~%& (BYVAL Synset~%&, BYVAL int&, BYVAL int&, BYVAL int&)
    FUNCTION findtheinfo_ds~%& (BYVAL char~%&, BYVAL int&, BYVAL int&, BYVAL int&)
    FUNCTION findtheinfo~%& (BYVAL char~%&, BYVAL int&, BYVAL int&, BYVAL int&)
    FUNCTION getindex~%& (BYVAL char~%&, BYVAL int&)
    FUNCTION getpos& (BYVAL char~%&)
    FUNCTION getptrtype& (BYVAL char~%&)
    FUNCTION getsstype& (BYVAL char~%&)
    FUNCTION in_wn~& (BYVAL char~%&, BYVAL int&)
    FUNCTION index_lookup~%& (BYVAL char~%&, BYVAL int&)
    FUNCTION insert_line~%& (BYVAL char~%&, BYVAL char~%&, BYVAL FILE~%&)
    FUNCTION is_defined~& (BYVAL char~%&, BYVAL int&)
    FUNCTION morphinit& ()
    FUNCTION morphstr~%& (BYVAL char~%&, BYVAL int&)
    FUNCTION morphword~%& (BYVAL char~%&, BYVAL int&)
    FUNCTION parse_index~%& (BYVAL long&, BYVAL int&, BYVAL char~%&)
    FUNCTION parse_synset~%& (BYVAL FILE~%&, BYVAL int&, BYVAL char~%&)
    FUNCTION re_morphinit& ()
    FUNCTION re_wninit& ()
    FUNCTION read_index~%& (BYVAL long&, BYVAL FILE~%&)
    FUNCTION read_synset~%& (BYVAL int&, BYVAL long&, BYVAL char~%&)
    FUNCTION replace_line~%& (BYVAL char~%&, BYVAL char~%&, BYVAL FILE~%&)
    FUNCTION strstr_getnext& ()
    FUNCTION strsubst~%& (BYVAL char~%&, char, char)
    FUNCTION strtolower~%& (BYVAL char~%&)
    FUNCTION traceptrs_ds~%& (BYVAL Synset~%&, BYVAL int&, BYVAL int&, BYVAL int&)
    FUNCTION wninit& ()
    SUB copyfile (BYVAL FILE~%&, BYVAL FILE~%&)
    SUB free_index (BYVAL Index~%&)
    SUB free_syns (BYVAL Synset~%&)
    SUB free_synset (BYVAL Synset~%&)
    SUB strstr_init (BYVAL char~%&, BYVAL char~%&)
    SUB wn_install_errmessage_handler
END DECLARE
DECLARE LIBRARY "..\lib\wn-getvars"
    FUNCTION getptr_OpenDB~%& ()
    FUNCTION getptr_abortsearch~%& ()
    FUNCTION getptr_adjclass~%& ()
    FUNCTION getptr_cntlistfp~%& ()
    FUNCTION getptr_datafps~%& ()
    FUNCTION getptr_dblicense~%& ()
    FUNCTION getptr_dflag~%& ()
    FUNCTION getptr_display_message~%& ()
    FUNCTION getptr_fileinfoflag~%& ()
    FUNCTION getptr_fnflag~%& ()
    FUNCTION getptr_frametext~%& ()
    FUNCTION getptr_frflag~%& ()
    FUNCTION getptr_helptext~%& ()
    FUNCTION getptr_indexfps~%& ()
    FUNCTION getptr_interface_doevents_func~%& ()
    FUNCTION getptr_keyindexfp~%& ()
    FUNCTION getptr_lexfiles~%& ()
    FUNCTION getptr_license~%& ()
    FUNCTION getptr_offsetflag~%& ()
    FUNCTION getptr_partchars~%& ()
    FUNCTION getptr_partnames~%& ()
    FUNCTION getptr_ptrtyp~%& ()
    FUNCTION getptr_revkeyindexfp~%& ()
    FUNCTION getptr_saflag~%& ()
    FUNCTION getptr_sensefp~%& ()
    FUNCTION getptr_vidxfilefp~%& ()
    FUNCTION getptr_vsentfilefp~%& ()
    FUNCTION getptr_wnrelease~%& ()
    FUNCTION getptr_wnresults~%& ()
    FUNCTION getptr_wnsnsflag~%& ()
END DECLARE

TYPE Index
    idxoffset AS LONG
    off_cnt AS LONG
    offset AS _UNSIGNED _OFFSET
    pos AS _UNSIGNED _OFFSET
    ptruse AS _UNSIGNED _OFFSET
    ptruse_cnt AS LONG
    sense_cnt AS LONG
    tagged_cnt AS LONG
    wd AS _UNSIGNED _OFFSET
END TYPE
TYPE SearchResults
    OutSenseCount0 AS LONG
    OutSenseCount1 AS LONG
    OutSenseCount2 AS LONG
    OutSenseCount3 AS LONG
    OutSenseCount4 AS LONG
    SenseCount0 AS LONG
    SenseCount1 AS LONG
    SenseCount2 AS LONG
    SenseCount3 AS LONG
    SenseCount4 AS LONG
    numforms AS LONG
    printcnt AS LONG
    searchbuf AS _UNSIGNED _OFFSET
    searchds AS _UNSIGNED _OFFSET
END TYPE
TYPE SnsIndex
    loc AS LONG
    nextsi AS _UNSIGNED _OFFSET
    sensekey AS _UNSIGNED _OFFSET
    tag_cnt AS LONG
    wnsense AS LONG
    word AS _UNSIGNED _OFFSET
END TYPE
TYPE Synset
    defn AS _UNSIGNED _OFFSET
    fcount AS LONG
    fnum AS LONG
    frmid AS _UNSIGNED _OFFSET
    frmto AS _UNSIGNED _OFFSET
    headsense AS INTEGER
    headword AS _UNSIGNED _OFFSET
    hereiam AS LONG
    key AS _UNSIGNED LONG
    lexid AS _UNSIGNED _OFFSET
    nextform AS _UNSIGNED _OFFSET
    nextss AS _UNSIGNED _OFFSET
    padding AS INTEGER
    pfrm AS _UNSIGNED _OFFSET
    pos AS _UNSIGNED _OFFSET
    ppos AS _UNSIGNED _OFFSET
    pto AS _UNSIGNED _OFFSET
    ptrcount AS LONG
    ptrlist AS _UNSIGNED _OFFSET
    ptroff AS _UNSIGNED _OFFSET
    ptrtyp AS _UNSIGNED _OFFSET
    searchtype AS LONG
    sstype AS LONG
    wcount AS LONG
    whichword AS LONG
    wnsns AS _UNSIGNED _OFFSET
    words AS _UNSIGNED _OFFSET
END TYPE
CONST PtrSize = 4
DIM MyIndex AS Index
DIM MySynset AS Synset
wn_install_errmessage_handler
IF wninit THEN EXIT SUB
REDIM synsetcount(4)
searchstr$ = searchstr$ + CHR$(0)
FOR i = 1 TO 4
    pIndex~%& = index_lookup(_OFFSET(searchstr$), i)
    IF pIndex~%& THEN
        memcpy _OFFSET(MyIndex), pIndex~%&, LEN(MyIndex)
        FOR indexcnt& = 0 TO MyIndex.off_cnt - 1
            pSynset~%& = read_synset(i, peekd(4 * indexcnt& + MyIndex.offset), _OFFSET(searchstr$))
            synsetcount(i) = synsetcount(i) + 1
            memcpy _OFFSET(MySynset), pSynset~%&, LEN(MySynset)
            defn$ = peekstr(MySynset.defn)
            definition$(i, synsetcount(i)) = MID$(defn$, 2, (LEN(defn$) - 2))
            synonym$(i, synsetcount(i)) = ""
            FOR syn& = 0 TO MySynset.wcount - 1
                IF syn& + 1 <> MySynset.whichword THEN
                    IF LEN(synonym$(i, synsetcount(i))) THEN synonym$(i, synsetcount(i)) = synonym$(i, synsetcount(i)) + ", "
                    syn$ = peekstr(peekp(PtrSize * syn& + MySynset.words))
                    IF INSTR(syn$, "_") THEN
                        buildsyn$ = ""
                        FOR splicepace = 1 TO LEN(syn$)
                            shave$ = MID$(syn$, splicepace, 1)
                            IF shave$ = "_" THEN shave$ = " "
                            buildsyn$ = buildsyn$ + shave$
                        NEXT splicepace
                        syn$ = buildsyn$
                    END IF
                    synonym$(i, synsetcount(i)) = synonym$(i, synsetcount(i)) + syn$
                END IF
            NEXT
            free_synset pSynset~%&
        NEXT
        free_index pIndex~%&
    END IF
NEXT
flag = -1
END SUB

SUB email (uemail$, upass$, remail$, id$, messageloc$, flag)
crlf$ = CHR$(13) + CHR$(10)
c = _OPENCLIENT("tcp/ip:25:mail.gmx.com")
IF c = 0 THEN EXIT FUNCTION
a$ = "EHLO localhost" + crlf$
PUT #c, , a$
a$ = "AUTH LOGIN" + crlf$
PUT #c, , a$
base64e$ = convbase64$(uemail$) + crlf$
PUT #c, , base64e$
base64p$ = convbase64$(upass$) + crlf$
PUT #c, , base64p$
a$ = "MAIL FROM: Report <" + uemail$ + ">" + crlf$
PUT #c, , a$
a$ = "RCPT TO: JARVIS <" + remail$ + ">" + crlf$
PUT #c, , a$
a$ = "DATA" + crlf$
PUT #c, , a$
a$ = ""
a$ = "From:  Report <" + uemail$ + ">" + crlf$
PUT #c, , a$
a$ = "To: JARVIS <" + remail$ + ">" + crlf$
PUT #c, , a$
a$ = "Subject: " + id$ + crlf$
PUT #c, , a$
a$ = crlf$
PUT #c, , a$
REDIM message$(65536)
OPEN messageloc$ FOR INPUT AS #1
DO
    message = message + 1
    LINE INPUT #1, message$(message)
LOOP UNTIL EOF(1) = -1
CLOSE #1
REDIM _PRESERVE message$(message)
FOR putmessage = 1 TO UBOUND(message$)
    a$ = message$(putmessage) + crlf$
    PUT #c, , a$
NEXT putmessage
a$ = crlf$
PUT #c, , a$
a$ = "." + crlf$
PUT #c, , a$
SLEEP 2
a$ = "QUIT" + crlf$
PUT #c, , a$
SLEEP 2
CLOSE c
flag = -1
END SUB

SUB txt2guid (c%&, t$)
poked c%&, VAL("&h" + LEFT$(t$, 8))
pokew c%& + 4, VAL("&h" + MID$(t$, 10, 4))
pokew c%& + 6, VAL("&h" + MID$(t$, 15, 4))
pokeb c%& + 8, VAL("&h" + MID$(t$, 20, 2))
pokeb c%& + 9, VAL("&h" + MID$(t$, 22, 2))
FOR i& = 0 TO 5
    pokeb c%& + 10 + i&, VAL("&h" + MID$(t$, 25 + i& * 2, 2))
NEXT
END SUB




FUNCTION Alphabetize (array$())
FOR a = 1 TO UBOUND(array$)
    FOR a2 = 1 TO UBOUND(array$)
        IF array$(a2) > array$(a) THEN
            SWAP array$(a), array$(a2)
        END IF
    NEXT a2
NEXT a
END FUNCTION

FUNCTION bin$ (num%)
IF num% = 0 THEN EXIT FUNCTION
DO
    remain% = ABS(num% MOD 2)
    num% = num% \ 2
    bin$ = LTRIM$(STR$(remain%))
    bintotal$ = bin$ + bintotal$
LOOP UNTIL num% = 0
bin$ = STRING$(8 - LEN(bintotal$), "0") + bintotal$
END FUNCTION

FUNCTION colortorgb& (c)
SELECT CASE c
    CASE 0
        r = 0
        g = 0
        b = 0
    CASE 1
        r = 0
        g = 0
        b = 168
    CASE 2
        r = 0
        g = 168
        b = 0
    CASE 3
        r = 0
        g = 168
        b = 168
    CASE 4
        r = 168
        g = 0
        b = 0
    CASE 5
        r = 168
        g = 0
        b = 168
    CASE 6
        r = 168
        g = 84
        b = 0
    CASE 7
        r = 168
        g = 168
        b = 168
    CASE 8
        r = 84
        g = 84
        b = 84
    CASE 9
        r = 84
        g = 84
        b = 252
    CASE 10
        r = 84
        g = 252
        b = 84
    CASE 11
        r = 84
        g = 252
        b = 252
    CASE 12
        r = 252
        g = 84
        b = 84
    CASE 13
        r = 252
        g = 84
        b = 252
    CASE 14
        r = 252
        g = 252
        b = 84
    CASE 15
        r = 252
        g = 252
        b = 252
END SELECT
colortorgb& = _RGB32(r, g, b)
END FUNCTION

FUNCTION Compare (check$, reference$)
REDIM Comparex(32)
REDIM Comparey(32)
FOR j = 1 TO LEN(check$)
    x = ASC(UCASE$(MID$(check$, j, 1)))
    IF x > 64 AND x < 91 THEN
        Comparex(x - 64) = Comparex(x - 64) + 1
    END IF
NEXT
FOR j = 1 TO LEN(reference$)
    x = ASC(UCASE$(MID$(reference$, j, 1)))
    IF x > 64 AND x < 91 THEN Comparey(x - 64) = Comparey(x - 64) + 1
NEXT
wordright = 0
wordwrong = 0
FOR j = 1 TO 26
    IF Comparex(j) <= Comparey(j) THEN
        wordright = wordright + Comparex(j)
        wordwrong = wordwrong + Comparey(j) - Comparex(j)
    ELSE
        wordright = wordright + Comparey(j)
    END IF
NEXT
Compare = ((wordright - wordwrong) / LEN(check$) * 100)
END FUNCTION

FUNCTION convbase64$ (bit8$)
IF bit8$ = "" THEN EXIT FUNCTION
base64$ = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
pad = LEN(bit8$) MOD 3
unenc$ = bit8$ + STRING$(pad + 1, "=")
st = 1
enc$ = ""
DO
    bytes$ = ""
    FOR x = st TO st + 2
        bytes$ = bytes$ + bin$(ASC(MID$(unenc$, x, 1)))
    NEXT x
    FOR x = 1 TO 4
        num = todecimal(MID$(bytes$, x * 6 - 5, 6))
        enc$ = enc$ + MID$(base64$, num + 1, 1)
    NEXT x
    st = st + 3
LOOP UNTIL LEN(unenc$) - st - 1 <= 0
enc$ = LEFT$(enc$, LEN(enc$) - pad + 1)
enc$ = enc$ + STRING$(pad - 1, "=")
convbase64$ = enc$
END FUNCTION

FUNCTION DaySuffix$ (day)
day$ = STR$(day)
suffix$ = "th"
IF day < 11 OR day > 19 THEN
    SELECT CASE VAL(RIGHT$(day$, 1))
        CASE 1
            suffix$ = "st"
        CASE 2
            suffix$ = "nd"
        CASE 3
            suffix$ = "rd"
    END SELECT
END IF
DaySuffix$ = day$ + suffix$
END FUNCTION

FUNCTION Deserialize$ (text$, chunk$)
DO
    b& = INSTR(e& + 1, text$, CHR$(34))
    IF 0 = b& THEN EXIT FUNCTION
    e& = INSTR(b& + 1, text$, CHR$(34))
    IF 0 = e& THEN EXIT FUNCTION
    SELECT CASE p&
        CASE 0
            IF chunk$ = MID$(text$, b& + 1, e& - b& - 1) THEN
                p& = 2
            ELSE
                p& = 1
            END IF
        CASE 1
            p& = 0
        CASE 2
            Deserialize$ = MID$(text$, b& + 1, e& - b& - 1)
            EXIT FUNCTION
    END SELECT
LOOP
END FUNCTION

FUNCTION dis (x1, y1, x2, y2)
dis = INT(SQR(((x2 - x1) ^ 2) + ((y2 - y1) ^ 2)))
END FUNCTION

FUNCTION Download (url$, file$, timelimit, row, col, length)
link$ = url$
GOSUB start_connection
t! = TIMER
head$ = ""
cont_type$ = ""
DO
    _LIMIT 20
    GET #client, , a2$
    a$ = a$ + a2$
    IF INSTR(a$, e$ + e$) AND head$ = "" THEN
        head$ = MID$(a$, 1, INSTR(a$, e$ + e$) - 1)
        uhead$ = UCASE$(head$)
        IF LEFT$(head$, 15) <> "HTTP/1.1 200 OK" THEN
            IF LEFT$(head$, 12) = "HTTP/1.1 302" THEN
                IF INSTR(uhead$, "LOCATION:") > 0 THEN
                    CLOSE #client
                    link$ = MID$(head$, INSTR(uhead$, "LOCATION:") + 9)
                    link$ = MID$(link$, 1, INSTR(link$, e$) - 1)
                    head$ = ""
                    uhead$ = ""
                    a$ = ""
                    GOSUB start_connection
                END IF
            ELSE
                EXIT FUNCTION
            END IF
        END IF
        IF INSTR(uhead$, "CONTENT-LENGTH:") > 0 THEN
            l&& = VAL(MID$(head$, INSTR(uhead$, "CONTENT-LENGTH:") + 15))
        END IF
        IF INSTR(uhead$, "TRANSFER-ENCODING") > 0 THEN
            cont_type$ = MID$(head$, INSTR(uhead$, "TRANSFER-ENCODING:") + 18)
            cont_type$ = UCASE$(RTRIM$(LTRIM$(MID$(cont_type$, 1, INSTR(cont_type$, e$) - 1))))
        END IF
        a$ = MID$(a$, INSTR(a$, e$ + e$) + 4)
    END IF
    IF l&& > 0 THEN ltf&& = l&&
    IF ltf&& > 0 THEN
        lod&& = LEN(a$)
        LOCATE row, col
        PRINT " ("; LTRIM$(RTRIM$(STR$((INT((lod&& / ltf&&) * 100))))); "%)"; RTRIM$(STR$(lod&&)); "b/"; LTRIM$(RTRIM$(STR$(ltf&&))); "b"
        _DISPLAY
    END IF
    IF head$ > "" THEN
        IF l&& > 0 THEN
            lod&& = LEN(a$)
            IF (lod&&) = l&& THEN
                download_done = -1
                LOCATE row, col
                PRINT " ("; "100%)"; RTRIM$(STR$(lod&&)); "b/"; LTRIM$(RTRIM$(STR$(ltf&&))); "b"
                _DISPLAY
                d$ = MID$(a$, 1, l&&)
            END IF
        ELSEIF cont_type$ = "CHUNKED" THEN
            h$ = MID$(a$, 1, INSTR(a$, e$))
            bytes = VAL("&H" + h$)
            IF LEN(a$) - LEN(h$) - 1 > bytes THEN
                chunk$ = chunk$ + MID$(a$, INSTR(a$, e$) + 1, bytes)
                a$ = MID$(a$, INSTR(a$, e$) + bytes + 1)
            ELSEIF bytes = 0 THEN
                dat = length
                download_done = -1
                d$ = chunk$
            END IF
        END IF
    END IF
    IF download_done THEN
        CLOSE client
        fh = FREEFILE
        OPEN file$ FOR OUTPUT AS #5
        CLOSE #5
        OPEN file$ FOR BINARY AS #5
        PUT #5, , d$
        CLOSE #5
        Download = -1
        EXIT FUNCTION
    END IF
LOOP UNTIL TIMER > t! + timelimit AND timelimit > 0
IF TIMER > t! + timelimit AND timelimit > 0 THEN Download = 1
CLOSE client
EXIT FUNCTION
start_connection:
url2$ = RTRIM$(LTRIM$(link$))
url4$ = RTRIM$(LTRIM$(link$))
IF LEFT$(UCASE$(url2$), 7) = "HTTP://" THEN url4$ = MID$(url2$, 8)
x = INSTR(url4$, "/")
IF x THEN url2$ = LEFT$(url4$, x - 1)
client = _OPENCLIENT("TCP/IP:80:" + url2$)
IF client = 0 THEN
    Download = 2
    EXIT FUNCTION
END IF
e$ = CHR$(13) + CHR$(10)
url3$ = RIGHT$(url4$, LEN(url4$) - x + 1)
x$ = "GET " + url3$ + " HTTP/1.1" + e$
x$ = x$ + "Host: " + url2$ + e$ + e$
PUT #client, , x$
RETURN
END FUNCTION

FUNCTION hexq$ (n~&&)
t$ = LCASE$(HEX$(n~&&))
hexq$ = STRING$(16 - LEN(t$), &H30) + t$
END FUNCTION

FUNCTION hexp$ (n~%&)
t$ = LCASE$(HEX$(n~%&))
hexp$ = STRING$((2 * LEN(n~%&)) - LEN(t$), &H30) + t$
END FUNCTION

FUNCTION hexd$ (n~&)
t$ = LCASE$(HEX$(n~&))
hexd$ = STRING$(8 - LEN(t$), &H30) + t$
END FUNCTION

FUNCTION hexw$ (n~&&)
t$ = LCASE$(HEX$(n~&&))
hexw$ = STRING$(4 - LEN(t$), &H30) + t$
END FUNCTION

FUNCTION hexb$ (n~%%)
t$ = LCASE$(HEX$(n~%%))
IF n~%% < &H10 THEN hexb$ = "0" + t$ ELSE hexb$ = t$
END FUNCTION

FUNCTION HTMLConvResChar$ (text$)
DO
    savetext$ = text$
    IF INSTR(text$, "&#34;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&#34;") - 1)) + CHR$(34) + MID$(text$, (INSTR(text$, "&#34;") + 5))
    IF INSTR(text$, "&#38;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&#38;") - 1)) + "&" + MID$(text$, (INSTR(text$, "&#38;") + 5))
    IF INSTR(text$, "&#39;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&#39;") - 1)) + "'" + MID$(text$, (INSTR(text$, "&#39;") + 5))
    IF INSTR(text$, "&#60;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&#60;") - 1)) + "<" + MID$(text$, (INSTR(text$, "&#60;") + 5))
    IF INSTR(text$, "&#62;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&#62;") - 1)) + ">" + MID$(text$, (INSTR(text$, "&#62;") + 5))
    IF INSTR(text$, "&#174;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&#174;") - 1)) + MID$(text$, (INSTR(text$, "&#174;") + 6))
    IF INSTR(text$, "&#225;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&#225;") - 1)) + CHR$(160) + MID$(text$, (INSTR(text$, "&#225;") + 6))
    IF INSTR(text$, "&#233;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&#233;") - 1)) + CHR$(130) + MID$(text$, (INSTR(text$, "&#233;") + 6))
    IF INSTR(text$, "&#960;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&#960;") - 1)) + "3.14" + MID$(text$, (INSTR(text$, "&#960;") + 6))
    IF INSTR(text$, "&#8211;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&#8211;") - 1)) + "-" + MID$(text$, (INSTR(text$, "&#8211;") + 7))
    IF INSTR(text$, "&#8217;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&#8217;") - 1)) + "'" + MID$(text$, (INSTR(text$, "&#8217;") + 7))
    IF INSTR(text$, "&#8220;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&#8220;") - 1)) + CHR$(34) + MID$(text$, (INSTR(text$, "&#8220;") + 7))
    IF INSTR(text$, "&#8221;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&#8221;") - 1)) + CHR$(34) + MID$(text$, (INSTR(text$, "&#8221;") + 7))
    IF INSTR(text$, "&amp;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&amp;") - 1)) + "&" + MID$(text$, (INSTR(text$, "&amp;") + 5))
    IF INSTR(text$, "&apos;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&apos;") - 1)) + "'" + MID$(text$, (INSTR(text$, "&apos;") + 6))
    IF INSTR(text$, "&gt;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&gt;") - 1)) + ">" + MID$(text$, (INSTR(text$, "&gt;") + 4))
    IF INSTR(text$, "&lt;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&lt;") - 1)) + "<" + MID$(text$, (INSTR(text$, "&lt;") + 4))
    IF INSTR(text$, "&nbsp;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&nbsp;") - 1)) + " " + MID$(text$, (INSTR(text$, "&nbsp;") + 6))
    IF INSTR(text$, "&quot;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&quot;") - 1)) + CHR$(34) + MID$(text$, (INSTR(text$, "&quot;") + 6))
LOOP UNTIL text$ = savetext$
HTMLConvResChar$ = text$
END FUNCTION

FUNCTION MonthToNum (month$)
SELECT CASE UCASE$(month$)
    CASE "JAN", "JAN.", "JANUARY"
        MonthToNum = 1
    CASE "FEB", "FEB.", "FEBRUARY"
        MonthToNum = 2
    CASE "MAR", "MAR.", "MARCH"
        MonthToNum = 3
    CASE "APR", "APR.", "APRIL"
        MonthToNum = 4
    CASE "MAY"
        MonthToNum = 5
    CASE "JUN", "JUN.", "JUNE"
        MonthToNum = 6
    CASE "JUL", "JUL.", "JULY"
        MonthToNum = 7
    CASE "AUG", "AUG.", "AUGUST"
        MonthToNum = 8
    CASE "SEP", "SEP.", "SEPTEMBER"
        MonthToNum = 9
    CASE "OCT", "OCT.", "OCTOBER"
        MonthToNum = 10
    CASE "NOV", "NOV.", "NOVEMBER"
        MonthToNum = 11
    CASE "DEC", "DEC.", "DECEMBER"
        MonthToNum = 12
    CASE ELSE
        MonthToNum = 0
END SELECT
END FUNCTION

FUNCTION peekstr$ (p~%&)
n~%& = peekpoke_strnlen(p~%&, &H7FFFFFFF~&)
t$ = STRING$(n~%&, 0)
peekpoke_memcpy _OFFSET(t$), p~%&, n~%&
peekstr$ = t$
END FUNCTION

FUNCTION RemArbitraryWords$ (text$)

RemArbitraryWords$ = text$
END FUNCTION

FUNCTION RemContainer$ (text$, s$, e$)
FOR index = 1 TO LEN(text$)
    chunk$ = MID$(text$, index, 1)
    IF chunk$ = s$ THEN
        DO
            index = index + 1
            IF index > LEN(text$) THEN
                RemContainer$ = text$
                EXIT DO
            END IF
            chunk$ = MID$(text$, index, 1)
        LOOP UNTIL chunk$ = e$
    ELSE
        RemContainer$ = RemContainer$ + chunk$
    END IF
NEXT index
END FUNCTION

FUNCTION remspace$ (a$)
DO
    trimming = 0
    IF LEFT$(a$, 1) = CHR$(32) OR LEFT$(a$, 1) = CHR$(0) THEN
        a$ = MID$(a$, 2)
        trimming = 1
    END IF
    IF RIGHT$(a$, 1) = CHR$(32) OR RIGHT$(a$, 1) = CHR$(0) THEN
        a$ = MID$(a$, 1, (LEN(a$) - 1))
        trimming = 1
    END IF
LOOP UNTIL trimming = 0
remspace$ = a$
END FUNCTION

FUNCTION timebetween&& (y1, m1, d1, h1, n1, s1, y2, m2, d2, h2, n2, s2)
IF y2 < 0 THEN y2 = y1
IF m2 < 0 THEN m2 = m1
IF d2 < 0 THEN d2 = d1
IF h2 < 0 THEN h2 = h1
IF n2 < 0 THEN n2 = n1
IF s2 < 0 THEN s2 = s1
t1&& = (31536000 * y1)
FOR month = 1 TO (m1 - 1)
    SELECT CASE month
        CASE 2
            isleap = (y1 MOD 4 = 0 AND y1 MOD 100 <> 0) OR y1 MOD 400 = 0
            dayinmonth = 29 - isleap
        CASE 4, 6, 9, 11
            dayinmonth = 30
        CASE ELSE
            dayinmonth = 31
    END SELECT
    t1&& = t1&& + (86400 * dayinmonth)
NEXT month
t1&& = t1&& + (86400 * d1) + (3600 * h1) + (60 * n1) + s1
t2&& = (31536000 * y2)
FOR month = 1 TO (m2 - 1)
    SELECT CASE month
        CASE 2
            isleap = (y2 MOD 4 = 0 AND y2 MOD 100 <> 0) OR y2 MOD 400 = 0
            dayinmonth = 29 - isleap
        CASE 4, 6, 9, 11
            dayinmonth = 30
        CASE ELSE
            dayinmonth = 31
    END SELECT
    t2&& = t2&& + (86400 * dayinmonth)
NEXT month
t2&& = t2&& + (86400 * d2) + (3600 * h2) + (60 * n2) + s2
timebetween&& = INT(t2&& - t1&&)
END FUNCTION

FUNCTION todecimal (binary1$)
FOR x = 1 TO LEN(binary1$)
    dec = dec + VAL(MID$(binary1$, x, 1)) * (2 ^ (LEN(binary1$) - x))
NEXT x
todecimal = dec
END FUNCTION

FUNCTION TokenExpired& (expiresin&)
STATIC tokendate$
STATIC timemark
IF expiresin& THEN
    IF DATE$ = tokendate$ AND ABS(TIMER - timemark) < expiresin& - 2 THEN
        TokenExpired& = 0
        EXIT FUNCTION
    END IF
END IF
DO
    tokendate$ = DATE$
    t = TIMER
    testdate$ = DATE$
LOOP UNTIL testdate$ = tokendate$
timemark = t
TokenExpired& = 1
END FUNCTION

FUNCTION TRIM$ (text$)
TRIM$ = RTRIM$(LTRIM$(text$))
END FUNCTION

FUNCTION UrlEncode$ (text$)
FOR a = 1 TO LEN(text$)
    a$ = MID$(text$, a, 1)
    IF a$ = " " THEN
        a$ = "+"
    ELSE
        l = ASC(a$)
        IF l < 48 OR (l > 57 AND l < 65) OR (l > 90 AND l < 97) OR l > 122 THEN a$ = "%" + HEX$(l)
    END IF
    UrlEncode$ = UrlEncode$ + a$
NEXT a
END FUNCTION

FUNCTION WordToNum (num$)
SELECT CASE word$
    CASE "zero"
        WordToNum = 0
    CASE "one"
        WordToNum = 1
    CASE "two"
        WordToNum = 2
    CASE "three"
        WordToNum = 3
    CASE "four"
        WordToNum = 4
    CASE "five"
        WordToNum = 5
    CASE "six"
        WordToNum = 6
    CASE "seven"
        WordToNum = 7
    CASE "eight"
        WordToNum = 8
    CASE "nine"
        WordToNum = 9
    CASE "ten"
        WordToNum = 10
    CASE "eleven"
        WordToNum = 11
    CASE "twelve"
        WordToNum = 12
    CASE "thirteen"
        WordToNum = 13
    CASE "fourteen"
        WordToNum = 14
    CASE "fifteen"
        WordToNum = 15
    CASE "sixteen"
        WordToNum = 16
    CASE "seventeen"
        WordToNum = 17
    CASE "eighteen"
        WordToNum = 18
    CASE "nineteen"
        WordToNum = 19
    CASE "twenty"
        WordToNum = 20
    CASE ELSE
        WordToNum = -1
END SELECT
END FUNCTION

