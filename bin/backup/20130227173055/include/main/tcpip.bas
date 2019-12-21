DO
    _LIMIT 1
    jarvishost = _OPENHOST("TCP/IP:7319")
LOOP UNTIL jarvishost < 0
SHELL _HIDE _DONTWAIT "start tools\JARVISboard.exe"
DO
    _LIMIT 1
    jbct = jbct + 1
    jarvisboard = _OPENCONNECTION(jarvishost)
LOOP UNTIL jarvisboard < 0 OR jbct = 30