IF usercommand$(runcommands) = "birthday" THEN
    IF INSTR(useroutputuse$, " your") THEN
        speechoutput = "my birthday is 11-27-2011"
    ELSE
        speechoutput$ = "your birthday is " + birthday$
    END IF
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF