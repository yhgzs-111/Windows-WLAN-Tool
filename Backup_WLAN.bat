@echo off
title WLAN����
cd /d "%~dp0"
md WLAN����
netsh wlan show profile
netsh wlan export profile folder=.\WLAN���� key=clear
cd WLAN����
echo ������ɣ���������zip�ļ�����
cd ..
:: ʹ��7za����
7za a ���ݻ�ԭWLAN.zip ./WLAN���� ./��ԭWLAN.bat
echo ������zip�ļ�����������˳�����
pause > nul