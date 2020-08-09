#!/bin/zsh

cd ${0:a:h}

git config pull.rebase false
git pull origin main

function sync() {
    rsync --exclude ".git/" \
        --exclude "doc/" \
        --exclude ".DS_Store" \
        --exclude ".macos" \
        --exclude "bootstrap.sh" \
        --exclude "brew.sh" \
        --exclude "sync.sh" \
        --exclude "README.md" \
        --exclude "LICENSE" \
        --exclude "iterm.itermcolors" \
        --exclude "iterm-preferences.json" \
        -avh --no-perms . ~;
}

sync

unset sync;
