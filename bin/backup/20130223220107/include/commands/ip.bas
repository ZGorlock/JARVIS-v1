IF usercommand$(runcommands) = "ip" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "copy" THEN
                SHELL _HIDE "resources\wget http://checkip.dyndns.com/ -O temp\globalIP.htm"
                OPEN "temp\globalIP.htm" FOR INPUT AS 1
                LINE INPUT #1, ip$
                CLOSE #1
                KILL "temp\globalIP.htm"
                ip$ = MID$(ip$, INSTR(ip$, ":") + 2)
                ip$ = LEFT$(ip$, INSTR(ip$, "<") - 1)
                speechoutput$ = "copying ip adress to clipboard"
                speechprint$ = speechoutput$
                speechcopy$ = ip$
                GOSUB textprint
                GOSUB speechoutput
                _CLIPBOARD$ = ip$
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        SHELL _HIDE "resources\wget http://checkip.dyndns.com/ -O temp\globalIP.htm"
        OPEN "temp\globalIP.htm" FOR INPUT AS 1
        LINE INPUT #1, ip$
        CLOSE #1
        KILL "temp\globalIP.htm"
        ip$ = MID$(ip$, INSTR(ip$, ":") + 2)
        ip$ = LEFT$(ip$, INSTR(ip$, "<") - 1)
        speechoutput$ = "your current ip adress is " + ip$
        speechprint$ = speechoutput$
        speechcopy$ = ip$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF
