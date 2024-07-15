#!/bin/bash
echo "Remove Neovim, y/n?"
read nvim
## Get sudo access
sudo -
if [[ "$nvim" = "y" ]]; then
  sudo apt remove nvim
  sudo rm -fr /squashfs-root/
  sudo rm /usr/bin/nvim
  exit 0
fi
echo "Install NvChad, y/n?"
read chad
## Download latest neovim version, make it executable and extract the files
wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
## Download and install latest version of packer
rm -fr ~/.local/share/nvim/site/pack/packer/start/packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
## remove prior neovim configurations
if [[ "$chad" = "y" ]]; then
  rm -fr ~/.config/nvim/
  ## clone NvChad
  git clone https://github.com/NvChad/starter ~/.config/nvim
else
rm -fr ~/.config/nvim/
  mkdir ~/.config/nvim/
fi
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
mkdir -p ~/.config/nvim/lua/len_configs
cp -r nvim ~/.config/
