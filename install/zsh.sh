#!/bin/zsh

setopt globdots

./install/unix.sh

git submodule init
git submodule update

ln -sv $PWD/zsh/* ~
