Import-Module -Name .\SwodniwUtils.psm1

winget install --id=Hex-Rays.IDA.Free --scope=machine -e
winget install --id=MHNexus.HxD --scope=machine -e

# Another tools
Invoke-WebDownload -Url "https://www.nirsoft.net/utils/hashmyfiles-x64.zip"

# C/C++ debugger
Invoke-GithubReleaseDownload -Repo "x64dbg/x64dbg" -OuputFile "x64dbg.zip" -SampleFileName "snapshot_*.zip"
# WinDBG
#### git IDA plugins
# git clone https://github.com/bootleg/ret-sync
# git clone https://github.com/danigargu/deREferencing

# C#
winget install --id=dnSpyEx.dnSpy --scope=machine -e
winget install --id=Microsoft.DotNet.DesktopRuntime.6 --scope=machine -e

# Android java/kotlin
Invoke-GithubReleaseDownload -Repo "skylot/jadx" -OuputFile "jadx.zip" -SampleFileName "jadx*-with-jre-win.zip"

# Python
$pythonVersion = $(Get-Command python -ErrorAction SilentlyContinue | Select-Object Version).version.ToString()

if ($pythonVersion -eq "0.0.0.0") {
    pyversion = "3.9.13"
    # Download python installer
    Invoke-WebDownload -Url "https://www.python.org/ftp/python/$pyversion/python-$pyversion-amd64.exe" -Path "python-installer.exe"
    # Install Python silently
    Start-Process -Wait -FilePath "python-installer.exe" -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1"
    # Check if the installation was successful
    if ($LastExitCode -eq 0) {
        Write-Host " [+] Python has been installed successfully."
    } else {
        Write-Host " [-] Python installation failed."
    }
    # Clean up the installer
    Remove-Item -Path "python-installer.exe"
} else {
    Write-Host " [!] Python is already installed with version $pythonVersion."
}

# Detect it easy
Invoke-GithubReleaseDownload -Repo "horsicq/DIE-engine" -OuputFile "die_win64_portable.zip" -SampleFileName "die_win64_portable*.zip"

# ExplorerSuite
Invoke-WebDownload -Url "https://ntcore.com/files/ExplorerSuite.exe"
