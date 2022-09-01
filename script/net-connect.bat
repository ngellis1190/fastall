@echo off

echo:
echo Connecting to configured wireless network...
echo:

netsh wlan add profile filename="..\config\net-secure.xml" user=all

setlocal disabledelayedexpansion
for /f "tokens=*" %%a in ('type "..\config\variables.ini"') do set %%a
netsh wlan connect ssid=%ssid% name=%ssid%

timeout 5

set wifi-test=fail
for /f "tokens=1" %%i in ('ping google.com -n 3^| findstr /C:"Reply"') do set wifi-test=pass

echo:
if %wifi-test%==pass (echo Successfully connected to network.)
if %wifi-test%==fail (echo Unable to connect to network.)

timeout 3