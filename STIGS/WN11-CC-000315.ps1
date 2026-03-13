<#
.SYNOPSIS
    This PowerShell script ensures the Windows Installer feature "Always install with elevated privileges" is disabled.

.NOTES
    Author          : Alex Adewoyin
    LinkedIn        : linkedin.com/in/alexadewoyin/
    GitHub          : github.com/whozdae
    Date Created    : 2026-03-11
    Version         : 1.0
    STIG-ID         : WN11-CC-000315
    Severity        : CAT I (High)

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run with Administrative privileges.
    PS C:\> .\Remediate-WN11-CC-000315.ps1 
#>

# 1. Define STIG Registry Parameters
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"
$valueName    = "AlwaysInstallElevated"
$valueData    = 0

# 2. Path Remediation: Ensure the Policy path exists
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
    Write-Host "CREATED: Registry path $registryPath."
}

# 3. Value Remediation: Enforce REG_DWORD = 0
$currentValue = Get-ItemProperty -Path $registryPath -Name $valueName -ErrorAction SilentlyContinue

if ($null -eq $currentValue -or $currentValue.$valueName -ne $valueData) {
    # Force creation/overwrite to ensure Type and Value match the STIG requirement
    New-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -PropertyType DWord -Force | Out-Null
    Write-Host "REMEDIATED: WN11-CC-000315 - $valueName set to $valueData."
}
else {
    Write-Host "COMPLIANT: WN11-CC-000315 - $valueName is already configured as specified."
}
