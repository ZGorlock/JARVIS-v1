' peek and poke for bytes, words, dwords, pointers, and qwords in qb64
' public domain, 2011 sept, 2012 feb & march, michael calkins
' http://www.qb64.net/forum/index.php?topic=4491.msg58252#msg58252

CONST peekpoke_bi_rev = "2012 03 14 mcalkins"

DECLARE CUSTOMTYPE LIBRARY "peekpoke"
 FUNCTION peekb~%% (BYVAL p AS _UNSIGNED _OFFSET)
 FUNCTION peekw~% (BYVAL p AS _UNSIGNED _OFFSET)
 FUNCTION peekd~& (BYVAL p AS _UNSIGNED _OFFSET)
 FUNCTION peekp~%& (BYVAL p AS _UNSIGNED _OFFSET)
 FUNCTION peekq~&& (BYVAL p AS _UNSIGNED _OFFSET)
 SUB pokeb (BYVAL p AS _UNSIGNED _OFFSET, BYVAL n AS _UNSIGNED _BYTE)
 SUB pokew (BYVAL p AS _UNSIGNED _OFFSET, BYVAL n AS _UNSIGNED INTEGER)
 SUB poked (BYVAL p AS _UNSIGNED _OFFSET, BYVAL n AS _UNSIGNED LONG)
 SUB pokep (BYVAL p AS _UNSIGNED _OFFSET, BYVAL n AS _UNSIGNED _OFFSET)
 SUB pokeq (BYVAL p AS _UNSIGNED _OFFSET, BYVAL n AS _UNSIGNED _INTEGER64)
 FUNCTION getpeekpokerev~%& ()
END DECLARE