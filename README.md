# zsh config #

A customized zsh config 

## Install ##

On Arch Linux run the following command to install zsh and some additional dependencies:

    sudo pacman -S zsh pkgfile
    sudo pkgfile -u


To set zsh as the default shell, run:

    chsh -s $(which zsh)

## Initial configuration ##

The repository comes with a default .zshrc so there is no need to run the initial setup. To activate this configuration, replace the initial .zshrc with the repository file:

    mv ~/.zshrc ~/.zshrc.old
    ln -s ~/zsh-config/zshrc ~/.zshrc
    mv ~/.zprofile ~/.zprofile.old
    ln -s ~/zsh-config/zprofile ~/.zprofile