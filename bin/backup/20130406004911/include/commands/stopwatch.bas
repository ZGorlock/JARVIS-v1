IF usercommand$(runcommands) = "stopwatch" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "start" THEN
                startsw! = TIMER
                sw = 1
                speechoutput$ = "starting stopwatch"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "stop" AND sw = 1 THEN
                stopsw! = TIMER
                sw = 0
                swtime! = (stopsw! - startsw!)
                swsave! = swtime!
                speechoutput$ = "stopwatch ran for" + STR$(swtime!) + " seconds"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "recall" THEN
                speechoutput$ = "last stopwatch ran for" + STR$(swsave!) + " seconds"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                usercommands = -1
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
