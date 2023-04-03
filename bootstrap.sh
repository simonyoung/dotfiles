#!/bin/zsh

# This installs homebrew itself, and also the command line tools in silent mode
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/gbsimyou/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
brew upgrade

BREW_PREFIX=$(brew --prefix)

brew tap homebrew/services

brew install curl wget git

## set zsh as default + install oh-my-zsh
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## set git config

git config --global user.name "Simon Young"
git config --global user.email simon180@mac.com
git config --global core.editor "nano"
