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
    color 2F
    echo Administrator privileges detected. Running script.
    echo.
) || (
    color 4F
    echo Please run this script with administrator privileges.
    pause
    exit /b 1
)

:: Run SFC (1)
echo Scanning and repairing system files... (1)

echo.
sfc /scannow
echo.

:: Run DISM
echo Repairing Windows image...

echo.
dism /online /cleanup-image /checkhealth
dism /online /cleanup-image /scanhealth
dism /online /cleanup-image /restorehealth
echo.

:: Ask the user if CHKDSK should be run
set /p "runChkdsk=Do you want to run CHKDSK with repairing (needs to reboot your computer)? (Y/N): "
if /i "%runChkdsk%"=="Y" (
    echo.
    echo Scanning and repairing drive C:
    echo.
    chkdsk C: /f /x
) else (
    echo.
    echo Scanning drive C:
    echo.
    chkdsk C:
    echo.
)

:: Run SFC (2)
echo Scanning and repairing system files... (2)
echo.
sfc /scannow
echo.

echo Repair process completed.
echo.
pause

endlocal
