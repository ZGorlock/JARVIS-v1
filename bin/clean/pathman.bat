@echo off
chdir batch
if %PROCESSOR_ARCHITECTURE%==x86 (
  copy /y "..\resources\PATHMAN.EXE" "%systemroot%\system32\PATHMAN.EXE"
) else (
  copy /y "..\resources\PATHMAN.EXE" "%systemroot%\SysWOW64\PATHMAN.EXE"
)
exit