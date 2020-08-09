#!/bin/zsh

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

fancy_echo "Updating Homebrew formulae ..."
brew update
brew upgrade

export HOMEBREW_NO_AUTO_UPDATE=1
BREW_PREFIX=$(brew --prefix)

###################
#     Node.js     #
###################

# Manage Node.js versions with n
if ! brew info n &>/dev/null; then
    brew install n
    # Deal with Permission Denied errors that would stop n from running - this is fine in a single user environment
    if [ ! -d "/usr/local/n" ]; then
      fancy_echo "Resolving permission issues with n..."
        sudo mkdir -p /usr/local/n
        sudo chown -R $(whoami) /usr/local/n
        sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
    fi
    # Now install the LTS version of Node.js
    fancy_echo "Info: 'n' now installed, installing the latest Node.js LTS version ..."
    n lts
    # Add Node.js to path
    export PATH=$PATH:/usr/local/bin/node
    # Now install Yarn
    fancy_echo "Info: 'Installing Yarn ..."
    curl -o- -L https://yarnpkg.com/install.sh | bash
else
    # Check/update the LTS version of Node.js
    fancy_echo "Info: 'n' is already installed, updating to the latest Node.js LTS version ..."
    n lts
fi

# Create a user profile .npmrc if it doesn't exist and prompt user to configure
if [ ! -f "$HOME/.npmrc" ]; then
  fancy_echo "Creating an empty per-user .npmrc config file ..."
    touch "$HOME/.npmrc"
fi

###################
#      Casks      #
###################

# Install Visual Studio Code & the Code Settings extension to sync VS Code settings from GitHub
if [ ! -d "$BREW_PREFIX/Caskroom/visual-studio-code" ]; then
    brew cask install visual-studio-code
    code --install-extension Shan.code-settings-sync
else
    fancy_echo "Info: Visual Studio Code is already installed"
fi

# Install Postman
if [ ! -d "$BREW_PREFIX/Caskroom/postman" ]; then
    brew cask install postman
else
    fancy_echo "Info: Postman is already installed"
fi

# Install Alfred
if [ ! -d "$BREW_PREFIX/Caskroom/alfred" ]; then
    brew cask install alfred
else
    fancy_echo "Info: Alfred is already installed"
fi
# TODO Install Alfred workflows from backup

# Install Kap for screen captures
if [ ! -d "$BREW_PREFIX/Caskroom/kap" ]; then
    brew cask install kap
else
    fancy_echo "Info: Kap is already installed"
fi

###################
#     Cleanup     #
###################

brew cleanup
