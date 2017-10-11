# Tools
An automated configuration and personal toolchain for my environment.

## Bootstrap
```sh
# Create Workspace Directory
mkdir -p ~/Documents/workspace
cd ~/Documents/workspace

# Download and Execute Installer
git clone https://github.com/ashwin153/tools.git
cd tools
chmod +x ./install.sh
./install.sh
```

## Command Line Interface
```sh
# Safely merges a git branch.
tools git merge --base master --feature ashwin153/feature

# Safely deletes a git branch.
tools git delete --branch ashwin153/feature
tools git delete --branch ashwin153/feature --remote

# Upgrades the toolchain.
tools setup upgrade

# Bootstraps a project template.
tools setup project --type latex
tools setup project --type pants --root ./path/to/dir
```
