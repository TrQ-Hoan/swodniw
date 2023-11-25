# swodniw

```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Force
```

Disable windows defender (Administrator required). Please disable all windows defender setting before run this command

```powershell
reg import .\disable-windows-defender.reg
```

Disable windows update (Administrator required)

```powershell
reg import .\disable-windows-update.reg
```

Remove all windows embedded application - before update app in store (TrustedInstaller required)

```powershell
# AdvanceRun
curl -L -O "https://www.nirsoft.net/utils/advancedrun-x64.zip"

# Open a shell with TrustedInstaller an run
powershell -ExecutionPolicy Bypass .\RemoveWindowsEmbeddedApps.ps1 
```

Remove Windows embedded Micsosoft OneDrive (Administrator required)

```powershell
powershell -ExecutionPolicy Bypass .\RemoveWindowsEmbeddedOneDrive.ps1
```

Update app in windows store and install `App Installer`. Install essential application

```powershell
powershell -ExecutionPolicy Bypass .\InstallEssentialApps.ps1
```

Install group apps

```powershell
powershell -ExecutionPolicy Bypass .\Install_RE_Apps.ps1
powershell -ExecutionPolicy Bypass .\Install_DFIR_Apps.ps1
```

---

Activate Windows 10

```cmd
start powershell.exe -executionpolicy bypass "irm https://massgrave.dev/get | iex"
```

Windows tweaks

```cmd
powershell.exe -executionpolicy bypass "irm christitus.com/win | iex"
```
