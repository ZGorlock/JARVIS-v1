IF usercommand$(runcommands) = "year" THEN
    year$ = RIGHT$(DATE$, 4)
    year = VAL(year$)
    speechoutput$ = "it is the year " + year$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF
