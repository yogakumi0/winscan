if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Please run this script with administrator privileges."
    pause
    exit 1
}

# Run CHKDSK
Write-Host '(1/4) chkdsk' -ForegroundColor Green
chkdsk /scan

# Run SFC (1)
Write-Host '(2/4) sfc' -ForegroundColor Green
sfc /scannow

# Run DISM
Write-Host '(3/4) dism' -ForegroundColor Green
dism /online /cleanup-image /restorehealth

# Run SFC (2)
Write-Host '(4/4) sfc' -ForegroundColor Green
sfc /scannow

Write-Host 'Press Enter to Continue...'
pause
