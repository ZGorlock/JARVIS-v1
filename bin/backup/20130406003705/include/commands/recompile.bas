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
