SUB email (uemail$, upass$, remail$, id$, messageloc$, flag)
crlf$ = CHR$(13) + CHR$(10)
c = _OPENCLIENT("tcp/ip:25:mail.gmx.com")
IF c = 0 THEN EXIT FUNCTION
a$ = "EHLO localhost" + crlf$
PUT #c, , a$
a$ = "AUTH LOGIN" + crlf$
PUT #c, , a$
base64e$ = convbase64$(uemail$) + crlf$
PUT #c, , base64e$
base64p$ = convbase64$(upass$) + crlf$
PUT #c, , base64p$
a$ = "MAIL FROM: Report <" + uemail$ + ">" + crlf$
PUT #c, , a$
a$ = "RCPT TO: JARVIS <" + remail$ + ">" + crlf$
PUT #c, , a$
a$ = "DATA" + crlf$
PUT #c, , a$
a$ = ""
a$ = "From:  Report <" + uemail$ + ">" + crlf$
PUT #c, , a$
a$ = "To: JARVIS <" + remail$ + ">" + crlf$
PUT #c, , a$
a$ = "Subject: " + id$ + crlf$
PUT #c, , a$
a$ = crlf$
PUT #c, , a$
REDIM message$(65536)
OPEN messageloc$ FOR INPUT AS #1
DO
    message = message + 1
    LINE INPUT #1, message$(message)
LOOP UNTIL EOF(1) = -1
CLOSE #1
REDIM _PRESERVE message$(message)
FOR putmessage = 1 TO UBOUND(message$)
    a$ = message$(putmessage) + crlf$
    PUT #c, , a$
NEXT putmessage
a$ = crlf$
PUT #c, , a$
a$ = "." + crlf$
PUT #c, , a$
SLEEP 2
a$ = "QUIT" + crlf$
PUT #c, , a$
SLEEP 2
CLOSE c
flag = -1
END SUB