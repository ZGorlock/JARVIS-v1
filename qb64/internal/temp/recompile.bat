@echo off
cd %0\..\
echo Recompiling...
cd ../c
.\bin\g -fstack-check -w -Wall -I.\i -I..\..\ -L.\l qbx.cpp libqbx.o ..\..\..\resources\jarvis.o -mwindows .\i686-w64-mingw32\lib\libimm32.a -lwinspool -lmingw32 -ln -lmix -limg -lttf -lSDL -s -o "..\..\..\untitled.exe"
pause
