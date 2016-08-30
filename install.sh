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
brew cask install insync
brew cask install insomniax
brew cask install beardedspice
brew cask install intellij-idea
brew cask install steam
brew cask install google-chrome

