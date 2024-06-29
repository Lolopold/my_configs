#!/bin/bash
echo "" > ~/.vimrc
rm -fr ~/.vim/*
cp prefs ~/.vim/prefs
echo "source ~/.vim/prefs" > ~/.vimrc
echo "Install plugin manager, y/n?"
read plug
if [[ "$plug" = "y" ]]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	cp plugs ~/.vim/plugs
	echo "source ~/.vim/plugs" >> ~/.vimrc
fi

