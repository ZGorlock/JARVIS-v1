'$include:'peekpoke.bi'

DECLARE CUSTOMTYPE LIBRARY
    SUB memcpy (BYVAL dest~%&, BYVAL src~%&, BYVAL count~%&)
END DECLARE

SCREEN 12
SCREEN _NEWIMAGE(640, 720)

DO
    word$ = ""
    DO
        CLS
        PRINT "Enter a word: " + word$
        DO
            _LIMIT 64
            k$ = INKEY$
        LOOP UNTIL LEN(k$)
        IF k$ = CHR$(8) THEN word$ = MID$(word$, 1, (LEN(word$) - 1))
        IF k$ = CHR$(13) AND LEN(word$) > 0 THEN EXIT DO
        IF k$ = CHR$(27) THEN SYSTEM
        IF ASC(k$) >= 32 AND ASC(k$) <= 126 THEN word$ = word$ + k$
    LOOP
    searchstr$ = LCASE$(word$)
    DO
        savestr$ = searchstr$
        IF LEFT$(searchstr$, 1) = " " THEN searchstr$ = MID$(searchstr$, 2, LEN(searchstr$))
        IF RIGHT$(searchstr$, 1) = " " THEN searchstr$ = MID$(searchstr$, 1, (LEN(searchstr$) - 1))
    LOOP UNTIL searchstr$ = savestr$
    word$ = UCASE$(searchstr$)
    IF INSTR(searchstr$, CHR$(32)) THEN
        buildstr$ = ""
        FOR remspace = 1 TO LEN(searchstr$)
            shave$ = MID$(searchstr$, remspace, 1)
            IF shave$ = " " THEN shave$ = "_"
            buildstr$ = buildstr$ + shave$
        NEXT remspace
        searchstr$ = buildstr$
    END IF
    REDIM n(4)
    REDIM definition$(4, 1024)
    REDIM synonym$(4, 1024)
    flag = 0
    CALL dictionary(searchstr$, definition$(), synonym$(), n(), flag)
    IF flag THEN
        CLS
        PRINT word$
        FOR printsyn = 1 TO 4
            IF n(printsyn) > 0 THEN
                PRINT
                SELECT CASE printsyn
                    CASE 1
                        PRINT "NOUN:"
                    CASE 2
                        PRINT "VERB:"
                    CASE 3
                        PRINT "ADJECTIVE:"
                    CASE 4
                        PRINT "ADVERB:"
                END SELECT
                FOR synsets = 1 TO n(printsyn)
                    PRINT "-" + definition$(printsyn, synsets)
                    IF LEN(synonym$(printsyn, synsets)) THEN PRINT "+" + synonym$(printsyn, synsets)
                NEXT synsets
            END IF
        NEXT printsyn
        DO
            _LIMIT 64
            k$ = INKEY$
        LOOP UNTIL k$ = CHR$(32)
    END IF
LOOP UNTIL k$ = CHR$(27)
SYSTEM

SUB dictionary (searchstr$, definition$(), synonym$(), n(), flag)
'$include:'wn.bi'
CONST PtrSize = 4
DIM MyIndex AS Index
DIM MySynset AS Synset
wn_install_errmessage_handler
IF wninit THEN EXIT SUB
REDIM n(4)
searchstr$ = searchstr$ + CHR$(0)
FOR i = 1 TO 4
    pIndex~%& = index_lookup(_OFFSET(searchstr$), i)
    IF pIndex~%& THEN
        memcpy _OFFSET(MyIndex), pIndex~%&, LEN(MyIndex)
        FOR indexcnt& = 0 TO MyIndex.off_cnt - 1
            pSynset~%& = read_synset(i, peekd(4 * indexcnt& + MyIndex.offset), _OFFSET(searchstr$))
            n(i) = n(i) + 1
            memcpy _OFFSET(MySynset), pSynset~%&, LEN(MySynset)
            defn$ = peekstr(MySynset.defn)
            definition$(i, n(i)) = MID$(defn$, 2, (LEN(defn$) - 2))
            synonym$(i, n(i)) = ""
            FOR syn& = 0 TO MySynset.wcount - 1
                IF syn& + 1 <> MySynset.whichword THEN
                    IF LEN(synonym$(i, n(i))) THEN synonym$(i, n(i)) = synonym$(i, n(i)) + ", "
                    syn$ = peekstr(peekp(PtrSize * syn& + MySynset.words))
                    IF INSTR(syn$, "_") THEN
                        buildsyn$ = ""
                        FOR remspace = 1 TO LEN(syn$)
                            shave$ = MID$(syn$, remspace, 1)
                            IF shave$ = "_" THEN shave$ = " "
                            buildsyn$ = buildsyn$ + shave$
                        NEXT remspace
                        syn$ = buildsyn$
                    END IF
                    synonym$(i, n(i)) = synonym$(i, n(i)) + syn$
                END IF
            NEXT
            free_synset pSynset~%&
        NEXT
        free_index pIndex~%&
    END IF
NEXT
flag = -1
END SUB

'$include:'peekstr.bi'