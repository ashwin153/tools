# Workspace
```
# Create Workspace Directory
mkdir -p ~/Documents/workspace
cd ~/Documents/workspace

# Download and Execute Installer
git clone https://github.com/ashwin153/tools.git
cd tools
chmod +x ./install.sh
./install.sh
```

# Commands
```
# Merge Branches                                                                                              
git checkout test
git pull
git checkout master
git pull
git merge --no-ff --no-commit test

git push origin --delete test
git branch -D test                                                                                   
```
