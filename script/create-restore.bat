@echo off
pushd "%~dp0"

echo:
echo Enabling system protection and creating a restore point...

powershell -command "Enable-ComputerRestore -Drive 'C:\'"
powershell -command "Checkpoint-Computer -Description 'Fastall Auto-Generated' -RestorePointType MODIFY_SETTINGS"

echo:
echo A restore point has been created or had been created recently.

timeout 3
