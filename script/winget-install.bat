@echo off
pushd "%~dp0"

echo:
echo Installing applications via WinGet...
echo:

for /F "tokens=*" %%A in (..\config\installs.ini) do (powershell -command "winget install --id %%A -e -h --accept-source-agreements --accept-package-agreements")

echo:
echo All applications should now be installed.

timeout 3
