_TITLE "Pack Uninstaller"
SCREEN 12
PRINT ">fetching the pack name"
OPEN "..\resources\name.txt" FOR INPUT AS #1
LINE INPUT #1, packname$
CLOSE #1
PRINT ">labelling pack"
OPEN "..\..\..\temp\packun.tmp" FOR OUTPUT AS #1
PRINT #1, packname$
CLOSE #1
PRINT ">removing include files"
REDIM array$(32768)
REDIM const$(32768)
REDIM customcmd$(32768)
REDIM dim$(32768)
REDIM func$(32768)
REDIM lib$(32768)
REDIM sound$(32768)
REDIM sub$(32768)
REDIM tcpip$(32768)
REDIM type$(32768)
OPEN "..\..\..\include\array.bas" FOR INPUT AS #1
DO
    arrays = arrays + 1
    LINE INPUT #1, arrays$(arrays)
LOOP UNTIL EOF(1) = -1
CLOSE #1
OPEN "..\..\..\include\const.bas" FOR INPUT AS #1
DO
    consts = consts + 1
    LINE INPUT #1, consts$(consts)
LOOP UNTIL EOF(1) = -1
CLOSE #1
OPEN "..\..\..\include\customcmd.bas" FOR INPUT AS #1
DO
    customcmds = customcmds + 1
    LINE INPUT #1, customcmds$(customcmds)
LOOP UNTIL EOF(1) = -1
CLOSE #1
OPEN "..\..\..\include\dim.bas" FOR INPUT AS #1
DO
    dims = dims + 1
    LINE INPUT #1, dims$(dims)
LOOP UNTIL EOF(1) = -1
CLOSE #1
OPEN "..\..\..\include\func.bas" FOR INPUT AS #1
DO
    funcs = funcs + 1
    LINE INPUT #1, funcs$(funcs)
LOOP UNTIL EOF(1) = -1
CLOSE #1
OPEN "..\..\..\include\lib.bas" FOR INPUT AS #1
DO
    libs = libs + 1
    LINE INPUT #1, libs$(libs)
LOOP UNTIL EOF(1) = -1
CLOSE #1
OPEN "..\..\..\include\sound.bas" FOR INPUT AS #1
DO
    sounds = sounds + 1
    LINE INPUT #1, sounds$(sounds)
LOOP UNTIL EOF(1) = -1
CLOSE #1
OPEN "..\..\..\include\sub.bas" FOR INPUT AS #1
DO
    subs = subs + 1
    LINE INPUT #1, subs$(subs)
LOOP UNTIL EOF(1) = -1
CLOSE #1
OPEN "..\..\..\include\tcpip.bas" FOR INPUT AS #1
DO
    tcpips = tcpips + 1
    LINE INPUT #1, tcpips$(tcpips)
LOOP UNTIL EOF(1) = -1
CLOSE #1
OPEN "..\..\..\include\type.bas" FOR INPUT AS #1
DO
    types = types + 1
    LINE INPUT #1, types$(types)
LOOP UNTIL EOF(1) = -1
CLOSE #1
FOR arraycheck = 1 TO arrays
    IF arrays$(arraycheck) = "'$include:'..\packs\" + packname$ + "\include\array.bas'" THEN arrays$(arraycheck) = ""
NEXT arraycheck
FOR constcheck = 1 TO consts
    IF consts$(constcheck) = "'$include:'..\packs\" + packname$ + "\include\const.bas'" THEN consts$(constcheck) = ""
NEXT constcheck
FOR customcmdcheck = 1 TO customcmds
    IF customcmds$(customcmdcheck) = "'$include:'..\packs\" + packname$ + "\include\customcmd.bas'" THEN customcmds$(customcmdcheck) = ""
NEXT customcmdcheck
FOR dimcheck = 1 TO dims
    IF dims$(dimcheck) = "'$include:'..\packs\" + packname$ + "\include\dim.bas'" THEN dims$(dimcheck) = ""
NEXT dimcheck
FOR funccheck = 1 TO funcs
    IF funcs$(funccheck) = "'$include:'..\packs\" + packname$ + "\include\func.bas'" THEN funcs$(funccheck) = ""
NEXT funccheck
FOR libcheck = 1 TO libs
    IF libs$(libcheck) = "'$include:'..\packs\" + packname$ + "\include\lib.bas'" THEN libs$(libcheck) = ""
NEXT libcheck
FOR soundcheck = 1 TO sounds
    IF sounds$(soundcheck) = "'$include:'..\packs\" + packname$ + "\include\sound.bas'" THEN sounds$(soundcheck) = ""
NEXT soundcheck
FOR subcheck = 1 TO subs
    IF subs$(subcheck) = "'$include:'..\packs\" + packname$ + "\include\sub.bas'" THEN subs$(subcheck) = ""
NEXT subcheck
FOR tcpipcheck = 1 TO tcpips
    IF tcpips$(tcpipcheck) = "'$include:'..\packs\" + packname$ + "\include\tcpip.bas'" THEN tcpips$(tcpipcheck) = ""
NEXT tcpipcheck
FOR typecheck = 1 TO types
    IF types$(typecheck) = "'$include:'..\packs\" + packname$ + "\include\type.bas'" THEN types$(typecheck) = ""
NEXT typecheck
OPEN "..\..\..\include\array.bas" FOR OUTPUT AS #1
FOR arrayprint = 1 TO arrays
    IF arrays$(arrayprint) <> "" THEN PRINT #1, arrays$(arrayprint)
NEXT
CLOSE #1
OPEN "..\..\..\include\const.bas" FOR OUTPUT AS #1
FOR constprint = 1 TO consts
    IF consts$(constprint) <> "" THEN PRINT #1, consts$(constprint)
NEXT
CLOSE #1
OPEN "..\..\..\include\customcmd.bas" FOR OUTPUT AS #1
FOR customcmdprint = 1 TO customcmd
    IF customcmds$(customcmdprint) <> "" THEN PRINT #1, customcmds$(customcmdprint)
NEXT
CLOSE #1
OPEN "..\..\..\include\dim.bas" FOR OUTPUT AS #1
FOR dimprint = 1 TO dims
    IF dims$(dimprint) <> "" THEN PRINT #1, dims$(dimprint)
NEXT
CLOSE #1
OPEN "..\..\..\include\func.bas" FOR OUTPUT AS #1
FOR funcprint = 1 TO funcs
    IF funcs$(funcprint) <> "" THEN PRINT #1, funcs$(funcprint)
NEXT
CLOSE #1
OPEN "..\..\..\include\lib.bas" FOR OUTPUT AS #1
FOR libprint = 1 TO libs
    IF libs$(libprint) <> "" THEN PRINT #1, libs$(libprint)
NEXT
CLOSE #1
OPEN "..\..\..\include\sound.bas" FOR OUTPUT AS #1
FOR soundprint = 1 TO sounds
    IF sounds$(soundprint) <> "" THEN PRINT #1, sounds$(soundprint)
NEXT
CLOSE #1
OPEN "..\..\..\include\sub.bas" FOR OUTPUT AS #1
FOR subprint = 1 TO subs
    IF subs$(subprint) <> "" THEN PRINT #1, subs$(subprint)
NEXT
CLOSE #1
OPEN "..\..\..\include\tcpip.bas" FOR OUTPUT AS #1
FOR tcpipprint = 1 TO tcpips
    IF tcpips$(tcpipprint) <> "" THEN PRINT #1, tcpips$(tcpipprint)
NEXT
CLOSE #1
OPEN "..\..\..\include\type.bas" FOR OUTPUT AS #1
FOR typeprint = 1 TO types
    IF types$(typeprint) <> "" THEN PRINT #1, types$(typeprint)
NEXT
CLOSE #1
PRINT ">removing libraries"
REDIM libraries$(1028)
OPEN "..\lib\libraries.txt" FOR INPUT AS #1
DO
    libraries = libraries + 1
    LINE INPUT #1, libraries$(libraries)
LOOP UNTIL EOF(1) = -1
CLOSE #1
FOR librarydel = 1 TO libraries
    SHELL _DONTWAIT _HIDE "del /f /s ..\..\..\lib\" + libraries$(librarydel)
NEXT librarydel
PRINT ">removing commands"
REDIM commands$(32768)
OPEN "..\..\..\include\commands.bas" FOR INPUT AS #1
DO
    commands = commands + 1
    LINE INPUT #1, commands$(commands)
LOOP UNTIL EOF(1) = -1
CLOSE #1
FOR commandcheck = 1 TO commands
    IF commands$(commandcheck) = "'[" + packname$ + "]" THEN
        FOR commandsrem = commandcheck TO (commandcheck + 9)
            commands$(commandsrem) = ""
        NEXT commandsrem
        commandcheck = commandsrem
    END IF
NEXT commandcheck
OPEN "..\..\..\include\commands.bas" FOR OUTPUT AS #1
FOR commandprint = 1 TO commands
    IF commands$(commandprint) <> "" THEN PRINT #1, commands$(commandprint)
NEXT commandprint
CLOSE #1
PRINT ">removing pack"
REDIM alarms$(32)
REDIM closetime(16384)
REDIM commands$(2048)
REDIM emotionsneg$(64)
REDIM emotionspos$(64)
REDIM inidata$(64)
REDIM jarvisini$(65536)
REDIM loadcommand$(1024)
REDIM loadcustom$(256)
REDIM packs$(32768)
OPEN jarvisloc$ + "\data\jarvis.ini" FOR INPUT AS #1
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
                    emotionsposcount = emotionsposcount + 1
                    emotionspos$(emotionsposcount) = jarvisini$(jarvisini)
                CASE 5
                    emotionsnegcount = emotionsnegcount + 1
                    emotionsneg$(emotionsnegcount) = jarvisini$(jarvisini)
                CASE 6
                    alarms = alarms + 1
                    alarms$(alarms) = jarvisini$(jarvisini)
                CASE 7
                    closetimes = closetimes + 1
                    closetime(closetimes) = VAL(jarvisini$(jarvisini))
                CASE 8
                    packs = packs + 1
                    packs$(packs) = jarvisini$(jarvisini)
            END SELECT
        ELSE
            iniblock = iniblock + 1
        END IF
    END IF
LOOP UNTIL EOF(1) = -1
CLOSE #1
OPEN jarvisloc$ + "\data\jarvis.ini" FOR OUTPUT AS #1
iniprint = 0
PRINT #1, "[Settings]"
DO
    iniprint = iniprint + 1
    PRINT #1, inidata$(iniprint)
LOOP UNTIL iniprint = inidata
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
packsprint = 0
PRINT #1, "[Packs]"
DO
    packsprint = packsprint +1
    IF packs$(packsprint) <> "'[" + packname$ + "]" THEN PRINT #1, packs$(packsprint)
LOOP UNTIL packsprint = packs
PRINT #1, ""
CLOSE #1
PRINT ">removing files from jarvisloc"
SHELL _HIDE _DONTWAIT "start ..\..\..\batch\delpack.bat"
SYSTEM