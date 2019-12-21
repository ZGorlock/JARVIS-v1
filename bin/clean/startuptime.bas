_SCREENHIDE
OPEN "C:\WINDOWS\jarvisloc.jdf" FOR INPUT AS #1
INPUT #1, jarvisloc$
CLOSE #1
jarvisloc$ = jarvisloc$ + "\data\jarvis.ini"
OPEN jarvisloc$ FOR INPUT AS #1
REDIM jarvisinput$(1048576)
jarvisinputs = 0
DO
    jarvisinputs = jarvisinputs + 1
    LINE INPUT #1, jarvisinput$(jarvisinputs)
LOOP UNTIL EOF(1) = -1
CLOSE #1
jarvisinput$(3) = DATE$
jarvisinput$(4) = TIME$
jarvisinput$(5) = LTRIM$(STR$(TIMER))
OPEN jarvisloc$ FOR OUTPUT AS #1
FOR jarvisprint = 1 TO jarvisinputs
    PRINT #1, jarvisinput$(jarvisprint)
NEXT jarvisprint
CLOSE #1
SYSTEM