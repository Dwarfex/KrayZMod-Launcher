@echo off
color 0F
mode 70,24
set title=KrayZ Launcher stucked
echo.
echo KrayZ Launcher stucked and closed automatically.
echo Check error.log for more information!
echo If this happens twice open a support-thread at kraZey.de
timeout /t 10 /NOBREAK > NUL
exit