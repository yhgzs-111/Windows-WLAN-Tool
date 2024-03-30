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

title 清除保存的WLAN

@echo off
echo 正在清除已保存的 WiFi 密码...
netsh wlan delete profile name=*  >nul 2>&1
echo 已成功清除所有已保存的 WiFi 密码。
echo 按任意键退出
pause > nul
