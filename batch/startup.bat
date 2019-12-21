@echo off
chdir ..\batch
set /p ft= 0<..\temp\firsttime.tmp
if %ft% == 0 (
echo adding pathman kit tool...
@ping 127.0.0.1 -n 1 -w 1000> nul
if %PROCESSOR_ARCHITECTURE%==x86 (
  copy /y "..\resources\PATHMAN.EXE" "%systemroot%\system32\PATHMAN.EXE"
) else (
  copy /y "..\resources\PATHMAN.EXE" "%systemroot%\SysWOW64\PATHMAN.EXE"
)
echo updating path environment variable...
@ping 127.0.0.1 -n 1 -w 1000> nul
pathman /au ..\lib\;lib\
echo make clean file backup
copy /y "..\bin\readme.txt" "..\bin\clean\readme.txt"
copy /y "..\bin\license\*.txt" "..\bin\clean\*.txt"
copy /y "*.bat" "..\bin\clean\*.bat"
copy /y "..\customcmd\_readme.txt" "..\bin\clean\_readme.txt"
copy /y "..\data\*.*" "..\bin\clean\*.*"
copy /y "..\lib\*.*" "..\bin\clean\*.*"
copy /y "..\qb64\qb64.exe" "..\bin\clean\qb64.exe"
copy /y "..\qb64\internal\c\makeline.txt" "..\bin\clean\qb64.exe"
copy /y "..\resources\urls\*.URL" "..\bin\clean\*.URL"
copy /y "..\resources\*.*" "..\bin\clean\*.*"
copy /y "..\source\*.bas" "..\bin\clean\*.bas"
copy /y "..\temp\*.*" "..\bin\clean\*.*"
copy /y "..\tools\*.*" "..\bin\clean\*.*"
copy /y "..\JARVIS.exe" "..\bin\clean\JARVIS.exe"
echo making nul backup
@ping 127.0.0.1 -n 1 -w 1000> nul
copy /y "..\source\JARVIS.bas" "..\bin\backup\bas\0.bas"
copy /y "..\JARVIS.exe" "..\bin\backup\exe\0.exe"
echo creating nul snapshot
@ping 127.0.0.1 -n 1 -w 1000> nul
copy /y "..\source\customcmd.bas" "..\snapshots\0\customcmd.bas"
copy /y "..\data\*.*" "..\snapshots\0\*.*"
copy /y "..\tools\dimscreen.ini" "..\snapshots\0\dimscreen.ini"
echo finding loc
@ping 127.0.0.1 -n 1 -w 1000> nul
chdir ..
cd > temp\jarvisloc.tmp
cd > C:\WINDOWS\jarvisloc.jdf
chdir batch
echo getting loc
@ping 127.0.0.1 -n 1 -w 1000> nul
set /p loc= 0<C:\WINDOWS\jarvisloc.jdf
echo moving tools to system folder
@ping 127.0.0.1 -n 1 -w 1000> nul
copy /y "%loc%\resources\mkshortcut.vbs" "C:\WINDOWS\System32\mkshortcut.vbs"
copy /y "%loc%\resources\showdesktop.scf" "C:\WINDOWS\System32\showdesktop.scf"
echo making shortcuts
@ping 127.0.0.1 -n 1 -w 1000> nul
mkshortcut /target:"%loc%\JARVIS.exe" /shortcut:"C:%homepath%\Desktop\jarvis"
mkshortcut /target:"%loc%\JARVIS.exe" /shortcut:"%loc%\bin\jarvis"
mkshortcut /target:"%loc%\JARVIS.exe" /shortcut:"%loc%\bin\clean\jarvis"
mkdir "C:\Documents and Settings\All Users\Start Menu\Programs\JARVIS"
mkshortcut /target:"%loc%\JARVIS.exe" /shortcut:"C:\Documents and Settings\All Users\Start Menu\Programs\JARVIS\jarvis"
mkshortcut /target:"%loc%\tools\startuptime.exe" /shortcut:"C:%homepath%\Start Menu\Programs\Startup\~startuptime"
mkshortcut /target:"%loc%\tools\startuptime.exe" /shortcut:"%loc%\bin\~startuptime"
mkshortcut /target:"%loc%\tools\startuptime.exe" /shortcut:"%loc%\bin\clean\~startuptime"
echo checking for profile data
@ping 127.0.0.1 -n 1 -w 1000> nul
if exist "C:\Program Files\JARVIS\temp\profile\jarvis.ini" (
copy /y "C:\Program Files\JARVIS\temp\profile\jarvis.ini" "..\data\jarvis.ini"
copy /y "C:\Program Files\JARVIS\temp\profile\dimscreen.ini" "..\tools\dimscreen.ini"
copy /y "C:\Program Files\JARVIS\temp\profile\log.jdf" "..\data\log.jdf"
copy /y "C:\Program Files\JARVIS\temp\profile\customcmd.bas" "..\customcmd.bas"
copy /y "C:\Program Files\JARVIS\temp\profile\alarm.*" "..\resources\alarm.*"
xcopy /s /y "C:\Program Files\JARVIS\temp\profile\customcmd" "..\customcmd\"
xcopy /s /y "C:\Program Files\JARVIS\temp\profile\snapshots" "..\snapshots\"
)
)
echo 1 > ..\temp\firsttime.tmp
exit