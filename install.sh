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
brew install scala --with-docs
brew install bash-completion

# brew install git-lfs
# brew install r
# brew install node --with-docs
# brew install tomcat
# brew install android-sdk
# brew install boost
# brew install cmake
# brew install mysql
# brew install maven

# Install Applications
brew cask install intellij-idea-ce
open /Applications/IntelliJ\ IDEA\ CE.app
brew cask install google-chrome
open /Applications/Google\ Chrome.app
brew cask install spectacle
open /Applications/Spectacle.app

# brew tap caskroom/versions
# brew cask install insync
# open /Applications/Insync.app
# brew cask install insomniax
# open /Applications/InsomniaX.app
# brew cask install beardedspice
# open /Applications/BeardedSpice.app
# brew cask install steam
# open /Applications/Steam.app

# Setup Workspace
git clone https://github.com/ashwin153/tools.git ~/Documents/workspace/tools
cp ~/Documents/workspace/tools/vimrc ~/.vimrc
cp ~/Documents/workspace/tools/bash_profile ~/.bash_profile
ssh-keygen -t rsa -b 4096 -C "ashwin.madavan@gmail.com"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
