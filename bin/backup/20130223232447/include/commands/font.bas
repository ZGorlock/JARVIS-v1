IF usercommand$(runcommands) = "font" OR usercommand$(runcommands) = "fonts" THEN
    speechoutput$ = "opening fonts folder"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start shell:Fonts"
    usercommands = -1
END IF
