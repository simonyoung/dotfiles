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

# Install the LTS version of Node.js
n lts

##################
#      Casks     #
##################

brew cask install visual-studio-code

##################
#     Cleanup    #
##################

brew cleanup
