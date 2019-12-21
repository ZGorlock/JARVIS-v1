resolution& = _SCREENIMAGE
screenx = _WIDTH(resolution&)
screeny = _HEIGHT(resolution&)
IF SystemParametersInfoW&(SPI_GETWORKAREA, 0, _OFFSET(Rec), 0) = 0 THEN
    error$ = "Cannot retrieve Work Area Parameters."
    GOSUB logger
END IF
workareax = Rec.right
workareay = Rec.bottom
dtwin%& = GetDesktopWindow
oidesk%& = OpenInputDesktop(0, 0, GENERIC_ALL)
IF oidesk%& <> dtwin%& AND oidesk%& > 0 THEN stdesk%& = SetThreadDesktop(oidesk%&)
SELECT CASE screenpos
    CASE 1
        _SCREENMOVE _MIDDLE
    CASE 2
        _SCREENMOVE ((workareax / 2) - 258), 0
    CASE 3
        _SCREENMOVE ((workareax / 2) - 258), (workareay - 240)
    CASE 4
        _SCREENMOVE 0, ((workareay / 2) - 120)
    CASE 5
        _SCREENMOVE (workareax - 517), ((workareay / 2) - 120)
    CASE 6
        _SCREENMOVE 0, 0
    CASE 7
        _SCREENMOVE (workareax - 517), 0
    CASE 8
        _SCREENMOVE 0, (workareay - 240)
    CASE 9
        _SCREENMOVE (workareax - 517), (workareay - 240)
END SELECT
SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\resources\nircmd.exe" + CHR$(34) + " win trans ititle " + CHR$(34) + "jarvis" + CHR$(34) + " " + LTRIM$(STR$(transparency))
_SCREENSHOW
screenstate = 1