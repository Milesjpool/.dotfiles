#!/bin/zsh

setopt -s dotglob

./install/unix.sh

ln -sv $PWD/zsh/* ~/