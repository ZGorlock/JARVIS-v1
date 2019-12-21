' peek and poke for bytes, words, dwords, pointers, and qwords in qb64
' revision 2012 09 27 mcalkins
' public domain, 2011 sept, 2012 feb, march, & sept, michael calkins
' http://www.qb64.net/forum/index.php?topic=4491.0

DECLARE LIBRARY "peekpoke"
 FUNCTION peekb~%% (BYVAL p~%&)
 FUNCTION peekw~% (BYVAL p~%&)
 FUNCTION peekd~& (BYVAL p~%&)
 FUNCTION peekp~%& (BYVAL p~%&)
 FUNCTION peekq~&& (BYVAL p~%&)
 SUB pokeb (BYVAL p~%&, BYVAL n~%%)
 SUB pokew (BYVAL p~%&, BYVAL n~%)
 SUB poked (BYVAL p~%&, BYVAL n~&)
 SUB pokep (BYVAL p~%&, BYVAL n~%&)
 SUB pokeq (BYVAL p~%&, BYVAL n~&&)
END DECLARE

DECLARE CUSTOMTYPE LIBRARY
 ' the following functions are meant for internal use. They are not guaranteed
 ' to be forward compatible.
 FUNCTION peekpoke_strnlen~%& ALIAS "strnlen" (BYVAL str~%&, BYVAL numberOfElements~%&)
 SUB peekpoke_memcpy ALIAS "memcpy" (BYVAL dest~%&, BYVAL src~%&, BYVAL count~%&)
END DECLARE