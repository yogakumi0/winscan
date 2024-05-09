::
::                   ███                                                      █████                                                          █████                                  ███ 
::                  ░░░                                                      ░░███                                                          ░░███                                  ░░░  
::  █████ ███ █████ ████  ████████    █████   ██████   ██████   ████████      ░███████  █████ ████    █████ ████  ██████   ███████  ██████   ░███ █████ █████ ████ █████████████   ████ 
:: ░░███ ░███░░███ ░░███ ░░███░░███  ███░░   ███░░███ ░░░░░███ ░░███░░███     ░███░░███░░███ ░███    ░░███ ░███  ███░░███ ███░░███ ░░░░░███  ░███░░███ ░░███ ░███ ░░███░░███░░███ ░░███ 
::  ░███ ░███ ░███  ░███  ░███ ░███ ░░█████ ░███ ░░░   ███████  ░███ ░███     ░███ ░███ ░███ ░███     ░███ ░███ ░███ ░███░███ ░███  ███████  ░██████░   ░███ ░███  ░███ ░███ ░███  ░███ 
::  ░░███████████   ░███  ░███ ░███  ░░░░███░███  ███ ███░░███  ░███ ░███     ░███ ░███ ░███ ░███     ░███ ░███ ░███ ░███░███ ░███ ███░░███  ░███░░███  ░███ ░███  ░███ ░███ ░███  ░███ 
::   ░░████░████    █████ ████ █████ ██████ ░░██████ ░░████████ ████ █████    ████████  ░░███████     ░░███████ ░░██████ ░░███████░░████████ ████ █████ ░░████████ █████░███ █████ █████
::    ░░░░ ░░░░    ░░░░░ ░░░░ ░░░░░ ░░░░░░   ░░░░░░   ░░░░░░░░ ░░░░ ░░░░░    ░░░░░░░░    ░░░░░███      ░░░░░███  ░░░░░░   ░░░░░███ ░░░░░░░░ ░░░░ ░░░░░   ░░░░░░░░ ░░░░░ ░░░ ░░░░░ ░░░░░ 
::                                                                                       ███ ░███      ███ ░███           ███ ░███                                                      
::                                                                                      ░░██████      ░░██████           ░░██████                                                       
::                                                                                       ░░░░░░        ░░░░░░             ░░░░░░                                                        
:: 



@echo off
title winscan by yogakumi0
setlocal

:: Checking if the script is being run with administrator rights
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system" && (
    echo [92mAdministrator privileges detected. Running script.[0m 
    echo.
) || (
    color 4F
    echo Please run this script with administrator privileges.
    pause
    exit /b 1
)

:: Run SFC (1)
echo ([92m1[0m) sfc

echo.
sfc /scannow
echo.

:: Run DISM
echo ([92m2[0m) dism

echo.
dism /online /cleanup-image /checkhealth
dism /online /cleanup-image /scanhealth
dism /online /cleanup-image /restorehealth
echo.

:: Run CHKDSK
echo ([92m3[0m) chkdsk
echo.
chkdsk C:
echo.

:: Run SFC (2)
echo ([92m4[0m) sfc (2)
echo.
sfc /scannow
echo.

echo [92mRepair process completed.[0m
echo.
pause

endlocal
