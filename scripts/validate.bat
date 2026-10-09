
@echo off
setlocal
cd /d "%~dp0.."

echo =====================================
echo       CyberVault CTF Validation
echo =====================================

if not exist "platform\deployment\.env" (
    echo ERROR: Environment file missing.
    exit /b 1
)

docker compose -f platform\deployment\docker-compose.yml --env-file platform\deployment\.env ps

if errorlevel 1 (
    echo ERROR: Unable to check containers.
    exit /b 1
)

echo.
echo Checking CTFd HTTP response...

for /f "usebackq tokens=1,* delims==" %%A in ("platform\deployment\.env") do (
    if "%%A"=="CTFD_PORT" set "CTFD_PORT=%%B"
)

if not defined CTFD_PORT set "CTFD_PORT=8000"

curl.exe -f -s -o NUL "http://127.0.0.1:%CTFD_PORT%/"

if errorlevel 1 (
    echo WARNING: CTFd HTTP check failed.
    exit /b 1
)

echo SUCCESS: CTFd website is responding.
endlocal
