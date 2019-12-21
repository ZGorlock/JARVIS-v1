IF usercommand$(runcommands) = "magnifier" OR usercommand$(runcommands) = "magnify" THEN
    speechoutput$ = "launching magnifier"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start %SystemRoot%\system32\magnify.exe"
    usercommands = -1
END IF
