@echo off
pushd "%~dp0"

echo:
echo Resetting recent files and folders history...

del /F /Q %APPDATA%\Microsoft\Windows\Recent\*
del /F /Q %APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*
del /F /Q %APPDATA%\Microsoft\Windows\Recent\CustomDestinations\*

taskkill /f /im explorer.exe > nul 2> nul
start explorer.exe

echo:
echo Recent files and folders have been reset.

timeout 3
