@echo off
pushd "%~dp0"

echo:
echo Copying files to user directories...
echo:

set contacts=False
set desktop=False
set documents=False
set downloads=False
set favorites=False
set links=False
set music=False
set pictures=False
set videos=False

powershell -command "$ErrorActionPreference='Ignore'"
(for /F "tokens=* usebackq" %%F in (`powershell -command "Test-Path ..\place\contacts\*"') do (set contacts=%%F)) > nul 2> nul
(for /F "tokens=* usebackq" %%F in (`powershell -command "Test-Path ..\place\desktop\*"`) do (set desktop=%%F)) > nul 2> nul
(for /F "tokens=* usebackq" %%F in (`powershell -command "Test-Path ..\place\documents\*") do (set documents=%%F)) > nul 2> nul
(for /F "tokens=* usebackq" %%F in (`powershell -command "Test-Path ..\place\downloads\*") do (set downloads=%%F)) > nul 2> nul
(for /F "tokens=* usebackq" %%F in (`powershell -command "Test-Path ..\place\favorites\*") do (set favorites=%%F)) > nul 2> nul
(for /F "tokens=* usebackq" %%F in (`powershell -command "Test-Path ..\place\links\*") do (set links=%%F)) > nul 2> nul
(for /F "tokens=* usebackq" %%F in (`powershell -command "Test-Path ..\place\music\*") do (set music=%%F)) > nul 2> nul
(for /F "tokens=* usebackq" %%F in (`powershell -command "Test-Path ..\place\pictures\*") do (set pictures=%%F)) > nul 2> nul
(for /F "tokens=* usebackq" %%F in (`powershell -command "Test-Path ..\place\videos\*") do (set videos=%%F)) > nul 2> nul

if %contacts%==True (copy ..\place\contacts\* %userprofile%\contacts\)
if %desktop%==True (copy ..\place\desktop\* %userprofile%\desktop\)
if %documents%==True (copy ..\place\documents\* %userprofile%\documents\)
if %downloads%==True (copy ..\place\downloads\* %userprofile%\downloads\)
if %favorites%==True (copy ..\place\favorites\* %userprofile%\favorites\)
if %links%==True (copy ..\place\links\* %userprofile%\links\)
if %music%==True (copy ..\place\music\* %userprofile%\music\)
if %pictures%==True (copy ..\place\pictures\* %userprofile%\pictures\)
if %videos%==True (copy ..\place\videos\* %userprofile%\videos\)

echo:
echo Files have been copied to user directories.

timeout 3
