@echo off

:: ����Ƿ��Թ���ԱȨ������
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo �����Թ���Ա����������нű�...
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\RunElevated.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\RunElevated.vbs"
    "%temp%\RunElevated.vbs"
    del "%temp%\RunElevated.vbs"
    exit /b
)

:============================================================================================================

title ��������WLAN

@echo off
echo ��������ѱ���� WiFi ����...
netsh wlan delete profile name=*  >nul 2>&1
echo �ѳɹ���������ѱ���� WiFi ���롣
pause
