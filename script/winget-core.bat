@echo off
pushd "%~dp0"

echo:
echo Installing the WinGet package manager and dependencies...
echo:

echo Downloading Microsoft XAML 2.7.0 NuGet package archive... 
powershell -command "Invoke-WebRequest -Uri https://globalcdn.nuget.org/packages/microsoft.ui.xaml.2.7.0.nupkg -Outfile ..\staging\xaml.zip"
echo [1 of 6] Done!
echo:

echo Extracting downloaded NuGet package archive... 
powershell -command "Expand-Archive -LiteralPath ..\staging\xaml.zip -DestinationPath ..\staging\xaml -Force"
echo [2 of 6] Done!
echo:

echo Installing AppX package directly from archive... 
powershell -command "Add-AppxPackage '..\staging\xaml\tools\AppX\x64\Release\Microsoft.UI.Xaml.2.7.appx'"
echo [3 of 6] Done!
echo:

echo Cleaning up from XAML installation...
powershell -command "rm ..\staging\* -R"
echo [4 of 6] Done!
echo:

echo Installing Microsoft VCLibs x64.14.00 for Desktops direct from CDN... 
powershell -command "Add-AppxPackage 'https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx'"
echo [5 of 6] Done!
echo:

echo Installing the latest version of WinGet from GitHub... 
powershell -command "Add-AppxPackage (-join ('https://github.com/microsoft/winget-cli/releases/download/',([System.Net.HttpWebRequest]::Create('https://github.com/microsoft/winget-cli/releases/latest').GetResponse().ResponseUri.Segments[5]),'/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle'))"
echo [6 of 6] Done!
echo:

echo WinGet should now be fully installed.

timeout 3
