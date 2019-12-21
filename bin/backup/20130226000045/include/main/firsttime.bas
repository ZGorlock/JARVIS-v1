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