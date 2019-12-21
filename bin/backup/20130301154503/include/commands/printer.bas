IF usercommand$(runcommands) = "printer" OR usercommand$(runcommands) = "printer" THEN
    speechoutput$ = "enumerating printers"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start shell:PrintersFolder"
    usercommands = -1
END IF
