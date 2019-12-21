IF usercommand$(runcommands) = "relaunch" THEN
    speechoutput$ = "relaunching"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "batch\relaunch.bat"
    usercommands = -1
    _DELAY .5
    GOSUB xcleanup
END IF