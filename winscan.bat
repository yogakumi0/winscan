@echo off
title winscan tool by yogakumi0
setlocal

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
set /p "runChkdsk=Do you want to run CHKDSK? (Y/N): "
if /i "%runChkdsk%"=="Y" (
    echo.
    echo Scanning and repairing drive C:
    echo.
    chkdsk C: /f /x
) else (
    echo.
    echo CHKDSK skipped.
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
