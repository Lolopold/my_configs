#!/bin/bash
sudo -i
wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
nvim=./squashfs-root/usr/bin/nvim
git clone https://github.com/NvChad/starter ~/.config/nvim
rm nvim.appimage
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
