update:
_SCREENSHOW
COLOR textcolor, 0
DO
    _LIMIT 64
    CLS
    PRINT "It looks like there is an update for your JARVIS"
    PRINT "Current Version:"; version#
    PRINT "Available Version:"; fileversion#
    PRINT
    PRINT "What would you like to do?"
    PRINT "   0-Update now"
    PRINT "   1-Update later"
    k$ = INKEY$
    IF k$ = CHR$(48) THEN
        CLS
        PRINT "JARVIS will now download and automatically install an update"
        PRINT "Please do not close JARVIS or turn off your computer during this time"
        _DISPLAY
        _DELAY 4
        GOSUB download
        EXIT DO
    END IF
    IF k$ = CHR$(49) THEN
        DO
            _LIMIT 128
            k$ = INKEY$
        LOOP UNTIL k$ = ""
        DO
            _LIMIT 64
            CLS
            PRINT "Would you like any of the following options?"
            PRINT "0-Turn Checking for updates off"
            PRINT "1-Skip this version"
            PRINT "2-I changed my mind, let me update"
            PRINT "3-Just let me use JARVIS"
            k$ = INKEY$
            IF k$ = CHR$(48) THEN
                updatecheck = 0
                CLS
                PRINT "Update checking has been turned off"
                PRINT "To turn this back on say 'turn update checking on'"
                PRINT "JARVIS will run as usual after 4 seconds"
                _DISPLAY
                _DELAY 4
                exitupdate = 1
                EXIT DO
            END IF
            IF k$ = CHR$(49) THEN
                skipversion# = fileversion#
                CLS
                PRINT "This version will no longer attemp to download"
                PRINT "To download this version say 'check for update'"
                PRINT "To turn checking for this version on say 'turn version update restrictions off'"
                PRINT "Or you can just wait until a newer version is available"
                PRINT "JARVIS will run as usual after 4 seconds"
                _DISPLAY
                _DELAY 4
                exitupdate = 1
                EXIT DO
            END IF
            IF k$ = CHR$(50) THEN
                CLS
                PRINT "JARVIS will now download and automatically install an update"
                PRINT "Please do not close JARVIS or turn off your computer during this time"
                _DISPLAY
                _DELAY 4
                GOSUB download
                EXIT DO
            END IF
            IF k$ = CHR$(51) THEN
                exitupdate = 1
                EXIT DO
            END IF
            _DISPLAY
        LOOP
        IF exitupdate = 1 THEN EXIT DO
    END IF
    _DISPLAY
LOOP
CLS
_DISPLAY
IF updatecall = 0 THEN _SCREENHIDE
exitupdate = 0
RETURN