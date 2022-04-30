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

#$psdir = "$env:OneDrive\PowerShell"
#Write-Host ("Load PS Profiles from {0}\autoload" -f $psdir) -ForegroundColor DarkCyan
#Get-ChildItem $psdir\autoload |
#  Where-Object Extension -EQ ".ps1" |
#  ForEach-Object { .$_.FullName }

function which($cmdname) {
    Get-Command $cmdname -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Definition
}

Import-Module PSReadLine
Import-Module -Name Terminal-Icons
Import-Module posh-git

# PSReadLine
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Tab -Function Complete
# Fish風のオートサジェスト機能を有効に
# -PredictionViewStyle パラメーターで表示形式を指定
Set-PSReadLineOption -PredictionSource History -PredictionViewStyle ListView
# (optional) Ctrl+f 入力で前方1単語進む : 補完の確定に使う用
Set-PSReadLineKeyHandler -Key "Ctrl+f" -Function ForwardWord

# Oh My Posh
oh-my-posh init pwsh | Invoke-Expression
#oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\dracula.omp.json" | Invoke-Expression

# Fast Node Manager (fnm)
fnm env --use-on-cd | Out-String | Invoke-Expression
