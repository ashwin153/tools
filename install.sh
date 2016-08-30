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
brew install r
brew cask install java
brew install tomcat
brew install android-sdk
brew install scala --with-docs
brew install node --with-docs
brew install boost
brew install cmake
brew install mysql
brew install maven
brew install git-lfs
brew install bash-completion

# Install Applications
brew tap caskroom/versions
brew cask install insync
open /Applications/Insync.app
brew cask install insomniax
open /Applications/InsomniaX.app
brew cask install beardedspice
open /Applications/BeardedSpice.app
brew cask install intellij-idea-ce
open /Applications/IntelliJ\ IDEA\ CE.app
brew cask install steam
open /Applications/Steam.app
brew cask install google-chrome
open /Applications/Google\ Chrome.app
brew cask install amethyst
open /Applications/Amethyst.app

# Setup Workspace
mkdir ~/Documents/workspace
cd ~/Documents/workspace
git clone https://github.com/ashwin153/tools.git
cp tools/vimrc ~/.vimrc
cp tools/bash_profile ~/.bash_profile
mkdir ~/.ssh
cp tools/id_rsa.pub ~/.ssh/
