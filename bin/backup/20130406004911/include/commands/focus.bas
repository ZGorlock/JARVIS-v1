IF usercommand$(runcommands) = "focus" THEN
    speechoutput$ = "switching to focus"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    focus& = ShowWindow&(hwnd, 1)
    usercommands = -1
END IF
