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
PRINT ">making directory"
SHELL _HIDE "mkdir " + CHR$(34) + jarvisloc$ + "\packs\" + packname$ + CHR$(34)
PRINT ">adding include files"
OPEN jarvisloc$ + "\include\array.bas" FOR APPEND AS #1
PRINT #1, "'$include:'..\packs\" + packname$ + "\include\array.bas'"
CLOSE #1
OPEN jarvisloc$ + "\include\const.bas" FOR APPEND AS #1
PRINT #1, "'$include:'..\packs\" + packname$ + "\include\const.bas'"
CLOSE #1
OPEN jarvisloc$ + "\include\customcmd.bas" FOR APPEND AS #1
PRINT #1, "'$include:'..\packs\" + packname$ + "\include\customcmd.bas'"
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
PRINT ">adding commands"
OPEN jarvisloc$ + "\include\commands.bas" FOR APPEND AS #1
PRINT #1, "OPEN " + CHR$(34) + "..\packs\" + packname$ + "\data\commands.txt" + CHR$(34) + " FOR INPUT AS #1" + CHR$(13) + "DO" + CHR$(13) + "    packcommands = packcommands + 1" + CHR$(13) + "    commandcount = commandcount + 1" + CHR$(13) + "    LINE INPUT #1, inputcommand$" + CHR$(13) + "    packcommands$(packcommands) = inputcommand$" + CHR$(13) + "    commands$(commandcount) = inputcommand$" + CHR$(13) + "LOOP UNTIL EOF(1) = -1" + CHR$(13) + "CLOSE #1"
CLOSE #1
PRINT ">moving files to jarvisloc"
SHELL _HIDE "xcopy /s /y " + CHR$(34) + "bin\commands" + CHR$(34) + " " + CHR$(34) + jarvisloc$ + "\pack\maplestory\commands\" + CHR$(34)
SHELL _HIDE "xcopy /s /y " + CHR$(34) + "bin\data" + CHR$(34) + " " + CHR$(34) + jarvisloc$ + "\pack\maplestory\data\" + CHR$(34)
SHELL _HIDE "xcopy /s /y " + CHR$(34) + "bin\include" + CHR$(34) + " " + CHR$(34) + jarvisloc$ + "\pack\maplestory\include\" + CHR$(34)
SHELL _HIDE "xcopy /s /y " + CHR$(34) + "bin\lib" + CHR$(34) + " " + CHR$(34) + jarvisloc$ + "\pack\maplestory\lib\" + CHR$(34)
SHELL _HIDE "xcopy /s /y " + CHR$(34) + "bin\resources" + CHR$(34) + " " + CHR$(34) + jarvisloc$ + "\pack\maplestory\resources\" + CHR$(34)
SHELL _HIDE "xcopy /s /y " + CHR$(34) + "bin\source" + CHR$(34) + " " + CHR$(34) + jarvisloc$ + "\pack\maplestory\source\" + CHR$(34)
SHELL _HIDE "xcopy /s /y " + CHR$(34) + "bin\tools" + CHR$(34) + " " + CHR$(34) + jarvisloc$ + "\pack\maplestory\tools\" + CHR$(34)
PRINT ">initiating recompile"
SHELL _HIDE _DONTWAIT "start " + CHR$(34) + jarvisloc$ + "\batch\uninstall.bat" + CHR$(34)
PRINT ">deleting source files"
SHELL _HIDE _DONTWAIT "start cleanup.bat"
SYSTEM