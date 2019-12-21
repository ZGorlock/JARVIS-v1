javishosttimeout = TIMER
DO
    _LIMIT 10
    jarvishost = _OPENHOST("TCP/IP:7319")
    IF jarvishosttimeout > TIMER THEN jarvishosttimeout = TIMER
LOOP UNTIL jarvishost < 0 OR javishosttimeout - TIMER >= 10
SHELL _HIDE _DONTWAIT "start tools\JARVISboard.exe"
jbct = 0
DO
    _LIMIT 10
    jbct = jbct + 1
    jarvisboard = _OPENCONNECTION(jarvishost)
LOOP UNTIL jarvisboard < 0 OR jbct = 100