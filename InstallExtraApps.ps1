Import-Module -Name .\SwodniwUtils.psm1

winget install --id=Mozilla.Firefox.ESR --scope=machine -e
winget install --id=Brave.Brave --scope=machine -e
winget install --id=7zip.7zip --scope=machine -e

winget install --id=Initex.Proxifier --scope=machine -e
winget install --id=GlavSoft.TightVNC --scope=machine  -e
winget install --id=ZeroTier.ZeroTierOne --scope=machine  -e

# Ultraview
Invoke-WebDownload -Url "https://www.ultraviewer.net/en/UltraViewer_setup_6.6_en.exe"

# MobaXterm keygen: https://gist.github.com/TrQ-Hoan/32f8a5a5658ba0d0b090f1a80117725f
winget install --id=Mobatek.MobaXterm --scope=machine -e
Invoke-WebDownload -Url "https://gist.githubusercontent.com/TrQ-Hoan/32f8a5a5658ba0d0b090f1a80117725f/raw/30e23c801aee7e49de746c31d91eaf40d1a4d660/MbXT_Keygen.py"