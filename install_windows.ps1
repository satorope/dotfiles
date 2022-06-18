#
Set-ExecutionPolicy Bypass -Scope Process -Force
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

@(
    "PSReadLine"
    #"WslInterop"
    "posh-git"
    "terminal-icons"
) | ForEach-Object {
    Install-Module $_ -Scope CurrentUser -Force
}

# Chocolatey
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Scoop
Invoke-Expression (New-Object net.webclient).downloadstring('https://get.scoop.sh')
scoop install chezmoi


# vim-plug
Invoke-WebRequest -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |
New-Item $HOME/vimfiles/autoload/plug.vim -Force

# AWKPATH
# ".:/usr/local/share/awk"
# PS [System.Environment]::SetEnvironmentVariable('AWKPATH, "Bar", 'Machine')
# AWKLIBPATH C:\Users\tsuna\scoop\apps\gawk\current\lib\gawk\ext-3.1
# PS [System.Environment]::SetEnvironmentVariable("AWKLIBPATH", "$HOME\scoop\apps\gawk\current\lib\gawk\ext-3.1", "User")

