#!/bin/bash
# Quick vim setup for Ubuntu (written for 14.04 x86_64)
echo "This installation contains sudo commands."
read -p "[Continue]"

# Install zenburn
mkdir -p ~/.vim/colors
wget -O ~/.vim/colors/zenburn.vim "http://slinky.imukuppi.org/zenburn/zenburn.vim"

# Install vundle
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Copy over after/ (fix Python ftplugin indentation)
cp -r after ~/.vim/after
# Copy over the vimrc
cp vimrc ~/.vimrc
# Install all vundle plugins
vim +PluginInstall +qall

# Install libclang
sudo apt-get install libclang-dev libclang1 cmake python-dev
mkdir ycm_build
cd ycm_build
cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
make ycm_support_libs
