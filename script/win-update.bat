@echo off

echo:
echo Updating Windows via USOclient...

usoclient startscan
usoclient startdownload
usoclient startinstall
usoclient resumeupdate

echo:
echo Updates will be finished after system reboot.

timeout 3