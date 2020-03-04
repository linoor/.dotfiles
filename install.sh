#!/bin/bash

# install oh my zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

# VIM
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.vim ~/.vim

# install badwolf theme
curl https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim -o ~/.vim/colors/badwolf.vim

# Neovim
ln -s ~/.dotfiles/init.vim ~/.config/nvim/

# EMACS
ln -s ~/.dotfiles/.spacemacs ~/.spacemacs
ln -s ~/.dotfiles/.emacs.d ~/.emacs.d

# zsh
ln -s ~/.dotfiles/.zshrc ~/.zshrc

# INTELLIJ
ln -s ~/.dotfiles/.ideavimrc ~/.ideavimrc
ln -s ~/.dotfiles/init.vim ~/.config/nvim/

