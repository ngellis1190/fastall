@echo off

echo:
echo Creating a restore point...
echo:

wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Fresh Install Point", 100, 7

echo:
echo A system restore point has been created.

timeout 3