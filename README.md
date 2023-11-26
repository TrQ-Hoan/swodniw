# swodniw

```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Force
```

Disable windows defender (Administrator required). Please disable all windows defender setting before run this command

```powershell
reg.exe import .\disable-windows-defender.reg
```

Disable windows update (Administrator required)

```powershell
reg.exe import .\disable-windows-update.reg
```

Remove all windows embedded application - before update app in store (TrustedInstaller required)

```powershell
# AdvanceRun
curl.exe -L -O "https://www.nirsoft.net/utils/advancedrun-x64.zip"

# Open a shell with TrustedInstaller an run
powershell.exe -ExecutionPolicy Bypass .\RemoveWindowsEmbeddedApps.ps1 
```

Remove Windows embedded Micsosoft OneDrive (Administrator required)

```powershell
powershell.exe -ExecutionPolicy Bypass .\RemoveWindowsEmbeddedOneDrive.ps1
```

Update app in windows store and install `App Installer`. Install essential application

```powershell
powershell.exe -ExecutionPolicy Bypass .\InstallEssentialApps.ps1
```

Install group apps

```powershell
powershell.exe -ExecutionPolicy Bypass .\Install_RE_Apps.ps1
powershell.exe -ExecutionPolicy Bypass .\Install_DFIR_Apps.ps1
```

---

Activate Windows 10

```powershell
powershell.exe -executionpolicy bypass "irm https://massgrave.dev/get | iex"
```

Windows tweaks

```powershell
# maybe need add hosts file `127.0.0.1 chocolatey.org` beacause chocolatey.org is auto install
powershell.exe -executionpolicy bypass "irm christitus.com/win | iex"
```

---

Hosts file

```conf
127.0.0.1 chocolatey.org
#152.199.21.175 cdn.winget.microsoft.com
152.199.39.108 cdn.winget.microsoft.com
```
