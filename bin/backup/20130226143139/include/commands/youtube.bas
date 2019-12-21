IF usercommand$(runcommands) = "youtube" THEN
    speechoutput$ = "opening youtube"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\youtube.URL"
    usercommands = -1
END IF