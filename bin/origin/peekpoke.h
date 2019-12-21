/*
peek and poke for bytes, words, dwords, pointers, and qwords in qb64
revision: 2012 09 27 mcalkins
public domain, 2011 sept, 2012 feb, march, & sept, michael calkins
http://www.qb64.net/forum/index.php?topic=4491.0

In a release build, it is important that these functions actually be inlined in all
cases. I am making them static to try to prevent the possibility of them being inlined
in one compilation unit, but not inlined in others. Perhaps I am being paranoid. Include
the header in each compilation unit that needs the functions. Hopefully, they will
always be inlined.

Note: in both mingw and MSVC++, you will need to specify optimization on the compiler
command line. (Examples: /O2 with MSVC++, or -O2 or -O3 with mingw.)
*/

static inline uint8 peekb(uptrszint p){return *(uint8*)p;}
static inline uint16 peekw(uptrszint p){return *(uint16*)p;}
static inline uint32 peekd(uptrszint p){return *(uint32*)p;}
static inline uptrszint peekp(uptrszint p){return *(uptrszint*)p;}
static inline uint64 peekq(uptrszint p){return *(uint64*)p;}
static inline void pokeb(uptrszint p, uint8 n){*(uint8*)p=n;}
static inline void pokew(uptrszint p, uint16 n){*(uint16*)p=n;}
static inline void poked(uptrszint p, uint32 n){*(uint32*)p=n;}
static inline void pokep(uptrszint p, uptrszint n){*(uptrszint*)p=n;}
static inline void pokeq(uptrszint p, uint64 n){*(uint64*)p=n;}