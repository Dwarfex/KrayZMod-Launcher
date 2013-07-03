@echo off
color 0F
mode 70,24
set title=KrayZ Launcher
title %title%
set krayzlauncher=1.514
set a= 
set b=%%
echo %a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%Launcher Version: %krayzlauncher%
timeout /t 1 /NOBREAK > NUL
REM cd /d "%~dp0"
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:://///////////////////////////////////////////////////////////////////// CREATING DIRS FOR TEMPFILES + MOVE ////////////////////////////////////////////////////////////////////
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
mkdir executables
mkdir batfiles
move /Y fgrep.exe executables > NUL
move /Y md5.exe executables > NUL
move /Y unix2dos.exe executables > NUL
move /Y UnRAR.exe executables > NUL
move /Y wget.exe executables > NUL
move /Y cp.exe executables > NUL
::move /Y cpuz.exe executables > NUL
move /Y arma2sizecheck.bat batfiles > NUL
move /Y arma2oasizecheck.bat batfiles > NUL
move /Y arma2md5check.bat batfiles > NUL
move /Y arma2oamd5check.bat batfiles > NUL
move /Y krayzcheck.bat batfiles > NUL
move /Y progressbar.bat batfiles > NUL
move /Y checkifstucked.bat batfiles > NUL
move /Y stuckedmsg.bat batfiles > NUL
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:://///////////////////////////////////////////////////////////////////// SETTING UP VARIABLES //////////////////////////////////////////////////////////////////////////////////
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
set datetime=%date%%time% -
set workingpath=%cd%
set fgrep=%workingpath%\executables\fgrep.exe
set md5=%workingpath%\executables\md5.exe
set unix2dos=%workingpath%\executables\unix2dos.exe
set unrar=%workingpath%\executables\UnRAR.exe
set wget=%workingpath%\executables\wget.exe
set copy=%workingpath%\executables\cp.exe
set startx=%workingpath%\startx.exe
set cpuz=%workingpath%\cpuz.exe
set arma2sizecheckbat=%workingpath%\batfiles\arma2sizecheck.bat
set arma2oasizecheckbat=%workingpath%\batfiles\arma2oasizecheck.bat
set arma2md5checkbat=%workingpath%\batfiles\arma2md5check.bat
set arma2oamd5checkbat=%workingpath%\batfiles\arma2oamd5check.bat
set krayzcheckbat=%workingpath%\batfiles\krayzcheck.bat
set progressbar=%workingpath%\batfiles\progressbar.bat
set checkifstucked=%workingpath%\batfiles\checkifstucked.bat
set stuckedmsg=%workingpath%\batfiles\stuckedmsg.bat
set delall=%workingpath%\delall.bat
set custom=
timeout /t 1 /NOBREAK > NUL
for /f "delims=" %%l in ('for /f "skip=3 tokens=2" %%p in ^('tasklist /fi "windowtitle eq Administrator:  %title%"'^) do @^<NUL set /p "=%%p "') do (if not defined pid set "pid=%%l")
for /f "delims=" %%l in ('for /f "skip=3 tokens=2" %%p in ^('tasklist /fi "windowtitle eq %title%"'^) do @^<NUL set /p "=%%p "') do (if not defined pid set "pid=%%l")
for /f "delims=" %%l in ('for /f "skip=3 tokens=3" %%p in ^('tasklist /fi "windowtitle eq Administrator:  %title%"'^) do @^<NUL set /p "=%%p "') do (if not %pid:~0,1% LEQ 9 set "pid=%%l")
for /f "delims=" %%l in ('for /f "skip=3 tokens=3" %%p in ^('tasklist /fi "windowtitle eq %title%"'^) do @^<NUL set /p "=%%p "') do (if not %pid:~0,1% LEQ 9 set "pid=%%l")
for /f "delims=" %%l in ('for /f "skip=3 tokens=4" %%p in ^('tasklist /fi "windowtitle eq Administrator:  %title%"'^) do @^<NUL set /p "=%%p "') do (if not %pid:~0,1% LEQ 9 set "pid=%%l")
for /f "delims=" %%l in ('for /f "skip=3 tokens=4" %%p in ^('tasklist /fi "windowtitle eq %title%"'^) do @^<NUL set /p "=%%p "') do (if not %pid:~0,1% LEQ 9 set "pid=%%l")
if %pid:~0,1% LEQ 9 title %title% - PID: %pid%
if %pid:~0,1% LEQ 9 timeout /t 2 /NOBREAK > NUL
if %pid:~0,1% LEQ 9 title %title%
if not %pid:~0,1% LEQ 9 title ERROR #001
if not %pid:~0,1% LEQ 9 echo Closing Launcher.. (can not define pid)
if not %pid:~0,1% LEQ 9 goto closeaddonsnotfound
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:://///////////////////////////////////////////////////////////////////// LOOKING FOR ARMA 2 & OA ///////////////////////////////////////////////////////////////////////////////
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
title %title% - Detecting ArmA 2 / ArmA 2 OA Path
for /F "skip=2 usebackq tokens=2* delims= " %%a IN (`reg query "HKLM\SOFTWARE\Wow6432Node\Bohemia Interactive Studio\ArmA 2" /v "main"`) do set arma2path=%%b
for /F "skip=2 usebackq tokens=2* delims= " %%a IN (`reg query "HKLM\SOFTWARE\Wow6432Node\Bohemia Interactive Studio\ArmA 2 OA" /v "main"`) do set arma2oapath=%%b
if not defined arma2path for /F "skip=2 usebackq tokens=2* delims= " %%a IN (`reg query "HKLM\SOFTWARE\Bohemia Interactive Studio\ArmA 2" /v "main"`) do set arma2path=%%b
if not defined arma2oapath for /F "skip=2 usebackq tokens=2* delims= " %%a IN (`reg query "HKLM\SOFTWARE\Bohemia Interactive Studio\ArmA 2 OA" /v "main"`) do set arma2oapath=%%b
if not defined arma2path set arma2path=%arma2oapath%
timeout /t 1 /NOBREAK > NUL
if "%arma2path%\" EQU "%arma2oapath%\" title %title% - Bohema Interactive Version or Other detected..
if "%arma2path%\" NEQ "%arma2oapath%\" title %title% - Combined Operations (Steam) detected..
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:://///////////////////////////////////////////////////////////////////// FIRST LOGGING, EVENT + ERROR LOG //////////////////////////////////////////////////////////////////////
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
timeout /t 1 /NOBREAK > NUL
cls
title %title% - Starting Event- and Errorlogger
cd /d %arma2oapath%
%startx% /b %delall%
echo %datetime% ############### Starting KrayZ Eventlog ############### >> "event.log"
echo %datetime% ############### Starting KrayZ Errorlog ############### >> "error.log"
if not defined arma2path echo No registry entry for ArmA 2 found.. Closing Launcher..
if not defined arma2path echo No registry entry for ArmA 2 found.. >> "error.log"
if not defined arma2path echo Reinstall ArmA 2 =)
if not defined arma2path set error=true
if defined arma2path echo ArmA 2 registry query found!
if defined arma2path echo %datetime% ArmA 2 registry query found! >> "event.log"
timeout /t 1 /NOBREAK > NUL
if not defined arma2oapath echo No registry entry for ArmA 2 OA found.. Closing Launcher..
if not defined arma2oapath echo No registry entry for ArmA 2 OA found.. >> "error.log"
if not defined arma2oapath echo Reinstall ArmA 2 OA =)
if not defined arma2oapath set error=true
if defined arma2oapath echo ArmA 2 OA registry query found!
if defined arma2oapath echo %datetime% ArmA 2 OA registry query found! >> "event.log"
timeout /t 1 /NOBREAK > NUL
if '%error%' == 'true' goto closeaddonsnotfound
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:://///////////////////////////////////////////////////////////////////// DOWNLOADING LATEST CHECKFILES ETC /////////////////////////////////////////////////////////////////////
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
title %title% - Dowloading latest checkfiles
%wget% -q http://krazey.de/files/krayz/checkfiles.rar
%unrar% x -y -inul checkfiles.rar
title %title%
del checkfiles.rar > NUL
cls
rename latest.tmp latest.txt
move /Y latest.txt %workingpath% > NUL
if exist %workingpath%\latest.txt for /f "delims=" %%x in (%workingpath%\latest.txt) do (set "%%x")
if exist %workingpath%\latest.txt del %workingpath%\latest.txt > NUL
rename latestdev.tmp latestdev.txt
move /Y latestdev.txt %workingpath% > NUL
if exist %workingpath%\latestdev.txt for /f "delims=" %%x in (%workingpath%\latestdev.txt) do (set "%%x")
if exist %workingpath%\latestdev.txt del %workingpath%\latestdev.txt > NUL
move /Y krayzlaunchercur.txt %workingpath% > NUL
for /f "delims=" %%x in (%workingpath%\krayzlaunchercur.txt) do (set krayzlaunchercur=%%x)
if defined krayzlaunchercur set krayzlaunchercur=%krayzlaunchercur: =%
if exist %workingpath%\krayzlaunchercur.txt del %workingpath%\krayzlaunchercur.txt > NUL
rename arma2oabeta.tmp arma2oabeta_orig.txt
move /Y arma2oabeta_orig.txt %workingpath% > NUL
rename arma2oadown.tmp arma2oadown.txt
move /Y arma2oadown.txt %workingpath% > NUL
for /f "delims=" %%x in (%workingpath%\arma2oadown.txt) do (set "%%x")
rename krayzmd5all.tmp krayzmd5all.txt
move /Y krayzmd5all.txt %workingpath% > NUL
:checkfiles
if not defined krayzver goto checkfiles1
if not defined krayzverdev goto checkfiles2
if not defined krayzlaunchercur goto checkfiles3
if not defined oabetadownload goto checkfiles4
if not exist %workingpath%\arma2oadown.txt goto checkfiles5
if not exist %workingpath%\krayzmd5all.txt goto checkfiles6
goto checkfilescomplete
:checkfiles1
if not exist %workingpath%\latest.tmp %wget% -q http://krazey.de/files/krayz/latest.tmp
if not exist %workingpath%\latest.tmp rename latest.tmp latest.txt
if not exist %workingpath%\latest.tmp move /Y latest.txt %workingpath% > NUL
if exist %workingpath%\latest.tmp for /f "delims=" %%x in (%workingpath%\latest.txt) do (set "%%x")
if exist %workingpath%\latest.tmp del %workingpath%\latest.txt > NUL
goto checkfiles
:checkfiles2
if not exist %workingpath%\latestdev.tmp %wget% -q http://krazey.de/files/krayz/latestdev.tmp
if not exist %workingpath%\latestdev.tmp rename latestdev.tmp latestdev.txt
if not exist %workingpath%\latestdev.tmp move /Y latestdev.txt %workingpath% > NUL
if exist %workingpath%\latestdev.txt for /f "delims=" %%x in (%workingpath%\latestdev.txt) do (set "%%x")
if exist %workingpath%\latestdev.txt del %workingpath%\latestdev.txt > NUL
goto checkfiles
:checkfiles3
if not exist %workingpath%\krayzlaunchercur.txt %wget% -q http://krazey.de/files/krayz/krayzlaunchercur.txt
if not exist %workingpath%\krayzlaunchercur.txt move /Y krayzlaunchercur.txt %workingpath% > NUL
if exist %workingpath%\krayzlaunchercur.txt for /f "delims=" %%x in (%workingpath%\krayzlaunchercur.txt) do (set krayzlaunchercur=%%x)
if defined krayzlaunchercur set krayzlaunchercur=%krayzlaunchercur: =%
if exist %workingpath%\krayzlaunchercur.txt del %workingpath%\krayzlaunchercur.txt > NUL
goto checkfiles
:checkfiles4
if not exist %workingpath%\arma2oadown.tmp %wget% -q http://krazey.de/files/krayz/arma2oadown.tmp
if not exist %workingpath%\arma2oadown.tmp rename arma2oadown.tmp arma2oadown.txt
if not exist %workingpath%\arma2oadown.tmp move /Y arma2oadown.txt %workingpath% > NUL
if exist %workingpath%\arma2oadown.tmp for /f "delims=" %%x in (%workingpath%\arma2oadown.txt) do (set "%%x")
if exist %workingpath%\arma2oadown.txt del %workingpath%\arma2oadown.txt > NUL
goto checkfiles
:checkfiles5
if not exist %workingpath%\arma2oabeta.tmp %wget% -q http://krazey.de/files/krayz/arma2oabeta.tmp
if not exist %workingpath%\arma2oabeta.tmp rename arma2oabeta.tmp arma2oabeta_orig.txt
if not exist %workingpath%\arma2oabeta.tmp move /Y arma2oabeta_orig.txt %workingpath% > NUL
goto checkfiles
:checkfiles6
if not exist %workingpath%\krayzmd5all.tmp %wget% -q http://krazey.de/files/krayz/krayzmd5all.tmp
if not exist %workingpath%\krayzmd5all.txt rename krayzmd5all.tmp krayzmd5all.txt
if not exist %workingpath%\krayzmd5all.txt move /Y krayzmd5all.txt %workingpath% > NUL
if exist %workingpath%\krayzmd5all.txt del %workingpath%\krayzmd5all.txt > NUL
goto checkfiles
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:://///////////////////////////////////////////////////////////////////// CREATING CONFIG - SETTING UP VARIABLES VIA CONFIG /////////////////////////////////////////////////////
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:checkfilescomplete
if not exist config.ini echo First launch of KrayZ Launcher, checking all files!
if not exist config.ini timeout /t 2 /NOBREAK > NUL
if exist config.ini for /f "delims=" %%x in (config.ini) do (set "%%x")
if exist config.ini echo config.ini found!
if not exist config.ini set version=0.000
if not exist config.ini echo version=0.000>> "config.ini"
if defined skipchecks set skipchecks=%skipchecks: =%
if exist config.ini timeout /t 1 /NOBREAK > NUL
:restart
if '%skipupdates%' == 'true' title %title% - Skipped Autoupdater..
if '%skipupdates%' == 'true' echo Autoupdater has been disabled! Loading Server Selecion..
if '%skipupdates%' == 'true' timeout /t 4 /NOBREAK > NUL
if '%skipupdates%' == 'true' goto skipupdates
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:://///////////////////////////////////////////////////////////////////// VERSION CHECK, DETECTING HARDWARE /////////////////////////////////////////////////////////////////////
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:start
title %title% - Version check
cls
echo Checking KrayZ Launcher..
echo Current/Latest: %krayzlauncher%/%krayzlaunchercur%
timeout /t 2 /NOBREAK > NUL
if %krayzlauncher% == %krayzlaunchercur% echo KrayZ Launcher up to date!
if %krayzlauncher% == %krayzlaunchercur% goto startlauncher
echo KrayZ Launcher outdated!
timeout /t 1 /NOBREAK > NUL
echo Download latest KrayZ Launcher to downloads:
echo %userprofile%\Downloads\
%wget% -o %workingpath%\krayz.log "http://krazey.de/files/krayz/KrayZ Launcher.exe"
echo Opening now dowloads directory..
move /Y "KrayZ Launcher.exe" %userprofile%\downloads\ > NUL
timeout /t 1 /NOBREAK > NUL
start explorer.exe "%userprofile%\downloads\"
exit
:startlauncher
::title %title% - Detecting hardware (cpu)
title %title% - Detecting hardware..
timeout /t 1 /NOBREAK > NUL
if not defined version echo Detecting KrayZ Version..
if '%skipchecks%' == 'true' goto updater
cls
::Old
::echo Detecting number of Cores..
::%cmdow% /run /hid wmic
::cls
::if %errorlevel% == 1 goto skip
::echo %errorlevel% == 0 goto
::pause
::taskkill /f /fi "imagename eq wmic.exe"
::for /F "skip=1 tokens=*" %%x in ('wmic cpu get NumberOfCores') do if not defined cores set cores=%%x
::for /F "skip=1 tokens=*" %%x in ('wmic cpu get NumberOfLogicalProcessors') do if not defined threads set threads=%%x
::for /F "skip=1 tokens=*" %%x in ('wmic cpu get Name') do if not defined cpu set cpu=%%x
::set cores=%cores: =%
::set threads=%threads: =%
echo Detecting hardware..
timeout /t 1 /NOBREAK > NUL
cls
echo Using cpuz.exe
echo Version 1.64
echo April 2013
echo.
echo Contact : cpuz@cpuid.com
echo Web page: http://www.cpuid.com/softwares/cpu-z.html
echo Validation page : http://valid.canardpc.com
echo Hall of Fame : http://valid.canardpc.com/records.php
echo Forum : http://forum.canardpc.com/forumdisplay.php?f=74
echo CPUID SDK : http://www.cpuid-pro.com/products-services.php
cd /d %workingpath%
%cpuz% -txt=cpuzlog
cd /d %arma2oapath%
cls
for /F "tokens=3,4" %%a in ('findstr "of.processors of.cores of.threads" %workingpath%\cpuzlog.txt') do set %%a=%%b
timeout /t 1 /NOBREAK > NUL
set cores=%cores: =%
set threads=%threads: =%
timeout /t 1 /NOBREAK > NUL
for /F "tokens=2*" %%a in ('findstr "Specification" %workingpath%\cpuzlog.txt')  do set cpu=%%a %%b
timeout /t 1 /NOBREAK > NUL
for /F "tokens=2*" %%a in ('findstr "Name" %workingpath%\cpuzlog.txt')  do set gpu=%%a %%b
cls
timeout /t 1 /NOBREAK > NUL
if '%cores%' NEQ '%threads%' echo Your CPU: %cpu%
if '%cores%' NEQ '%threads%' echo Number of cores/threads: %cores% cores and %threads% threads.
if '%cores%' NEQ '%threads%' echo %datetime% Your CPU: %cpu% >> "event.log"
if '%cores%' NEQ '%threads%' echo %datetime% Number of cores/threads: %cores% cores and %threads% threads. >> "event.log"
if '%cores%' EQU '%threads%' echo Your CPU: %cpu%
if '%cores%' EQU '%threads%' echo Number of cores/threads: %cores% cores/threads.
if '%cores%' EQU '%threads%' echo %datetime% Your CPU: %cpu% >> "event.log"
if '%cores%' EQU '%threads%' echo %datetime% Number of cores/threads: %cores% cores/threads. >> "event.log"
echo Your GPU: %gpu%
echo %datetime% Your GPU: %gpu% >> "event.log"
timeout /t 3 /NOBREAK > NUL
cls
title %title% - Checking ArmA 2 Version..
echo Checking ArmA 2 Version..
timeout /t 2 /NOBREAK > NUL
cls
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if exist "AddOns" goto check
if not exist "AddOns" cd %arma2path%
if exist "AddOns" goto check
if not exist "AddOns" echo ArmA 2 AddOns not found!
if not exist "AddOns" echo Copy the ArmA2 AddOns folder and place it within the ArmA2 OA folder!
if not exist "AddOns" echo Launcher will be closed in the next five seconds!
if not exist "AddOns" echo ArmA 2 AddOns not found! Copy the ArmA2 AddOns folder and place it within the ArmA2 OA folder! >> "error.log"
if not exist "AddOns" goto closeaddonsnotfound
cls
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:://///////////////////////////////////////////////////////////////////// CHECKING ARMA 2 FILESIZE //////////////////////////////////////////////////////////////////////////////
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:check
title %title% - Checking ArmA 2 filesize
echo Checking now ArmA 2 files!
set current=arma2sizecheck.txt
set checkfile=arma2sizecheck_orig.txt
%startx% /b %arma2sizecheckbat%
call %progressbar%
title %title% - Checking ArmA 2 filesize
for %%F in (%workingpath%\%current%) do set arma2sizecheck=%%~zF
for %%F in (%workingpath%\%checkfile%) do set arma2sizecheck_orig=%%~zF
for /f "delims=" %%a in (%workingpath%\%current%) do findstr /i /X /C:"%%a" %workingpath%\%checkfile% || echo %datetime% CHANGED: %%a>>error.log
cls
if '%arma2sizecheck%' NEQ '%arma2sizecheck_orig%' echo %datetime% Missing data in ArmA 2 AddOns corrputed! Update or reinstall your ArmA 2 OA! >> error.log
if '%arma2sizecheck%' NEQ '%arma2sizecheck_orig%' echo Missing data in ArmA 2 AddOns! Update or reinstall your ArmA 2 OA!
if '%arma2sizecheck%' NEQ '%arma2sizecheck_orig%' set error=1
if '%arma2sizecheck%' EQU '%arma2sizecheck_orig%' echo ArmA 2 size-check complete, no errors found!
del %workingpath%\%current% > NUL
del %workingpath%\%checkfile% > NUL
timeout /t 2 /NOBREAK > NUL
cls
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:://///////////////////////////////////////////////////////////////////// CHECKING ARMA 2 MD5 HASH //////////////////////////////////////////////////////////////////////////////
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
title %title% - Checking ArmA 2 md5 hashes
echo Checking ArmA 2 md5 hashes (can take up to 2 minutes)..
set current=arma2md5check.txt
set checkfile=arma2md5check_orig.txt
%startx% /b %arma2md5checkbat%
for /f "delims=" %%l in ('for /f "skip=3 tokens=2" %%p in ^('tasklist /fi "imagename eq cmd.exe"'^) do @^<NUL set /p "=%%p "') do (set "PIDs=%%l")
%startx% /b %checkifstucked%
for /f "skip=3 tokens=2" %%p in ('tasklist /fi "imagename eq cmd.exe"') do (echo %PIDs% | find "%%p" > NUL || if not defined PIDCHECK set "PIDCHECK=%%p")
call %progressbar%
taskkill /f /pid %PIDCHECK%
title %title% - Checking ArmA 2 md5 hashes
for /f "delims=" %%a in (%workingpath%\%current%) do findstr /i /X /C:"%%a" %workingpath%\%checkfile% || echo %datetime% CHANGED: %%a>> "error.log"
cls
echo ArmA 2 md5-check complete
del %workingpath%\%current% > NUL
del %workingpath%\%checkfile% > NUL
cls
timeout /t 2 /NOBREAK > NUL
cls
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:://///////////////////////////////////////////////////////////////////// CHECKING ARMA 2 OA FILESIZE ///////////////////////////////////////////////////////////////////////////
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
cd %arma2oapath%
cd /d %arma2oapath%
title %title% - Checking ArmA 2 OA filesize
echo Checking now ArmA 2 OA files!
set current=arma2oasizecheck.txt
set checkfile=arma2oasizecheck_orig.txt
%startx% /b %arma2oasizecheckbat%
call %progressbar%
for %%F in (%workingpath%\%current%) do set arma2oalog=%%~zF
for %%F in (%workingpath%\%checkfile%) do set arma2oalog_orig=%%~zF
title %title% - Checking ArmA 2 OA filesize
for /f "delims=" %%a in (%workingpath%\%current%) do findstr /i /X /C:"%%a" %workingpath%\%checkfile% || echo %datetime% CHANGED: %%a>> "error.log"
cls
if '%arma2oalog%' NEQ '%arma2oalog_orig%' echo %datetime% Missing data in ArmA 2 OA Expansion\AddOns or corrupted! Update or reinstall your ArmA 2 OA! >> "error.log"
if '%arma2oalog%' NEQ '%arma2oalog_orig%' echo Missing data in ArmA 2 OA Expansion\AddOns! Update or reinstall your ArmA 2 OA!
if '%arma2oalog%' NEQ '%arma2oalog_orig%' set error=1
if '%arma2oalog%' EQU '%arma2oalog_orig%' echo ArmA 2 OA check complete, no errors found!
del %workingpath%\%current% > NUL
del %workingpath%\%checkfile% > NUL
timeout /t 5 /NOBREAK > NUL
cls
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:://///////////////////////////////////////////////////////////////////// CHECKING ARMA 2 OA MD5 HASH ///////////////////////////////////////////////////////////////////////////
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
title %title% - Checking ArmA 2 OA md5 hashes..
echo Checking ArmA 2 OA md5 hashes (can take up to 2 minutes)..
set current=arma2oamd5check.txt
set checkfile=arma2oamd5check_orig.txt
%startx% /b %arma2oamd5checkbat%
for /f "delims=" %%l in ('for /f "skip=3 tokens=2" %%p in ^('tasklist /fi "imagename eq cmd.exe"'^) do @^<NUL set /p "=%%p "') do (set "PIDs=%%l")
%startx% /b %checkifstucked%
for /f "skip=3 tokens=2" %%p in ('tasklist /fi "imagename eq cmd.exe"') do (echo %PIDs% | find "%%p" > NUL || if not defined PIDCHECK set "PIDCHECK=%%p")
call %progressbar%
taskkill /f /pid %PIDCHECK%
title %title% - Checking ArmA 2 OA md5 hashes..
for /f "delims=" %%a in (%workingpath%\%current%) do findstr /i /X /C:"%%a" %workingpath%\%checkfile% || echo %datetime% CHANGED: %%a>> "error.log"
cls
echo ArmA 2 OA md5-check complete
del %workingpath%\%current% > NUL
del %workingpath%\%checkfile% > NUL
timeout /t 3 /NOBREAK > NUL
cls
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:://///////////////////////////////////////////////////////////////////// CHECKING ARMA 2 OA BETA ///////////////////////////////////////////////////////////////////////////////
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:recheckbeta
title %title% - Checking ArmA 2 OA beta
if not defined betacounter set betacounter=0
if '%betacounter%' == '0' echo Checking ArmA 2 OA Beta..
if '%betacounter%' == '1' echo Re-Checking ArmA 2 OA Beta..
if '%betacounter%' == '0' timeout /t 2 /NOBREAK > NUL
if '%betacounter%' == '1' timeout /t 2 /NOBREAK > NUL
if exist %workingpath%\arma2oabeta.txt del %workingpath%\arma2oabeta.txt > NUL
if exist %workingpath%\betaerror.log del %workingpath%\betaerror.log > NUL
%md5% Expansion\beta\arma2oa.exe >> "%workingpath%\arma2oabeta.txt"
title %title% - Checking ArmA 2 OA beta hashes..
for /f "delims=" %%a in (%workingpath%\arma2oabeta.txt) do findstr /i /X /C:"%%a" %workingpath%\arma2oabeta_orig.txt || echo %datetime% CHANGED: %%a>> "%workingpath%\betaerror.log"
if not exist %workingpath%\betaerror.log cls
if not exist %workingpath%\betaerror.log echo ArmA 2 OA Beta is up to date!
if not exist %workingpath%\betaerror.log timeout /t 2 /NOBREAK > NUL
if not exist %workingpath%\betaerror.log set arma2oabetapatch=true
if not exist %workingpath%\betaerror.log goto checkend
if exist %workingpath%\betaerror.log cls
if exist %workingpath%\betaerror.log echo ArmA 2 OA Beta outdated!
if exist %workingpath%\betaerror.log echo %datetime% ArmA 2 OA Beta outdated! >> "event.log"
if exist %workingpath%\betaerror.log timeout /t 3 /NOBREAK > NUL
if exist %workingpath%\betaerror.log echo Downloading latest ArmA 2 OA Beta for KrayZ!
if exist %workingpath%\betaerror.log echo Downloading %oabetadownload% >> "event.log"
if exist %workingpath%\betaerror.log %wget% -o %workingpath%\krayz.log %oabetadownload%
if exist %workingpath%\betaerror.log timeout /t 3 /NOBREAK > NUL
if exist %workingpath%\betaerror.log echo Starting Installation in the next seconds..
if exist %workingpath%\betaerror.log timeout /t 3 /NOBREAK > NUL
if exist %workingpath%\betaerror.log start "" %oainstallexe%
for /f "delims=" %%l in ('for /f "skip=3 tokens=2" %%p in ^('tasklist /fi "imagename eq ARMA2_OA_Build_*"'^) do @^<NUL set /p "=%%p "') do (if not defined betainstallpid set "betainstallpid=%%l")
if exist %workingpath%\betaerror.log title %title%
if exist %workingpath%\betaerror.log timeout /t 1 /NOBREAK > NUL
cls
:installcheck
if not defined arma2oabetapatch echo Waiting..
set arma2oabetapatch=true
tasklist /fi "pid eq %betainstallpid%" | findstr %betainstallpid% > NUL
if %errorlevel%==1 goto installcomplete
timeout /t 1 /NOBREAK > NUL
goto installcheck
:installcomplete
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:://///////////////////////////////////////////////////////////////////// CHECKEND //////////////////////////////////////////////////////////////////////////////////////////////
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:checkend
cls
if '%error%' == '1' title %title% - ERROR #002
if '%error%' == '1' echo Errors found, check error.log, Launcher will be closed in the next seconds!
if not '%error%' == '1' title %title% - No errors found..
if not '%error%' == '1' echo Starting KrayZ DayZ Updater in the next three seconds =)
if not '%error%' == '1' %fgrep% -v "skipchecks" config.ini > config2.ini
if not '%error%' == '1' del config.ini > NUL
if not '%error%' == '1' rename config2.ini config.ini > NUL
if not '%error%' == '1' %unix2dos% config.ini > NUL
if not '%error%' == '1' echo skipchecks=true>> "config.ini"
timeout /t 3 /NOBREAK > NUL
cls
if not '%error%' == '1' goto updater
if '%error%' == '1' exit
cls
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:://///////////////////////////////////////////////////////////////////// KRAYZ FULL UPDATER ////////////////////////////////////////////////////////////////////////////////////
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:updater
cd %arma2oapath%
cd /d %arma2oapath%
title %title% - Starting Updater..
if not '%arma2oabetapatch%' == 'true' goto recheckbeta
cls
::if '%version%' == '%krayzver%' goto serverselection
if not '%version%' == '%krayzver%' echo KrayZ (Current/Latest: %version%/%krayzver%)
if '%version%' == '%krayzver%' echo KrayZ (Current/Latest: %version%/%krayzver%)
if '%version%' == '%krayzver%' echo Checking KrayZ files for errors..
if '%version%' == '%krayzver%' goto patchrecheck
if exist "@KrayZ" echo KrayZ Version found!
if exist "@KRAYZ_CBA+JSRS" echo KrayZ CBA+JSRS Version found!
if exist "@KrayZ" goto patchdownload
if not exist "@KrayZ" echo No previous KrayZ Version found!
if not exist "@KrayZ" echo %datetime% No previous KrayZ Version found! >> "event.log"
if not exist "@KrayZ" goto fulldownload1
:fulldownload1
title %title% - Updating KrayZ..
if exist @KrayZ rmdir @KrayZ /s /q > NUL
if '%krayzupdatecounter%' == '2' set /a krayzupdatecounter=%krayzupdatecounter%+1 > NUL
echo Downloading latest KrayZ now.. (v%krayzver%)
echo This could take a few minutes ;)
echo %datetime% Downloading latest KrayZ now.. (v%krayzver%) >> "event.log"
if exist KrayZ_%krayzver%_full.rar del KrayZ_%krayzver%_full.rar > NUL
%wget% -o %workingpath%\krayz.log http://krazey.ximensions-server.de/KrayZ_%krayzver%_full.rar
%unrar% x -y KrayZ_%krayzver%_full.rar
title %title%
del KrayZ_%krayzver%_full.rar > NUL
timeout /t 5 /NOBREAK > NUL
cls
if '%krayzupdatecounter%' == '3' echo Downloaded and unpacked latest KrayZ!
if '%krayzupdatecounter%' == '3' echo Rechecking KrayZ files..
if '%krayzupdatecounter%' == '3' timeout /t 5 /NOBREAK > NUL
if '%krayzupdatecounter%' == '3' cls
if '%krayzupdatecounter%' == '3' goto patchrecheck
if not exist "@KRAYZ_CBA+JSRS" echo No previous KrayZ CBA+JSRS Version found!
if not exist "@KRAYZ_CBA+JSRS" echo %datetime% No previous KrayZ CBA+JSRS Version found! >> "event.log"
if not exist "@KRAYZ_CBA+JSRS" goto fulldownload2
:fulldownload2
title %title% - Updating KrayZ CBA+JSRS..
if exist @KRAYZ_CBA+JSRS rmdir @KRAYZ_CBA+JSRS /s /q > NUL
echo Downloading latest KRAYZ_CBA+JSRS now.. (v%krayzcba%)
echo This could take a few minutes ;)
echo %datetime% Downloading latest KRAYZ_CBA+JSRS now.. (v%krayzcba%) >> "event.log"
if exist KrayZ_%krayzcba%_CBA_JSRS_full.rar del KrayZ_%krayzcba%_CBA_JSRS_full.rar > NUL
%wget% -o %workingpath%\krayz.log http://krazey.ximensions-server.de/KrayZ_%krayzcba%_CBA_JSRS_full.rar
%unrar% x -y KrayZ_%krayzcba%_CBA_JSRS_full.rar
title %title%
del KrayZ_%krayzcba%_CBA_JSRS_full.rar > NUL
timeout /t 5 /NOBREAK > NUL
cls
if '%krayzupdatecounter%' == '4' echo Downloaded and unpacked latest KrayZ CBA+JSRS!
if '%krayzupdatecounter%' == '4' echo Fullpatched KrayZ, ..loading Server Selection now!
if '%krayzupdatecounter%' == '4' timeout /t 5 /NOBREAK > NUL
if '%krayzupdatecounter%' == '4' %fgrep% -v "version" config.ini > config2.ini
if '%krayzupdatecounter%' == '4' del config.ini > NUL
if '%krayzupdatecounter%' == '4' rename config2.ini config.ini > NUL
if '%krayzupdatecounter%' == '4' %unix2dos% config.ini > NUL
if '%krayzupdatecounter%' == '4' echo version=%krayzver%>> "config.ini"
if '%krayzupdatecounter%' == '4' cls
if '%krayzupdatecounter%' == '4' goto serverselection
if not defined version echo version=%krayzver%>> "config.ini"
echo Starting KrayZ Server Selection in the next seconds!
timeout /t 5 /NOBREAK > NUL
goto serverselection
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:://///////////////////////////////////////////////////////////////////// KRAYZ PATCH UPDATER ///////////////////////////////////////////////////////////////////////////////////
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:patchdownload
cd %arma2oapath%
cd /d %arma2oapath%
cls
if not exist "@KRAYZ_CBA+JSRS" echo No previous KrayZ CBA+JSRS Version found!
if not exist "@KRAYZ_CBA+JSRS" echo %datetime% No previous KrayZ CBA+JSRS Version found! >> "event.log"
if not exist "@KRAYZ_CBA+JSRS" goto fulldownload2
if not '%version%' == '%krayzver%' echo KrayZ (Current/Latest: %version%/%krayzver%)
if not '%version%' == '%krayzver%' echo Checking @KrayZ and @KRAYZ_CBA+JSRS md5 hashes..
if not '%version%' == '%krayzver%' echo (can take up to 2 minutes)
if not defined version echo Checking @KrayZ and @KRAYZ_CBA+JSRS md5 hashes..
if not defined version echo (can take up to 2 minutes)
:patchrecheck
set current=krayzlogfile.txt
set checkfile=krayzmd5all.txt
%startx% /b %krayzcheckbat%
for /f "delims=" %%l in ('for /f "skip=3 tokens=2" %%p in ^('tasklist /fi "imagename eq cmd.exe"'^) do @^<NUL set /p "=%%p "') do (set "PIDs=%%l")
%startx% /b %checkifstucked%
for /f "skip=3 tokens=2" %%p in ('tasklist /fi "imagename eq cmd.exe"') do (echo %PIDs% | find "%%p" > NUL || if not defined PIDCHECK set "PIDCHECK=%%p")
call %progressbar%
taskkill /f /pid %PIDCHECK%
set md5error=false
title %title% - Checking KrayZ md5 hashes..
for /f "delims=" %%a in (%workingpath%\%current%) do findstr /i /X /C:"%%a" %workingpath%\%checkfile% || echo %datetime% CHANGED: %%a>> "%workingpath%\md5error.log"
cls
for %%F in ("%workingpath%\%current%") do set "krayzlogfile=%%~zF"
for %%F in ("%workingpath%\%checkfile%") do set "krayzmd5all=%%~zF"
del %workingpath%\%current% > NUL
if exist %workingpath%\md5error.log set md5error=true
if '%krayzlogfile%' NEQ '%krayzmd5all%' set md5error=true
if "%md5error%;%krayzupdatecounter%"=="true;1" ( set /a krayzupdatecounter=%krayzupdatecounter%+1 > NUL )
if '%krayzupdatecounter%' == '2' goto fulldownload1
if "%md5error%;%krayzupdatecounter%"=="true;3" ( set /a krayzupdatecounter=%krayzupdatecounter%+1 > NUL )
if '%krayzupdatecounter%' == '4' goto fulldownload2
if '%krayzlogfile%' NEQ '%krayzmd5all%' echo %datetime% Missing data in KrayZ! Updateing KrayZ now.. >> error.log
if '%krayzlogfile%' NEQ '%krayzmd5all%' echo Missing data in KrayZ! Updating KrayZ now..
if '%krayzlogfile%' NEQ '%krayzmd5all%' timeout /t 5 /NOBREAK > NUL
if '%krayzlogfile%' NEQ '%krayzmd5all%' goto ifupdatetrue
if exist %workingpath%\md5error.log echo title %title% - KrayZ is outdated or corrupted..
if exist %workingpath%\md5error.log echo Your KrayZ is outdated or corrupted!
if exist %workingpath%\md5error.log set update=true
if exist %workingpath%\md5error.log echo Downloading latest patch! This could take a few minutes ;)
if exist %workingpath%\md5error.log echo %datetime% Downloading latest patch! >> "event.log"
if exist %workingpath%\md5error.log goto ifupdatetrue
if not exist %workingpath%\md5error.log title %title% - All up to date..
if not exist %workingpath%\md5error.log echo KrayZ is up to date!
if not exist %workingpath%\md5error.log echo %datetime% KrayZ is up to date! >> "event.log"
if not exist %workingpath%\md5error.log echo Starting KrayZ Server Selection in the next seconds, have fun =)
if not exist %workingpath%\md5error.log set version=%krayzver%
for /f "tokens=2 delims==" %%s in ('findstr /c:"version" "config.ini" ^|findstr /n "^" ^|findstr "1:"') do set "find=%%s" 
if not defined version set version=0.000
%fgrep% -v "version" config.ini > config2.ini
del config.ini > NUL
rename config2.ini config.ini > NUL
%unix2dos% config.ini > NUL
echo version=%version%>> "config.ini"
if not '%version%' == '%krayzver%' %fgrep% -v "version" config.ini > config2.ini
if not '%version%' == '%krayzver%' del config.ini > NUL
if not '%version%' == '%krayzver%' rename config2.ini config.ini > NUL
if not '%version%' == '%krayzver%' %unix2dos% config.ini > NUL
if not '%version%' == '%krayzver%' version=%krayzver%>> "config.ini"
if not exist %workingpath%\md5error.log timeout /t 5 /NOBREAK > NUL
if not exist %workingpath%\md5error.log goto serverselection
:ifupdatetrue
if exist KrayZ_%krayzver%_patch.rar del KrayZ_%krayzver%_patch.rar > NUL
%wget% -o %workingpath%\krayz.log http://krazey.ximensions-server.de/KrayZ_%krayzver%_patch.rar
%unrar% x -y KrayZ_%krayzver%_patch.rar
title %title%
del KrayZ_%krayzver%_patch.rar > NUL
cls
echo Your KrayZ has been updated!
echo %datetime% Your KrayZ has been updated! >> "event.log"
echo Rechecking now KrayZ.. =)
if '%version%' == 'false' echo version=%krayzver%>> "config.ini"
timeout /t 5 /NOBREAK > NUL
cls
if not defined krayzupdatecounter set krayzupdatecounter=0
if '%krayzupdatecounter%' == '0' set /a krayzupdatecounter=%krayzupdatecounter%+1 > NUL
if exist %workingpath%\md5error.log del %workingpath%\md5error.log > NUL
if not exist %workingpath%\md5error.log set md5error=false
if '%krayzupdatecounter%' == '1' goto patchrecheck
goto serverselection
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:://///////////////////////////////////////////////////////////////////// KRAYZ DEV UPDATER /////////////////////////////////////////////////////////////////////////////////////
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
::Not needed..
:devupdater
title %title% - Devupdater..
timeout /t 5 /NOBREAK > NUL
echo -CpuCount=%cores% -exThreads=%exthreads%
timeout /t 2 /NOBREAK > NUL
choice /C:YN /N /M "Copying @KrayZ to @KrayZ_dev? (Y/N):"
if '%errorlevel%' == '2' goto skip1
if exist @KrayZ_dev rmdir @KrayZ_dev /s /q
%copy% -R @KrayZ @KrayZ_dev
:skip1
choice /C:YN /N /M "Copying @KRAYZ_CBA+JSRS to @KRAYZ_CBA+JSRS_dev? (Y/N):"
if '%errorlevel%' == '2' goto skip2
if exist @KRAYZ_CBA+JSRS_dev rmdir @KRAYZ_CBA+JSRS_dev /s /q
%copy% -R @KRAYZ_CBA+JSRS @KRAYZ_CBA+JSRS_dev
cls
:skip2
choice /C:YN /N /M "Downloading http://krazey.de/files/krayz/%krayzverdev%.rar? (Y/N):"
if '%errorlevel%' == '2' goto skip3
%wget% -o %workingpath%\krayz.log http://krazey.de/files/krayz/%krayzverdev%.rar
%unrar% x -y %krayzverdev%.rar
title %title%
del %krayzverdev%.rar > NUL
:skip3
echo Back to devstart..
timeout /t 5 /NOBREAK > NUL
goto devstart
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:://///////////////////////////////////////////////////////////////////// SERVER SELECTION //////////////////////////////////////////////////////////////////////////////////////
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:skipupdates
:serverselection
title %title% - Server Selection
cls
if not defined skipupdates set skipupdates=false
set T=%workingpath%\var.tmp
>%T% echo %krayzverdev%
for %%i in (%T%) do set /a LenVarDev=%%~zi-2
del %T%
>%T% echo %krayzver%
for %%i in (%T%) do set /a LenVar=%%~zi-2
del %T%
if %LenVarDev% == 9 set var1=%a%%a%%a%%a%
if %LenVarDev% == 5 set var1=%a%%a%%a%%a%%a%%a%%a%%a%
if %LenVarDev% == 11 set var1=%a%%a%
if %LenVar% == 5 set var2=%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%
if %LenVar% == 6 set var2=%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%
if %LenVar% == 11 set var2=%a%%a%%a%%a%%a%
if %LenVar% == 5 set var3=%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%
if %LenVar% == 6 set var3=%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%
if %LenVar% == 11 set var3=%a%%a%%a%%a%%a%
if %LenVar% == 5 set var4=%a%%a%%a%%a%%a%%a%%a%%a%%a%
if %LenVar% == 6 set var4=%a%%a%%a%%a%%a%%a%%a%%a%
if %LenVar% == 11 set var4=%a%%a%%a%%a%
if %LenVar% == 5 set var5=%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%
if %LenVar% == 6 set var5=%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%
if %LenVar% == 11 set var5=%a%%a%%a%%a%%a%%a%%a%%a%
if %LenVarDev% == 9 set var6=%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%
if %LenVarDev% == 5 set var6=%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%
if %LenVarDev% == 6 set var6=%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%
if %LenVarDev% == 11 set var6=%a%%a%%a%%a%%a%%a%%a%%a%
:backtoserverselection
if %skipupdates% == false set var7=%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%
if %skipupdates% == true set var7=%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%
echo #-------------------------------------------------------------------#
echo #%a%1. KrayZ (v%krayzverdev%) TEST 1 WHITELIST [VETERAN 3DP:ON][GMT-6]%var1%#
echo #-------------------------------------------------------------------#
echo #%a%2. KrayZ (v%krayzver%) TEST 2 PUBLIC [VETERAN 3DP:ON][GMT-6]%var2%#
echo #-------------------------------------------------------------------#
echo #%a%3. KrayZ (v%krayzver%) TEST 3 PUBLIC [VETERAN 3DP:ON][GMT-6]%var3%#
echo #-------------------------------------------------------------------#
echo #%a%4. KrayZ (v%krayzver%) TEST 4 PUBLIC [VETERAN 3DP:OFF][GMT-2]%var4%#
echo #-------------------------------------------------------------------#
echo #%a%5. Start KrayZ v%krayzver% without connecting to a server%var5%#
::echo #-------------------------------------------------------------------#
::echo #%a%6. Start KrayZ v%krayzverdev% without connecting to a server%var6%#
echo #-------------------------------------------------------------------#
if '%skipupdates%' == 'false' echo #%a%6. Turn off Autoupdater. Current (skipupdates): %skipupdates%%var7%#
if '%skipupdates%' == 'true' echo #%a%7. Reactivate Autoupdater. Current (skipupdates): %skipupdates%%var7%#
echo #-------------------------------------------------------------------#
echo #%a%8. Restart Launcher%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%#
echo #-------------------------------------------------------------------#
echo #%a%C. Set up your custom startparameter:%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%#
if defined custom echo #%a%%a%%a%%a%Current parameter: %custom%
echo #-------------------------------------------------------------------#
echo #%a%0. Exit Launcher%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%#
echo #-------------------------------------------------------------------#
choice /C:12345678C0 /N /M "Take a choice (1,2,3,4,5,6,7,8,C,0):"
::if '%errorlevel%' == '1' set devmode=true
if '%errorlevel%' == '1' goto server1
if '%errorlevel%' == '2' goto server2
if '%errorlevel%' == '3' goto server3
if '%errorlevel%' == '4' goto server4
if '%errorlevel%' == '5' goto server5
if '%errorlevel%' == '6' goto selection7
if '%errorlevel%' == '7' goto selection8
if '%errorlevel%' == '8' goto selection9
if '%errorlevel%' == '9' goto selectionc
if '%errorlevel%' == '10' goto selection10
:server1
set "ipport=-connect=144.76.39.227 -port=4302"
cls
if defined ipport goto gamestart
:server2
set "ipport=-connect=144.76.39.227 -port=5302"
cls
if defined ipport goto gamestart
:server3
set "ipport=-connect=144.76.39.227 -port=6302"
cls
if defined ipport goto gamestart
:server4
set "ipport=-connect=178.63.73.149 -port=5302"
cls
if defined ipport goto gamestart
:server5
set "ipport=
cls
goto gamestart
:server6
set "ipport=
cls
goto gamestart
:selection7
cls
%fgrep% -v "skipupdates" config.ini > config2.ini
del config.ini > NUL
rename config2.ini config.ini > NUL
%unix2dos% config.ini > NUL
echo skipupdates=true>> "config.ini"
set skipupdates=true
goto backtoserverselection
:selection8
cls
%fgrep% -v "skipupdates" config.ini > config2.ini
del config.ini > NUL
rename config2.ini config.ini > NUL
%unix2dos% config.ini > NUL
echo skipupdates=false>> "config.ini"
set skipupdates=false
goto backtoserverselection
:selection9
cls
goto restart
:selectionc
cls
echo Your custom startparameter:
echo Allready integrated startparameter:
echo -mod
echo -nosplash
::echo -connect (can be used if you choose 5 or 6 at server selection)
::echo -port (can be used if you choose 5 or 6 at server selection)
echo -connect (can be used if you choose 5 at server selection)
echo -port (can be used if you choose 5 at server selection)
echo -CpuCount (autodetect, do not use this!)
echo -exThreads (autodetect, do not use this!)
echo.
echo Other useful startparameter:
echo -window (Displays Arma windowed instead of full screen.)
echo -nopause (Allow the game running even when its window does not have focus)
if defined custom %fgrep% -v "custom" config.ini > config2.ini
if defined custom del config.ini > NUL
if defined custom rename config2.ini config.ini > NUL
if defined custom %unix2dos% config.ini > NUL
choice /C:NER /N /M "Edit custom startparameter or set a new one? (N)ew,(E)dit,(R)eset:"
echo.
if '%errorlevel%' == '1' goto custompar1
if '%errorlevel%' == '2' goto custompar2
if '%errorlevel%' == '3' goto custompar3
:custompar1
set /P custom=
echo custom=%custom%>> "config.ini"
cls
goto backtoserverselection
:custompar2
if not defined custom goto custompar1
set customold=%custom%
set /P customnew=%customold%%a%
set custom=%customold%%a%%customnew%
echo custom=%custom%>> "config.ini"
cls
goto backtoserverselection
:custompar3
set custom=
echo custom=%custom%>> "config.ini"
cls
%fgrep% -v "custom" config.ini > config2.ini
del config.ini > NUL
rename config2.ini config.ini > NUL
%unix2dos% config.ini > NUL
goto backtoserverselection
:selection10
exit
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:://///////////////////////////////////////////////////////////////////// ARMA 2 OA STARTER /////////////////////////////////////////////////////////////////////////////////////
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:gamestart
goto krayzstart
:krayzstart
::Old
::for /F "skip=1 tokens=*" %%x in ('wmic cpu get NumberOfCores') do if not defined cores set cores=%%x
::set cores=%cores: =%
cd /d %workingpath%
%cpuz% -txt=cpuzlog
cd %arma2oapath%
cd /d %arma2oapath%
for /F "tokens=3,4" %%a in ('findstr "of.processors of.cores of.threads" %workingpath%\cpuzlog.txt') do set %%a=%%b
set cores=%cores: =%
if '%cores%' LEQ '2' set exthreads=3
if '%cores%' GEQ '4' set exthreads=7
if '%devmode%' == 'true' goto devstart
if not exist "AddOns" set krayz="-mod=%arma2path%;Expansion;ca;Expansion\beta;Expansion\beta\Expansion;@krayz;@krayz_cba+jsrs" -nosplash
if not exist "AddOns" goto AUTOCONNECT
set krayz=-beta=Expansion\beta;Expansion\beta\Expansion -mod=@krayz;@krayz_cba+jsrs -nosplash
goto AUTOCONNECT
:devstart
echo To start KrayZ in devmode you have to update it manually!
echo Copy/rename @krayz and @krayz_cba+jsrs to
echo @krayz_dev and @krayz_cba+jsrs_dev
echo ..or type "N" to download the latest Dev-Version (v%krayzverdev%).
choice /C:YN /N /M "Do you wanna start KrayZ in devmode? (Y/N):"
if errorlevel 2 cls
if errorlevel 2 echo Creating KrayZ-Dev now..
if errorlevel 2 goto devupdater
if not exist "AddOns" set krayz="-mod=%arma2path%;Expansion;ca;Expansion\beta;Expansion\beta\Expansion;@krayz_dev;@krayz_cba+jsrs_dev" -nosplash
if not exist "AddOns" goto AUTOCONNECT
set krayz=-beta=Expansion\beta;Expansion\beta\Expansion -mod=@krayz_dev;@krayz_cba+jsrs_dev -nosplash
goto AUTOCONNECT
:AUTOCONNECT
echo %datetime% Startingpath: %cd% >> event.log
echo %datetime% KrayZ started with following startparameter: .\Expansion\beta\arma2oa.exe -CpuCount=%cores% -exThreads=%exthreads% %krayz% %ipport% %custom% >> event.log
start .\Expansion\beta\arma2oa.exe -CpuCount=%cores% -exThreads=%exthreads% %krayz% %ipport% %custom%
exit
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:://///////////////////////////////////////////////////////////////////// CLOSE IF FOLDER ADDONS NOT FOUND //////////////////////////////////////////////////////////////////////
::-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:closeaddonsnotfound
timeout /t 5 /NOBREAK > NUL
exit