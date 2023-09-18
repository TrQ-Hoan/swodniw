Import-Module -Name .\SwodniwUtils.psm1

# TimelineExplorer - https://ericzimmerman.github.io/#!index.md
curl -O "https://f001.backblazeb2.com/file/EricZimmermanTools/TimelineExplorer.zip"

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

# install python lib
python -m pip install mysql-connector-python

