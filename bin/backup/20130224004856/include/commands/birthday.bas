IF usercommand$(runcommands) = "birthday" THEN
    speechoutput$ = "your birthday is " + birthday$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF