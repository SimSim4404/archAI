@echo off
chcp 65001 > nul

setlocal
cd /d "%~dp0"

echo [*] 임시 업로드 폴더 준비 중...
set "TEMP_DIR=%TEMP%\arch_portfolio_deploy"
if exist "%TEMP_DIR%" rd /s /q "%TEMP_DIR%"
mkdir "%TEMP_DIR%"

echo [*] 건축학과 웹사이트 파일 복사 중...
robocopy . "%TEMP_DIR%" /E /XD .git > nul

pushd "%TEMP_DIR%"
git init
git branch -M main
git remote add origin https://github.com/SimSim4404/arch-portfolio.git
git add .
git commit -m "건축학과 웹사이트 업데이트"
git push -f origin main
popd

rd /s /q "%TEMP_DIR%"

echo [OK] arch-portfolio 업로드가 완료되었습니다.
pause
