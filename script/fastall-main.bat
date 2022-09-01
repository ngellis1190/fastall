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
echo *                  this version of fastall will                  *
echo *                                                                *
echo *                connect to a pre-defined network                *
echo *           install winget and desired apps via winget           *
echo *              scan for and install windows updates              *
echo *           place existing files onto the user desktop           *
echo *                                                                *
echo *          this script will auto-start in 30 seconds...          *
echo *                                                                *
echo ******************************************************************

timeout 30

call net-connect.bat
call winget-core.bat
call winget-apps.bat
call win-update.bat
call place-desktop.bat
call recent-cleanup.bat
call create-restore.bat

color 2f

RunDLL32 User32.dll,MessageBeep
timeout 1
RunDLL32 User32.dll,MessageBeep
timeout 1
RunDLL32 User32.dll,MessageBeep
timeout 1
RunDLL32 User32.dll,MessageBeep
timeout 1
RunDLL32 User32.dll,MessageBeep
timeout 1

echo:
echo ******************************************************************
echo *                                                                *
echo *              fastall has completed all operations              *
echo *       remember to restart your computer to finish update       *
echo *                                                                *
echo ******************************************************************
echo:

pause