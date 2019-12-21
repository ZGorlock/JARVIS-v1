OPEN "data\jarvis.ini" FOR INPUT AS #1
iniblock = 1
DO
    jarvisini = jarvisini + 1
    LINE INPUT #1, jarvisini$(jarvisini)
    IF LEFT$(jarvisini$(jarvisini), 1) <> "[" THEN
        IF jarvisini$(jarvisini) <> "" THEN
            SELECT CASE iniblock
                CASE 1
                    inidata = inidata + 1
                    inidata$(inidata) = jarvisini$(jarvisini)
                CASE 2
                    commandcount = commandcount + 1
                    loadcommands = loadcommands + 1
                    loadcommand$(loadcommands) = jarvisini$(jarvisini)
                    commands$(commandcount) = jarvisini$(jarvisini)
                CASE 3
                    commandcount = commandcount + 1
                    loadcustom = loadcustom + 1
                    loadcustom$(loadcustom) = jarvisini$(jarvisini)
                    commands$(commandcount) = jarvisini$(jarvisini)
                CASE 4
                    IF firsttime <> 1 THEN
                        programlnkload = programlnkload + 1
                        proglnk$(programlnkload) = jarvisini$(jarvisini)
                    END IF
                CASE 5
                    IF firsttime <> 1 THEN
                        programnameload = programnameload + 1
                        progname$(programnameload) = jarvisini$(jarvisini)
                    END IF
                CASE 6
                    emotionsposcount = emotionsposcount + 1
                    emotionspos$(emotionsposcount) = jarvisini$(jarvisini)
                CASE 7
                    emotionsnegcount = emotionsnegcount + 1
                    emotionsneg$(emotionsnegcount) = jarvisini$(jarvisini)
                CASE 8
                    alarms = alarms + 1
                    alarms$(alarms) = jarvisini$(jarvisini)
                CASE 9
                    closetimes = closetimes + 1
                    closetime(closetimes) = VAL(jarvisini$(jarvisini))
                CASE 10
                    packs = packs + 1
                    packs$(packs) = jarvisini$(jarvisini)
            END SELECT
        ELSE
            iniblock = iniblock + 1
        END IF
    END IF
LOOP UNTIL EOF(1) = -1
CLOSE #1
packcommands = 1
'$include:'..\include\commands.bas'
IF jarvisloc$ = "" THEN jarvisloc$ = inidata$(1)
IF bootdate$ = "" THEN bootdate$ = inidata$(2)
IF boottime$ = "" THEN boottime$ = inidata$(3)
IF boottimer = 0 THEN boottimer = VAL(inidata$(4))
id$ = inidata$(5)
username$ = inidata$(6)
recognition = VAL(inidata$(7))
textcolor = VAL(inidata$(8))
standbytoggle = VAL(inidata$(9))
standbytime## = VAL(inidata$(10))
timepref = VAL(inidata$(11))
anglepref = VAL(inidata$(12))
afirmpref = VAL(inidata$(13))
alertpref = VAL(inidata$(14))
volincr = VAL(inidata$(15))
ssloc$ = inidata$(16)
ssfile$ = inidata$(17)
speed& = VAL(inidata$(18))
buffer& = VAL(inidata$(19))
IF screenx = 0 THEN screenx = VAL(inidata$(20))
IF screeny = 0 THEN screeny = VAL(inidata$(21))
IF workareax = 0 THEN workareax = VAL(inidata$(22))
IF workareay = 0 THEN workareay = VAL(inidata$(23))
screenpos = VAL(inidata$(24))
transparency = VAL(inidata$(25))
mdpath$ = inidata$(26)
downloadpath$ = inidata$(27)
updatecheck = VAL(inidata$(28))
skipversion# = VAL(inidata$(29))
programdir$ = inidata$(30)
musicdir$ = inidata$(31)
sndvol# = VAL(inidata$(32))
songs = VAL(inidata$(33))
IF songs = 0 THEN songs = musicnameload
programs = VAL(inidata$(34))
IF programs = 0 THEN programs = programnameload
emailaddress$ = inidata$(35)
zipcode = VAL(inidata$(36))
prognum = VAL(inidata$(37))
songnum = VAL(inidata$(38))
lang$ = inidata$(39)
saveyear = VAL(inidata$(40))
eventnum = VAL(inidata$(41))
SHELL _HIDE "chdir " + CHR$(34) + jarvisloc$ + CHR$(34)
OPEN "data\log.jdf" FOR APPEND AS #2