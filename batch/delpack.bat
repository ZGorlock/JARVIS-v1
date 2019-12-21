@echo off
set /p loc= 0<C:\WINDOWS\jarvisloc.jdf
set /p pkn= 0<%loc%\temp\packun.tmp
del /f /q %loc%\temp\packun.tmp
chdir %loc%
echo removing files from jarvisloc
@ping 127.0.0.1 -n 5 -w 1000> nul
rmdir /q /s %loc%\packs\%pkn%\
echo recompiling...
@ping 127.0.0.1 -n 5 -w 1000> nul
del /f /q %loc%\JARVIS.exe
cmd /c start %loc%\qb64\QB64.exe -c %loc%\source\JARVIS.bas
exit