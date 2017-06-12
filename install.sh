#!/bin/bash
# Install Command Line Tools
xcode-select --install

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
sudo chown -R $(whoami) /usr/local
brew update
brew doctor
brew upgrade 

# Install Tools
brew install cask    
brew tap homebrew/science   
brew cask install java
brew install scala
brew install bash-completion
brew install git-lfs

# Install Applications
brew cask install intellij-idea-ce
brew cask install google-chrome
brew cask install spectacle
brew cask install steam

# Setup Workspace`
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .vimrc ~/.vimrc
cp .bash_profile ~/.bash_profile
vim +PluginInstall +qall
