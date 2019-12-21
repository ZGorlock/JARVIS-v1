IF usercommand$(runcommands) = "defragment" THEN
    speechoutput$ = "launching defragment tool"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start %SystemRoot%\system32\dfrg.msc"
    usercommands = -1
END IF
