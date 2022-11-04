@echo off
pushd "%~dp0"

echo:
echo Checking for updates to Fastall...
echo:

echo ******************************************************************
echo *                                                                *
echo *               checking for updates to fastall...               *
echo *                                                                *
echo ******************************************************************

setlocal enabledelayedexpansion

set "localVersion=v1.2.1"
for /f "tokens=*" %%a in ('powershell -command "([System.Net.HttpWebRequest]::Create('https://github.com/ngellis1190/fastall/releases/latest').GetResponse().ResponseUri.Segments[5])"') do set netVersion=%%a

set startUpdate=N

if !netVersion! == !localVersion! (
echo:
echo ******************************************************************
echo *                                                                *
echo *       you're already running the latest release ^(%localVersion%^)       *
echo *                                                                *
echo ******************************************************************
) else (
echo:
echo ******************************************************************
echo *                                                                *
echo *            a new release is available for download^^!            *
echo *                                                                *
echo *            you're currently running          %localVersion%            *
echo *            the latest release is             %netVersion%            *
echo *                                                                *
echo *     https://github.com/ngellis1190/fastall/releases/latest     *
echo *                                                                *
echo ******************************************************************
echo:
echo ******************************************************************
echo *                                                                *
echo *                would you like to update?  [y/N]                *
echo *      you will need to reconfigure your settings afterward      *
echo *                                                                *
echo ******************************************************************
echo:
set /p startUpdate=[ enter 'Y' to update or 'N' to skip ]: 
)

if /I %startUpdate%==Y (

echo:
echo Update accepted. Creating backup of current version...

powershell -command "rm ..\staging\* -R"
powershell -command "Compress-Archive -Path ..\* -DestinationPath ..\backup\%localVersion%.zip -Force"

echo:
echo A backup has been compressed and saved to the backup folder.
echo:
echo Downloading the latest version of Fastall from GitHub...

powershell -command "Invoke-WebRequest -Uri (-join ('https://github.com/ngellis1190/fastall/archive/refs/tags/',([System.Net.HttpWebRequest]::Create('https://github.com/ngellis1190/fastall/releases/latest').GetResponse().ResponseUri.Segments[5]),'.zip')) -Outfile ..\staging\update.zip"

echo:
echo Decompressing the update package...

powershell -command "Expand-Archive -LiteralPath ..\staging\update.zip -DestinationPath ..\staging\update -Force"

echo:
echo Installing the update...

cd ..\staging\update\fastall-%netVersion:v=%
echo backup>exclude.txt
echo staging>>exclude.txt
echo exclude.txt>>exclude.txt
echo .GITKEEP>>exclude.txt
echo script\fastall-update.bat>>exclude.txt
powershell -command "Get-ChildItem ..\..\..\ -Exclude staging,backup,script | Remove-Item -Recurse -Force"
powershell -command "Get-ChildItem ..\..\..\script -Exclude fastall-update.bat | Remove-Item -Recurse -Force"
xcopy * ..\..\..\ /c /e /y /exclude:exclude.txt

cd ..\..\..\
powershell -command "rm *.GITKEEP -R"
powershell -command "rm staging\* -R"

echo:
echo Update installed successfully. Press any key to finish update.
pause

taskkill /IM cmd.exe

)

timeout 5
