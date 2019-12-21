@echo off
echo relaunching
@ping 127.0.0.1 -n 8 -w 1000> nul
start JARVIS.exe
exit