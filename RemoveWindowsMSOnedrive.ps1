# Remove Microsoft OneDrive Client Script
# Author: Simon Lee
# Date  : January 2019
# Version 0.5

# Stop OneDrive Process and Uninstall
taskkill /f /im OneDrive.exe
& "$env:SystemRoot\SysWOW64\OneDriveSetup.exe" /uninstall

# Take Ownsership of OneDriveSetup.exe
$ACL = Get-ACL -Path $env:SystemRoot\SysWOW64\OneDriveSetup.exe
$Group = New-Object System.Security.Principal.NTAccount("$env:UserName")
$ACL.SetOwner($Group)
Set-Acl -Path $env:SystemRoot\SysWOW64\OneDriveSetup.exe -AclObject $ACL

# Assign Full R/W Permissions to $env:UserName (Administrator)
$Acl = Get-Acl "$env:SystemRoot\SysWOW64\OneDriveSetup.exe"
$Ar = New-Object  system.security.accesscontrol.filesystemaccessrule("$env:UserName","FullControl","Allow")
$Acl.SetAccessRule($Ar)
Set-Acl "$env:SystemRoot\SysWOW64\OneDriveSetup.exe" $Acl

# Take Ownsership of OneDriveSettingSyncProvider.dll
$ACL = Get-ACL -Path $env:SystemRoot\SysWOW64\OneDriveSettingSyncProvider.dll
$Group = New-Object System.Security.Principal.NTAccount("$env:UserName")
$ACL.SetOwner($Group)
Set-Acl -Path $env:SystemRoot\SysWOW64\OneDriveSettingSyncProvider.dll -AclObject $ACL

# Assign Full R/W Permissions to $env:UserName (Administrator)
$Acl = Get-Acl "$env:SystemRoot\SysWOW64\OneDriveSettingSyncProvider.dll"
$Ar = New-Object  system.security.accesscontrol.filesystemaccessrule("$env:UserName","FullControl","Allow")
$Acl.SetAccessRule($Ar)
Set-Acl "$env:SystemRoot\SysWOW64\OneDriveSettingSyncProvider.dll" $Acl

# Take Ownsership of OneDrive.ico
$ACL = Get-ACL -Path $env:SystemRoot\SysWOW64\OneDrive.ico
$Group = New-Object System.Security.Principal.NTAccount("$env:UserName")
$ACL.SetOwner($Group)
Set-Acl -Path $env:SystemRoot\SysWOW64\OneDrive.ico -AclObject $ACL

# Assign Full R/W Permissions to $env:UserName (Administrator)
$Acl = Get-Acl "$env:SystemRoot\SysWOW64\OneDrive.ico"
$Ar = New-Object  system.security.accesscontrol.filesystemaccessrule("$env:UserName","FullControl","Allow")
$Acl.SetAccessRule($Ar)
Set-Acl "$env:SystemRoot\SysWOW64\OneDrive.ico" $Acl

# $env:LOCALAPPDATA\Microsoft\OneDrive
# Assign Full R/W Permissions to $env:UserName (Administrator)
$Acl = Get-Acl "$env:LOCALAPPDATA\Microsoft\OneDrive"
$Ar = New-Object  system.security.accesscontrol.filesystemaccessrule("$env:UserName","FullControl","Allow")
$Acl.SetAccessRule($Ar)
Set-Acl "$env:LOCALAPPDATA\Microsoft\OneDrive" $Acl

REG Delete "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
REG Delete "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f

# Allow for NTFS Permissions to Apply
Start-Sleep -Seconds 60

# Restart Windows Shell to release of FileSyncShell64.dll
taskkill /f /im explorer.exe
explorer.exe

Remove-Item -Path "$env:SystemRoot\SysWOW64\OneDriveSetup.exe"
Write-Output "OneDriveSetup.exe Removed"

Remove-Item -Path "$env:SystemRoot\SysWOW64\OneDriveSettingSyncProvider.dll"
Write-Output "OneDriveSettingSyncProvider.dll Removed"

Remove-Item -Path "$env:SystemRoot\SysWOW64\OneDrive.ico" 
Write-Output "OneDrive.icon Removed"

Remove-Item -Path "$env:USERPROFILE\OneDrive" -Recurse -Force 
Write-Output "USERProfile\OneDrive Removed" 

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\OneDrive" -Recurse -Force 
Write-Output "LocalAppData\Microsoft\OneDrive Removed" 

Remove-Item -Path "$env:ProgramData\Microsoft OneDrive" -Recurse -Force
Write-Output "ProgramData\Microsoft OneDrive Removed" 

Remove-Item -Path "C:\ProgramData\Microsoft OneDrive" -Recurse -Force -ErrorAction Ignore
Write-Output "C:\ProgramData\Microsoft OneDrive Removed" 

Remove-Item -Path "C:\OneDriveTemp" -Recurse -Force -ErrorAction Ignore
Write-Output "C:\OneDriveTemp Removed"