@echo off
pushd "%~dp0"

echo:
echo Enabling system protection and creating a restore point...

powershell -command "Enable-ComputerRestore -Drive 'C:\'"
powershell -command "Checkpoint-Computer -Description 'Known Good - Post Installation' -RestorePointType MODIFY_SETTINGS"

echo:
echo A restore point has been created or a recent one had already been available.

timeout 3
