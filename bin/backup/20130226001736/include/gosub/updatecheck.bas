updatecheck:
versionfile$ = "http://dl.dropbox.com/u/30616191/JARVIS/version.txt"
getversion = _OPENCLIENT("TCP/IP:80:" + "dl.dropbox.com")
IF getversion THEN
    request$ = "GET " + versionfile$ + " HTTP/1.0" + CR$ + CR$
    PUT #getversion, , request$
    _DELAY 2
    GET #getversion, , response$
    CLOSE getversion
END IF
fileversion# = VAL(RIGHT$(response$, VAL(MID$(response$, ((INSTR(response$, "content-length: ")) + 16), ((INSTR(((INSTR(response$, "content-length: ")) + 16), response$, CHR$(10))) - ((INSTR(response$, "content-length: ")) + 16))))))
IF fileversion# <> version# THEN
    updateresponse = 1
ELSE
    updateresponse = 0
END IF
IF fileversion# <> version# AND fileversion# <> skipversion# AND updatecall = 0 THEN
    GOSUB update
END IF
RETURN