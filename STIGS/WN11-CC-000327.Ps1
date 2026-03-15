<#
.SYNOPSIS
    Ensures PowerShell Transcription is enabled to maintain an audit trail of PowerShell activity.

.NOTES
    Author          : Alex Adewoyin
    LinkedIn        : linkedin.com/in/alexadewoyin/
    GitHub          : github.com/whozdae
    Date Created    : 2026-03-14
    Version         : 1.0
    STIG-ID         : WN11-CC-000327
    Severity        : CAT II (Medium)

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run with Administrative privileges.
    PS C:\> .\Remediate-WN11-CC-000327.ps1 
#>

# 1. Define STIG Registry Parameters
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription"
$valueName    = "EnableTranscripting"
$valueData    = 1

# 2. Path Remediation: Ensure the Policy path exists
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
    Write-Host "CREATED: Registry path $registryPath."
}

# 3. Value Remediation: Enforce REG_DWORD = 1
$currentValue = Get-ItemProperty -Path $registryPath -Name $valueName -ErrorAction SilentlyContinue

if ($null -eq $currentValue -or $currentValue.$valueName -ne $valueData) {
    New-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -PropertyType DWord -Force | Out-Null
    Write-Host "REMEDIATED: WN11-CC-000327 - $valueName set to $valueData."
}
else {
    Write-Host "COMPLIANT: WN11-CC-000327 - $valueName is already configured as specified."
}

# 4. Mandatory Note for Documentation/Fix
Write-Host "`nIMPORTANT:" -ForegroundColor Yellow
Write-Host "The STIG requires specifying a Transcript output directory (OutputDirectory value)."
Write-Host "Ensure transcripts are pointed to a secure Central Log Server to prevent local user tampering."

# 5. Force Group Policy Update
Write-Host "Triggering Group Policy Update..." -ForegroundColor Cyan
gpupdate /force
