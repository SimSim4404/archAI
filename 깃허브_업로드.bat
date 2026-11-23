@echo off
chcp 65001 > nul

cd /d "%~dp0"

echo [info] GitHub 저장소(archAI)로 업로드를 시작합니다...
git push -u origin main

pause
