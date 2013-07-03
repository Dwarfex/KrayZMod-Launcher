@echo off
echo wscript.sleep 50 >%workingpath%\sleep50.vbs
for %%F in (%workingpath%\%checkfile%) do set filesize_orig=%%~zF
:check
for %%F in (%workingpath%\%current%) do set filesize_current=%%~zF
set /a d=%filesize_current%00/%filesize_orig%
::timeout /t 1 /NOBREAK > NUL
::cscript /nologo %workingpath%\sleep50.vbs
if 5 GEQ %d% goto step1
if 10 GEQ %d% goto step2
if 15 GEQ %d% goto step3
if 20 GEQ %d% goto step4
if 25 GEQ %d% goto step5
if 30 GEQ %d% goto step6
if 35 GEQ %d% goto step7
if 40 GEQ %d% goto step8
if 45 GEQ %d% goto step9
if 50 GEQ %d% goto step10
if 55 GEQ %d% goto step11
if 60 GEQ %d% goto step12
if 65 GEQ %d% goto step13
if 70 GEQ %d% goto step14
if 75 GEQ %d% goto step15
if 80 GEQ %d% goto step16
if 85 GEQ %d% goto step17
if 90 GEQ %d% goto step18
if 95 GEQ %d% goto step19
::if 99 GEQ %d% goto step20
::if 105 GEQ %d% goto step21
goto check
:check2
cscript /nologo %workingpath%\sleep50.vbs
set /a d=%d%+1
if 95 GEQ %d% goto step19
if 99 GEQ %d% goto step20
if 105 GEQ %d% goto step21
goto check2
:step1
title %title%:%a%%a%%a%Progress:%a%%a%%a%[%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%]%a%%a%%d%%b%
goto check
:step2
title %title%:%a%%a%%a%Progress:%a%%a%%a%[=%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%]%a%%a%%d%%b%
goto check
:step3
title %title%:%a%%a%%a%Progress:%a%%a%%a%[==%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%]%a%%a%%d%%b%
goto check
:step4
title %title%:%a%%a%%a%Progress:%a%%a%%a%[===%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%]%a%%a%%d%%b%
goto check
:step5
title %title%:%a%%a%%a%Progress:%a%%a%%a%[====%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%]%a%%a%%d%%b%
goto check
:step6
title %title%:%a%%a%%a%Progress:%a%%a%%a%[=====%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%]%a%%a%%d%%b%
goto check
:step7
title %title%:%a%%a%%a%Progress:%a%%a%%a%[======%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%]%a%%a%%d%%b%
goto check
:step8
title %title%:%a%%a%%a%Progress:%a%%a%%a%[=======%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%]%a%%a%%d%%b%
goto check
:step9
title %title%:%a%%a%%a%Progress:%a%%a%%a%[========%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%]%a%%a%%d%%b%
goto check
:step10
title %title%:%a%%a%%a%Progress:%a%%a%%a%[=========%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%]%a%%a%%d%%b%
goto check
:step11
title %title%:%a%%a%%a%Progress:%a%%a%%a%[==========%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%]%a%%a%%d%%b%
goto check
:step12
title %title%:%a%%a%%a%Progress:%a%%a%%a%[===========%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%]%a%%a%%d%%b%
goto check
:step13
title %title%:%a%%a%%a%Progress:%a%%a%%a%[============%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%]%a%%a%%d%%b%
goto check
:step14
title %title%:%a%%a%%a%Progress:%a%%a%%a%[=============%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%]%a%%a%%d%%b%
goto check
:step15
title %title%:%a%%a%%a%Progress:%a%%a%%a%[==============%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%]%a%%a%%d%%b%
goto check
:step16
title %title%:%a%%a%%a%Progress:%a%%a%%a%[===============%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%]%a%%a%%d%%b%
goto check
:step17
title %title%:%a%%a%%a%Progress:%a%%a%%a%[================%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%%a%]%a%%a%%d%%b%
goto check
:step18
title %title%:%a%%a%%a%Progress:%a%%a%%a%[=================%a%%a%%a%%a%%a%%a%%a%%a%%a%]%a%%a%%d%%b%
goto check
:step19
title %title%:%a%%a%%a%Progress:%a%%a%%a%[==================%a%%a%%a%%a%%a%%a%]%a%%a%%d%%b%
goto check2
:step20
title %title%:%a%%a%%a%Progress:%a%%a%%a%[===================%a%%a%%a%]%a%%a%%d%%b%
goto check2
:step21
title %title%:%a%%a%%a%Progress:%a%%a%%a%[====================]%a%%a%100%b%
timeout /t 4 /NOBREAK > NUL
del %workingpath%\sleep50.vbs >NUL
title %title%