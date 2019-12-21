@echo off
chdir batch
echo make clean file backup
copy /y "..\bin\readme.txt" "..\bin\clean\readme.txt"
copy /y "..\bin\license\*.txt" "..\bin\clean\*.txt"
copy /y "*.bat" "..\bin\clean\*.bat"
copy /y "..\customcmd\_readme.txt" "..\bin\clean\_readme.txt"
copy /y "..\data\*.*" "..\bin\clean\*.*"
copy /y "..\include\*.bas" "..\bin\clean\*.bas"
copy /y "..\include\commands\*.bas" "..\bin\clean\*.bas"
copy /y "..\include\func\*.bas" "..\bin\clean\*.bas"
copy /y "..\include\gosub\*.bas" "..\bin\clean\*.bas"
copy /y "..\include\main\*.bas" "..\bin\clean\*.bas"
copy /y "..\include\sub\*.bas" "..\bin\clean\*.bas"
copy /y "..\lib\*.*" "..\bin\clean\*.*"
copy /y "..\qb64\qb64.exe" "..\bin\clean\qb64.exe"
copy /y "..\qb64\internal\c\makeline.txt" "..\bin\clean\qb64.exe"
copy /y "..\resources\urls\*.URL" "..\bin\clean\*.URL"
copy /y "..\resources\*.*" "..\bin\clean\*.*"
copy /y "..\source\*.bas" "..\bin\clean\*.bas"
copy /y "..\temp\*.*" "..\bin\clean\*.*"
copy /y "..\tools\*.*" "..\bin\clean\*.*"
copy /y "..\JARVIS.exe" "..\bin\clean\JARVIS.exe"
exit