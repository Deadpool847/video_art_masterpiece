@echo off
echo 🔥 ULTIMATE VIDEO ART MASTERPIECE SETUP
echo =======================================
echo.

REM Check Docker
docker --version >nul 2>&1 || (
    echo ❌ Install Docker Desktop first: https://www.docker.com/products/docker-desktop
    pause & exit /b 1
)

echo ✅ Docker found
echo.

echo 🧹 Clean slate...
docker-compose -f docker-compose.ultimate.yml down -v 2>nul
docker system prune -f 2>nul

echo 🚀 Building ultimate bulletproof version...
docker-compose -f docker-compose.ultimate.yml up --build -d

echo.
echo ⏳ Starting services...
timeout /t 30 /nobreak >nul

echo 📊 Status:
docker-compose -f docker-compose.ultimate.yml ps

echo.
echo 🎉 READY! 
echo   Frontend: http://localhost:3000
echo   Backend:  http://localhost:8001
echo.
pause