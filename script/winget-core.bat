@echo off

echo:
echo Installing WinGet utility...
echo:

start ms-windows-store:

echo Setting up the Microsoft Store...
echo:

timeout 30

Taskkill /IM WinStore.App.exe /F

echo:
echo Microsoft Store has been set up. Closing applications...
echo:

powershell -command "Add-AppxPackage -Path '..\binary\VCLinUWP.appx'"
powershell -command "Add-AppxPackage -Path '..\binary\VCLibW32.appx'"
powershell -command "Add-AppxPackage -Path '..\binary\winget.msixbundle'"

echo:
echo WinGet should now be installed.

timeout 3