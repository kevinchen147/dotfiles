#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin main;

rsync --exclude ".git/" \
    --exclude "bootstrap.sh" \
    --exclude "README.md" \
    -avh --no-perms . ~;

source ~/.profile;