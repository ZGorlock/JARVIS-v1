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