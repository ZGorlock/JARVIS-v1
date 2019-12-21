IF usercommand$(runcommands) = "ebay" THEN
    speechoutput$ = "opening ebay"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start resources\urls\ebay.URL"
    usercommands = -1
END IF
