IF usercommand$(runcommands) = "notepad" THEN
    speechoutput$ = "opening a notepad"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start notepad.exe"
    usercommands = -1
END IF
