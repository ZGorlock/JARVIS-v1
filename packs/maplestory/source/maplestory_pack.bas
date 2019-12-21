IF mapleload = 0 THEN
    IF _FILEEXISTS("packs\maplestoy\data\settings.txt") = -1 THEN
        OPEN "packs\maplestory\data\settings.txt" FOR OUTPUT AS #1
        PRINT #1, ""
        CLOSE #1
    END IF
    msdata = 0
    REDIM msdata$(2056)
    OPEN "packs\maplestory\data\settings.txt" FOR INPUT AS #1
    DO
        msdata = msdata + 1
        LINE INPUT #1, msdata$(msdata)
    LOOP UNTIL EOF(1) = -1
    CLOSE #1
    msusername$ = msdata$(1)
    mspassword$ = msdata$(2)
    mspic$ = msdata$(3)
    mapleload = 1
END IF
IF usercommand$(runcommands) = "maplestory" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "on" THEN
                IF mson = 0 THEN
                    speechoutput$ = "turning checking for maplestory commands on"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    mson = 1
                    usercommands = -1
                END IF
                EXIT DO
            END IF
            IF usercommand$(runcommands2) = "off" THEN
                IF mson = 1 THEN
                    speechoutput$ = "turning checking for maplestory commands off"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    mson = 0
                    usercommands = -1
                END IF
                EXIT DO
            END IF
        NEXT runcommands2
        SELECT CASE mson
            CASE 0
                speechoutput$ = "turning checking for maplestory commands on"
                mson = 1
            CASE 1
                speechoutput$ = "turning checking for maplestory commands off"
                mson = 0
        END SELECT
        speechprint$ = speechoutput$
        GOSUB textprint
        GOSUB speechoutput
        usercommands = -1
        EXIT DO
    LOOP
END IF
IF usercommand$(runcommands) = "maple" OR usercommand$(runcommands) = "maples" THEN
    DO
        FOR runcommands2 = 1 TO usercommands
            IF usercommand$(runcommands2) = "story" OR usercommand$(runcommands2) = "stories" THEN
                DO
                    FOR runcommands3 = 1 TO usercommands
                        IF usercommand$(runcommands3) = "on" THEN
                            IF mson = 0 THEN
                                speechoutput$ = "turning checking for maplestory commands on"
                                speechprint$ = speechoutput$
                                GOSUB textprint
                                GOSUB speechoutput
                                mson = 1
                                usercommands = -1
                            END IF
                            EXIT DO
                        END IF
                        IF usercommand$(runcommands3) = "off" THEN
                            IF mson = 1 THEN
                                speechoutput$ = "turning checking for maplestory commands off"
                                speechprint$ = speechoutput$
                                GOSUB textprint
                                GOSUB speechoutput
                                mson = 0
                                usercommands = -1
                            END IF
                            EXIT DO
                        END IF
                    NEXT runcommands3
                    SELECT CASE mson
                        CASE 0
                            speechoutput$ = "turning checking for maplestory commands on"
                            mson = 1
                        CASE 1
                            speechoutput$ = "turning checking for maplestory commands off"
                            mson = 0
                    END SELECT
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    usercommands = -1
                    EXIT DO
                LOOP
                EXIT DO
            END IF
        NEXT runcommands2
        EXIT DO
    LOOP
END IF
IF mson = 1 THEN
    '$include:'..\packs\maplestory\commands\password.bas'
    '$include:'..\packs\maplestory\commands\username.bas'
END IF