IF usercommand$(runcommands) = "google" AND RIGHT$(useroutputuse$, 6) = "google" THEN
    speechoutput$ = "opening google"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\google.URL"
    usercommands = -1
END IF
