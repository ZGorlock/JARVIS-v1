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
