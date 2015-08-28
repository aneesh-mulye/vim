#!/bin/bash
# Quick vim setup for Ubuntu (for 15.04 x86_64)

# Install vundle
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Copy over after/ (fix Python ftplugin indentation)
cp -r after ~/.vim/after
# Copy over the vimrc
cp vimrc ~/.vimrc
# Install all vundle plugins
vim +PluginInstall +qall

# Compile and install YCM support libs
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --gocode-completer
