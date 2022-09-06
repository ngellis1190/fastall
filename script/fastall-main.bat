@echo off
pushd "%~dp0"

echo:
echo ******************************************************************
echo *                                                                *
echo *                       welcome to fastall                       *
echo *       an open-source utility for rapid system deployment       *
echo *                                                                *
echo *                        made by the norm                        *
echo *                                                                *
echo *             view or contribute to the project here             *
echo *             https://github.com/ngellis1190/fastall             *
echo *                                                                *
echo ******************************************************************
echo:
echo ******************************************************************
echo *                                                                *
echo *          this script will auto-start in 7 seconds...           *
echo *                                                                *
echo ******************************************************************

timeout 7

call net-connect.bat
call winget-core.bat
call winget-install.bat
call place-files.bat
call win-update.bat
call create-restore.bat
call winget-uninstall.bat
call recent-cleanup.bat

color 2f

echo:
echo ******************************************************************
echo *                                                                *
echo *              fastall has completed all operations              *
echo *       remember to restart your computer to finish update       *
echo *                                                                *
echo ******************************************************************
echo:

for /L %%X in (0,1,7) do (
RunDLL32 User32.dll,MessageBeep
timeout 1 > nul 2> nul )

pause
