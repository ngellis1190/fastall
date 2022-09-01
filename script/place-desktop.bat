@echo off

echo:
echo Moving files to user desktop...

copy ..\desktop\* %userprofile%\desktop\

echo:
echo Files have been moved to desktop.

timeout 3