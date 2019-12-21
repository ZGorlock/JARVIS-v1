SUB gettag (file$, tag, tag$(), album$, art&, artist$, genre$, title$, year$, comment$)
tag = 0
TYPE Ext_Header
    size AS LONG
    flags AS _UNSIGNED _BYTE
    extflag AS _UNSIGNED _BYTE
END TYPE
TYPE Frame_Head
    id AS STRING * 4
    size AS _UNSIGNED LONG
    flags AS _UNSIGNED INTEGER
END TYPE
TYPE ID3_Header
    id AS STRING * 3
    ver AS _UNSIGNED _BYTE
    rev AS _UNSIGNED _BYTE
    flags AS _UNSIGNED _BYTE
    size AS LONG
END TYPE
TYPE MetaData
    tag AS STRING * 3
    title AS STRING * 30
    artist AS STRING * 30
    album AS STRING * 30
    year AS STRING * 4
    comment AS STRING * 30
    genre AS STRING * 1
END TYPE
DIM ext AS Ext_Header
DIM frm AS Frame_Head
DIM head AS ID3_Header
DIM idtag AS MetaData
IF _FILEEXISTS(file$) = 0 THEN
    CLOSE #1
    EXIT SUB
END IF
OPEN file$ FOR BINARY AS #1
GET #1, , head
IF head.id = "ID3" THEN
    head.size = switch_Byte~&(head.size)
    headsiz = DeSync~&(head.size)
    IF (head.flags AND &B1000000) = &B1000000 THEN
        GET #1, , ext
        SEEK #1, DeSync~&(ext.size) + 10
    END IF
    REDIM tag$(128, 4)
    DO
        GET #1, , frm
        IF frm.id > "    " THEN
            frameno = frameno + 1
            tag$(frameno, 1) = frm.id
            tag$(frameno, 2) = TagBin$(frm.flags, 2)
            tag$(frameno, 3) = STR$(switch_Byte~&(frm.size))
            tag$(frameno, 4) = SPACE$(switch_Byte~&(frm.size))
            GET #1, , tag$(frameno, 4)
            c = c + 10 + VAL(tag$(frameno, 3))
        ELSE
            EXIT DO
        END IF
    LOOP UNTIL c >= headsiz
    SEEK #1, headsiz + 1
    CLOSE #1
    album$ = ""
    art$ = ""
    artist$ = ""
    genre$ = ""
    title$ = ""
    year$ = ""
    IF art& < -1 THEN _FREEIMAGE art&
    IF art& <> 1 THEN art& = 0
    FOR tagfix = 1 TO frameno
        IF LEFT$(tag$(tagfix, 4), 1) = CHR$(1) THEN tag$(tagfix, 4) = MID$(tag$(tagfix, 4), 4)
        DO
            FOR spacecheck = 2 TO LEN(tag$(tagfix, 4)) STEP 2
                IF MID$(tag$(tagfix, 4), spacecheck, 1) <> CHR$(0) THEN EXIT DO
            NEXT spacecheck
            temptag$ = ""
            FOR spaceremove = 1 TO LEN(tag$(tagfix, 4)) STEP 2
                temptag$ = temptag$ + MID$(tag$(tagfix, 4), spaceremove, 1)
            NEXT spaceremove
            tag$(tagfix, 4) = temptag$
            EXIT DO
        LOOP
        IF tag$(tagfix, 1) <> "PIC" AND tag$(tagfix, 1) <> "APIC" THEN
            tag$(tagfix, 4) = remspace$(tag$(tagfix, 4))
        END IF
    NEXT tagfix
    FOR sorttag = 1 TO frameno
        SELECT CASE tag$(sorttag, 1)
            CASE "TAL", "TALB"
                album$ = tag$(sorttag, 4)
            CASE "PIC", "APIC"
                IF art& <> 1 THEN
                    DO
                        imagetype$ = MID$(tag$(sorttag, 4), 2, (INSTR(2, tag$(sorttag, 4), CHR$(32)) - 2))
                        imagetype$ = MID$(imagetype$, (INSTR(imagetype$, "/") + 1), 4)
                        IF LEFT$(imagetype$, 3) = "png" THEN imagetype$ = "png"
                        IF imagetype$ = "jpeg" THEN imagetype$ = "jpg"
                        SELECT CASE imagetype$
                            CASE "jpg"
                                indicator$ = "ÿØÿà"
                            CASE "png"
                                indicator$ = "‰PNG"
                            CASE ELSE
                                EXIT DO
                        END SELECT
                        notart = 0
                        DO
                            FOR findind = 1 TO LEN(tag$(sorttag, 4))
                                checkind$ = MID$(tag$(sorttag, 4), findind, 4)
                                IF checkind$ = indicator$ THEN
                                    imagedata$ = MID$(tag$(sorttag, 4), findind)
                                    EXIT DO
                                END IF
                            NEXT findind
                            notart = 1
                            EXIT DO
                        LOOP
                        IF notart = 0 THEN
                            OPEN "cover." + imagetype$ FOR BINARY AS #2
                            PUT #2, , imagedata$
                            CLOSE #2
                            art& = _LOADIMAGE("cover." + imagetype$)
                            KILL "cover." + imagetype$
                        END IF
                        EXIT DO
                    LOOP
                END IF
            CASE "TP1", "TPE1"
                artist$ = tag$(sorttag, 4)
            CASE "TCON"
                genre$ = tag$(sorttag, 4)
            CASE "TT2", "TIT2"
                title$ = tag$(sorttag, 4)
            CASE "TYER", "TYE"
                year$ = tag$(sorttag, 4)
                IF LEN(year$) > 4 THEN yeara$ = LEFT$(year$, 4)
                IF INSTR(yeara$, "-") THEN yeara$ = RIGHT$(year$, 4)
                year$ = yeara$
            CASE "COMM"
                comment$ = tag$(sorttag, 4)
        END SELECT
    NEXT sorttag
    OPEN file$ FOR BINARY AS #1
    start = LOF(1) - 127
    GET #1, start, idtag
    CLOSE #1
    IF idtag.tag = "TAG" THEN
        IF title$ = "" THEN title$ = remspace$(idtag.title)
        IF artist$ = "" THEN artist$ = remspace$(idtag.artist)
        IF album$ = "" THEN album$ = remspace$(idtag.album)
        IF year$ = "" THEN year$ = remspace$(idtag.year)
        IF comment$ = "" THEN comment$ = remspace$(idtag.comment)
        IF genre$ = "" THEN genre$ = remspace$(idtag.genre)
    END IF
END IF
IF title$ = "" THEN title$ = LEFT$(file$, (LEN(file$) - 4))
tag = 1
END SUB