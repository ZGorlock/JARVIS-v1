IF usercommand$(runcommands) = "baidu" THEN
    speechoutput$ = "opening baidu"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\baidu.URL"
    usercommands = -1
END IF
