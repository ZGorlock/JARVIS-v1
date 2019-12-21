IF usercommand$(runcommands) = "spell" THEN
    word$ = MID$(useroutputuse$, (INSTR(useroutputuse$, "spell") + 6), (INSTR((INSTR(useroutputuse$, "spell") + 6), useroutputuse$, " ")))
    IF word$ = "" THEN word$ = MID$(useroutputuse$, (INSTR(useroutputuse$, "spell") + 6))
    speechoutput$ = word$ + " - "
    speechprint$ = speechoutput$
    FOR spellword = 1 TO LEN(word$)
        speechoutput$ = speechoutput$ + MID$(word$, spellword, 1) + ", "
        speechprint$ = speechprint$ + MID$(word$, spellword, 1) + "-"
    NEXT spellword
    speechoutput$ = LEFT$(speechoutput$, (LEN(speechoutput$) - 1))
    speechprint$ = LEFT$(speechprint$, (LEN(speechprint$) - 1))
    speechcopy$ = speechprint$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF