@echo off
echo ========================================
echo  0x File - Fly.io Deployment Script
echo ========================================
echo.

echo [1/5] Setting Redis Secret with TLS...
fly secrets set REDIS="rediss://default:AWRAAAIncDFhYmI3M2RkMzgxNDk0YzNiOWM2NzMxOTg1NzYwMTAzY3AxMjU2NjQ@together-liger-25664.upstash.io:6379" --app 0xfile
if %errorlevel% neq 0 (
    echo ERROR: Failed to set REDIS secret
    pause
    exit /b 1
)
echo SUCCESS: REDIS secret set!
echo.

echo [2/5] Verifying secrets...
fly secrets list --app 0xfile
echo.

echo [3/5] Deploying to Fly.io...
fly deploy
if %errorlevel% neq 0 (
    echo ERROR: Deployment failed
    pause
    exit /b 1
)
echo SUCCESS: Deployment complete!
echo.

echo [4/5] Checking status...
fly status --app 0xfile
echo.

echo [5/5] Showing logs...
echo Press Ctrl+C to stop logs
fly logs --app 0xfile

pause
