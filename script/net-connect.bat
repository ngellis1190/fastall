@echo off
pushd "%~dp0"

setlocal disabledelayedexpansion
for /f "tokens=*" %%a in ('type "..\config\variables.ini"') do set %%a

echo:
echo Connecting to the %ssid% wireless network...
echo:

netsh wlan add profile filename="..\config\net-secure.xml" user=all
netsh wlan connect ssid=%ssid% name=%ssid%

timeout 5

echo:
echo Testing connection to the internet...
echo:

set wifi-test=fail
for /f "tokens=1" %%i in ('ping google.com -n 3^| findstr /C:"Reply"') do set wifi-test=pass

if %wifi-test%==pass (echo Successfully connected to the internet.
timeout 3
exit /b) else ( echo Unable to verify connection to the internet.
echo Waiting for connection, then reattempting internet test...
timeout 15
echo:
echo Testing connection to the internet...
echo:
for /f "tokens=1" %%i in ('ping google.com -n 3^| findstr /C:"Reply"') do set wifi-test=pass )

if %wifi-test%==pass (echo Successfully connected to the internet.
) else (
echo *************************************************************************
echo *                                                                       *
echo *              unable to verify connection to the internet              *
echo *  fastall is unable to continue without an active internet connection  *
echo *                   press any key to exit the program                   *
echo *                                                                       *
echo *************************************************************************
color 4f
for /L %%X in (0,1,7) do (
RunDLL32 User32.dll,MessageBeep
timeout 2 > nul 2> nul )
echo:
pause
exit
)

timeout 3
