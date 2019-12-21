#define _WINDOWS
#include "wn.h"

inline extern int wncustom_display_message(char * p) {
 MessageBoxA(0, p, "wn error message", 0);
 return -1;
}

inline void wn_install_errmessage_handler(void) {
 display_message = & wncustom_display_message;
}