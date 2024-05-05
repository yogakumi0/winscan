@echo off
title winscan tool by yogakumi0
setlocal

:: Run SFC (1)
echo Scanning and repairing system files... (1)
sfc /scannow

:: Run DISM
echo Repairing Windows image...
dism /online /cleanup-image /checkhealth
dism /online /cleanup-image /scanhealth
dism /online /cleanup-image /restorehealth

:: Ask the user if CHKDSK should be run
set /p runChkdsk=Do you want to run CHKDSK? (Y/N): 
if /i "%runChkdsk%"=="Y" (
    :: Ask the user for the drive letter
    set /p driveLetter=Please enter the drive letter (If you dont know what letter, type C): 

    :: Run CHKDSK for the selected drive
    echo Scanning and repairing drive %driveLetter%...
    chkdsk %driveLetter%: /f /x
) else (
    echo CHKDSK skipped.
)

:: Run SFC (2)
echo Scanning and repairing system files... (2)
sfc /scannow

echo Repair process completed.
pause

endlocal
