_TITLE "Pack Installer"
SCREEN 12
PRINT ">fetching jarvisloc"
IF _FILEEXISTS("C:\WINDOWS\jarvisloc.jdf") = 0 THEN
    PRINT ">please install JARVIS first"
    _DELAY 2
    SYSTEM
END IF
OPEN "C:\WINDOWS\jarvisloc.jdf" FOR INPUT AS #1
LINE INPUT #1, jarvisloc$
CLOSE #1
PRINT ">fetching the pack name"
OPEN "bin\resources\name.txt" FOR INPUT AS #1
LINE INPUT #1, packname$
CLOSE #1
PRINT ">checking for this pack"
REDIM alarms$(32)
REDIM closetime(16384)
REDIM commands$(2048)
REDIM emotionsneg$(64)
REDIM emotionspos$(64)
REDIM inidata$(256)
REDIM jarvisini$(65536)
REDIM loadcommand$(1024)
REDIM loadcustom$(256)
REDIM packs$(1028)
REDIM proglnk$(32768)
REDIM progname$(32768)
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
FOR packcheck = 1 TO packs
    IF packs$(packcheck) = packname$ THEN
        PRINT ">this pack is already installed"
        _DELAY 2
        SYSTEM
    END IF
NEXT packcheck
PRINT ">making directory"
SHELL _HIDE "mkdir " + CHR$(34) + jarvisloc$ + "\packs\" + packname$ + CHR$(34)
PRINT ">adding include files"
OPEN jarvisloc$ + "\include\array.bas" FOR APPEND AS #1
PRINT #1, "'$include:'..\packs\" + packname$ + "\include\array.bas'"
CLOSE #1
OPEN jarvisloc$ + "\include\commands.bas" FOR APPEND AS #1
PRINT #1, "'$include:'..\packs\" + packname$ + "\include\commands.bas'"
CLOSE #1
OPEN jarvisloc$ + "\include\const.bas" FOR APPEND AS #1
PRINT #1, "'$include:'..\packs\" + packname$ + "\include\const.bas'"
CLOSE #1
OPEN jarvisloc$ + "\include\customcmd.bas" FOR APPEND AS #1
PRINT #1, "'$include:'..\packs\" + packname$ + "\include\customcmd.bas'"
CLOSE #1
OPEN jarvisloc$ + "\include\customconv.bas" FOR APPEND AS #1
PRINT #1, "'$include:'..\packs\" + packname$ + "\include\customconv.bas'"
CLOSE #1
OPEN jarvisloc$ + "\include\custominf.bas" FOR APPEND AS #1
PRINT #1, "'$include:'..\packs\" + packname$ + "\include\custominf.bas'"
CLOSE #1
OPEN jarvisloc$ + "\include\dim.bas" FOR APPEND AS #1
PRINT #1, "'$include:'..\packs\" + packname$ + "\include\dim.bas'"
CLOSE #1
OPEN jarvisloc$ + "\include\func.bas" FOR APPEND AS #1
PRINT #1, "'$include:'..\packs\" + packname$ + "\include\func.bas'"
CLOSE #1
OPEN jarvisloc$ + "\include\lib.bas" FOR APPEND AS #1
PRINT #1, "'$include:'..\packs\" + packname$ + "\include\lib.bas'"
CLOSE #1
OPEN jarvisloc$ + "\include\sound.bas" FOR APPEND AS #1
PRINT #1, "'$include:'..\packs\" + packname$ + "\include\sound.bas'"
CLOSE #1
OPEN jarvisloc$ + "\include\sub.bas" FOR APPEND AS #1
PRINT #1, "'$include:'..\packs\" + packname$ + "\include\sub.bas'"
CLOSE #1
OPEN jarvisloc$ + "\include\tcpip.bas" FOR APPEND AS #1
PRINT #1, "'$include:'..\packs\" + packname$ + "\include\tcpip.bas'"
CLOSE #1
OPEN jarvisloc$ + "\include\type.bas" FOR APPEND AS #1
PRINT #1, "'$include:'..\packs\" + packname$ + "\include\type.bas'"
CLOSE #1
PRINT ">adding libraries"
SHELL _HIDE "copy " + CHR$(34) + "bin\lib\*.*" + CHR$(34) + " " + CHR$(34) + jarvisloc$ + "\lib\*.*" + CHR$(34)
SHELL _HIDE "del /f /q " + CHR$(34) + jarvisloc$ + "\lib\libraries.txt" + CHR$(34)
PRINT ">moving files to jarvisloc"
SHELL _HIDE "copy /y " + CHR$(34) + "bin\tools\uninstall.exe" + CHR$(34) + " " + CHR$(34) + jarvisloc$ + "\tools\uninstallpack.exe" + CHR$(34)
SHELL _HIDE "xcopy /s /y " + CHR$(34) + "bin\commands" + CHR$(34) + " " + CHR$(34) + jarvisloc$ + "\packs\" + packname$ + "\commands\" + CHR$(34)
SHELL _HIDE "xcopy /s /y " + CHR$(34) + "bin\data" + CHR$(34) + " " + CHR$(34) + jarvisloc$ + "\packs\" + packname$ + "\data\" + CHR$(34)
SHELL _HIDE "xcopy /s /y " + CHR$(34) + "bin\include" + CHR$(34) + " " + CHR$(34) + jarvisloc$ + "\packs\" + packname$ + "\include\" + CHR$(34)
SHELL _HIDE "xcopy /s /y " + CHR$(34) + "bin\lib" + CHR$(34) + " " + CHR$(34) + jarvisloc$ + "\packs\" + packname$ + "\lib\" + CHR$(34)
SHELL _HIDE "xcopy /s /y " + CHR$(34) + "bin\resources" + CHR$(34) + " " + CHR$(34) + jarvisloc$ + "\packs\" + packname$ + "\resources\" + CHR$(34)
SHELL _HIDE "xcopy /s /y " + CHR$(34) + "bin\source" + CHR$(34) + " " + CHR$(34) + jarvisloc$ + "\packs\" + packname$ + "\source\" + CHR$(34)
SHELL _HIDE "xcopy /s /y " + CHR$(34) + "bin\tools" + CHR$(34) + " " + CHR$(34) + jarvisloc$ + "\packs\" + packname$ + "\tools\" + CHR$(34)
PRINT ">adding pack"
OPEN jarvisloc$ + "\data\jarvis.ini" FOR OUTPUT AS #1
iniprint = 0
PRINT #1, "[Settings]"
DO
    iniprint = iniprint + 1
    PRINT #1, inidata$(iniprint)
LOOP UNTIL iniprint = inidata
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
packsprint = 0
PRINT #1, "[Packs]"
DO
    packsprint = packsprint + 1
    PRINT #1, packs$(packsprint)
LOOP UNTIL packsprint = packs
PRINT #1, packname$
PRINT #1, ""
CLOSE #1
PRINT ">initiating recompile"
SHELL _HIDE _DONTWAIT "start " + jarvisloc$ + "\batch\compile.bat"
PRINT ">deleting source files"
SHELL _HIDE _DONTWAIT "start cleanup.bat"
SYSTEM