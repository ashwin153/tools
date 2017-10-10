#!/bin/bash
# Install Command Line Tools
xcode-select --install

# Install Homebrew.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
sudo chown -R $(whoami) /usr/local
brew update
brew doctor
brew upgrade 
brew install cask    
brew tap homebrew/science   

# Install Languages.
brew cask install java
brew install scala
brew install python
brew install python3

# Install Virtual Machine.
brew cask install virtualbox
brew install docker
brew install boot2docker

# Install Tools.
brew install bash-completion
brew install git-lfs

# Install Applications.
brew cask install google-chrome
brew cask install insync
brew cask install intellij-idea-ce
brew cask install spectacle

# Install Fonts.
brew tap caskroom/fonts
brew cask install font-hasklig

# Setup Python.
sudo easy_install pip
sudo pip install virtualenv
sudo pip install click

# Setup Git.
git config --global core.editor /usr/bin/vim
git config --global user.name "Ashwin Madavan"
git config --global user.email ashwin.madavan@gmail.com

# Setup Workspace.
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s .vimrc ~/.vimrc
ln -s .bash_profile ~/.bash_profile
vim +PluginInstall +qall

