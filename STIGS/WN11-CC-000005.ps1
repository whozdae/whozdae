<#
.SYNOPSIS
    This PowerShell script ensures the camera is disabled on the lock screen if a camera is present on the device.

.NOTES
    Author          : Alex Adewoyin
    LinkedIn        : linkedin.com/in/alexadewoyin/
    GitHub          : github.com/whozdae
    Date Created    : 2026-03-10
    Version         : 1.0
    STIG-ID         : WN11-CC-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run with Administrative privileges.
    PS C:\> .\Remediate-WN11-CC-000005.ps1 
#>

# 1. Hardware Check: If no camera exists, the STIG is Not Applicable (NA)
$camera = Get-PnpDevice -FriendlyName "*Camera*" -Status OK -ErrorAction SilentlyContinue

if (-not $camera) {
    Write-Host "NA: No camera hardware detected. Policy is Not Applicable."
    exit 0
}

# 2. Define STIG Registry Parameters
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$valueName    = "NoLockScreenCamera"
$valueData    = 1

# 3. Path Remediation: Ensure the Policy path exists
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
    Write-Host "CREATED: Registry path $registryPath."
}

# 4. Value Remediation: Enforce REG_DWORD = 1
$currentValue = Get-ItemProperty -Path $registryPath -Name $valueName -ErrorAction SilentlyContinue

if ($null -eq $currentValue -or $currentValue.$valueName -ne $valueData) {
    # Force creation/overwrite to ensure Type and Value match the STIG requirement
    New-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -PropertyType DWord -Force | Out-Null
    Write-Host "REMEDIATED: WN11-CC-000005 - $valueName set to $valueData."
}
else {
    Write-Host "COMPLIANT: WN11-CC-000005 - $valueName is already configured as specified."
}
