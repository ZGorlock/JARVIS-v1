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
