@echo off
pushd "%~dp0"

echo:
echo Installing WinGet package manager...
echo:

echo Setting up the WinUI 2 dependency via the Microsoft Store...

start ms-windows-store:

timeout 60

taskkill /IM WinStore.App.exe /F > nul 2> nul

echo:
echo WinUI 2 has been set up. Closing the Microsoft Store...
echo:

echo Installing WinGet dependency packages...

powershell -command "Add-AppxPackage -Path '..\binary\VCLinUWP.appx'" > nul 2> nul
powershell -command "Add-AppxPackage -Path '..\binary\VCLibW32.appx'" > nul 2> nul
powershell -command "Add-AppxPackage -Path '..\binary\winget.msixbundle'"

echo:
echo WinGet should now be installed.

timeout 3
