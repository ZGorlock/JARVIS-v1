@echo off
echo PREPARING TO COMPILE...
title QB64 Compiler
set /p loc= 0<C:\WINDOWS\jarvisloc.jdf
for /f "tokens=1-4 delims=/ " %%a in ("%date%") do (
    set day=%%c&set month=%%b&set year=%%d
)
for /f "tokens= 1-4 delims=:." %%a in ("%time%") do (
    set hour=%%a&set mins=%%b&set secs=%%c
)
if %hour% lss 10 set hour=0%hour: =%
set timestamp=%year%%month%%day%%hour%%mins%%secs%
@ping 127.0.0.1 -n 5 -w 1000> nul
mkdir %loc%\bin\backup\%timestamp%
copy /y %loc%\source\JARVIS.bas %loc%\bin\backup\%timestamp%\JARVIS.bas
copy /y %loc%\JARVIS.exe %loc%\bin\backup\%timestamp%\JARVIS.exe
mkdir %loc%\bin\backup\%timestamp%\customcmd
xcopy /e /EXCLUDE:%loc%\resources\ccex.inf /q /y %loc%\customcmd %loc%\bin\backup\%timestamp%\customcmd
mkdir %loc%\bin\backup\%timestamp%\data
xcopy /e /q /y %loc%\data %loc%\bin\backup\%timestamp%\data
mkdir %loc%\bin\backup\%timestamp%\include
xcopy /e /q /y %loc%\include %loc%\bin\backup\%timestamp%\include
mkdir %loc%\bin\backup\%timestamp%\snapshots
xcopy /e /q /y %loc%\snapshots %loc%\bin\backup\%timestamp%\snapshots
mkdir %loc%\bin\backup\%timestamp%\source
xcopy /e /EXCLUDE:%loc%\resources\ccex.inf /q /y %loc%\source %loc%\bin\backup\%timestamp%\source
del /f /q %loc%\JARVIS.exe
cmd /c start %loc%\qb64\QB64.exe -c %loc%\source\JARVIS.bas
exit