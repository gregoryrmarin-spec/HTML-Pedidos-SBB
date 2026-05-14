@echo off
chcp 65001 >nul
setlocal

if exist "C:\Program Files\Git\cmd\git.exe" set "PATH=C:\Program Files\Git\cmd;%PATH%"
set PYTHONIOENCODING=utf-8
set PYTHONUTF8=1

cd /d "%~dp0"

python tools\atualizar_estoque.py --push %*
set EXITCODE=%ERRORLEVEL%

echo.
if %EXITCODE% NEQ 0 (
    echo Houve algum erro. Veja a mensagem acima.
) else (
    echo Atualizacao diaria de estoque concluida.
)

if /I "%SESSIONNAME%"=="Console" pause
exit /b %EXITCODE%
