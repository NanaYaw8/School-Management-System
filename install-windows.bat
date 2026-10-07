@echo off
setlocal
where node >nul 2>nul
if errorlevel 1 (
  echo Node.js 20+ is required. Install it from https://nodejs.org/ then run this file again.
  pause
  exit /b 1
)
call npm install
if errorlevel 1 goto fail
if not exist data mkdir data
if not exist .env copy .env.example .env >nul
start "School Management Server" cmd /k "npm start"
timeout /t 3 /nobreak >nul
start http://localhost:3000
exit /b 0
:fail
echo Installation failed. Check your internet connection and npm output.
pause
