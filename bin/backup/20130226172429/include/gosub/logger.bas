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