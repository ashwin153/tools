#!/bin/bash
# Install XCode Developer Tools.
if [[ -z $(xcode-select -p) ]] ; then 
  echo "[install] XCode Developer Tools"
  eval "xcode-select --install"
fi

# Install Homebrew.
if [[ $(which -s brew) -ne 0 ]] ; then
  tag="install"
  echo "[$tag] Homebrew/Core"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  sudo chown -R $(whoami) /usr/local
  brew doctor
else
  tag="upgrade"
  echo "[$tag] Homebrew/Core"
  brew update
  brew doctor
fi

# Install Homebrew Tools.
echo "[$tag] Homebrew/Caskroom"
eval "brew $tag cask"
echo "[$tag] Homebrew/Font"
eval "brew tap caskroom/fonts"
echo "[$tag] Homebrew/Science"
eval "brew tap homebrew/science"   

# Install Programming Languages.
echo "[$tag] Language/Java"
eval "brew cask install java"
echo "[$tag] Language/LaTeX"
eval "brew cask install basictex"
echo "[$tag] Language/Python"
eval "brew $tag python"
echo "[$tag] Language/Python3"
eval "brew $tag python3"
echo "[$tag] Language/Scala"
eval "brew $tag scala"

# Install Virtual Machines.
echo "[$tag] VirtualMachine/Boot2Docker"
eval "brew $tag boot2docker"
echo "[$tag] VirtualMachine/Docker"
eval "brew $tag docker"
echo "[$tag] VirtualMachine/VirtualBox"
eval "brew cask install virtualbox"

# Install Productivity Tools.
echo "[$tag] Productivity/BashCompletion"
eval "brew $tag bash-completion"
echo "[$tag] Productivity/GitLfs"
eval "brew $tag git-lfs"

# Install Applications.
echo "[$tag] Application/GoogleChrome"
eval "brew cask install google-chrome"
echo "[$tag] Application/Insync"
eval "brew cask install insync"
echo "[$tag] Application/IntelliJ"
eval "brew cask install intellij-idea-ce"
echo "[$tag] Application/Spectacle"
eval "brew cask install spectacle"

# Install Fonts.
echo "[$tag] Font/Hasklig"
eval "brew cask install font-hasklig"

# Setup Python.
echo "[$tag] Python/Click"
sudo pip install click
echo "[$tag] Python/Virtualenv"
sudo pip install virtualenv

# Setup Git.
echo "[$tag] Setup/Git"
git config --global core.editor /usr/bin/vim
git config --global user.name "Ashwin Madavan"
git config --global user.email ashwin.madavan@gmail.com

# Setup Workspace.
echo "[$tag] Setup/Workspace"
rm -rf ~/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
rm ~/.vimrc
ln -s ~/Documents/workspace/tools/.vimrc ~/.vimrc
rm ~/.bash_profile
ln -s ~/Documents/workspace/tools/.bash_profile ~/.bash_profile
source ~/.bash_profile
vim +PluginInstall +qall

