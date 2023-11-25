@echo off

:: call disable update
echo " [*] Disable Windows Update"
start disable_windows_update.bat

:: call disable windows defender
echo " [*] Disable Windows Defender"
start reg import disable_windows_defender.reg

:: call remove onedrive
echo " [*] Remove OneDrive"
start powershell.exe -ExecutionPolicy Bypass -File .\RemoveWindowsMSOneDrive.ps1

:: call remove bloatware
echo " [*] Remove Bloatware"
start AdvancedRun.exe /Run rmwinapp.cfg

:: enable wsl
echo " [*] Enable WSL"
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
