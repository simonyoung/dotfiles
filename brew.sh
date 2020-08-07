#!/bin/zsh

brew update
brew upgrade

BREW_PREFIX=$(brew --prefix)

##################
#      Casks     #
##################

brew cask install visual-studio-code

##################
#     Cleanup    #
##################

brew cleanup
