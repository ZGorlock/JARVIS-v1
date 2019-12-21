FUNCTION Alphabetize (array$())
FOR a = 1 TO UBOUND(array$)
    FOR a2 = 1 TO UBOUND(array$)
        IF array$(a2) > array$(a) THEN
            SWAP array$(a), array$(a2)
        END IF
    NEXT a2
NEXT a
END FUNCTION