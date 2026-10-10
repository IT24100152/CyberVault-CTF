
@echo off
setlocal
cd /d "%~dp0.."

echo =====================================
echo       CyberVault CTF Deployment
echo =====================================

if not exist "platform\deployment\.env" (
    echo ERROR: Environment file missing.
    echo Create .env from .env.example first.
    exit /b 1
)

if not exist "platform\ctfd\Dockerfile" (
    echo ERROR: CTFd source code missing.
    exit /b 1
)

docker info >nul 2>&1
if errorlevel 1 (
    echo ERROR: Docker is not running.
    exit /b 1
)

echo Starting CyberVault CTF...

docker compose -f platform\deployment\docker-compose.yml --env-file platform\deployment\.env up -d --build

if errorlevel 1 (
    echo ERROR: Deployment failed.
    exit /b 1
)

echo.
echo Deployment command completed.
echo Check service status using scripts\validate.bat
endlocal
