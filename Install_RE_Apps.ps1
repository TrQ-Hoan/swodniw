Import-Module -Name .\SwodniwUtils.psm1

winget install --id=Hex-Rays.IDA.Free --scope=machine -e
winget install --id=MHNexus.HxD --scope=machine -e

winget install --id=dnSpyEx.dnSpy --scope=machine -e
winget install --id=Microsoft.DotNet.DesktopRuntime.6 --scope=machine -e

$pythonVersion = $(Get-Command python -ErrorAction SilentlyContinue | Select-Object Version).version.ToString()

if ($pythonVersion -eq "0.0.0.0") {
    # Download python installer
    Download-UsingWebC -Url "https://www.python.org/ftp/python/3.11.5/python-3.11.5-amd64.exe" -Path "python-installer.exe"
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
Download-GithubReleaseLatest -Repo "horsicq/DIE-engine" -OuputFile "die_win64_portable.zip" -SampleFileName "die_win64_portable*.zip"

# ExplorerSuite
Download-UsingWebC -Url "https://ntcore.com/files/ExplorerSuite.exe"