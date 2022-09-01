@echo off

echo:
echo Removing fastall from recent files and folders...

del /F /Q %APPDATA%\Microsoft\Windows\Recent\*
del /F /Q %APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*
del /F /Q %APPDATA%\Microsoft\Windows\Recent\CustomDestinations\*

taskkill /f /im explorer.exe

start explorer.exe

echo:
echo Removed recent files and folders.

timeout 3