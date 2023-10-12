Import-Module -Name .\SwodniwUtils.psm1

winget install --id=RARLab.WinRAR --scope=machine -e
winget install --id=voidtools.Everything --scope=machine -e
winget install --id=Notepad++.Notepad++ --scope=machine -e
winget install --id=Git.Git --scope=machine -e
winget install --id=gerardog.gsudo --scope=machine -e

winget install --id=Microsoft.Sysinternals.ProcessExplorer --scope=machine -e
winget install --id=Microsoft.Sysinternals.Autoruns --scope=machine -e

# VSCode Setup System
Download-UsingWebC -Url "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64" -Path "VSCode-x64.exe"

# WinRAR keygen
Download-UsingWebC -Url "https://github.com/bitcookies/winrar-keygen/releases/download/v2.1.2/winrar-keygen-x64.exe"
.\winrar-keygen-x64.exe "Freeware" "freeware.vn" > rarreg.key

# EV Key
Download-UsingWebC -Url "https://github.com/lamquangminh/EVKey/releases/download/Release/EVKey.zip"

#### Windows and Office ####

# WSL ubuntu
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
# ubuntu 22.04 | winget Canonical.Ubuntu.2204 | store 9PN20MSR04DW
wsl --set-default-version 1
# curl.exe -L -o ubuntu-2204.zip "https://aka.ms/wslubuntu2204"
Download-UsingWebC -Url "https://wslstorestorage.blob.core.windows.net/wslblob/Ubuntu2204-221101.AppxBundle" -Path "ubuntu-2204.zip"

# Office https://github.com/farag2/Office.git
Download-GithubReleaseLatest -Repo "farag2/Office" -OuputFile "Office.zip" -SampleFileName "Office*.zip"

powershell.exe -executionpolicy bypass "irm https://massgrave.dev/get | iex"

# Optimize Edge
# HKCU\Software\Policies\Microsoft\Edge
# Remove all, without ConfigureDoNotTrack
powershell.exe -executionpolicy bypass "irm christitus.com/win | iex"
