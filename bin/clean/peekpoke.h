/*
peek and poke for bytes, words, dwords, pointers, and qwords in qb64
public domain, 2011 sept, 2012 feb & march, michael calkins
http://www.qb64.net/forum/index.php?topic=4491.msg58252#msg58252
*/

unsigned char peekb(void * p){return *(unsigned char *)p;}

unsigned short peekw(void * p){return *(unsigned short *)p;}

unsigned int peekd(void * p){return *(unsigned int *)p;}

void * peekp(void * p){return *(void **)p;}

unsigned long long peekq(void * p){return *(unsigned long long *)p;}

void pokeb(void * p, unsigned char n){*(unsigned char *)p = n;}

void pokew(void * p, unsigned short n){*(unsigned short *)p = n;}

void poked(void * p, unsigned int n){*(unsigned int *)p = n;}

void pokep(void * p, void * n){*(void **)p = n;}

void pokeq(void * p, unsigned long long n){*(unsigned long long *)p = n;}

void * getpeekpokerev(void){return (void *) "2012 03 14 mcalkins";}