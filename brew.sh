#!/bin/zsh

brew update
brew upgrade

BREW_PREFIX=$(brew --prefix)

###################
#     Node.js     #
###################

# Manage Node.js versions with n
brew install n

# Deal with Permission Denied errors that would stop normal operation
sudo mkdir -p /usr/local/n
sudo chown -R $(whoami) /usr/local/n
sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share

# Now install the LTS version of Node.js
n lts

##################
#      Casks     #
##################

# Install Visual Studio Code & the Code Settings extension to sync VS Code settings from GitHub
brew cask install visual-studio-code
code --install-extension Shan.code-settings-sync

# Install Alfred
brew cask install alfred
# TODO Install Alfred workflows from backup

##################
#     Cleanup    #
##################

brew cleanup
