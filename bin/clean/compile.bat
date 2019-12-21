@echo off
echo PREPARING TO COMPILE...
title QB64 Compiler
set /p loc= 0<C:\WINDOWS\jarvisloc.jdf
set /p ctime= 0<"%loc%\temp\compiletime.tmp"
@ping 127.0.0.1 -n 5 -w 1000> nul
copy /y %loc%\source\JARVIS.bas %loc%\bin\backup\bas\%ctime%.bas
copy /y %loc%\JARVIS.exe %loc%\bin\backup\exe\%ctime%.exe
del /f /q %loc%\JARVIS.exe
cmd /c start %loc%\qb64\QB64.exe -c %loc%\source\JARVIS.bas
exit