@echo off
:: FileGuard - Hash-based file integrity checker for sensitive files
:: Author: Mohammad Ali

setlocal enabledelayedexpansion

echo.
echo 🛡️ FileGuard - File Integrity Watchdog
echo --------------------------------------

set /p "filepath=Enter full path to the sensitive file to monitor: "

if not exist "%filepath%" (
    echo [ERROR] File not found: %filepath%
    exit /b
)

:: Generate original hash
for /f "skip=1 delims=" %%H in ('certutil -hashfile "%filepath%" SHA256 ^| find /v "hash of" ^| find /v "CertUtil"') do (
    set "original=%%H"
    goto done
)
:done

echo.
echo [INFO] Monitoring started on: %filepath%
echo [INFO] Original SHA256: !original!

:watchloop
timeout /t 10 > nul
for /f "skip=1 delims=" %%C in ('certutil -hashfile "%filepath%" SHA256 ^| find /v "hash of" ^| find /v "CertUtil"') do (
    set "current=%%C"
    goto compare
)
:compare
if not "!current!"=="!original!" (
    echo.
    echo 🚨 [ALERT] File has been modified!
    echo Timestamp: %DATE% %TIME%
    echo New SHA256: !current!
    pause
    exit /b
)

goto watchloop
