@echo off
:check
timeout /t 30 /NOBREAK > NUL
tasklist /fi "tasklist /fi "imagename eq md5.exe" | findstr md5.exe > NUL
if %errorlevel%==1 goto closelauncher
goto check
:closelauncher
set errorlevel=0
timeout /t 4 /NOBREAK > NUL
::rechecking, this makes me horny
tasklist /fi "tasklist /fi "imagename eq md5.exe" | findstr md5.exe > NUL
if %errorlevel%==0 goto check
start %stuckedmsg%
taskkill /f /pid %pid%
exit