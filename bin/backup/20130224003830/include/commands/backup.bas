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
