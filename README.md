# swodniw

```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Force
```

Remove all windows embedded application (before update app in store)

```powershell
# AdvanceRun
curl -L -O "https://www.nirsoft.net/utils/advancedrun-x64.zip"

# Open a shell with TrustedInstaller an run
powershell -ExecutionPolicy Bypass .\RemoveWindowsEmbeddedApps.ps1 
```

Update app in windows store and install `App Installer`. Install essential application

```powershell
powershell -ExecutionPolicy Bypass ./InstallEssentialApps.ps1
```

Install group apps

```powershell
powershell -ExecutionPolicy Bypass ./Install_RE_Apps.ps1
powershell -ExecutionPolicy Bypass ./Install_DFIR_Apps.ps1
```
