@echo off

:: 检查是否以管理员权限运行
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo 请求以管理员身份重新运行脚本...
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\RunElevated.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\RunElevated.vbs"
    "%temp%\RunElevated.vbs"
    del "%temp%\RunElevated.vbs"
    exit /b
)

:============================================================================================================

title WLAN还原
cd WLAN备份
for %%i in (./*.xml) do (
	netsh wlan add profile "%%i"
)
set /p input=已还原WLAN，是否删除文件？（Y/n）
if /i %input%=="Y" goto yes
if /i %input%=="N" goto exit

:yes
cd ..
rmdir /s /q WLAN备份
echo 文件已删除
goto exit

:exit
echo 按任意键退出
pause > nul