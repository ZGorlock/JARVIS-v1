IF usercommand$(runcommands) = "visualize" OR usercommand$(runcommands) = "visualizer" THEN
    speechoutput$ = "launching visualizer"
    SHELL _DONTWAIT _HIDE "start tools\visualizer.exe"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF