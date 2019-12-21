updateini:
OPEN iniloc$ FOR OUTPUT AS #1
PRINT #1, "[Settings]"
PRINT #1, jarvisloc$
PRINT #1, bootdate$
PRINT #1, boottime$
PRINT #1, LTRIM$(STR$(boottimer))
PRINT #1, id$
PRINT #1, username$
PRINT #1, LTRIM$(STR$(recognition))
PRINT #1, LTRIM$(STR$(textcolor))
PRINT #1, LTRIM$(STR$(standbytoggle))
PRINT #1, LTRIM$(STR$(standbytime##))
PRINT #1, LTRIM$(STR$(timepref))
PRINT #1, LTRIM$(STR$(anglepref))
PRINT #1, LTRIM$(STR$(afirmpref))
PRINT #1, LTRIM$(STR$(alertpref))
PRINT #1, LTRIM$(STR$(volincr))
PRINT #1, ssloc$
PRINT #1, ssfile$
PRINT #1, LTRIM$(STR$(speed&))
PRINT #1, LTRIM$(STR$(buffer&))
PRINT #1, LTRIM$(STR$(screenx))
PRINT #1, LTRIM$(STR$(screeny))
PRINT #1, LTRIM$(STR$(workareax))
PRINT #1, LTRIM$(STR$(workareay))
PRINT #1, LTRIM$(STR$(screenpos))
PRINT #1, LTRIM$(STR$(transparency))
PRINT #1, mdpath$
PRINT #1, downloadpath$
PRINT #1, LTRIM$(STR$(updatecheck))
PRINT #1, LTRIM$(STR$(skipversion#))
PRINT #1, programdir$
PRINT #1, musicdir$
PRINT #1, LTRIM$(STR$(sndvol#))
PRINT #1, LTRIM$(STR$(songs))
PRINT #1, LTRIM$(STR$(programs))
PRINT #1, emailaddress$
PRINT #1, LTRIM$(STR$(zipcode))
PRINT #1, LTRIM$(STR$(prognum))
PRINT #1, LTRIM$(STR$(songnum))
PRINT #1, lang$
PRINT #1, LTRIM$(STR$(saveyear))
PRINT #1, LTRIM$(STR$(eventnum))
PRINT #1, birthday$
PRINT #1, ""
commandprint = 0
PRINT #1, "[Command Words]"
DO
    commandprint = commandprint + 1
    PRINT #1, loadcommand$(commandprint)
LOOP UNTIL commandprint = loadcommands
PRINT #1, ""
customprint = 0
PRINT #1, "[Custom Command Words]"
DO
    customprint = customprint + 1
    PRINT #1, loadcustom$(customprint)
LOOP UNTIL customprint = loadcustom
PRINT #1, ""
programlnkprint = 0
PRINT #1, "[Program Links]
DO
    programlnkprint = programlnkprint + 1
    IF proglnk$(programlnkprint) <> "" THEN PRINT #1, proglnk$(programlnkprint)
LOOP UNTIL programlnkprint = programlnkload
PRINT #1, ""
programnameprint = 0
PRINT #1, "[Program Names]
DO
    programnameprint = programnameprint + 1
    IF progname$(programnameprint) <> "" THEN PRINT #1, progname$(programnameprint)
LOOP UNTIL programnameprint = programnameload
PRINT #1, ""
emotionsposprint = 0
PRINT #1, "[Positive Emotions]"
DO
    emotionsposprint = emotionsposprint + 1
    PRINT #1, emotionspos$(emotionsposprint)
LOOP UNTIL emotionsposprint = emotionsposcount
PRINT #1, ""
emotionsnegprint = 0
PRINT #1, "[Negative Emotions]"
DO
    emotionsnegprint = emotionsnegprint + 1
    PRINT #1, emotionsneg$(emotionsnegprint)
LOOP UNTIL emotionsnegprint = emotionsnegcount
PRINT #1, ""
alarmprint = 0
PRINT #1, "[Alarms]"
DO
    alarmprint = alarmprint + 1
    PRINT #1, alarms$(alarmprint)
LOOP UNTIL alarmprint = alarms
PRINT #1, ""
closetimesprint = 0
PRINT #1, "[Close Times]"
DO
    closetimesprint = closetimesprint + 1
    PRINT #1, LTRIM$(STR$(closetime(closetimesprint)))
LOOP UNTIL closetimesprint = closetimes
IF endprog = 1 THEN PRINT #1, LTRIM$(STR$(TIMER))
PRINT #1, ""
packprint = 0
PRINT #1, "[Packs]"
DO
    packprint = packprint + 1
    PRINT #1, packs$(packprint)
LOOP UNTIL packprint = packs
PRINT #1, ""
CLOSE #1
RETURN