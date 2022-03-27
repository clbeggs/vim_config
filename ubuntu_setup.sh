#!/bin/bash



dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-1 "['<Alt>1']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-2 "['<Alt>2']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-3 "['<Alt>3']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-4 "['<Alt>4']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-5 "['<Alt>5']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-6 "['<Alt>6']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-7 "['<Alt>7']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-8 "['<Alt>8']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-9 "['<Alt>9']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-10 "['<Alt>0']"

dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-1 "['<Shift><Alt>exclam']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-2 "['<Shift><Alt>at']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-3 "['<Shift><Alt>numbersign']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-4 "['<Shift><Alt>dollar']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-5 "['<Shift><Alt>percent']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-6 "['<Shift><Alt>asciicircum']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-7 "['<Shift><Alt>ampersand']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-8 "['<Shift><Alt>asterisk']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-9 "['<Shift><Alt>parenleft']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-10 "['<Primary><Shift>parenright']"


dconf write /org/gnome/shell/extensions/pop-shell/focus-down "['<Alt>j']"
dconf write /org/gnome/shell/extensions/pop-shell/focus-left "['<Alt>h']"
dconf write /org/gnome/shell/extensions/pop-shell/focus-right "['<Alt>l']"
dconf write /org/gnome/shell/extensions/pop-shell/focus-up "['<Alt>k']"


dconf write /org/gnome/desktop/wm/keybindings/tile-move-down "['<Shift><Alt>j']"
dconf write /org/gnome/desktop/wm/keybindings/tile-move-left "['<Shift><Alt>h']"
dconf write /org/gnome/desktop/wm/keybindings/tile-move-right "['<Shift><Alt>l']"
dconf write /org/gnome/desktop/wm/keybindings/tile-move-up "['<Shift><Alt>k']"


dconf write /org/gnome/desktop/wm/keybindings/close "['<Shift><Alt>q']"



sudo apt install terminator git make cmake ninja-build ranger xclip
sudo apt-get install gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen



mkdir -p ~/InstalledSoftware
wget -q  --directory-prefix=$HOME/InstalledSoftware https://github.com/neovim/neovim/archive/refs/tags/v0.6.1.tar.gz

# Pyenv
curl https://pyenv.run | bash
# Vim-Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


echo "alias v=\"nvim\"" >> ~/.bashrc
echo "cls=\"clear;ls\"" >> ~/.bashrc


wget https://nodejs.org/dist/v17.6.0/node-v17.6.0-linux-x64.tar.xz
# wget https://github.com/ryanoasis/nerd-fonts/archive/refs/tags/v2.1.0.tar.gz
