# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

# Ignore security check on autocompletion directories
ZSH_DISABLE_COMPFIX=true

# Disable marking untracked files under VCS as dirty. This makes
# repository status check for large repositories much, much faster
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git node npm npx vscode yarn)

source $ZSH/oh-my-zsh.sh

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases
