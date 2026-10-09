
@echo off
setlocal
cd /d "%~dp0.."

echo =====================================
echo       CyberVault CTF Restart
echo =====================================

echo Restarting CyberVault containers...
echo Stored data will be preserved.

docker compose -f platform\deployment\docker-compose.yml --env-file platform\deployment\.env restart

if errorlevel 1 (
    echo ERROR: Restart failed.
    exit /b 1
)

echo SUCCESS: Restart command completed.
endlocal
