#!/usr/bin/env pwsh

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Import-Module
Import-WslCommand "awk", "emacs", "nano", "vim"

$psdir = "$env:OneDrive\PowerShell"
Write-Host ("Load PS Profiles from {0}\autoload" -f $psdir) -ForegroundColor DarkCyan
Get-ChildItem $psdir\autoload |
  Where-Object Extension -EQ ".ps1" |
  ForEach-Object { .$_.FullName }

# Oh My Posh
oh-my-posh init pwsh | Invoke-Expression

Import-Module posh-git

# Fast Node Manager (fnm)
fnm env --use-on-cd | Out-String | Invoke-Expression

