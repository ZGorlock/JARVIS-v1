SUB dictionary (searchstr$, definition$(), synonym$(), synsetcount(), flag)
'$include:'..\include\resources\wn.bas'
CONST PtrSize = 4
DIM MyIndex AS Index
DIM MySynset AS Synset
wn_install_errmessage_handler
IF wninit THEN EXIT SUB
REDIM synsetcount(4)
searchstr$ = searchstr$ + CHR$(0)
FOR i = 1 TO 4
    pIndex~%& = index_lookup(_OFFSET(searchstr$), i)
    IF pIndex~%& THEN
        memcpy _OFFSET(MyIndex), pIndex~%&, LEN(MyIndex)
        FOR indexcnt& = 0 TO MyIndex.off_cnt - 1
            pSynset~%& = read_synset(i, peekd(4 * indexcnt& + MyIndex.offset), _OFFSET(searchstr$))
            synsetcount(i) = synsetcount(i) + 1
            memcpy _OFFSET(MySynset), pSynset~%&, LEN(MySynset)
            defn$ = peekstr(MySynset.defn)
            definition$(i, synsetcount(i)) = MID$(defn$, 2, (LEN(defn$) - 2))
            synonym$(i, synsetcount(i)) = ""
            FOR syn& = 0 TO MySynset.wcount - 1
                IF syn& + 1 <> MySynset.whichword THEN
                    IF LEN(synonym$(i, synsetcount(i))) THEN synonym$(i, synsetcount(i)) = synonym$(i, synsetcount(i)) + ", "
                    syn$ = peekstr(peekp(PtrSize * syn& + MySynset.words))
                    IF INSTR(syn$, "_") THEN
                        buildsyn$ = ""
                        FOR splicepace = 1 TO LEN(syn$)
                            shave$ = MID$(syn$, splicepace, 1)
                            IF shave$ = "_" THEN shave$ = " "
                            buildsyn$ = buildsyn$ + shave$
                        NEXT splicepace
                        syn$ = buildsyn$
                    END IF
                    synonym$(i, synsetcount(i)) = synonym$(i, synsetcount(i)) + syn$
                END IF
            NEXT
            free_synset pSynset~%&
        NEXT
        free_index pIndex~%&
    END IF
NEXT
flag = -1
END SUB