versionfile$ = "C:" + ENVIRON$("HOMEPATH") + "\Application Data\JARVIS\version.jdf"
IF _FILEEXISTS(versionfile$) = 0 THEN
    SHELL _HIDE "mkdir " + CHR$(34) + "C:" + ENVIRON$("HOMEPATH") + "\Application Data\JARVIS" + CHR$(34)
    OPEN versionfile$ FOR OUTPUT AS #1
    PRINT #1, version#
    CLOSE #1
END IF
OPEN versionfile$ FOR INPUT AS #1
INPUT #1, fileversion#
CLOSE #1
DO
    IF fileversion# <> version# THEN
        SELECT CASE fileversion#
            CASE .01
        END SELECT
    END IF
LOOP UNTIL fileversion# = version#
OPEN versionfile$ FOR OUTPUT AS #1
PRINT #1, version#
CLOSE #1