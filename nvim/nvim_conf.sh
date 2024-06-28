#!/bin/bash
## Get sudo access
sudo -
## Download latest neovim version, make it executable and extract the files
wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
## remove prior neovim configurations
rm -fr ~/.config/nvim/
## clone NvChad
git clone https://github.com/NvChad/starter ~/.config/nvim
## cleanup current dir and move to root
rm nvim.appimage
sudo rm -fr /squashfs-root/
sudo mv squashfs-root /
sudo rm /usr/bin/nvim
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

#############################################################
#                                                           #
# Insert wanted configurations for neovim installation here #
#                                                           #
#############################################################
echo -e 'vim.opt.relativenumber = true \n' >> ~/.config/nvim/init.lua
echo -e 'vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true }) \n' >> ~/.config/nvim/init.lua
echo -e 'vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true }) \n' >> ~/.config/nvim/init.lua

