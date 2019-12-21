' peek null terminated string
' revision 2012 09 27 mcalkins
' public domain, 2012 sept, michael calkins
' http://www.qb64.net/forum/index.php?topic=4491.0

FUNCTION peekstr$ (p AS _UNSIGNED _OFFSET)
' copies a maximum of 0x7fffffff bytes.
DIM t AS STRING
DIM n AS _UNSIGNED _OFFSET
n = peekpoke_strnlen(p, &H7FFFFFFF~&) ' scan string bytes for null
t = STRING$(n, 0) ' heap allocation and memset nulls
peekpoke_memcpy _OFFSET(t), p, n ' copy
peekstr = t

'I am not satisified that this is very efficient, but I'm not sure how to really
'improve much on it. It reads the source twice (once scanning for the null,
'again to copy). It writes the destination twice, once during the memset, again
'to copy). It would be nice to be able to enlarge a QB64 string without
'initializing it.
END FUNCTION
