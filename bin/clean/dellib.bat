@echo off
chdir batch
@ping 127.0.0.1 -n 5 -w 1000> nul
del ..\*.dll
exit