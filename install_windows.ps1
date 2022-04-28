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
