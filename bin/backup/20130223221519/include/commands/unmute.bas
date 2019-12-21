IF usercommand$(runcommands) = "unmute" THEN
    SHELL _HIDE _DONTWAIT CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " mutesysvolume 0"
    _DELAY .5
    speechoutput$ = "volume unmuted"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF
