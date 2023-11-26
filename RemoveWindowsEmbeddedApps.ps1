Param (
    [switch]$all = $false
)

$systemDrive = Join-Path -Path $env:SYSTEMDRIVE -ChildPath '\'

# Define the parent directory path
$parentPath = $systemDrive + "Program Files\WindowsApps"

# Array app remove: (git bash command) ls "/c/Program Files/WindowsApps" | sort | cut -d '_' -f 1 | cut -d '/' -f 1 | uniq
$listApps = @("Microsoft.549981C3F5F10", "Microsoft.Advertising.Xaml", "Microsoft.BingWeather", "Microsoft.Microsoft3DViewer", "Microsoft.MicrosoftOfficeHub", "Microsoft.MicrosoftSolitaireCollection", "Microsoft.MixedReality.Portal", "Microsoft.Office.OneNote", "Microsoft.People", "Microsoft.SkypeApp", "Microsoft.WindowsMaps", "Microsoft.GamingApp", "Microsoft.Xbox.TCUI", "Microsoft.XboxApp", "Microsoft.XboxIdentityProvider", "Microsoft.XboxSpeechToTextOverlay", "Microsoft.XboxGamingOverlay", "Microsoft.OutlookForWindows", "Microsoft.XboxGameOverlay", "Microsoft.MicrosoftOfficeHub", "Microsoft.Office.OneNote", "Microsoft.GetHelp", "Microsoft.Getstarted", "Microsoft.WindowsFeedbackHub")

$listAppsOptional = @("Microsoft.YourPhone", "Microsoft.WindowsCamera")

function Remove-Windows-Apps {
    param (
        [string[]] $listAppsRemoval
    )

	foreach ($item in $listAppsRemoval) {
		if ($(Get-AppxPackage $item -AllUsers).InstallLocation -like "$parentPath*" ) {
			Get-AppxPackage $item -AllUsers | Remove-AppxPackage
		}
	}

	# Get a list of child directories in the parent directory
	$childDirectories = Get-ChildItem -Path $parentPath -Directory

	foreach ($childDirectory in $childDirectories) {
		$directoryName = $childDirectory.Name
		$containsSubstring = $listAppsRemoval | Where-Object { $directoryName -like "*$_*" }

		if ($containsSubstring) {
			Write-Host Deleting directory $childDirectory.FullName
			& cmd /c rmdir /s /q $childDirectory.FullName
		}
	}
}

Remove-Windows-Apps -listAppsRemoval $listApps
if ($all) {
	Remove-Windows-Apps -listAppsRemoval $listAppsOptional
}
& cmd /c rmdir /q /s "$parentPath\DeletedAllUserPackages"
& cmd /c rmdir /q /s "$parentPath\Deleted"

taskkill /f /im ShellExperienceHost.exe
taskkill /f /im StartMenuExperienceHost.exe
& cmd /r rmdir /q /s %localappdata%\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy