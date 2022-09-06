@echo off
pushd "%~dp0"

echo:
echo Updating Windows via PSWindowsUpdate...

powershell -command "Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force"
powershell -command "Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted"
powershell -command "Set-ExecutionPolicy Unrestricted -Confirm:$false"
powershell -command "Install-Module PSWindowsUpdate"
powershell -command "Install-WindowsUpdate -AcceptAll -IgnoreReboot"
powershell -command "Set-ExecutionPolicy Default -Confirm:$false"

echo:
echo Updates will be finished after your next system reboot.

timeout 3
