@echo off
pushd "%~dp0"

echo:
echo Uninstalling desired applications...
echo Operator interaction may be required for this step...
echo:

for /F "tokens=*" %%A in (..\config\uninstalls.ini) do (powershell -command "winget uninstall '%%A' -h")

echo:
echo Uninstalled requested applications.

timeout 3
