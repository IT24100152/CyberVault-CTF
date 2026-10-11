@echo off
setlocal
cd /d "%~dp0.."

echo =====================================
echo    CyberVault CTF Service Recovery
echo =====================================

echo [1/2] Restarting CTFd, MariaDB and Redis...

docker compose -f platform\deployment\docker-compose.yml --env-file platform\deployment\.env restart

if errorlevel 1 (
    echo ERROR: CTFd platform restart failed.
    exit /b 1
)

echo [2/2] Restarting Stage 03 Flask challenge...

docker compose -f challenges\challenge3-vulnerable-login\compose.yaml --env-file challenges\challenge3-vulnerable-login\.env restart

if errorlevel 1 (
    echo ERROR: Stage 03 restart failed.
    exit /b 1
)

echo =====================================
echo SUCCESS: CyberVault services restarted.
echo Existing data and scores are preserved.
echo =====================================

endlocal