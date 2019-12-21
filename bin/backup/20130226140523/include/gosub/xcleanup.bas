xcleanup:
_SNDPLAY tone3
_DELAY .3
IF 0 <= COMinit& THEN CoUninitialize
IF pszCoMemText%& THEN CoTaskMemFree pszCoMemText%&
IF Event.elParamType THEN GOSUB clearevent
IF 0 <= Voiceinit& THEN error$ = "New reference count: 0x" + hexd(dABSOLUTEp(peekp(peekp(pVoice%&) + 8), pVoice%&))
GOSUB logger
IF 0 <= Graminit& THEN error$ = "New reference count: 0x" + hexd(dABSOLUTEp(peekp(peekp(pGrammar%&) + 8), pGrammar%&))
GOSUB logger
'IF 0 <= Recinit& THEN error$ = "New reference count: 0x" + hexd(dABSOLUTEp(peekp(peekp(pReco%&) + 8), pReco%&))
IF 0 <= Recinit& THEN error$ = "New reference count: 0x00000000"
GOSUB logger
_SCREENHIDE
closetime = TIMER
timespent = closetime - starttime
iniloc$ = "data\jarvis.ini"
endprog = 1
GOSUB updateini
PRINT #2, timekey$
PRINT #2, "Time Spent:"; timespent
PRINT #2, "Commands  :"; userlogs
PRINT #2, "Responses :"; jarvislogs
PRINT #2, "Errors    :"; errorcount
PRINT #2, LTRIM$(STR$(ERR)); ":"; LTRIM$(STR$(_ERRORLINE))
PRINT #2, "--------------------------------------------------------------------------------------------------------------------------------"
CLOSE #2
CLOSE #3
KILL "temp\si.tmp"
_SNDCLOSE tone1
_SNDCLOSE tone2
_SNDCLOSE tone3
_SNDCLOSE music
_SNDCLOSE defaultalarm
IF alarm <> 0 THEN _SNDCLOSE alarm
request$ = "terminate"
IF jbct < 30 THEN PRINT #jarvisboard, request$
_DELAY 1
IF jbct < 30 THEN CLOSE #jarvisboard
CLOSE #jarvishost
IF firsttime = 1 THEN SHELL _DONTWAIT _HIDE "start batch\dellib.bat"
CLEAR
SYSTEM
RETURN