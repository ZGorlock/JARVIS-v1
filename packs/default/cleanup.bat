@echo off
echo cleaning up files...
@ping 127.0.0.1 -n 5 -w 1000> nul
rmdir /q /s "bin"
del /f /q "installer.exe"
del /f /q "*.dll"
del /f /q "cleanup.bat"
exit