@echo off
chdir batch
@ping 127.0.0.1 -n 5 -w 1000> nul
set /p os= 0<%homedrive%%homepath%\Application Data\JARVIS\os.jdf
IF %os%==1 (
) else (
del ..\*.dll
del ..\*.h
del ..\*.o
)
exit