DWORD dABSOLUTEp(DWORD (__stdcall *pf)(void *), void * v0){
 return (*pf)(v0);
}

DWORD dABSOLUTEppdp(DWORD (__stdcall *pf)(void *, void *, DWORD, void *), void * v0, void * v1, DWORD v2, void * v3){
 return (*pf)(v0, v1, v2, v3);
}

DWORD dABSOLUTEppp(DWORD (__stdcall *pf)(void *, void *, void *), void * v0, void * v1, void * v2){
 return (*pf)(v0, v1, v2);
}

DWORD dABSOLUTEpqq(DWORD (__stdcall *pf)(void *, ULONGLONG, ULONGLONG), void * v0, ULONGLONG v1, ULONGLONG v2){
 return (*pf)(v0, v1, v2);
}

DWORD dABSOLUTEpqp(DWORD (__stdcall *pf)(void *, ULONGLONG, void *), void * v0, ULONGLONG v1, void * v2){
 return (*pf)(v0, v1, v2);
}

DWORD dABSOLUTEppd(DWORD (__stdcall *pf)(void *, void *, DWORD), void * v0, void * v1, DWORD v2){
 return (*pf)(v0, v1, v2);
}

DWORD dABSOLUTEpd(DWORD (__stdcall *pf)(void *, DWORD), void * v0, DWORD v1){
 return (*pf)(v0, v1);
}

DWORD dABSOLUTEpdpp(DWORD (__stdcall *pf)(void *, DWORD, void *, void *), void * v0, DWORD v1, void * v2, void * v3){
 return (*pf)(v0, v1, v2, v3);
}

DWORD dABSOLUTEpdddpp(DWORD (__stdcall *pf)(void *, DWORD, DWORD, DWORD, void *, void *), void * v0, DWORD v1, DWORD v2, DWORD v3, void * v4, void * v5){
 return (*pf)(v0, v1, v2, v3, v4, v5);
}