hwnd = FindWindow(0, "JARVIS" + CHR$(0))
hot& = SendMessageA&(hwnd, WM_SETHOTKEY, HK_ALT + ASC("J"), 0)
IF hot& <> 1 THEN
    error$ = "Could not set hotkey."
    GOSUB logger
ELSE
    top& = DefWindowProcA&(hwnd, WM_SHOWWINDOW, 0, 0)
END IF
starttime = TIMER
_SNDPLAY tone3
_DELAY .3
cumclosetime = 0
FOR avgclosetime = 1 TO closetimes
    cumclosetime = cumclosetime + closetime(avgclosetime)
NEXT avgclosetime
avgclosetime = INT((cumclosetime / (closetimes - 1)))
timekey$ = DATE$ + " -- " + LEFT$(TIME$, 5)
PRINT #2, timekey$
bootmonth = VAL(LEFT$(bootdate$, 2))
bootday = VAL(MID$(bootdate$, 4, 2))
bootyear = VAL(RIGHT$(bootdate$, 4))
boothour = VAL(LEFT$(boottime$, 2))
bootminute = VAL(MID$(boottime$, 4, 2))
bootsecond = VAL(RIGHT$(boottime$, 2))
inputcount = 1
mouseswap = GetSystemMetrics(23)
status$ = "ACTIVE"
IF firsttime = 1 THEN
    speechoutput$ = "welcome " + username$ + ", I am Jarvis (Just Another Rather Very Intelligent System), a Digital Life Assistant for Windows XP Professional. Check out the documentation to learn how to use me, type or say 'help' or 'documentation'!"
ELSE
    speechoutput$ = "welcome back " + username$
END IF
speechprint$ = speechoutput$
GOSUB textprint
GOSUB speechoutput
active = 1
usercommands = 1
startactive = TIMER
activetimer = INT(TIMER)