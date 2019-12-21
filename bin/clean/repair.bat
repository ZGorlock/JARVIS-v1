@echo off
echo repairing missing files
if exist "..\bin\readme.txt" (
) else (
copy /y "..\bin\clean\readme.txt" "..\bin\readme.txt"
)
if exist "..\bin\license\dll_license.txt" (
) else (
copy /y "..\bin\clean\dll_license.txt" "..\bin\license\dll_license.txt"
)
if exist "..\bin\license\license.txt" (
) else (
copy /y "..\bin\clean\license.txt" "..\bin\license\license.txt"
)
if exist "..\bin\license\nircmd_license.txt" (
) else (
copy /y "..\bin\clean\nircmd_license.txt" "..\bin\license\nircmd_license.txt"
)
if exist "..\bin\license\pathman_license.txt" (
) else (
copy /y "..\bin\clean\pathman_license.txt" "..\bin\license\pathman_license.txt"
)
if exist "..\bin\license\qb64_license.txt" (
) else (
copy /y "..\bin\clean\qb64_license.txt" "..\bin\license\qb64_license.txt"
)
if exist "..\batch\cfb.bat" (
) else (
copy /y "..\bin\clean\cfb.bat" "..\batch\cfb.bat"
)
if exist "..\batch\compile.bat" (
) else (
copy /y "..\bin\clean\compile.bat" "..\batch\compile.bat"
)
if exist "..\batch\dellib.bat" (
) else (
copy /y "..\bin\clean\dellib.bat" "..\batch\dellib.bat"
)
if exist "..\batch\pathman.bat" (
) else (
copy /y "..\bin\clean\pathman.bat" "..\batch\pathman.bat"
)
if exist "..\batch\repair.bat" (
) else (
copy /y "..\bin\clean\repair.bat" "..\batch\repair.bat"
)
if exist "..\batch\startup.bat" (
) else (
copy /y "..\bin\clean\startup.bat" "..\batch\startup.bat"
)
if exist "..\batch\uninstall.bat" (
) else (
copy /y "..\bin\clean\uninstall.bat" "..\batch\uninstall.bat"
)
if exist "..\customcmd\_readme.txt" (
) else (
copy /y "..\bin\clean\_readme.txt" "..\customcmd\_readme.txt"
)
if exist "..\data\jarvis.ini" (
) else (
copy /y "..\bin\clean\jarvis.ini" "..\data\jarvis.ini"
)
if exist "..\data\log.jdf" (
) else (
copy /y "..\bin\clean\log.jdf" "..\data\log.jdf"
)
if exist "..\dll\jpeg.dll" (
) else (
copy /y "..\bin\clean\jpeg.dll" "..\dll\jpeg.dll"
)
if exist "..\dll\libfreetype-6.dll" (
) else (
copy /y "..\bin\clean\libfreetype-6.dll" "..\dll\libfreetype-6.dll"
)
if exist "..\dll\libgcc_s_sjlj-1.dll" (
) else (
copy /y "..\bin\clean\libgcc_s_sjlj-1.dll" "..\dll\libgcc_s_sjlj-1.dll"
)
if exist "..\dll\libogg-0.dll" (
) else (
copy /y "..\bin\clean\libogg-0.dll" "..\dll\libogg-0.dll"
)
if exist "..\dll\libpng12-0.dll" (
) else (
copy /y "..\bin\clean\libpng12-0.dll" "..\dll\libpng12-0.dll"
)
if exist "..\dll\libstdc++-6.dll" (
) else (
copy /y "..\bin\clean\libstdc++-6.dll" "..\dll\libstdc++-6.dll"
)
if exist "..\dll\libtiff-3.dll" (
) else (
copy /y "..\bin\clean\libtiff-3.dll" "..\dll\libtiff-3.dll"
)
if exist "..\dll\libvorbis-0.dll" (
) else (
copy /y "..\bin\clean\libvorbis-0.dll" "..\dll\libvorbis-0.dll"
)
if exist "..\dll\libvorbisfile-3.dll" (
) else (
copy /y "..\bin\clean\libvorbisfile-3.dll" "..\dll\libvorbisfile-3.dll"
)
if exist "..\dll\peekpoke.h" (
) else (
copy /y "..\bin\clean\peekpoke.h" "..\dll\peekpoke.h"
)
if exist "..\dll\SDL.dll" (
) else (
copy /y "..\bin\clean\SDL.dll" "..\dll\SDL.dll"
)
if exist "..\dll\SDL_image.dll" (
) else (
copy /y "..\bin\clean\SDL_image.dll" "..\dll\SDL_image.dll"
)
if exist "..\dll\SDL_mixer.dll" (
) else (
copy /y "..\bin\clean\SDL_mixer.dll" "..\dll\SDL_mixer.dll"
)
if exist "..\dll\SDL_net.dll" (
) else (
copy /y "..\bin\clean\SDL_net.dll" "..\dll\SDL_net.dll"
)
if exist "..\dll\SDL_ttf.dll" (
) else (
copy /y "..\bin\clean\SDL_ttf.dll" "..\dll\SDL_ttf.dll"
)
if exist "..\dll\smpeg.dll" (
) else (
copy /y "..\bin\clean\smpeg.dll" "..\dll\smpeg.dll"
)
if exist "..\dll\text_speak_qb64.h" (
) else (
copy /y "..\bin\clean\text_speak_qb64.h" "..\dll\text_speak_qb64.h"
)
if exist "..\dll\zlib.dll" (
) else (
copy /y "..\bin\clean\zlib.dll" "..\dll\zlib.dll"
)
if exist "..\qb64\qb64.exe" (
) else (
copy /y "..\bin\clean\qb64.exe" "..\qb64\qb64.exe"
)
if exist "..\qb64\internal\c\makeline.txt" (
) else (
copy /y "..\bin\clean\makeline.txt" "..\qb64\internal\c\makeline.txt"
)
if exist "..\resources\urls\amazon.URL" (
) else (
copy /y "..\bin\clean\amazon.URL" "..\resources\urls\amazon.URL"
)
if exist "..\resources\urls\baidu.URL" (
) else (
copy /y "..\bin\clean\baidu.URL" "..\resources\urls\baidu.URL"
)
if exist "..\resources\urls\blogspot.URL" (
) else (
copy /y "..\bin\clean\blogspot.URL" "..\resources\urls\blogspot.URL"
)
if exist "..\resources\urls\dictionary.URL" (
) else (
copy /y "..\bin\clean\dictionary.URL" "..\resources\urls\dictionary.URL"
)
if exist "..\resources\urls\ebay.URL" (
) else (
copy /y "..\bin\clean\ebay.URL" "..\resources\urls\ebay.URL"
)
if exist "..\resources\urls\facebook.URL" (
) else (
copy /y "..\bin\clean\facebook.URL" "..\resources\urls\facebook.URL"
)
if exist "..\resources\urls\google.URL" (
) else (
copy /y "..\bin\clean\google.URL" "..\resources\urls\google.URL"
)
if exist "..\resources\urls\linkedin.URL" (
) else (
copy /y "..\bin\clean\linkedin.URL" "..\resources\urls\linkedin.URL"
)
if exist "..\resources\urls\live.URL" (
) else (
copy /y "..\bin\clean\live.URL" "..\resources\urls\live.URL"
)
if exist "..\resources\urls\msn.URL" (
) else (
copy /y "..\bin\clean\msn.URL" "..\resources\urls\msn.URL"
)
if exist "..\resources\urls\translate.URL" (
) else (
copy /y "..\bin\clean\translate.URL" "..\resources\urls\translate.URL"
)
if exist "..\resources\urls\twitter.URL" (
) else (
copy /y "..\bin\clean\twitter.URL" "..\resources\urls\twitter.URL"
)
if exist "..\resources\urls\wikipedia.URL" (
) else (
copy /y "..\bin\clean\wikipedia.URL" "..\resources\urls\wikipedia.URL"
)
if exist "..\resources\urls\wordpress.URL" (
) else (
copy /y "..\bin\clean\wordpress.URL" "..\resources\urls\wordpress.URL"
)
if exist "..\resources\urls\yahoo.URL" (
) else (
copy /y "..\bin\clean\yahoo.URL" "..\resources\urls\yahoo.URL"
)
if exist "..\resources\urls\youtube.URL" (
) else (
copy /y "..\bin\clean\youtube.URL" "..\resources\urls\youtube.URL"
)
if exist "..\resources\defaultalarm.ogg" (
) else (
copy /y "..\bin\clean\defaultalarm.ogg" "..\resources\defaultalarm.ogg"
)
if exist "..\resources\hexx.bi" (
) else (
copy /y "..\bin\clean\hexx.bi" "..\resources\hexx.bi"
)
if exist "..\resources\internet.URL" (
) else (
copy /y "..\bin\clean\internet.URL" "..\resources\internet.URL"
)
if exist "..\resources\jarvis.ico" (
) else (
copy /y "..\bin\clean\jarvis.ico" "..\resources\jarvis.ico"
)
if exist "..\resources\jarvis.o" (
) else (
copy /y "..\bin\clean\jarvis.o" "..\resources\jarvis.o"
)
if exist "..\resources\jarvis.png" (
) else (
copy /y "..\bin\clean\jarvis.png" "..\resources\jarvis.png"
)
if exist "..\resources\jarvis.rc" (
) else (
copy /y "..\bin\clean\jarvis.rc" "..\resources\jarvis.rc"
)
if exist "..\resources\mkshortcut.vbs" (
) else (
copy /y "..\bin\clean\mkshortcut.vbs" "..\resources\mkshortcut.vbs"
)
if exist "..\resources\nircmd.exe" (
) else (
copy /y "..\bin\clean\nircmd.exe" "..\resources\nircmd.exe"
)
if exist "..\resources\PATHMAN.EXE" (
) else (
copy /y "..\bin\clean\PATHMAN.EXE" "..\resources\PATHMAN.EXE"
)
if exist "..\resources\peekpoke.bi" (
) else (
copy /y "..\bin\clean\peekpoke.bi" "..\resources\peekpoke.bi"
)
if exist "..\resources\server.inf" (
) else (
copy /y "..\bin\clean\server.inf" "..\resources\server.inf"
)
if exist "..\resources\showdesktop.scf" (
) else (
copy /y "..\bin\clean\showdesktop.scf" "..\resources\showdesktop.scf"
)
if exist "..\resources\tone1.ogg" (
) else (
copy /y "..\bin\clean\tone1.ogg" "..\resources\tone1.ogg"
)
if exist "..\resources\tone2.ogg" (
) else (
copy /y "..\bin\clean\tone2.ogg" "..\resources\tone2.ogg"
)
if exist "..\resources\tone3.ogg" (
) else (
copy /y "..\bin\clean\tone3.ogg" "..\resources\tone3.ogg"
)
if exist "..\resources\wget.exe" (
) else (
copy /y "..\bin\clean\wget.exe" "..\resources\wget.exe"
)
if exist "..\source\alarms.bas" (
) else (
copy /y "..\bin\clean\alarms.bas" "..\source\alarms.bas"
)
if exist "..\source\clock.bas" (
) else (
copy /y "..\bin\clean\clock.bas" "..\source\clock.bas"
)
if exist "..\source\customcmd.bas" (
) else (
copy /y "..\bin\clean\customcmd.bas" "..\source\customcmd.bas"
)
if exist "..\source\digitalclock.bas" (
) else (
copy /y "..\bin\clean\digitalclock.bas" "..\source\digitalclock.bas"
)
if exist "..\source\fractal.bas" (
) else (
copy /y "..\bin\clean\fractal.bas" "..\source\fractal.bas"
)
if exist "..\source\JARVIS.bas" (
) else (
copy /y "..\bin\clean\JARVIS.bas" "..\source\JARVIS.bas"
)
if exist "..\source\JARVISboard.bas" (
) else (
copy /y "..\bin\clean\JARVISboard.bas" "..\source\JARVISboard.bas"
)
if exist "..\source\log.bas" (
) else (
copy /y "..\bin\clean\log.bas" "..\source\log.bas"
)
if exist "..\source\polarclock.bas" (
) else (
copy /y "..\bin\clean\polarclock.bas" "..\source\polarclock.bas"
)
if exist "..\source\qb64.bas" (
) else (
copy /y "..\bin\clean\qb64.bas" "..\source\qb64.bas"
)
if exist "..\source\quadratic.bas" (
) else (
copy /y "..\bin\clean\quadratic.bas" "..\source\quadratic.bas"
)
if exist "..\source\report.bas" (
) else (
copy /y "..\bin\clean\report.bas" "..\source\report.bas"
)
if exist "..\source\startup.bas" (
) else (
copy /y "..\bin\clean\startup.bas" "..\source\startup.bas"
)
if exist "..\source\startuptime.bas" (
) else (
copy /y "..\bin\clean\startuptime.bas" "..\source\startuptime.bas"
)
if exist "..\temp\compiletime.tmp" (
) else (
copy /y "..\bin\clean\compiletime.tmp" "..\temp\compiletime.tmp"
)
if exist "..\temp\dimscreenrunning.tmp" (
) else (
copy /y "..\bin\clean\dimscreenrunning.tmp" "..\temp\dimscreenrunning.tmp"
)
if exist "..\temp\firsttime.tmp" (
) else (
copy /y "..\bin\clean\firsttime.tmp" "..\temp\firsttime.tmp"
)
if exist "..\temp\fractaltype.tmp" (
) else (
copy /y "..\bin\clean\fractaltype.tmp" "..\temp\fractaltype.tmp"
)
if exist "..\temp\globalIP.htm" (
) else (
copy /y "..\bin\clean\globalIP.htm" "..\temp\globalIP.htm"
)
if exist "..\temp\jarvisloc.tmp" (
) else (
copy /y "..\bin\clean\jarvisloc.tmp" "..\temp\jarvisloc.tmp"
)
if exist "..\temp\uninstall.tmp" (
) else (
copy /y "..\bin\clean\uninstall.tmp" "..\temp\uninstall.tmp"
)
if exist "..\tools\alarms.exe" (
) else (
copy /y "..\bin\clean\alarms.exe" "..\tools\alarms.exe"
)
if exist "..\tools\dimscreen.exe" (
) else (
copy /y "..\bin\clean\dimscreen.exe" "..\tools\dimscreen.exe"
)
if exist "..\tools\dimscreen.ini" (
) else (
copy /y "..\bin\clean\dimscreen.ini" "..\tools\dimscreen.ini"
)
if exist "..\tools\fractal.exe" (
) else (
copy /y "..\bin\clean\fractal.exe" "..\tools\fractal.exe"
)
if exist "..\tools\JARVISboard.exe" (
) else (
copy /y "..\bin\clean\JARVISboard.exe" "..\tools\JARVISboard.exe"
)
if exist "..\tools\log.exe" (
) else (
copy /y "..\bin\clean\log.exe" "..\tools\log.exe"
)
if exist "..\tools\polarclock.exe" (
) else (
copy /y "..\bin\clean\polarclock.exe" "..\tools\polarclock.exe"
)
if exist "..\tools\quadratic.exe" (
) else (
copy /y "..\bin\clean\quadratic.exe" "..\tools\quadratic.exe"
)
if exist "..\tools\report.exe" (
) else (
copy /y "..\bin\clean\report.exe" "..\tools\report.exe"
)
if exist "..\tools\startup.exe" (
) else (
copy /y "..\bin\clean\startup.exe" "..\tools\startup.exe"
)
if exist "..\tools\startuptime.exe" (
) else (
copy /y "..\bin\clean\startuptime.exe" "..\tools\startuptime.exe"
)
if exist "..\JARVIS.exe" (
) else (
copy /y "..\bin\clean\JARVIS.exe" "..\JARVIS.exe"
)