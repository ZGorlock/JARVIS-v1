clearevent:
SELECT CASE Event.elParamType
    ON ERROR GOTO 0
    CASE 1, 2
        IF 0 < dABSOLUTEp(peekp(peekp(Event.lParam) + 8), Event.lParam) THEN
            error$ = "Event.lParam reference count is > 0."
            Event.elParamType = 0
            Event.lParam = 0
            GOSUB logger
            GOSUB xcleanup
        END IF
    CASE 3, 4
        CoTaskMemFree Event.lParam
END SELECT
Event.elParamType = 0
Event.lParam = 0
ON ERROR GOTO xcleanup
RETURN