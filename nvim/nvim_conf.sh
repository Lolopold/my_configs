#!/bin/bash
wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
nvim=./squashfs-root/usr/bin/nvim
git clone https://github.com/NvChad/starter ~/.config/nvim && $nvim
