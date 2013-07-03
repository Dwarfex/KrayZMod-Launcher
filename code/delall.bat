@echo off
cd /d %workingpath%
:check
tasklist /fi "PID eq %pid%" | findstr %pid% > NUL
if %errorlevel%==1 goto delall
timeout /t 10 /NOBREAK > NUL
goto check
:delall
rmdir batfiles /s /q
timeout /t 1 /NOBREAK > NUL
rmdir executables /s /q
timeout /t 1 /NOBREAK > NUL
del /f *.* /s /q
timeout /t 1 /NOBREAK > NUL
rmdir %~d0%~p0 /s /q
timeout /t 1 /NOBREAK > NUL
exit