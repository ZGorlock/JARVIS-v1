@echo off
echo uninstalling...
@ping 127.0.0.1 -n 5 -w 1000> nul
set /p loc= 0<C:\WINDOWS\jarvisloc.jdf
set /p ut= 0<%loc%\temp\uninstall.tmp
If %ut%==1 (
copy /y "%loc%\tools\dimscreen.ini" "dimscreen.ini"
copy /y "%loc%\data\jarvis.ini" "jarvis.ini"
copy /y "%loc%\data\log.jdf" "log.jdf"
copy /y "%loc%\source\customcmd.bas" "customcmd.bas"
copy /y "%loc%\resources\alarm.*" "alarm.*"
xcopy /s /y "%loc%\customcmd" "customcmd\"
xcopy /s /y "%loc%\snapshots" "snapshots\"
)
rmdir /q /s %loc%
del /f /q "C:\WINDOWS\jarvisloc.jdf"
del /f /q "C:%homepath%\Start Menu\Programs\Startup\startuptime.lnk"
del /f /q "C:%homepath%\Start Menu\Programs\Startup\jarvis.lnk"
del /f /q "C:%homepath%\Desktop\jarvis.lnk"
rmdir /q /s "C:\Documents and Settings\All Users\Start Menu\Programs\JARVIS"
rmdir /q /s "C:%homepath%\Application Data\JARVIS"
If %ut%==1 (
mkdir "C:\Program Files\JARVIS\temp\profile"
copy /y "dimscreen.ini" "C:\Program Files\JARVIS\temp\profile\dimscreen.ini"
copy /y "jarvis.ini" "C:\Program Files\JARVIS\temp\profile\jarvis.ini"
copy /y "log.jdf "C:\Program Files\JARVIS\temp\profile\log.jdf"
copy /y "customcmd.bas" "C:\Program Files\JARVIS\temp\profile\customcmd.bas"
copy /y "alarm.*" "C:\Program Files\JARVIS\temp\profile\alarm.*"
xcopy /s /y "customcmd" "C:\Program Files\JARVIS\temp\profile\customcmd\"
xcopy /s /y "snapshots" "C:\Program Files\JARVIS\temp\profile\snapshots\"
del /f /q "C:\dimscreen.ini"
del /f /q "C:\jarvis.ini"
del /f /q "C:\log.jdf"
del /f /q "C:\customcmd.bas"
del /f /q "C:\alarm.*"
rmdir /q /s "C:\customcmd"
rmdir /q /s "C:\snapshots"
)
del /f /q "uninstall.bat"
exit