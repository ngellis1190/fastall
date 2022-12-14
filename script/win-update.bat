@echo off
pushd "%~dp0"

echo:
echo Updating Windows via PSWindowsUpdate via NuGet...

powershell -command "Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force"
powershell -command "Register-PSRepository -Default -InstallationPolicy Trusted"
powershell -command "Install-Module PSWindowsUpdate"

for /L %%X in (0,1,3) do (
powershell -ExecutionPolicy Unrestricted -command "Install-WindowsUpdate -AcceptAll -IgnoreReboot" )

powershell -command "Uninstall-Package PSWindowsUpdate -Force"
powershell -command "Get-PSRepository | Unregister-PSRepository"

echo:
echo Updates will be finished after your next system reboot.

timeout 3